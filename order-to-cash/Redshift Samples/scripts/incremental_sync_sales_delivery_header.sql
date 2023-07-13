CREATE OR REPLACE PROCEDURE public.incremental_sync_sales_delivery_header()
 LANGUAGE plpgsql
AS $$
DECLARE
        sql          VARCHAR(MAX) := '';
        staged_record_count BIGINT :=0;
BEGIN

     -- Truncate staging table

    EXECUTE 'TRUNCATE TABLE stg.lis_12_vchdr;';

    EXECUTE 'COPY JOB RUN auto_copy_lis_12_vchdr';
  
    -- Create staging table to store records from DM tables that match the current batch in the staging table
    EXECUTE 'drop table if exists temp_sales_delivery_header_match;';
    EXECUTE 'create temp table temp_sales_delivery_header_match(like dm.sales_delivery_header); ';




--Identify sls_dstrbn_document_nbr records from DM table that exist in the latest extract
-- We will expire these records in a later step

    EXECUTE 'insert into temp_sales_delivery_header_match (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,Unloading_Point
,Total_Weight
,Company_Code
,Sales_District
,record_create_date
,billing_block
,Weight_Unit
,incoterms_part_1
,incoterms_part_2
,Customer_Group
,Sold_to_Party
,Ship_to_Party
,Delivery_Type
,Delivery_Date
,Vendor_account_number
,Delivery_Block__Document_Header
,Loading_Point
,Net_weight
,Bill_to_Party
,Payer
,Forwarding_Agent
,Sales_employee
,Route
,SD_Document_Category
,Sales_Organization
,Volume_unit
,Volume
,Shipping_Point_Receiving_Point
,Planned_Goods_Movement_Date
,Actual_Goods_Movement_Date
,Num_of_deliveries
,Num_of_Packages_per_Delivery
,Fiscal_Year_Variant
,Actual_GI_Delay_GI_Date_for_Delivery
,ODQ_Change_Mode
,ODQ_Counter
,dm_record_start_date
,dm_record_end_date
,dm_is_current
) 

  select 
distinct
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,Unloading_Point
,Total_Weight
,Company_Code
,Sales_District
,record_create_date
,billing_block
,Weight_Unit
,incoterms_part_1
,incoterms_part_2
,Customer_Group
,Sold_to_Party
,Ship_to_Party
,Delivery_Type
,Delivery_Date
,Vendor_account_number
,Delivery_Block__Document_Header
,Loading_Point
,Net_weight
,Bill_to_Party
,Payer
,Forwarding_Agent
,Sales_employee
,sdh.Route
,SD_Document_Category
,Sales_Organization
,Volume_unit
,Volume
,Shipping_Point_Receiving_Point
,Planned_Goods_Movement_Date
,Actual_Goods_Movement_Date
,Num_of_deliveries
,Num_of_Packages_per_Delivery
,Fiscal_Year_Variant
,Actual_GI_Delay_GI_Date_for_Delivery
,ODQ_Change_Mode
,ODQ_Counter
,dm_record_start_date
,dm_record_end_date
,dm_is_current
  from 
    dm.sales_delivery_header  sdh
  join
    stg.lis_12_vchdr  vchdr
    on sdh.sls_dstrbn_document_nbr = vchdr.vbeln   
  where 
    dm_is_current = ''1''
;';
 
    sql := 'SELECT COUNT(*) FROM temp_sales_delivery_header_match;';
    
    EXECUTE sql INTO staged_record_count;
    RAISE INFO 'Matched records into temp_sales_delivery_header_match: %', staged_record_count;
    

	-- Delete records from target table that also exist in staging table (updated records)
    
    EXECUTE 'DELETE FROM dm.sales_delivery_header  
using temp_sales_delivery_header_match tsdh
 WHERE dm.sales_delivery_header.sls_dstrbn_document_nbr = tsdh.sls_dstrbn_document_nbr
 and dm.sales_delivery_header.dm_is_current =''1'';';
    


	-- Insert all records from staging table into target table

	EXECUTE 'insert into dm.sales_delivery_header (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,Unloading_Point
