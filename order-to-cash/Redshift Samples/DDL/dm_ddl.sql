--**  Execute this script to create DM Schema and associated tables (Propogation Layer)

CREATE SCHEMA  dm;

CREATE TABLE dm.sales_document_header (
    cncl_data_recd_ind character varying(2) ENCODE lzo,
    sls_dstrbn_document_nbr character varying(20) ENCODE lzo,
    quotation_or_inquiry_is_valid_from date ENCODE az64,
    sales_document_type character varying(8) ENCODE lzo,
    order_reason character varying(6) ENCODE lzo,
    bid_quotation_valid_date date ENCODE az64,
    company_code character varying(8) ENCODE lzo,
    record_create_date date ENCODE az64,
    billing_block_in_sd_document character varying(4) ENCODE lzo,
    local_currency character varying(10) ENCODE lzo,
    sold_to_party character varying(20) ENCODE lzo,
    exchange_rate_type character varying(8) ENCODE lzo,
    customer_group_1 character varying(6) ENCODE lzo,
    customer_group_2 character varying(6) ENCODE lzo,
    customer_group_3 character varying(6) ENCODE lzo,
    customer_group_4 character varying(6) ENCODE lzo,
    customer_group_5 character varying(6) ENCODE lzo,
    delivery_block_document_header character varying(4) ENCODE lzo,
    billing_type character varying(8) ENCODE lzo,
    statistics_currency character varying(10) ENCODE lzo,
    sd_document_category character varying(8) ENCODE lzo,
    statistics_update_date date ENCODE az64,
    sales_office character varying(8) ENCODE lzo,
    sales_group character varying(6) ENCODE lzo,
    sales_organization character varying(8) ENCODE lzo,
    distribution_channel character varying(4) ENCODE lzo,
    sd_document_currency character varying(10) ENCODE lzo,
    order_header_division character varying(4) ENCODE lzo,
    order_header_sales_doc_reference_category character varying(8) ENCODE lzo,
    num_of_orders numeric(12, 5) ENCODE az64,
    fiscal_year_variant character varying(4) ENCODE lzo,
    odq_change_mode character varying(2) ENCODE lzo,
    odq_counter numeric(5, 2) ENCODE az64,
    dm_record_start_date timestamp without time zone ENCODE az64,
    dm_record_end_date timestamp without time zone ENCODE az64,
    dm_is_current character varying(1) ENCODE lzo
) DISTSTYLE AUTO;



