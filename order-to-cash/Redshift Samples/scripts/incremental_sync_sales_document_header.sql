CREATE OR REPLACE PROCEDURE public.incremental_sync_sales_document_header()
 LANGUAGE plpgsql
AS $$
DECLARE
        sql          VARCHAR(MAX) := '';
        staged_record_count BIGINT :=0;
BEGIN

     -- Truncate staging table

    EXECUTE 'TRUNCATE TABLE stg.lis_11_vahdr;';

    EXECUTE 'COPY JOB RUN auto_copy_LIS_11_VAHDR';
  
    -- Create staging table to store records from DM tables that match the current batch in the staging table
    EXECUTE 'drop table if exists temp_sales_document_header_match;';
    EXECUTE 'create temp table temp_sales_document_header_match(like dm.sales_document_header); ';




--Identify sls_dstrbn_document_nbr records from DM table that exist in the latest extract
-- We will expire these records in a later step

    EXECUTE 'insert into temp_sales_document_header_match (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,quotation_or_inquiry_is_valid_from
,sales_document_type
,order_reason
,bid_quotation_valid_date
,company_code
,record_create_date
,billing_block_in_sd_document
,local_currency
,sold_to_party
,exchange_rate_type
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,delivery_block_document_header
,Billing_Type
,statistics_currency
,sd_document_category
,statistics_update_date
,sales_office
,sales_group
,sales_organization
,distribution_channel
,sd_document_currency
,order_header_division
,order_header_sales_doc_reference_category
,num_of_orders
,fiscal_year_variant
,odq_change_mode
,odq_counter
,dm_record_start_date 
,dm_record_end_date 
,dm_is_current 
) 

  select 
distinct
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,quotation_or_inquiry_is_valid_from
,sales_document_type
,order_reason
,bid_quotation_valid_date
,company_code
,record_create_date
,billing_block_in_sd_document
,local_currency
,sold_to_party
,exchange_rate_type
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,delivery_block_document_header
,Billing_Type
,statistics_currency
,sd_document_category
,statistics_update_date
,sales_office
,sales_group
,sales_organization
,distribution_channel
,sd_document_currency
,order_header_division
,order_header_sales_doc_reference_category
,num_of_orders
,fiscal_year_variant
,odq_change_mode
,odq_counter
,dm_record_start_date 
,dm_record_end_date 
,dm_is_current 
  from 
    dm.sales_document_header  sdh
  join
    stg.lis_11_vahdr  vadhdr
    on sdh.sls_dstrbn_document_nbr = vadhdr.vbeln   
  where 
    dm_is_current = ''1''
;';
 
    sql := 'SELECT COUNT(*) FROM temp_sales_document_header_match;';
    
    EXECUTE sql INTO staged_record_count;
    RAISE INFO 'Matched records into temp_sales_document_header_match: %', staged_record_count;
    

	-- Delete records from target table that also exist in staging table (updated records)
    
    EXECUTE 'DELETE FROM dm.sales_document_header  
using temp_sales_document_header_match tsdh
 WHERE dm.sales_document_header.sls_dstrbn_document_nbr = tsdh.sls_dstrbn_document_nbr
 and dm.sales_document_header.dm_is_current =''1'';';
    


	-- Insert all records from staging table into target table

	EXECUTE 'insert into dm.sales_document_header (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,quotation_or_inquiry_is_valid_from
,sales_document_type
,order_reason
,bid_quotation_valid_date
,company_code
,record_create_date
,billing_block_in_sd_document
,local_currency
,sold_to_party
,exchange_rate_type
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,delivery_block_document_header
,Billing_Type
,statistics_currency
,sd_document_category
,statistics_update_date
,sales_office
,sales_group
,sales_organization
,distribution_channel
,sd_document_currency
,order_header_division
,order_header_sales_doc_reference_category
,num_of_orders
,fiscal_year_variant
,odq_change_mode
,odq_counter
,dm_record_start_date 
,dm_record_end_date 
,dm_is_current 
) 
with lis_11_vahdr_latest as (select v.*,row_number() over (partition by vbeln order by ERDAT DESC,rocancel ) as doc_item_rank  from stg.LIS_11_VAHDR v)
   
SELECT 
distinct
rocancel,
vbeln,
To_date(angdt,''YYYYMMDD''),
auart,
augru,
To_date(bnddt,''YYYYMMDD''),
bukrs,
To_date(erdat,''YYYYMMDD''),
faksk,
hwaer,
kunnr,
kurst,
kvgr1,
kvgr2,
kvgr3,
kvgr4,
kvgr5,
lifsk,
fkart,
stwae,
vbtyp,
To_date(vdatu,''YYYYMMDD''),
vkbur,
vkgrp,
vkorg,
vtweg,
waerk,
spara,
vgtyp_ak,
anzau,
periv,
odq_changemode,
odq_entitycntr,
CURRENT_TIMESTAMP,
CASE WHEN rocancel =''X'' OR doc_item_rank > 1 THEN current_timestamp else ''9999-12-31''::DATE  END, 
CASE WHEN rocancel =''X'' OR doc_item_rank > 1 THEN ''0'' ELSE ''1'' END
FROM
lis_11_vahdr_latest vahdr ;';

  -- Insert Old records with expiry dates
    EXECUTE 'insert into dm.sales_document_header (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,quotation_or_inquiry_is_valid_from
,sales_document_type
,order_reason
,bid_quotation_valid_date
,company_code
,record_create_date
,billing_block_in_sd_document
,local_currency
,sold_to_party
,exchange_rate_type
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,delivery_block_document_header
,Billing_Type
,statistics_currency
,sd_document_category
,statistics_update_date
,sales_office
,sales_group
,sales_organization
,distribution_channel
,sd_document_currency
,order_header_division
,order_header_sales_doc_reference_category
,num_of_orders
,fiscal_year_variant
,odq_change_mode
,odq_counter
,dm_record_start_date 
,dm_record_end_date 
,dm_is_current 
) 

   
SELECT 
distinct 
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,quotation_or_inquiry_is_valid_from
,sales_document_type
,order_reason
,bid_quotation_valid_date
,company_code
,record_create_date
,billing_block_in_sd_document
,local_currency
,sold_to_party
,exchange_rate_type
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,delivery_block_document_header
,Billing_Type
,statistics_currency
,sd_document_category
,statistics_update_date
,sales_office
,sales_group
,sales_organization
,distribution_channel
,sd_document_currency
,order_header_division
,order_header_sales_doc_reference_category
,num_of_orders
,fiscal_year_variant
,odq_change_mode
,odq_counter
,dm_record_start_date 
,current_timestamp 
,0 
FROM
   
    temp_sales_document_header_match  tsdh ;';

-- Refresh dm.sales_document_header_latest MV. This MV will be used to list the latest version of the sales_document_headers

EXECUTE 'refresh materialized view archdm.sales_document_header_latest;';
END
$$
