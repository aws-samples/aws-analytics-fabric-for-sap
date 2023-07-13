CREATE OR REPLACE PROCEDURE public.incremental_sync_sales_document_item()
 LANGUAGE plpgsql
AS $$
DECLARE
        sql          VARCHAR(MAX) := '';
        staged_record_count BIGINT :=0;
BEGIN

     -- Truncate staging table

    EXECUTE 'TRUNCATE TABLE stg.LIS_11_VAITM;';

    EXECUTE 'COPY JOB RUN auto_copy_LIS_11_VAITM';
  
    -- Create staging table to store records from DM tables that match the current batch in the staging table

    EXECUTE 'drop table if exists temp_sales_document_item_match;';
    EXECUTE 'create temp table temp_sales_document_item_match(like dm.sales_document_item); ';




--Identify sls_dstrbn_document_nbr and sd_doc_item_nbr records from DM table that exist in the latest extract
-- We will expire these records in a later step

EXECUTE 'insert into temp_sales_document_item_match (
cncl_data_recd_ind
, sls_dstrbn_document_nbr
, item_rejection_status
, sd_doc_item_nbr
, item_incompletion_status
, item_billing_incompletion_status
, item_pricing_incompletion_status
, item_delivery_incompletion_status
, quotation_or_inquiry_is_valid_from
, sales_document_type
, order_reason
, bid_quotation_valid_date
, company_code
, billing_block_in_sd_document
, local_currency
, sold_to_party
, exchange_rate_type
, customer_group_1
, customer_group_2
, customer_group_3
, customer_group_4
, customer_group_5
, delivery_block_document_header
, statistics_currency
, sd_document_category
, sales_office
, sales_group
, sales_organization
, distribution_channel
, reason_for_rejection_of_sales_documents
, last_changed_on
, item_order_probability
, item_gross_weight
, application_component
, sap_bw_transaction_key
, batch_number
, credit_data_exchange_rate_for_requested_delivery_date
, international_article_number_ean_upc
, record_create_date
, object_creator_name
, entry_time
, billing_block_for_item
, weight_unit
, cumulative_confirmed_quantity_in_sales_unit
, cumulative_confirmed_quantity_in_base_unit
, condition_unit
, sales_deal
, condition_pricing_unit
, cumulative_order_quantity_in_sales_units
, subtotal_1_from_pricing_procedure_for_price_element
, subtotal_2_from_pricing_procedure_for_price_element
, subtotal_3_from_pricing_procedure_for_price_element
, subtotal_4_from_pricing_procedure_for_price_element
, subtotal_5_from_pricing_procedure_for_price_element
, subtotal_6_from_pricing_procedure_for_price_element
, minimum_delivery_quantity_in_delivery_note_processing
, storage_location
, cumulative_required_delivery_qty_all_dlv_relev_sched_lines
, material_group
, material_number
, material_entered
, base_unit_of_measure
, material_group_1
, material_group_2
, material_group_3
, material_group_4
, material_group_5
, tax_amount_in_document_currency
, net_price
, net_value_of_the_order_item_in_document_currency
, net_weight_of_the_item
, ship_to_party_unload_point
, bill_to_party
, payer
, ship_to_party
, product_hierarchy
, forwarding_agent
, sales_document_item_category
, sales_employee
, route
, special_stock_indicator
, division
, statistics_date
, exchange_rate_for_statistics
, reason_for_material_substitution
, unlimited_overdelivery_allowed
, overdelivery_tolerance
, sales_qty_sku_denominator
, sales_qty_sku_numerator
, sales_base_sales_units_conversion_factor
, sales_base_sales_units_conversion_factor2
, underdelivery_tolerance
, statistics_update_date
, reference_document_nbr
, reference_item_nbr
, preceding_sd_doc_category
, volume_unit
, item_volume
, sales_unit
, shipping_or_receiving_point
, sd_document_currency
, cost_in_document_currency
, own_or_external_plant
, target_quantity_uom
, target_quantity_in_sales_units
, outline_agreement_target_value_in_document_currency
, sales_district
, services_rendered_date
, billing_date
, incoterms_part_1
, incoterms_part_2
, customer_group
, customer_account_assignment_group
, price_determination_exchange_rate
, translation_date
, pricing_and_exchange_rate_date
, promotion
, product_catalog_number
, sd_document_currency_vbak
, order_header_division
, order_header_sales_doc_reference_category
, wbs_element
, number_of_order_items
, fiscal_year_variant
, campaign_of_referred_sales_order_item_for_bw_extraction
, planning_in_apo
, item_sales_qty_net_price
, odq_change_mode
, odq_counter
, dm_record_start_date
, dm_record_end_date
,dm_is_current
) 

  select 