CREATE TABLE DM.sales_document_item
(
 cncl_data_recd_ind	VARCHAR(2)
,sls_dstrbn_document_nbr	VARCHAR(20)
,item_rejection_status	VARCHAR(2)
,sd_doc_item_nbr	VARCHAR(12)
,item_incompletion_status	VARCHAR(2)
,item_billing_incompletion_status	VARCHAR(2)
,item_pricing_incompletion_status	VARCHAR(2)
,item_delivery_incompletion_status	VARCHAR(2)
,quotation_or_inquiry_is_valid_from	DATE
,sales_document_type	VARCHAR(8)
,order_reason	VARCHAR(6)
,bid_quotation_valid_date	DATE
,company_code	VARCHAR(8)
,billing_block_in_sd_document	VARCHAR(4)
,local_currency	VARCHAR(10)
,sold_to_party	VARCHAR(20)
,exchange_rate_type	VARCHAR(8)
,customer_group_1	VARCHAR(6)
,customer_group_2	VARCHAR(6)
,customer_group_3	VARCHAR(6)
,customer_group_4	VARCHAR(6)
,customer_group_5	VARCHAR(6)
,delivery_block_document_header	VARCHAR(4)
,statistics_currency	VARCHAR(10)
,sd_document_category	VARCHAR(8)
,sales_office	VARCHAR(8)
,sales_group	VARCHAR(6)
,sales_organization	VARCHAR(8)
,distribution_channel	VARCHAR(4)
,reason_for_rejection_of_sales_documents	VARCHAR(4)
,last_changed_on	DATE
,item_order_probability	NUMERIC(8,2)
,item_gross_weight	NUMERIC(11,3)
,application_component	VARCHAR(60)
,sap_bw_transaction_key	VARCHAR(6)
,batch_number	VARCHAR(20)
,credit_data_exchange_rate_for_requested_delivery_date	NUMERIC(12,5)
,international_article_number_ean_upc	VARCHAR(36)
,record_create_date	DATE
,object_creator_name	VARCHAR(24)
,entry_time	VARCHAR(26)
,billing_block_for_item	VARCHAR(4)
,weight_unit	VARCHAR(6)
,cumulative_confirmed_quantity_in_sales_unit	NUMERIC(11,3)
,cumulative_confirmed_quantity_in_base_unit	NUMERIC(11,3)
,condition_unit	VARCHAR(6)
,sales_deal	VARCHAR(20)
,condition_pricing_unit	NUMERIC(6,3)
,cumulative_order_quantity_in_sales_units	NUMERIC(11,3)
,subtotal_1_from_pricing_procedure_for_price_element	NUMERIC(9,2)
,subtotal_2_from_pricing_procedure_for_price_element	NUMERIC(9,2)
,subtotal_3_from_pricing_procedure_for_price_element	NUMERIC(9,2)
,subtotal_4_from_pricing_procedure_for_price_element	NUMERIC(9,2)
,subtotal_5_from_pricing_procedure_for_price_element	NUMERIC(9,2)
,subtotal_6_from_pricing_procedure_for_price_element	NUMERIC(9,2)
,minimum_delivery_quantity_in_delivery_note_processing	NUMERIC(10,3)
,storage_location	VARCHAR(8)
,cumulative_required_delivery_qty_all_dlv_relev_sched_lines	NUMERIC(11,3)
,material_group	VARCHAR(18)
,material_number	VARCHAR(80)
,material_entered	VARCHAR(80)
,base_unit_of_measure	VARCHAR(6)
,material_group_1	VARCHAR(6)
,material_group_2	VARCHAR(6)
,material_group_3	VARCHAR(6)
,material_group_4	VARCHAR(6)
,material_group_5	VARCHAR(6)
,tax_amount_in_document_currency	NUMERIC(9,2)
,net_price	NUMERIC(8,2)
,net_value_of_the_order_item_in_document_currency	NUMERIC(10,2)
,net_weight_of_the_item	NUMERIC(11,3)
,ship_to_party_unload_point	VARCHAR(50)
,bill_to_party	VARCHAR(20)
,payer	VARCHAR(20)
,ship_to_party	VARCHAR(20)
,product_hierarchy	VARCHAR(36)
,forwarding_agent	VARCHAR(20)
,sales_document_item_category	VARCHAR(8)
,sales_employee	VARCHAR(16)
,route	VARCHAR(12)
,special_stock_indicator	VARCHAR(2)
,division	VARCHAR(4)
,statistics_date	DATE
,exchange_rate_for_statistics	NUMERIC(12,5)
,reason_for_material_substitution	VARCHAR(8)
,unlimited_overdelivery_allowed	VARCHAR(2)
,overdelivery_tolerance	NUMERIC(2,1)
,sales_qty_sku_denominator	NUMERIC(6,3)
,sales_qty_sku_numerator	NUMERIC(6,3)
,sales_base_sales_units_conversion_factor	NUMERIC(6,3)
,sales_base_sales_units_conversion_factor2	NUMERIC(6,3)
,underdelivery_tolerance	NUMERIC(2,1)
,statistics_update_date	DATE
,reference_document_nbr	VARCHAR(20)
,reference_item_nbr	VARCHAR(12)
,preceding_sd_doc_category	VARCHAR(8)
,volume_unit	VARCHAR(6)
,item_volume	NUMERIC(11,3)
,sales_unit	VARCHAR(6)
,shipping_or_receiving_point	VARCHAR(8)
,sd_document_currency	VARCHAR(10)
,cost_in_document_currency	NUMERIC(9,2)
,own_or_external_plant	VARCHAR(8)
,target_quantity_uom	VARCHAR(6)
,target_quantity_in_sales_units	NUMERIC(7,3)
,outline_agreement_target_value_in_document_currency	NUMERIC(9,2)
,sales_district	VARCHAR(12)
,services_rendered_date	DATE
,billing_date	DATE
,incoterms_part_1	VARCHAR(6)
,incoterms_part_2	VARCHAR(56)
,customer_group	VARCHAR(4)
,customer_account_assignment_group	VARCHAR(4)
,price_determination_exchange_rate	NUMERIC(12,5)
,translation_date	DATE
,pricing_and_exchange_rate_date	DATE
,promotion	VARCHAR(20)
,product_catalog_number	VARCHAR(20)
,sd_document_currency_vbak	VARCHAR(10)
,order_header_division	VARCHAR(4)
,order_header_sales_doc_reference_category	VARCHAR(8)
,wbs_element	VARCHAR(48)
,number_of_order_items	NUMERIC(12,5)
,fiscal_year_variant	VARCHAR(4)
,campaign_of_referred_sales_order_item_for_bw_extraction	VARCHAR(64)
,planning_in_apo	VARCHAR(2)
,item_sales_qty_net_price	NUMERIC(8,2)
,odq_change_mode	VARCHAR(2)
,odq_counter	NUMERIC(5,2)
,dm_record_start_date	timestamp
,dm_record_end_date timestamp
,dm_is_current	varchar(1)
);