,Total_Weight
,Company_Code
,Sales_District
,record_create_date
,billing_block
,Weight_Unit
,incoterms_part_1
,incoterms_part_2
,Customer_Group
,Sold_to_Party
,Ship_to_Party
,Delivery_Type
,Delivery_Date
,Vendor_account_number
,Delivery_Block__Document_Header
,Loading_Point
,Net_weight
,Bill_to_Party
,Payer
,Forwarding_Agent
,Sales_employee
,Route
,SD_Document_Category
,Sales_Organization
,Volume_unit
,Volume
,Shipping_Point_Receiving_Point
,Planned_Goods_Movement_Date
,Actual_Goods_Movement_Date
,Num_of_deliveries
,Num_of_Packages_per_Delivery
,Fiscal_Year_Variant
,Actual_GI_Delay_GI_Date_for_Delivery
,ODQ_Change_Mode
,ODQ_Counter
,dm_record_start_date
,dm_record_end_date
,dm_is_current 
) 

   
SELECT 
distinct
ROCANCEL
,VBELN
,ABLAD
,BTGEW
,BUKRS
,BZIRK
,to_date(ERDAT,''YYYYMMDD'')
,FAKSK
,GEWEI
,INCO1
,INCO2
,KDGRP
,KUNAG
,KUNNR
,LFART
,to_date(LFDAT,''YYYYMMDD'')
,LIFNR
,LIFSK
,LSTEL
,NTGEW
,PKUNRE
,PKUNRG
,PSPDNR
,PVRTNR
,ROUTE
,VBTYP
,VKORG
,VOLEH
,VOLUM
,VSTEL
,to_date(WADAT,''YYYYMMDD'')
,to_date(WADAT_IST,''YYYYMMDD'')
,ANZLI
,MCBW_ANZPK
,PERIV
,WA_DELAY_LF
,ODQ_CHANGEMODE
,ODQ_ENTITYCNTR
,current_timestamp
,''9999-12-31''::DATE
,''1''
FROM
    stg.lis_12_vchdr vchdr ;';

  -- Insert Old records with expiry dates
    EXECUTE 'insert into dm.sales_delivery_header (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,Unloading_Point
,Total_Weight
,Company_Code
,Sales_District
,record_create_date
,billing_block
,Weight_Unit
,incoterms_part_1
,incoterms_part_2
,Customer_Group
,Sold_to_Party
,Ship_to_Party
,Delivery_Type
,Delivery_Date
,Vendor_account_number
,Delivery_Block__Document_Header
,Loading_Point
,Net_weight
,Bill_to_Party
,Payer
,Forwarding_Agent
,Sales_employee
,Route
,SD_Document_Category
,Sales_Organization
,Volume_unit
,Volume
,Shipping_Point_Receiving_Point
,Planned_Goods_Movement_Date
,Actual_Goods_Movement_Date
,Num_of_deliveries
,Num_of_Packages_per_Delivery
,Fiscal_Year_Variant
,Actual_GI_Delay_GI_Date_for_Delivery
,ODQ_Change_Mode
,ODQ_Counter
,dm_record_start_date
,dm_record_end_date
,dm_is_current 
) 

   
SELECT 
distinct 
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,Unloading_Point
,Total_Weight
,Company_Code
,Sales_District
,record_create_date
,billing_block
,Weight_Unit
,incoterms_part_1
,incoterms_part_2
,Customer_Group
,Sold_to_Party
,Ship_to_Party
,Delivery_Type
,Delivery_Date
,Vendor_account_number
,Delivery_Block__Document_Header
,Loading_Point
,Net_weight
,Bill_to_Party
,Payer
,Forwarding_Agent
,Sales_employee
,Route
,SD_Document_Category
,Sales_Organization
,Volume_unit
,Volume
,Shipping_Point_Receiving_Point
,Planned_Goods_Movement_Date
,Actual_Goods_Movement_Date
,Num_of_deliveries
,Num_of_Packages_per_Delivery
,Fiscal_Year_Variant
,Actual_GI_Delay_GI_Date_for_Delivery
,ODQ_Change_Mode
,ODQ_Counter
,dm_record_start_date 
,current_timestamp 
,0 
FROM
   temp_sales_delivery_header_match  tsdh ;';

-- Refresh dm.sales_delivery_header_latest MV. This MV will be used to list the latest version of the sales_delivery_headers

EXECUTE 'refresh materialized view archdm.sales_delivery_header_latest;';
END
$$