distinct
cncl_data_recd_ind
, sls_dstrbn_document_nbr
, item_rejection_status
, sd_doc_item_nbr
, item_incompletion_status
, item_billing_incompletion_status
, item_pricing_incompletion_status
, item_delivery_incompletion_status
, quotation_or_inquiry_is_valid_from
, sales_document_type
, order_reason
, bid_quotation_valid_date
, company_code
, billing_block_in_sd_document
, local_currency
, sold_to_party
, exchange_rate_type
, customer_group_1
, customer_group_2
, customer_group_3
, customer_group_4
, customer_group_5
, delivery_block_document_header
, statistics_currency
, sd_document_category
, sales_office
, sales_group
, sales_organization
, distribution_channel
, reason_for_rejection_of_sales_documents
, last_changed_on
, item_order_probability
, item_gross_weight
, application_component
, sap_bw_transaction_key
, batch_number
, credit_data_exchange_rate_for_requested_delivery_date
, international_article_number_ean_upc
, record_create_date
, object_creator_name
, entry_time
, billing_block_for_item
, weight_unit
, cumulative_confirmed_quantity_in_sales_unit
, cumulative_confirmed_quantity_in_base_unit
, condition_unit
, sales_deal
, condition_pricing_unit
, cumulative_order_quantity_in_sales_units
, subtotal_1_from_pricing_procedure_for_price_element
, subtotal_2_from_pricing_procedure_for_price_element
, subtotal_3_from_pricing_procedure_for_price_element
, subtotal_4_from_pricing_procedure_for_price_element
, subtotal_5_from_pricing_procedure_for_price_element
, subtotal_6_from_pricing_procedure_for_price_element
, minimum_delivery_quantity_in_delivery_note_processing
, storage_location
, cumulative_required_delivery_qty_all_dlv_relev_sched_lines
, material_group
, material_number
, material_entered
, base_unit_of_measure
, material_group_1
, material_group_2
, material_group_3
, material_group_4
, material_group_5
, tax_amount_in_document_currency
, net_price
, net_value_of_the_order_item_in_document_currency
, net_weight_of_the_item
, ship_to_party_unload_point
, bill_to_party
, payer
, ship_to_party
, product_hierarchy
, forwarding_agent
, sales_document_item_category
, sales_employee
, sdi.route
, special_stock_indicator
, division
, statistics_date
, exchange_rate_for_statistics
, reason_for_material_substitution
, unlimited_overdelivery_allowed
, overdelivery_tolerance
, sales_qty_sku_denominator
, sales_qty_sku_numerator
, sales_base_sales_units_conversion_factor
, sales_base_sales_units_conversion_factor2
, underdelivery_tolerance
, statistics_update_date
, reference_document_nbr
, reference_item_nbr
, preceding_sd_doc_category
, volume_unit
, item_volume
, sales_unit
, shipping_or_receiving_point
, sd_document_currency
, cost_in_document_currency
, own_or_external_plant
, target_quantity_uom
, target_quantity_in_sales_units
, outline_agreement_target_value_in_document_currency
, sales_district
, services_rendered_date
, billing_date
, incoterms_part_1
, incoterms_part_2
, customer_group
, customer_account_assignment_group
, price_determination_exchange_rate
, translation_date
, pricing_and_exchange_rate_date
, promotion
, product_catalog_number
, sd_document_currency_vbak
, order_header_division
, order_header_sales_doc_reference_category
, wbs_element
, number_of_order_items
, fiscal_year_variant
, campaign_of_referred_sales_order_item_for_bw_extraction
, planning_in_apo
, item_sales_qty_net_price
, odq_change_mode
, odq_counter
, dm_record_start_date
, dm_record_end_date
,dm_is_current
  from 
    dm.sales_document_item  sdi
  join
    stg.LIS_11_VAITM  vaitm
    on sdi.sls_dstrbn_document_nbr = vaitm.vbeln   
    and sdi.sd_doc_item_nbr = vaitm.posnr
  where 
    dm_is_current = ''1''