CREATE TABLE dm.matr_master (
    client character varying(3) ENCODE lzo,
    material_number character varying(40) ENCODE lzo,
    created_on date ENCODE az64,
    object_creator_name character varying(12) ENCODE lzo,
    date_of_last_change date ENCODE az64,
    name_of_person_who_changed_object character varying(12) ENCODE lzo,
    maintenance_status_of_complete_material character varying(15) ENCODE lzo,
    maintenance_status character varying(15) ENCODE lzo,
    flag_material_for_deletion_at_client_level character varying(1) ENCODE lzo,
    material_type character varying(4) ENCODE lzo,
    industry_sector character varying(1) ENCODE lzo,
    material_group character varying(9) ENCODE lzo,
    old_material_number character varying(40) ENCODE lzo,
    base_unit_of_measure character varying(3) ENCODE lzo,
    purchase_order_unit_of_measure character varying(3) ENCODE lzo,
    document_number_without_document_management_system character varying(22) ENCODE lzo,
    document_type_without_document_management_system character varying(3) ENCODE lzo,
    document_version_without_document_management_system character varying(2) ENCODE lzo,
    page_format_of_document_without_document_management_system character varying(4) ENCODE lzo,
    document_change_number_without_document_management_system character varying(6) ENCODE lzo,
    page_number_of_document_without_document_management_system character varying(3) ENCODE lzo,
    number_of_sheets_without_document_management_system integer ENCODE az64,
    production_or_inspection_memo character varying(18) ENCODE lzo,
    page_format_of_production_memo character varying(4) ENCODE lzo,
    size_or_dimensions character varying(32) ENCODE lzo,
    basic_material character varying(48) ENCODE lzo,
    industry_standard_description_such_as_ansi_or_iso character varying(18) ENCODE lzo,
    laboratory_or_design_office character varying(3) ENCODE lzo,
    purchasing_value_key character varying(4) ENCODE lzo,
    item_gross_weight numeric(16, 3) ENCODE az64,
    net_weight_of_the_item numeric(16, 3) ENCODE az64,
    weight_unit character varying(3) ENCODE lzo,
    item_volume numeric(16, 3) ENCODE az64,
    volume_unit character varying(3) ENCODE lzo,
    container_requirements character varying(2) ENCODE lzo,
    storage_conditions character varying(2) ENCODE lzo,
    temperature_conditions_indicator character varying(2) ENCODE lzo,
    low_level_code character varying(3) ENCODE lzo,
    transportation_group character varying(4) ENCODE lzo,
    hazardous_material_number character varying(40) ENCODE lzo,
    division character varying(2) ENCODE lzo,
    sold_to_party character varying(10) ENCODE lzo,
    european_article_number_ean_obsolete character varying(13) ENCODE lzo,
    number_of_gr_or_gi_slips_to_be_printed numeric(16, 3) ENCODE az64,
    procurement_rule character varying(1) ENCODE lzo,
    source_of_supply character varying(1) ENCODE lzo,
    season_category character varying(4) ENCODE lzo,
    label_type character varying(2) ENCODE lzo,
    label_form character varying(2) ENCODE lzo,
    disposal_type character varying(1) ENCODE lzo,
    international_article_number_ean_upc character varying(18) ENCODE lzo,
    category_of_international_article_number_ean character varying(2) ENCODE lzo,
    length numeric(16, 3) ENCODE az64,
    width numeric(16, 3) ENCODE az64,
    height numeric(16, 3) ENCODE az64,
    unit_of_dimension_for_length_or_width_or_height character varying(3) ENCODE lzo,
    product_hierarchy character varying(18) ENCODE lzo,
    stock_transfer_net_change_costing character varying(1) ENCODE lzo,
    cad_indicator character varying(1) ENCODE lzo,
    qm_in_procurement_is_active character varying(1) ENCODE lzo,
    allowed_packaging_weight numeric(16, 3) ENCODE az64,
    unit_of_weight_allowed_packaging_weight character varying(3) ENCODE lzo,
    allowed_packaging_volume numeric(16, 3) ENCODE az64,
    volume_unit_allowed_packaging_volume character varying(3) ENCODE lzo,
    excess_weight_tolerance_for_handling_unit numeric(4, 1) ENCODE az64,
    excess_volume_tolerance_of_the_handling_unit numeric(4, 1) ENCODE az64,
    variable_purchase_order_unit_active character varying(1) ENCODE lzo,
    revision_level_has_been_assigned_to_the_material character varying(1) ENCODE lzo,
    configurable_material character varying(1) ENCODE lzo,
    batch_management_requirement_indicator character varying(1) ENCODE lzo,
    packaging_material_type character varying(4) ENCODE lzo,
    maximum_level_by_volume numeric(6, 3) ENCODE az64,
    stacking_factor bigint ENCODE az64,
    material_group_packaging_materials character varying(4) ENCODE lzo,
    authorization_group character varying(4) ENCODE lzo,
    valid_from_date date ENCODE az64,
    deletion_date date ENCODE az64,
    season_year character varying(4) ENCODE lzo,
    price_band_category character varying(2) ENCODE lzo,
    empties_bill_of_material character varying(1) ENCODE lzo,
    external_material_group character varying(18) ENCODE lzo,
    cross_plant_configurable_material character varying(40) ENCODE lzo,
    material_category character varying(2) ENCODE lzo,
    material_co_product_indicator character varying(1) ENCODE lzo,
    material_follow_up_material_indicator character varying(1) ENCODE lzo,
    pricing_reference_material character varying(40) ENCODE lzo,
    cross_plant_material_status character varying(2) ENCODE lzo,
    cross_distribution_chain_material_status character varying(2) ENCODE lzo,
    date_from_which_the_cross_plant_material_status_is_valid date ENCODE az64,
    date_from_which_the_x_distr_chain_material_status_is_valid date ENCODE az64,
    tax_classification_of_the_material character varying(1) ENCODE lzo,
    catalog_profile character varying(9) ENCODE lzo,
    minimum_remaining_shelf_life numeric(8, 4) ENCODE az64,
    total_shelf_life numeric(8, 4) ENCODE az64,
    storage_percentage numeric(6, 3) ENCODE az64,
    content_unit character varying(3) ENCODE lzo,
    net_contents numeric(16, 3) ENCODE az64,
    comparison_price_unit numeric(10, 5) ENCODE az64,
    is_r_labeling_material_grouping_deactivated character varying(18) ENCODE lzo,
    gross_contents numeric(16, 3) ENCODE az64,
    quantity_conversion_method character varying(1) ENCODE lzo,
    internal_object_number character varying(18) ENCODE lzo,
    environmentally_relevant character varying(1) ENCODE lzo,
    product_allocation_determination_procedure character varying(18) ENCODE lzo,
    pricing_profile_for_variants character varying(1) ENCODE lzo,
    material_qualifies_for_discount_in_kind character varying(1) ENCODE lzo,
    manufacturer_part_number character varying(40) ENCODE lzo,
    manufacturer_number character varying(10) ENCODE lzo,
    number_of_firms_own_internal_inventory_managed_material character varying(40) ENCODE lzo,
    mfr_part_profile character varying(4) ENCODE lzo,
    units_of_measure_usage character varying(1) ENCODE lzo,
    rollout_in_a_season character varying(2) ENCODE lzo,
    dangerous_goods_indicator_profile character varying(3) ENCODE lzo,
    highly_viscous_indicator character varying(1) ENCODE lzo,
    in_bulk_or_liquid_indicator character varying(1) ENCODE lzo,
    level_of_explicitness_for_serial_number character varying(1) ENCODE lzo,
    packaging_material_is_closed_packaging character varying(1) ENCODE lzo,
    approved_batch_record_required character varying(1) ENCODE lzo,
    assign_effectivity_parameter_values_or__override_change_numbers character varying(1) ENCODE lzo,
    material_completion_level character varying(2) ENCODE lzo,
    period_indicator_for_shelf_life_expiration_date character varying(1) ENCODE lzo,
    rounding_rule_for_calculation_of_sled character varying(1) ENCODE lzo,
    product_composition_printed_on_packaging_indicator character varying(1) ENCODE lzo,
    general_item_category_group character varying(4) ENCODE lzo,
    generic_material_with_logistical_variants character varying(1) ENCODE lzo,
    material_is_activated_for_cw character varying(1) ENCODE lzo,
    valuation_unit_of_measure character varying(3) ENCODE lzo,
    tolerance_group_for_cwm character varying(9) ENCODE lzo,
    checkbox character varying(1) ENCODE lzo,
    base_unit_of_measure_cwm character varying(3) ENCODE lzo,
    external_long_material_number character varying(40) ENCODE lzo,
    material_version_number character varying(10) ENCODE lzo,
    external_material_number_plus_version_for_selection character varying(51) ENCODE lzo,
    nato_stock_number character varying(9) ENCODE lzo,
    internal_charactieristic_number_for_color_characteristics character varying(10) ENCODE lzo,
    internal_char_number_for_characteristics_for_main_sizes character varying(10) ENCODE lzo,
    internal_char_number_for_characteristics_for_second_sizes character varying(10) ENCODE lzo,
    characteristic_value_for_colors_of_variants character varying(18) ENCODE lzo,
    characteristic_value_for_main_sizes_of_variants character varying(18) ENCODE lzo,
    characteristic_value_for_second_size_for_variants character varying(18) ENCODE lzo,
    characteristic_value_for_evaluation_purposes character varying(18) ENCODE lzo,
    care_codes_such_as_washing_code_ironing_code_etc character varying(16) ENCODE lzo,
    brand character varying(4) ENCODE lzo,
    fiber_code_for_textiles_component_1 character varying(3) ENCODE lzo,
    percentage_share_of_fiber_component_1 numeric(6, 3) ENCODE az64,
    fiber_code_for_textiles_component_2 character varying(3) ENCODE lzo,
    percentage_share_of_fiber_component_2 numeric(6, 3) ENCODE az64,
    fiber_code_for_textiles_component_3 character varying(3) ENCODE lzo,
    percentage_share_of_fiber_component_3 numeric(6, 3) ENCODE az64,
    fiber_code_for_textiles_component_4 character varying(3) ENCODE lzo,
    percentage_share_of_fiber_component_4 numeric(6, 3) ENCODE az64,
    fiber_code_for_textiles_component_5 character varying(3) ENCODE lzo,
    percentage_share_of_fiber_component_5 numeric(6, 3) ENCODE az64,
    material_group_hierarchy_level_1 character varying(18) ENCODE lzo,
    material_group_hierarchy_level_2 character varying(18) ENCODE lzo,
    material_group_hierarchy_level_3 character varying(18) ENCODE lzo,
    material_group_hierarchy_level_4 character varying(18) ENCODE lzo,
    fashion_grade character varying(4) ENCODE lzo,
    odq_change_mode character varying(2) ENCODE lzo,
    odq_counter numeric(5, 2) ENCODE az64,
    dm_record_start_date timestamp without time zone ENCODE az64,
    dm_record_end_date timestamp without time zone ENCODE az64,
    dm_is_current character varying(1) ENCODE lzo
) DISTSTYLE AUTO;


