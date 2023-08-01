CREATE OR REPLACE PROCEDURE public.incremental_sync_billing_document_item()
 LANGUAGE plpgsql
AS $$
DECLARE
        sql          VARCHAR(MAX) := '';
        staged_record_count BIGINT :=0;
BEGIN

     -- Truncate staging table

    EXECUTE 'TRUNCATE TABLE stg.lis_13_vditm;';

    EXECUTE 'COPY JOB RUN auto_copy_lis_13_vditm';
  
    -- Create staging table to store records from DM tables that match the current batch in the staging table
    EXECUTE 'drop table if exists temp_billing_document_item_match;';
    EXECUTE 'create temp table temp_billing_document_item_match(like dm.billing_document_item); ';




--Identify sls_dstrbn_document_nbr records from DM table that exist in the latest extract
-- We will expire these records in a later step

    EXECUTE 'insert into temp_billing_document_item_match (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,sd_doc_item_nbr
,last_changed_on
,company_code
,sales_district
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Promotion
,Sales_Document
,Sales_Document_Item
,Rebate_Basis_1
,Volume_rebate_group
,item_gross_weight
,Billing_Item_GrossValue
,application_component
,sap_bw_transaction_key
,batch_number
,international_article_number_ean_upc
,record_create_date
,billing_or_invoice_plan_rule
,services_rendered_date
,Actual_billed_quantity
,Billing_quantity_in_stock_keeping_unit
,weight_unit
,sales_deal
,Controlling_Area
,CostCenter
,price_determination_exchange_rate
,translation_date
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,subtotal_1_from_pricing_procedure_for_price_element
,subtotal_2_from_pricing_procedure_for_price_element
,subtotal_3_from_pricing_procedure_for_price_element
,subtotal_4_from_pricing_procedure_for_price_element
,subtotal_5_from_pricing_procedure_for_price_element
,subtotal_6_from_pricing_procedure_for_price_element
,storage_location
,mat_management_Requiredquantity
,material_group
,material_number
,material_entered
,base_unit_of_measure
,material_group_1
,material_group_2
,material_group_3
,material_group_4
,material_group_5
,tax_amount_in_document_currency
,net_value_of_the_order_item_in_document_currency
,net_weight_of_the_item
,bill_to_party
,ship_to_party
,Item_Type
,product_hierarchy
,CommissionGroup
,pricing_and_exchange_rate_date
,sales_document_item_category
,sales_employee
,Amounteligibleforcashdiscount
,Scale_Quantity
,order_header_division
,division
,statistics_date
,exchange_rate_for_statistics
,sales_qty_sku_denominator
,sales_qty_sku_numerator
,statistics_update_date
,reference_document_nbr
,reference_item_nbr
,sales_office
,sales_group
,volume_unit
,item_volume
,sales_unit
,shipping_or_receiving_point
,cost_in_document_currency
,own_or_external_plant
,wbs_element
,Num_of_billing_items
,fiscal_year_variant
,campaign_of_referred_sales_order_item_for_bw_extraction
,odq_change_mode
,odq_counter
,dm_record_start_date 
,dm_record_end_date 
,dm_is_current
) 

  select 
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,sd_doc_item_nbr
,last_changed_on
,company_code
,sales_district
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Promotion
,Sales_Document
,Sales_Document_Item
,Rebate_Basis_1
,Volume_rebate_group
,item_gross_weight
,Billing_Item_GrossValue
,application_component
,sap_bw_transaction_key
,batch_number
,international_article_number_ean_upc
,record_create_date
,billing_or_invoice_plan_rule
,services_rendered_date
,Actual_billed_quantity
,Billing_quantity_in_stock_keeping_unit
,weight_unit
,sales_deal
,Controlling_Area
,CostCenter
,price_determination_exchange_rate
,translation_date
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,subtotal_1_from_pricing_procedure_for_price_element
,subtotal_2_from_pricing_procedure_for_price_element
,subtotal_3_from_pricing_procedure_for_price_element
,subtotal_4_from_pricing_procedure_for_price_element
,subtotal_5_from_pricing_procedure_for_price_element
,subtotal_6_from_pricing_procedure_for_price_element
,storage_location
,mat_management_Requiredquantity
,material_group
,material_number
,material_entered
,base_unit_of_measure
,material_group_1
,material_group_2
,material_group_3
,material_group_4
,material_group_5
,tax_amount_in_document_currency
,net_value_of_the_order_item_in_document_currency
,net_weight_of_the_item
,bill_to_party
,ship_to_party
,Item_Type
,product_hierarchy
,CommissionGroup
,pricing_and_exchange_rate_date
,sales_document_item_category
,sales_employee
,Amounteligibleforcashdiscount
,Scale_Quantity
,order_header_division
,division
,statistics_date
,exchange_rate_for_statistics
,sales_qty_sku_denominator
,sales_qty_sku_numerator
,statistics_update_date
,reference_document_nbr
,reference_item_nbr
,sales_office
,sales_group
,volume_unit
,item_volume
,sales_unit
,shipping_or_receiving_point
,cost_in_document_currency
,own_or_external_plant
,wbs_element
,Num_of_billing_items
,fiscal_year_variant
,campaign_of_referred_sales_order_item_for_bw_extraction
,odq_change_mode
,odq_counter
,dm_record_start_date 
,dm_record_end_date 
,dm_is_current
  from 
    dm.billing_document_item  bdi
  join
    stg.lis_13_vditm  vditm
    on bdi.sls_dstrbn_document_nbr = vditm.vbeln   
    and bdi.sd_doc_item_nbr = vditm.posnr
  where 
    dm_is_current = ''1''