;';
 
    sql := 'SELECT COUNT(*) FROM temp_sales_document_item_match;';
    
    EXECUTE sql INTO staged_record_count;
    RAISE INFO 'Matched records into temp_sales_document_item_match: %', staged_record_count;
    

	-- Delete records from target table that also exist in staging table (updated records)
    
    EXECUTE 'DELETE FROM dm.sales_document_item  
using temp_sales_document_item_match tsih
 WHERE dm.sales_document_item.sls_dstrbn_document_nbr = tsih.sls_dstrbn_document_nbr
 and dm.sales_document_item.sd_doc_item_nbr = tsih.sd_doc_item_nbr
 and dm.sales_document_item.dm_is_current =''1'';';
    


	-- Insert all records from staging table into target table

	EXECUTE 'INSERT INTO DM.sales_document_item (cncl_data_recd_ind
, sls_dstrbn_document_nbr
, item_rejection_status
, sd_doc_item_nbr
, item_incompletion_status
, item_billing_incompletion_status
, item_pricing_incompletion_status
, item_delivery_incompletion_status
, quotation_or_inquiry_is_valid_from
, sales_document_type
, order_reason
, bid_quotation_valid_date
, company_code
, billing_block_in_sd_document
, local_currency
, sold_to_party
, exchange_rate_type
, customer_group_1
, customer_group_2
, customer_group_3
, customer_group_4
, customer_group_5
, delivery_block_document_header
, statistics_currency
, sd_document_category
, sales_office
, sales_group
, sales_organization
, distribution_channel
, reason_for_rejection_of_sales_documents
, last_changed_on
, item_order_probability
, item_gross_weight
, application_component
, sap_bw_transaction_key
, batch_number
, credit_data_exchange_rate_for_requested_delivery_date
, international_article_number_ean_upc
, record_create_date
, object_creator_name
, entry_time
, billing_block_for_item
, weight_unit
, cumulative_confirmed_quantity_in_sales_unit
, cumulative_confirmed_quantity_in_base_unit
, condition_unit
, sales_deal
, condition_pricing_unit
, cumulative_order_quantity_in_sales_units
, subtotal_1_from_pricing_procedure_for_price_element
, subtotal_2_from_pricing_procedure_for_price_element
, subtotal_3_from_pricing_procedure_for_price_element
, subtotal_4_from_pricing_procedure_for_price_element
, subtotal_5_from_pricing_procedure_for_price_element
, subtotal_6_from_pricing_procedure_for_price_element
, minimum_delivery_quantity_in_delivery_note_processing
, storage_location
, cumulative_required_delivery_qty_all_dlv_relev_sched_lines
, material_group
, material_number
, material_entered
, base_unit_of_measure
, material_group_1
, material_group_2
, material_group_3
, material_group_4
, material_group_5
, tax_amount_in_document_currency
, net_price
, net_value_of_the_order_item_in_document_currency
, net_weight_of_the_item
, ship_to_party_unload_point
, bill_to_party
, payer
, ship_to_party
, product_hierarchy
, forwarding_agent
, sales_document_item_category
, sales_employee
, route
, special_stock_indicator
, division
, statistics_date
, exchange_rate_for_statistics
, reason_for_material_substitution
, unlimited_overdelivery_allowed
, overdelivery_tolerance
, sales_qty_sku_denominator
, sales_qty_sku_numerator
, sales_base_sales_units_conversion_factor
, sales_base_sales_units_conversion_factor2
, underdelivery_tolerance
, statistics_update_date
, reference_document_nbr
, reference_item_nbr
, preceding_sd_doc_category
, volume_unit
, item_volume
, sales_unit
, shipping_or_receiving_point
, sd_document_currency
, cost_in_document_currency
, own_or_external_plant
, target_quantity_uom
, target_quantity_in_sales_units
, outline_agreement_target_value_in_document_currency
, sales_district
, services_rendered_date
, billing_date
, incoterms_part_1
, incoterms_part_2
, customer_group
, customer_account_assignment_group
, price_determination_exchange_rate
, translation_date
, pricing_and_exchange_rate_date
, promotion
, product_catalog_number
, sd_document_currency_vbak
, order_header_division
, order_header_sales_doc_reference_category
, wbs_element
, number_of_order_items
, fiscal_year_variant
, campaign_of_referred_sales_order_item_for_bw_extraction
, planning_in_apo
, item_sales_qty_net_price
, odq_change_mode
, odq_counter
, dm_record_start_date
, dm_record_end_date
,dm_is_current)
  with LIS_11_VAITM_latest as (select v.*,row_number() over (partition by vbeln,posnr order by AEDAT DESC,rocancel ) as doc_item_rank  from stg.LIS_11_VAITM v)