CREATE TABLE dm.customer_master (
    client character varying(3) ENCODE lzo,
    customer_number character varying(10) ENCODE lzo,
    address character varying(10) ENCODE lzo,
    title character varying(15) ENCODE lzo,
    central_order_block_for_customer character varying(2) ENCODE lzo,
    express_train_station character varying(50) ENCODE lzo,
    train_station character varying(50) ENCODE lzo,
    international_location_number_part_1 character varying(7) ENCODE lzo,
    international_location_number_part_2 character varying(5) ENCODE lzo,
    authorization_group character varying(4) ENCODE lzo,
    industry_key character varying(4) ENCODE lzo,
    check_digit_for_the_international_location_number character varying(1) ENCODE lzo,
    data_communication_line_no character varying(14) ENCODE lzo,
    record_create_date date ENCODE az64,
    object_creator_name character varying(12) ENCODE lzo,
    unloading_points_exist_indicator character varying(1) ENCODE lzo,
    central_billing_block_for_customer character varying(2) ENCODE lzo,
    account_number_of_the_master_record_with_the_fiscal_address character varying(10) ENCODE lzo,
    working_time_calendar character varying(2) ENCODE lzo,
    account_number_of_an_alternative_payer character varying(10) ENCODE lzo,
    group_key character varying(10) ENCODE lzo,
    customer_account_group character varying(4) ENCODE lzo,
    customer_classification character varying(2) ENCODE lzo,
    country_or_region_key character varying(3) ENCODE lzo,
    Supplier_Account_Number character varying(20) ENCODE lzo,
    central_delivery_block_for_the_customer character varying(2) ENCODE lzo,
    city_coordinates character varying(10) ENCODE lzo,
    central_deletion_flag_for_master_record character varying(1) ENCODE lzo,
    name_1 character varying(35) ENCODE lzo,
    name_2 character varying(35) ENCODE lzo,
    name_3 character varying(35) ENCODE lzo,
    name_4 character varying(35) ENCODE lzo,
    nielsen_id character varying(2) ENCODE lzo,
    city character varying(35) ENCODE lzo,
    district character varying(35) ENCODE lzo,
    po_box character varying(10) ENCODE lzo,
    po_box_postal_code character varying(10) ENCODE lzo,
    postal_code character varying(10) ENCODE lzo,
    region_state_province_county character varying(3) ENCODE lzo,
    county_code character varying(3) ENCODE lzo,
    city_code character varying(4) ENCODE lzo,
    regional_market character varying(5) ENCODE lzo,
    sort_field character varying(10) ENCODE lzo,
    central_posting_block character varying(1) ENCODE lzo,
    language_key character varying(1) ENCODE lzo,
    tax_number_1 character varying(16) ENCODE lzo,
    tax_number_2 character varying(11) ENCODE lzo,
    business_partner_subject_to_equalization_tax_indicator character varying(1) ENCODE lzo,
    liable_for_vat character varying(1) ENCODE lzo,
    street_and_house_number character varying(35) ENCODE lzo,
    telebox_number character varying(15) ENCODE lzo,
    first_telephone_number character varying(16) ENCODE lzo,
    second_telephone_number character varying(16) ENCODE lzo,
    fax_number character varying(31) ENCODE lzo,
    teletex_number character varying(30) ENCODE lzo,
    telex_number character varying(30) ENCODE lzo,
    transportation_zone_to_or_from_which_the_goods_are_delivered character varying(10) ENCODE lzo,
    one_time_account_indicator character varying(1) ENCODE lzo,
    alternative_payee_in_document_allowed_indicator character varying(1) ENCODE lzo,
    company_id_of_trading_partner character varying(6) ENCODE lzo,
    vat_registration_number character varying(20) ENCODE lzo,
    competitor_indicator character varying(1) ENCODE lzo,
    sales_partner_indicator character varying(1) ENCODE lzo,
    sales_prospect_indicator character varying(1) ENCODE lzo,
    customer_type_4_indicator character varying(1) ENCODE lzo,
    default_sold_to_party_id character varying(1) ENCODE lzo,
    consumer_indicator character varying(1) ENCODE lzo,
    legal_status character varying(2) ENCODE lzo,
    industry_code_1 character varying(10) ENCODE lzo,
    industry_code_2 character varying(10) ENCODE lzo,
    industry_code_3 character varying(10) ENCODE lzo,
    industry_code_4 character varying(10) ENCODE lzo,
    industry_code_5 character varying(10) ENCODE lzo,
    initial_contact character varying(10) ENCODE lzo,
    annual_sales numeric(10, 2) ENCODE az64,
    year_for_which_sales_are_given character varying(4) ENCODE lzo,
    currency_of_sales_figure character varying(5) ENCODE lzo,
    yearly_number_of_employees integer ENCODE az64,
    year_for_which_the_number_of_employees_is_given character varying(4) ENCODE lzo,
    attribute_1 character varying(2) ENCODE lzo,
    attribute_2 character varying(2) ENCODE lzo,
    attribute_3 character varying(2) ENCODE lzo,
    attribute_4 character varying(2) ENCODE lzo,
    attribute_5 character varying(2) ENCODE lzo,
    attribute_6 character varying(3) ENCODE lzo,
    attribute_7 character varying(3) ENCODE lzo,
    attribute_8 character varying(3) ENCODE lzo,
    attribute_9 character varying(3) ENCODE lzo,
    attribute_10 character varying(3) ENCODE lzo,
    natural_person character varying(1) ENCODE lzo,
    annual_sales_1 numeric(17, 2) ENCODE az64,
    tax_jurisdiction character varying(15) ENCODE lzo,
    search_term_for_matchcode_search_1 character varying(50) ENCODE lzo,
    search_term_for_matchcode_search_2 character varying(50) ENCODE lzo,
    search_term_for_matchcode_search_3 character varying(50) ENCODE lzo,
    fiscal_year_variant character varying(4) ENCODE lzo,
    usage_indicator character varying(3) ENCODE lzo,
    inspection_carried_out_by_customer_no_inspection_lot character varying(1) ENCODE lzo,
    inspection_for_a_delivery_note_after_outbound_delivery character varying(1) ENCODE lzo,
    reference_account_group_for_one_time_account_customer character varying(4) ENCODE lzo,
    po_box_city character varying(35) ENCODE lzo,
    own_or_external_plant character varying(8) ENCODE lzo,
    report_key_for_data_medium_exchange character varying(1) ENCODE lzo,
    instruction_key_for_data_medium_exchange character varying(2) ENCODE lzo,
    status_of_data_transfer_into_subsequent_release character varying(1) ENCODE lzo,
    assignment_to_hierarchy character varying(2) ENCODE lzo,
    payment_block character varying(1) ENCODE lzo,
    is_r_labeling_customer_or_plant_group character varying(10) ENCODE lzo,
    id_for_mainly_non_military_use character varying(1) ENCODE lzo,
    id_for_mainly_military_use character varying(1) ENCODE lzo,
    customer_condition_group_1 character varying(2) ENCODE lzo,
    customer_condition_group_2 character varying(2) ENCODE lzo,
    customer_condition_group_3 character varying(2) ENCODE lzo,
    customer_condition_group_4 character varying(2) ENCODE lzo,
    customer_condition_group_5 character varying(2) ENCODE lzo,
    alternative_payer_using_account_number_indicator character varying(1) ENCODE lzo,
    tax_type character varying(2) ENCODE lzo,
    tax_number_type character varying(2) ENCODE lzo,
    tax_number_3 character varying(18) ENCODE lzo,
    tax_number_4 character varying(18) ENCODE lzo,
    customer_is_icms_exempt character varying(1) ENCODE lzo,
    customer_is_ipi_exempt character varying(1) ENCODE lzo,
    customer_group_for_substituiçao_tributária_calculation character varying(3) ENCODE lzo,
    customer_cfop_category character varying(2) ENCODE lzo,
    tax_law_icms character varying(3) ENCODE lzo,
    tax_law_ipi character varying(3) ENCODE lzo,
    biochemical_warfare_for_legal_control_indicator character varying(1) ENCODE lzo,
    nuclear_nonproliferation_for_legal_control_indicator character varying(1) ENCODE lzo,
    national_security_for_legal_control_indicator character varying(1) ENCODE lzo,
    missile_technology_for_legal_control_indicator character varying(1) ENCODE lzo,
    central_sales_block_for_customer character varying(2) ENCODE lzo,
    uniform_resource_locator character varying(132) ENCODE lzo,
    dm_record_start_date timestamp without time zone ENCODE az64,
    dm_record_end_date timestamp without time zone ENCODE az64,
    dm_is_current character varying(1) ENCODE lzo
) DISTSTYLE AUTO;