;';


 
    sql := 'SELECT COUNT(*) FROM temp_billing_document_item_match;';
    
    EXECUTE sql INTO staged_record_count;
    RAISE INFO 'Matched records into temp_billing_document_item_match: %', staged_record_count;
    

	-- Delete records from target table that also exist in staging table (updated records)
    
    EXECUTE 'DELETE FROM dm.billing_document_item  
using temp_billing_document_item_match tbdh
 WHERE dm.billing_document_item.sls_dstrbn_document_nbr = tbdh.sls_dstrbn_document_nbr
 and dm.billing_document_item.dm_is_current =''1'';';
    


	-- Insert all records from staging table into target table

	EXECUTE 'insert into dm.billing_document_item (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,sd_doc_item_nbr
,last_changed_on
,company_code
,sales_district
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Promotion
,Sales_Document
,Sales_Document_Item
,Rebate_Basis_1
,Volume_rebate_group
,item_gross_weight
,Billing_Item_GrossValue
,application_component
,sap_bw_transaction_key
,batch_number
,international_article_number_ean_upc
,record_create_date
,billing_or_invoice_plan_rule
,services_rendered_date
,Actual_billed_quantity
,Billing_quantity_in_stock_keeping_unit
,weight_unit
,sales_deal
,Controlling_Area
,CostCenter
,price_determination_exchange_rate
,translation_date
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,subtotal_1_from_pricing_procedure_for_price_element
,subtotal_2_from_pricing_procedure_for_price_element
,subtotal_3_from_pricing_procedure_for_price_element
,subtotal_4_from_pricing_procedure_for_price_element
,subtotal_5_from_pricing_procedure_for_price_element
,subtotal_6_from_pricing_procedure_for_price_element
,storage_location
,mat_management_Requiredquantity
,material_group
,material_number
,material_entered
,base_unit_of_measure
,material_group_1
,material_group_2
,material_group_3
,material_group_4
,material_group_5
,tax_amount_in_document_currency
,net_value_of_the_order_item_in_document_currency
,net_weight_of_the_item
,bill_to_party
,ship_to_party
,Item_Type
,product_hierarchy
,CommissionGroup
,pricing_and_exchange_rate_date
,sales_document_item_category
,sales_employee
,Amounteligibleforcashdiscount
,Scale_Quantity
,order_header_division
,division
,statistics_date
,exchange_rate_for_statistics
,sales_qty_sku_denominator
,sales_qty_sku_numerator
,statistics_update_date
,reference_document_nbr
,reference_item_nbr
,sales_office
,sales_group
,volume_unit
,item_volume
,sales_unit
,shipping_or_receiving_point
,cost_in_document_currency
,own_or_external_plant
,wbs_element
,Num_of_billing_items
,fiscal_year_variant
,campaign_of_referred_sales_order_item_for_bw_extraction
,odq_change_mode
,odq_counter
,dm_record_start_date 
,dm_record_end_date 
,dm_is_current
) 
with lis_13_vditm_latest as (select v.*,row_number() over (partition by vbeln,posnr order by AEDAT DESC,rocancel ) as doc_item_rank  from stg.lis_13_vditm v)
   
