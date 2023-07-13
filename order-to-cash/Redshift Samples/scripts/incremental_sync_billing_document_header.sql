CREATE OR REPLACE PROCEDURE public.incremental_sync_billing_document_header()
 LANGUAGE plpgsql
AS $$
DECLARE
        sql          VARCHAR(MAX) := '';
        staged_record_count BIGINT :=0;
BEGIN

     -- Truncate staging table

    EXECUTE 'TRUNCATE TABLE stg.lis_13_vdhdr;';

    EXECUTE 'COPY JOB RUN auto_copy_lis_13_vdhdr';
    
    sql := 'SELECT COUNT(*) FROM stg.lis_13_vdhdr;';
    
    EXECUTE sql INTO staged_record_count;
    IF staged_record_count > 0 THEN
  
    -- Create staging table to store records from DM tables that match the current batch in the staging table
    EXECUTE 'drop table if exists temp_billing_document_header_match;';
    EXECUTE 'create temp table temp_billing_document_header_match(like dm.billing_document_header); ';
    

      


--Identify sls_dstrbn_document_nbr records from DM table that exist in the latest extract
-- We will expire these records in a later step

    EXECUTE 'insert into temp_billing_document_header_match (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,company_code
,sales_district
,record_create_date
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,sales_employee
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Num_of_billing_docs
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
,company_code
,sales_district
,record_create_date
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,sales_employee
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Num_of_billing_docs
,fiscal_year_variant
,odq_change_mode
,odq_counter
,dm_record_start_date 
,dm_record_end_date 
,dm_is_current 
  from 
    dm.billing_document_header  bdh
  join
    stg.lis_13_vdhdr  vdhdr
    on bdh.sls_dstrbn_document_nbr = vdhdr.vbeln   
  where 
    dm_is_current = ''1''
;';
 
    sql := 'SELECT COUNT(*) FROM temp_billing_document_header_match;';
    
    EXECUTE sql INTO staged_record_count;
    RAISE INFO 'Matched records into temp_billing_document_header_match: %', staged_record_count;
    

	-- Delete records from target table that also exist in staging table (updated records)
    
    EXECUTE 'DELETE FROM dm.billing_document_header  
using temp_billing_document_header_match tbdh
 WHERE dm.billing_document_header.sls_dstrbn_document_nbr = tbdh.sls_dstrbn_document_nbr
 and dm.billing_document_header.dm_is_current =''1'';';
    


	-- Insert all records from staging table into target table

	EXECUTE 'insert into dm.billing_document_header (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,company_code
,sales_district
,record_create_date
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,sales_employee
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Num_of_billing_docs
,fiscal_year_variant
,odq_change_mode
,odq_counter
,dm_record_start_date 
,dm_record_end_date 
,dm_is_current 
) 
with lis_13_vdhdr_latest as (select v.*,row_number() over (partition by vbeln order by ERDAT DESC,rocancel ) as doc_item_rank  from stg.lis_13_vdhdr v)
   
SELECT 
distinct
rocancel,
vbeln,
bukrs,
bzirk,
To_date(erdat,''YYYYMMDD'',true),
fkart,
To_date(fkdat,''YYYYMMDD'',true),
fktyp,
hwaer,
kdgrp,
kunag,
kunrg,
kurrf,
kurst,
pvrtnr,
stwae,
vbtyp,
vkorg,
vtweg,
waerk,
anzfk,
periv,
odq_changemode,
odq_entitycntr,
CURRENT_TIMESTAMP,
CASE WHEN rocancel =''X'' OR doc_item_rank > 1 THEN current_timestamp else ''9999-12-31''::DATE  END, 
CASE WHEN rocancel =''X'' OR doc_item_rank > 1 THEN ''0'' ELSE ''1'' END
FROM
lis_13_vdhdr_latest vdhdr ;';

  -- Insert Old records with expiry dates
    EXECUTE 'insert into dm.billing_document_header (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,company_code
,sales_district
,record_create_date
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,sales_employee
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Num_of_billing_docs
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
,company_code
,sales_district
,record_create_date
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,sales_employee
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Num_of_billing_docs
,fiscal_year_variant
,odq_change_mode
,odq_counter
,dm_record_start_date 
,current_timestamp 
,0 
FROM
       temp_billing_document_header_match  tsdh ;';

-- Refresh dm.billing_document_header_latest MV. This MV will be used to list the latest version of the billing_document_headers

EXECUTE 'refresh materialized view archdm.billing_document_header_latest;';
ELSE
   RAISE INFO 'No data found in staging table.';

END IF; 
END
$$