CREATE TABLE dm.sales_delivery_header (
    cncl_data_recd_ind character varying(2) ENCODE lzo,
    sls_dstrbn_document_nbr character varying(20) ENCODE lzo,
    unloading_point character varying(50) ENCODE lzo,
    total_weight numeric(8, 3) ENCODE az64,
    company_code character varying(8) ENCODE lzo,
    sales_district character varying(12) ENCODE lzo,
    record_create_date date ENCODE az64,
    billing_block character varying(4) ENCODE lzo,
    weight_unit character varying(6) ENCODE lzo,
    incoterms_part_1 character varying(6) ENCODE lzo,
    incoterms_part_2 character varying(56) ENCODE lzo,
    customer_group character varying(4) ENCODE lzo,
    sold_to_party character varying(20) ENCODE lzo,
    ship_to_party character varying(20) ENCODE lzo,
    delivery_type character varying(8) ENCODE lzo,
    delivery_date date ENCODE az64,
    vendor_account_number character varying(20) ENCODE lzo,
    delivery_block__document_header character varying(4) ENCODE lzo,
    loading_point character varying(4) ENCODE lzo,
    net_weight numeric(19, 3) ENCODE az64,
    bill_to_party character varying(20) ENCODE lzo,
    payer character varying(20) ENCODE lzo,
    forwarding_agent character varying(20) ENCODE lzo,
    sales_employee character varying(16) ENCODE lzo,
    route character varying(12) ENCODE lzo,
    sd_document_category character varying(8) ENCODE lzo,
    sales_organization character varying(8) ENCODE lzo,
    volume_unit character varying(6) ENCODE lzo,
    volume numeric(18, 3) ENCODE az64,
    shipping_point_receiving_point character varying(8) ENCODE lzo,
    planned_goods_movement_date date ENCODE az64,
    actual_goods_movement_date date ENCODE az64,
    num_of_deliveries numeric(5, 0) ENCODE az64,
    num_of_packages_per_delivery numeric(5, 0) ENCODE az64,
    fiscal_year_variant character varying(4) ENCODE lzo,
    actual_gi_delay_gi_date_for_delivery numeric(5, 0) ENCODE az64,
    odq_change_mode character varying(2) ENCODE lzo,
    odq_counter numeric(5, 2) ENCODE az64,
    dm_record_start_date timestamp without time zone ENCODE az64,
    dm_record_end_date timestamp without time zone ENCODE az64,
    dm_is_current character varying(1) ENCODE lzo
) DISTSTYLE AUTO;