SELECT 
distinct
rocancel,
vbeln,
posnr,
To_date(aedat, ''YYYYMMDD''),
bukrs,
bzirk,
fkart,
To_date(fkdat, ''YYYYMMDD''),
fktyp,
hwaer,
kdgrp,
kunag,
kunrg,
kurrf,
kurst,
stwae,
vbtyp,
vkorg,
vtweg,
waerk,
aktnr,
aubel,
aupos,
bonba,
bonus,
brgew,
brtwr,
bwapplnm,
bwvorg,
charg,
ean11,
To_date(erdat, ''YYYYMMDD''),
fareg,
To_date(fbuda, ''YYYYMMDD''),
fkimg,
fklmg,
gewei,
knuma_ag,
kokrs,
kostl,
kursk,
To_date(kursk_dat, ''YYYYMMDD''),
kvgr1,
kvgr2,
kvgr3,
kvgr4,
kvgr5,
kzwi1,
kzwi2,
kzwi3,
kzwi4,
kzwi5,
kzwi6,
lgort,
lmeng,
matkl,
matnr,
matwa,
meins,
mvgr1,
mvgr2,
mvgr3,
mvgr4,
mvgr5,
mwsbp,
netwr,
ntgew,
pkunre,
pkunwe,
posar,
prodh,
provg,
To_date(prsdt, ''YYYYMMDD''),
pstyv,
pvrtnr,
skfbp,
smeng,
spara,
spart,
To_date(stadat, ''YYYYMMDD''),
stcur,
umvkn,
umvkz,
To_date(vdatu, ''YYYYMMDD''),
vgbel,
vgpos,
vkbur,
vkgrp,
voleh,
volum,
vrkme,
vstel,
wavwr,
werks,
ps_posid,
anzfkpos,
periv,
mcex_apcampaign,
odq_changemode,
odq_entitycntr,
CURRENT_TIMESTAMP,
CASE WHEN rocancel =''X'' OR doc_item_rank > 1 THEN current_timestamp else ''9999-12-31''::DATE  END, 
CASE WHEN rocancel =''X'' OR doc_item_rank > 1 THEN ''0'' ELSE ''1'' END
FROM
lis_13_vditm_latest vditm ;';

  -- Insert Old records with expiry dates
    EXECUTE 'insert into dm.billing_document_item (