SELECT 
DISTINCT
rocancel,
vbeln,
absta,
posnr,
uvall,
uvfak,
uvprs,
uvvlk,
To_date(angdt,''YYYYMMDD''),
auart,
augru,
To_date(bnddt,''YYYYMMDD''),
bukrs,
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
stwae,
vbtyp,
vkbur,
vkgrp,
vkorg,
vtweg,
abgru,
To_date(aedat,''YYYYMMDD''),
awahr,
brgew,
bwapplnm,
bwvorg,
charg,
cmkua,
ean11,
To_date(erdat,''YYYYMMDD''),
ernam,
erzet,
faksp,
gewei,
kbmeng,
klmeng,
kmein,
knuma_ag,
kpein,
kwmeng,
kzwi1,
kzwi2,
kzwi3,
kzwi4,
kzwi5,
kzwi6,
lfmng,
lgort,
lsmeng,
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
netpr,
netwr,
ntgew,
pabla,
pkunre,
pkunrg,
pkunwe,
prodh,
pspdnr,
pstyv,
pvrtnr,
route,
sobkz,
spart,
To_date(stadat,''YYYYMMDD''),
stcur,
sugrd,
uebtk,
uebto,
umvkn,
umvkz,
umzin,
umziz,
untto,
To_date(vdatu,''YYYYMMDD''),
vgbel,
vgpos,
vgtyp,
voleh,
volum,
vrkme,
vstel,
waerk,
wavwr,
werks,
zieme,
zmeng,
zwert,
bzirk,
To_date(fbuda,''YYYYMMDD''),
To_date(fkdat,''YYYYMMDD''),
inco1,
inco2,
kdgrp,
ktgrd,
kursk,
To_date(kursk_dat,''YYYYMMDD''),
To_date(prsdt,''YYYYMMDD''),
waktion,
wminr,
waerk_vbak,
spara,
vgtyp_ak,
ps_posid,
anzaupo,
periv,
mcex_apcampaign,
apoplanned,
mcbw_netpr_avkm,
odq_changemode,
odq_entitycntr,
CURRENT_TIMESTAMP,
CASE WHEN rocancel =''X'' OR doc_item_rank > 1 THEN current_timestamp else ''9999-12-31''::DATE  END, 
CASE WHEN rocancel =''X'' OR doc_item_rank > 1 THEN ''0'' ELSE ''1'' END
FROM
LIS_11_VAITM_latest;';

  -- Insert Old records with expiry dates
    EXECUTE 'insert into dm.sales_document_item (