CREATE TABLE dm.delivery_item (
    cncl_data_recd_ind character varying(2) ENCODE lzo,
    sls_dstrbn_document_nbr character varying(20) ENCODE lzo,
    picking_or_putaway_confirmation_status character varying(2) ENCODE lzo,
    item_picking_or_putaway_status character varying(2) ENCODE lzo,
    sd_doc_item_nbr character varying(12) ENCODE lzo,
    item_goods_movement_status character varying(2) ENCODE lzo,
    unloading_point character varying(50) ENCODE lzo,
    company_code character varying(8) ENCODE lzo,
    sales_district character varying(12) ENCODE lzo,
    billing_block_in_sd_document character varying(4) ENCODE lzo,
    incoterms_part_1 character varying(6) ENCODE lzo,
    incoterms_part_2 character varying(56) ENCODE lzo,
    customer_group character varying(4) ENCODE lzo,
    sold_to_party character varying(20) ENCODE lzo,
    ship_to_party character varying(20) ENCODE lzo,
    delivery_type character varying(8) ENCODE lzo,
    delivery_date date ENCODE az64,
    vendor_account_number character varying(20) ENCODE lzo,
    delivery_block_document_header character varying(4) ENCODE lzo,
    loading_point character varying(4) ENCODE lzo,
    route character varying(12) ENCODE lzo,
    sd_document_category character varying(8) ENCODE lzo,
    sales_organization character varying(8) ENCODE lzo,
    shipping_or_receiving_point character varying(8) ENCODE lzo,
    planned_goods_movement_date date ENCODE az64,
    actual_goods_movement_date date ENCODE az64,
    last_changed_on date ENCODE az64,
    promotion character varying(20) ENCODE lzo,
    item_gross_weight numeric(8, 3) ENCODE az64,
    application_component character varying(60) ENCODE lzo,
    sap_bw_transaction_key character varying(6) ENCODE lzo,
    batch_number character varying(20) ENCODE lzo,
    international_article_number_ean_upc character varying(36) ENCODE lzo,
    record_create_date date ENCODE az64,
    object_creator_name character varying(24) ENCODE lzo,
    entry_time character varying(26) ENCODE lzo,
    billing_block_for_item character varying(4) ENCODE lzo,
    weight_unit character varying(6) ENCODE lzo,
    business_area character varying(8) ENCODE lzo,
    picking_control_indicator character varying(2) ENCODE lzo,
    customer_group_1 character varying(6) ENCODE lzo,
    customer_group_2 character varying(6) ENCODE lzo,
    customer_group_3 character varying(6) ENCODE lzo,
    customer_group_4 character varying(6) ENCODE lzo,
    customer_group_5 character varying(6) ENCODE lzo,
    consumption_posting character varying(2) ENCODE lzo,
    actual_quantity_delivered_in_sales_units numeric(17, 3) ENCODE az64,
    actualquantitydeliveredinstockkeepingunits numeric(17, 3) ENCODE az64,
    warehouse_number_or_complex character varying(6) ENCODE lzo,
    storage_location character varying(8) ENCODE lzo,
    storage_bin character varying(20) ENCODE lzo,
    storagetype character varying(6) ENCODE lzo,
    material_group character varying(18) ENCODE lzo,
    material_number character varying(80) ENCODE lzo,
    material_entered character varying(80) ENCODE lzo,
    base_unit_of_measure character varying(6) ENCODE lzo,
    material_group_1 character varying(6) ENCODE lzo,
    material_group_2 character varying(6) ENCODE lzo,
    material_group_3 character varying(6) ENCODE lzo,
    material_group_4 character varying(6) ENCODE lzo,
    material_group_5 character varying(6) ENCODE lzo,
    net_weight_of_the_item numeric(8, 3) ENCODE az64,
    bill_to_party character varying(20) ENCODE lzo,
    payer character varying(20) ENCODE lzo,
    item_type character varying(2) ENCODE lzo,
    product_hierarchy character varying(36) ENCODE lzo,
    forwarding_agent character varying(20) ENCODE lzo,
    sales_document_item_category character varying(8) ENCODE lzo,
    sales_employee character varying(16) ENCODE lzo,
    statistics_date date ENCODE az64,
    sales_qty_sku_denominator numeric(3, 0) ENCODE az64,
    sales_qty_sku_numerator numeric(3, 0) ENCODE az64,
    fixed_shipping_processing_time_in_days numeric(6, 2) ENCODE az64,
    variable_shipping_processing_time_in_days numeric(6, 2) ENCODE az64,
    statistics_update_date date ENCODE az64,
    reference_document_nbr character varying(20) ENCODE lzo,
    reference_item_nbr character varying(12) ENCODE lzo,
    preceding_sd_doc_category character varying(8) ENCODE lzo,
    sales_office character varying(8) ENCODE lzo,
    sales_group character varying(6) ENCODE lzo,
    volume_unit character varying(6) ENCODE lzo,
    item_volume numeric(8, 3) ENCODE az64,
    sales_unit character varying(6) ENCODE lzo,
    distribution_channel character varying(4) ENCODE lzo,
    own_or_external_plant character varying(8) ENCODE lzo,
    num_of_delivery_items numeric(12, 5) ENCODE az64,
    order_header_division character varying(4) ENCODE lzo,
    wbs_element character varying(48) ENCODE lzo,
    fiscal_year_variant character varying(4) ENCODE lzo,
    bw_extraction_le_actual_gi_delay numeric(12, 5) ENCODE az64,
    campaign_of_referred_sales_order_item_for_bw_extraction character varying(64) ENCODE lzo,
    odq_change_mode character varying(2) ENCODE lzo,
    odq_counter numeric(5, 2) ENCODE az64,
    dm_record_start_date timestamp without time zone ENCODE az64,
    dm_record_end_date timestamp without time zone ENCODE az64,
    dm_is_current character varying(1) ENCODE lzo
) DISTSTYLE AUTO;