cncl_data_recd_ind
,sls_dstrbn_document_nbr
,sd_doc_item_nbr
,last_changed_on
,company_code
,sales_district
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Promotion
,Sales_Document
,Sales_Document_Item
,Rebate_Basis_1
,Volume_rebate_group
,item_gross_weight
,Billing_Item_GrossValue
,application_component
,sap_bw_transaction_key
,batch_number
,international_article_number_ean_upc
,record_create_date
,billing_or_invoice_plan_rule
,services_rendered_date
,Actual_billed_quantity
,Billing_quantity_in_stock_keeping_unit
,weight_unit
,sales_deal
,Controlling_Area
,CostCenter
,price_determination_exchange_rate
,translation_date
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,subtotal_1_from_pricing_procedure_for_price_element
,subtotal_2_from_pricing_procedure_for_price_element
,subtotal_3_from_pricing_procedure_for_price_element
,subtotal_4_from_pricing_procedure_for_price_element
,subtotal_5_from_pricing_procedure_for_price_element
,subtotal_6_from_pricing_procedure_for_price_element
,storage_location
,mat_management_Requiredquantity
,material_group
,material_number
,material_entered
,base_unit_of_measure
,material_group_1
,material_group_2
,material_group_3
,material_group_4
,material_group_5
,tax_amount_in_document_currency
,net_value_of_the_order_item_in_document_currency
,net_weight_of_the_item
,bill_to_party
,ship_to_party
,Item_Type
,product_hierarchy
,CommissionGroup
,pricing_and_exchange_rate_date
,sales_document_item_category
,sales_employee
,Amounteligibleforcashdiscount
,Scale_Quantity
,order_header_division
,division
,statistics_date
,exchange_rate_for_statistics
,sales_qty_sku_denominator
,sales_qty_sku_numerator
,statistics_update_date
,reference_document_nbr
,reference_item_nbr
,sales_office
,sales_group
,volume_unit
,item_volume
,sales_unit
,shipping_or_receiving_point
,cost_in_document_currency
,own_or_external_plant
,wbs_element
,Num_of_billing_items
,fiscal_year_variant
,campaign_of_referred_sales_order_item_for_bw_extraction
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
,sd_doc_item_nbr
,last_changed_on
,company_code
,sales_district
,Billing_Type
,billing_date
,Billing_Category
,local_currency
,customer_group
,Sold_to_Party
,Payer
,Financial_Accounting_ExchangeRate
,exchange_rate_type
,statistics_currency
,sd_document_category
,sales_organization
,distribution_channel
,sd_document_currency
,Promotion
,Sales_Document
,Sales_Document_Item
,Rebate_Basis_1
,Volume_rebate_group
,item_gross_weight
,Billing_Item_GrossValue
,application_component
,sap_bw_transaction_key
,batch_number
,international_article_number_ean_upc
,record_create_date
,billing_or_invoice_plan_rule
,services_rendered_date
,Actual_billed_quantity
,Billing_quantity_in_stock_keeping_unit
,weight_unit
,sales_deal
,Controlling_Area
,CostCenter
,price_determination_exchange_rate
,translation_date
,customer_group_1
,customer_group_2
,customer_group_3
,customer_group_4
,customer_group_5
,subtotal_1_from_pricing_procedure_for_price_element
,subtotal_2_from_pricing_procedure_for_price_element
,subtotal_3_from_pricing_procedure_for_price_element
,subtotal_4_from_pricing_procedure_for_price_element
,subtotal_5_from_pricing_procedure_for_price_element
,subtotal_6_from_pricing_procedure_for_price_element
,storage_location
,mat_management_Requiredquantity
,material_group
,material_number
,material_entered
,base_unit_of_measure
,material_group_1
,material_group_2
,material_group_3
,material_group_4
,material_group_5
,tax_amount_in_document_currency
,net_value_of_the_order_item_in_document_currency
,net_weight_of_the_item
,bill_to_party
,ship_to_party
,Item_Type
,product_hierarchy
,CommissionGroup
,pricing_and_exchange_rate_date
,sales_document_item_category
,sales_employee
,Amounteligibleforcashdiscount
,Scale_Quantity
,order_header_division
,division
,statistics_date
,exchange_rate_for_statistics
,sales_qty_sku_denominator
,sales_qty_sku_numerator
,statistics_update_date
,reference_document_nbr
,reference_item_nbr
,sales_office
,sales_group
,volume_unit
,item_volume
,sales_unit
,shipping_or_receiving_point
,cost_in_document_currency
,own_or_external_plant
,wbs_element
,Num_of_billing_items
,fiscal_year_variant
,campaign_of_referred_sales_order_item_for_bw_extraction
,odq_change_mode
,odq_counter
,dm_record_start_date 
,current_timestamp 
,0 
FROM
       temp_billing_document_item_match  tsdh ;';

-- Refresh dm.billing_document_item_latest MV. This MV will be used to list the latest version of the billing_document_items

EXECUTE 'refresh materialized view archdm.billing_document_item_latest;';
END
$$