cncl_data_recd_ind
, sls_dstrbn_document_nbr
, item_rejection_status
, sd_doc_item_nbr
, item_incompletion_status
, item_billing_incompletion_status
, item_pricing_incompletion_status
, item_delivery_incompletion_status
, quotation_or_inquiry_is_valid_from
, sales_document_type
, order_reason
, bid_quotation_valid_date
, company_code
, billing_block_in_sd_document
, local_currency
, sold_to_party
, exchange_rate_type
, customer_group_1
, customer_group_2
, customer_group_3
, customer_group_4
, customer_group_5
, delivery_block_document_header
, statistics_currency
, sd_document_category
, sales_office
, sales_group
, sales_organization
, distribution_channel
, reason_for_rejection_of_sales_documents
, last_changed_on
, item_order_probability
, item_gross_weight
, application_component
, sap_bw_transaction_key
, batch_number
, credit_data_exchange_rate_for_requested_delivery_date
, international_article_number_ean_upc
, record_create_date
, object_creator_name
, entry_time
, billing_block_for_item
, weight_unit
, cumulative_confirmed_quantity_in_sales_unit
, cumulative_confirmed_quantity_in_base_unit
, condition_unit
, sales_deal
, condition_pricing_unit
, cumulative_order_quantity_in_sales_units
, subtotal_1_from_pricing_procedure_for_price_element
, subtotal_2_from_pricing_procedure_for_price_element
, subtotal_3_from_pricing_procedure_for_price_element
, subtotal_4_from_pricing_procedure_for_price_element
, subtotal_5_from_pricing_procedure_for_price_element
, subtotal_6_from_pricing_procedure_for_price_element
, minimum_delivery_quantity_in_delivery_note_processing
, storage_location
, cumulative_required_delivery_qty_all_dlv_relev_sched_lines
, material_group
, material_number
, material_entered
, base_unit_of_measure
, material_group_1
, material_group_2
, material_group_3
, material_group_4
, material_group_5
, tax_amount_in_document_currency
, net_price
, net_value_of_the_order_item_in_document_currency
, net_weight_of_the_item
, ship_to_party_unload_point
, bill_to_party
, payer
, ship_to_party
, product_hierarchy
, forwarding_agent
, sales_document_item_category
, sales_employee
, route
, special_stock_indicator
, division
, statistics_date
, exchange_rate_for_statistics
, reason_for_material_substitution
, unlimited_overdelivery_allowed
, overdelivery_tolerance
, sales_qty_sku_denominator
, sales_qty_sku_numerator
, sales_base_sales_units_conversion_factor
, sales_base_sales_units_conversion_factor2
, underdelivery_tolerance
, statistics_update_date
, reference_document_nbr
, reference_item_nbr
, preceding_sd_doc_category
, volume_unit
, item_volume
, sales_unit
, shipping_or_receiving_point
, sd_document_currency
, cost_in_document_currency
, own_or_external_plant
, target_quantity_uom
, target_quantity_in_sales_units
, outline_agreement_target_value_in_document_currency
, sales_district
, services_rendered_date
, billing_date
, incoterms_part_1
, incoterms_part_2
, customer_group
, customer_account_assignment_group
, price_determination_exchange_rate
, translation_date
, pricing_and_exchange_rate_date
, promotion
, product_catalog_number
, sd_document_currency_vbak
, order_header_division
, order_header_sales_doc_reference_category
, wbs_element
, number_of_order_items
, fiscal_year_variant
, campaign_of_referred_sales_order_item_for_bw_extraction
, planning_in_apo
, item_sales_qty_net_price
, odq_change_mode
, odq_counter
, dm_record_start_date
, dm_record_end_date
,dm_is_current
) 

   
SELECT 
distinct 
cncl_data_recd_ind
, sls_dstrbn_document_nbr
, item_rejection_status
, sd_doc_item_nbr
, item_incompletion_status
, item_billing_incompletion_status
, item_pricing_incompletion_status
, item_delivery_incompletion_status
, quotation_or_inquiry_is_valid_from
, sales_document_type
, order_reason
, bid_quotation_valid_date
, company_code
, billing_block_in_sd_document
, local_currency
, sold_to_party
, exchange_rate_type
, customer_group_1
, customer_group_2
, customer_group_3
, customer_group_4
, customer_group_5
, delivery_block_document_header
, statistics_currency
, sd_document_category
, sales_office
, sales_group
, sales_organization
, distribution_channel
, reason_for_rejection_of_sales_documents
, last_changed_on
, item_order_probability
, item_gross_weight
, application_component
, sap_bw_transaction_key
, batch_number
, credit_data_exchange_rate_for_requested_delivery_date
, international_article_number_ean_upc
, record_create_date
, object_creator_name
, entry_time
, billing_block_for_item
, weight_unit
, cumulative_confirmed_quantity_in_sales_unit
, cumulative_confirmed_quantity_in_base_unit
, condition_unit
, sales_deal
, condition_pricing_unit
, cumulative_order_quantity_in_sales_units
, subtotal_1_from_pricing_procedure_for_price_element
, subtotal_2_from_pricing_procedure_for_price_element
, subtotal_3_from_pricing_procedure_for_price_element
, subtotal_4_from_pricing_procedure_for_price_element
, subtotal_5_from_pricing_procedure_for_price_element
, subtotal_6_from_pricing_procedure_for_price_element
, minimum_delivery_quantity_in_delivery_note_processing
, storage_location
, cumulative_required_delivery_qty_all_dlv_relev_sched_lines
, material_group
, material_number
, material_entered
, base_unit_of_measure
, material_group_1
, material_group_2
, material_group_3
, material_group_4
, material_group_5
, tax_amount_in_document_currency
, net_price
, net_value_of_the_order_item_in_document_currency
, net_weight_of_the_item
, ship_to_party_unload_point
, bill_to_party
, payer
, ship_to_party
, product_hierarchy
, forwarding_agent
, sales_document_item_category
, sales_employee
, route
, special_stock_indicator
, division
, statistics_date
, exchange_rate_for_statistics
, reason_for_material_substitution
, unlimited_overdelivery_allowed
, overdelivery_tolerance
, sales_qty_sku_denominator
, sales_qty_sku_numerator
, sales_base_sales_units_conversion_factor
, sales_base_sales_units_conversion_factor2
, underdelivery_tolerance
, statistics_update_date
, reference_document_nbr
, reference_item_nbr
, preceding_sd_doc_category
, volume_unit
, item_volume
, sales_unit
, shipping_or_receiving_point
, sd_document_currency
, cost_in_document_currency
, own_or_external_plant
, target_quantity_uom
, target_quantity_in_sales_units
, outline_agreement_target_value_in_document_currency
, sales_district
, services_rendered_date
, billing_date
, incoterms_part_1
, incoterms_part_2
, customer_group
, customer_account_assignment_group
, price_determination_exchange_rate
, translation_date
, pricing_and_exchange_rate_date
, promotion
, product_catalog_number
, sd_document_currency_vbak
, order_header_division
, order_header_sales_doc_reference_category
, wbs_element
, number_of_order_items
, fiscal_year_variant
, campaign_of_referred_sales_order_item_for_bw_extraction
, planning_in_apo
, item_sales_qty_net_price
, odq_change_mode
, odq_counter
,dm_record_start_date 
,current_timestamp 
,0 
FROM
   
    temp_sales_document_item_match  tsih ;';

-- Refresh dm.sales_document_item_latest MV. This MV will be used to list the latest version of the sales_document_items

EXECUTE 'refresh materialized view dm.sales_document_item_latest;';
END
$$