CREATE TABLE dm.billing_document_header (
    cncl_data_recd_ind character varying(2) ENCODE lzo,
    sls_dstrbn_document_nbr character varying(20) ENCODE lzo,
    company_code character varying(8) ENCODE lzo,
    sales_district character varying(12) ENCODE lzo,
    record_create_date date ENCODE az64,
    billing_type character varying(8) ENCODE lzo,
    billing_date date ENCODE az64,
    billing_category character varying(2) ENCODE lzo,
    local_currency character varying(10) ENCODE lzo,
    customer_group character varying(4) ENCODE lzo,
    sold_to_party character varying(20) ENCODE lzo,
    payer character varying(20) ENCODE lzo,
    financial_accounting_exchangerate numeric(12, 5) ENCODE az64,
    exchange_rate_type character varying(8) ENCODE lzo,
    sales_employee character varying(16) ENCODE lzo,
    statistics_currency character varying(10) ENCODE lzo,
    sd_document_category character varying(8) ENCODE lzo,
    sales_organization character varying(8) ENCODE lzo,
    distribution_channel character varying(4) ENCODE lzo,
    sd_document_currency character varying(10) ENCODE lzo,
    num_of_billing_docs numeric(12, 5) ENCODE az64,
    fiscal_year_variant character varying(4) ENCODE lzo,
    odq_change_mode character varying(2) ENCODE lzo,
    odq_counter numeric(5, 2) ENCODE az64,
    dm_record_start_date timestamp without time zone ENCODE az64,
    dm_record_end_date timestamp without time zone ENCODE az64,
    dm_is_current character varying(1) ENCODE lzo
) DISTSTYLE AUTO;

CREATE TABLE dm.billing_document_item (
    cncl_data_recd_ind character varying(2) ENCODE lzo,
    sls_dstrbn_document_nbr character varying(20) ENCODE lzo,
    sd_doc_item_nbr character varying(12) ENCODE lzo,
    last_changed_on date ENCODE az64,
    company_code character varying(8) ENCODE lzo,
    sales_district character varying(12) ENCODE lzo,
    billing_type character varying(8) ENCODE lzo,
    billing_date date ENCODE az64,
    billing_category character varying(2) ENCODE lzo,
    local_currency character varying(10) ENCODE lzo,
    customer_group character varying(4) ENCODE lzo,
    sold_to_party character varying(20) ENCODE lzo,
    payer character varying(20) ENCODE lzo,
    financial_accounting_exchangerate numeric(12, 5) ENCODE az64,
    exchange_rate_type character varying(8) ENCODE lzo,
    statistics_currency character varying(10) ENCODE lzo,
    sd_document_category character varying(8) ENCODE lzo,
    sales_organization character varying(8) ENCODE lzo,
    distribution_channel character varying(4) ENCODE lzo,
    sd_document_currency character varying(10) ENCODE lzo,
    promotion character varying(20) ENCODE lzo,
    sales_document character varying(20) ENCODE lzo,
    sales_document_item character varying(12) ENCODE lzo,
    rebate_basis_1 numeric(10, 2) ENCODE az64,
    volume_rebate_group character varying(4) ENCODE lzo,
    item_gross_weight numeric(8, 3) ENCODE az64,
    billing_item_grossvalue numeric(10, 2) ENCODE az64,
    application_component character varying(60) ENCODE lzo,
    sap_bw_transaction_key character varying(6) ENCODE lzo,
    batch_number character varying(20) ENCODE lzo,
    international_article_number_ean_upc character varying(36) ENCODE lzo,
    record_create_date date ENCODE az64,
    billing_or_invoice_plan_rule character varying(2) ENCODE lzo,
    services_rendered_date date ENCODE az64,
    actual_billed_quantity numeric(10, 3) ENCODE az64,
    billing_quantity_in_stock_keeping_unit numeric(10, 3) ENCODE az64,
    weight_unit character varying(6) ENCODE lzo,
    sales_deal character varying(20) ENCODE lzo,
    controlling_area character varying(8) ENCODE lzo,
    costcenter character varying(20) ENCODE lzo,
    price_determination_exchange_rate numeric(10, 5) ENCODE az64,
    translation_date date ENCODE az64,
    customer_group_1 character varying(6) ENCODE lzo,
    customer_group_2 character varying(6) ENCODE lzo,
    customer_group_3 character varying(6) ENCODE lzo,
    customer_group_4 character varying(6) ENCODE lzo,
    customer_group_5 character varying(6) ENCODE lzo,
    subtotal_1_from_pricing_procedure_for_price_element numeric(11, 2) ENCODE az64,
    subtotal_2_from_pricing_procedure_for_price_element numeric(11, 2) ENCODE az64,
    subtotal_3_from_pricing_procedure_for_price_element numeric(11, 2) ENCODE az64,
    subtotal_4_from_pricing_procedure_for_price_element numeric(11, 2) ENCODE az64,
    subtotal_5_from_pricing_procedure_for_price_element numeric(11, 2) ENCODE az64,
    subtotal_6_from_pricing_procedure_for_price_element numeric(11, 2) ENCODE az64,
    storage_location character varying(8) ENCODE lzo,
    mat_management_requiredquantity numeric(10, 3) ENCODE az64,
    material_group character varying(18) ENCODE lzo,
    material_number character varying(80) ENCODE lzo,
    material_entered character varying(80) ENCODE lzo,
    base_unit_of_measure character varying(6) ENCODE lzo,
    material_group_1 character varying(6) ENCODE lzo,
    material_group_2 character varying(6) ENCODE lzo,
    material_group_3 character varying(6) ENCODE lzo,
    material_group_4 character varying(6) ENCODE lzo,
    material_group_5 character varying(6) ENCODE lzo,
    tax_amount_in_document_currency numeric(11, 2) ENCODE az64,
    net_value_of_the_order_item_in_document_currency numeric(8, 2) ENCODE az64,
    net_weight_of_the_item numeric(8, 3) ENCODE az64,
    bill_to_party character varying(20) ENCODE lzo,
    ship_to_party character varying(20) ENCODE lzo,
    item_type character varying(2) ENCODE lzo,
    product_hierarchy character varying(36) ENCODE lzo,
    commissiongroup character varying(4) ENCODE lzo,
    pricing_and_exchange_rate_date date ENCODE az64,
    sales_document_item_category character varying(8) ENCODE lzo,
    sales_employee character varying(16) ENCODE lzo,
    amounteligibleforcashdiscount numeric(10, 3) ENCODE az64,
    scale_quantity numeric(10, 3) ENCODE az64,
    order_header_division character varying(4) ENCODE lzo,
    division character varying(4) ENCODE lzo,
    statistics_date date ENCODE az64,
    exchange_rate_for_statistics numeric(10, 5) ENCODE az64,
    sales_qty_sku_denominator numeric(6, 3) ENCODE az64,
    sales_qty_sku_numerator numeric(6, 3) ENCODE az64,
    statistics_update_date date ENCODE az64,
    reference_document_nbr character varying(20) ENCODE lzo,
    reference_item_nbr character varying(12) ENCODE lzo,
    sales_office character varying(8) ENCODE lzo,
    sales_group character varying(6) ENCODE lzo,
    volume_unit character varying(6) ENCODE lzo,
    item_volume numeric(8, 3) ENCODE az64,
    sales_unit character varying(6) ENCODE lzo,
    shipping_or_receiving_point character varying(8) ENCODE lzo,
    cost_in_document_currency numeric(11, 2) ENCODE az64,
    own_or_external_plant character varying(8) ENCODE lzo,
    wbs_element character varying(48) ENCODE lzo,
    num_of_billing_items numeric(12, 5) ENCODE az64,
    fiscal_year_variant character varying(4) ENCODE lzo,
    campaign_of_referred_sales_order_item_for_bw_extraction character varying(64) ENCODE lzo,
    odq_change_mode character varying(2) ENCODE lzo,
    odq_counter numeric(5, 2) ENCODE az64,
    dm_record_start_date timestamp without time zone ENCODE az64,
    dm_record_end_date timestamp without time zone ENCODE az64,
    dm_is_current character varying(1) ENCODE lzo
) DISTSTYLE AUTO;
