--**Contains definition for reporting materialized views

create schema archdm;

create materialized view archdm.sales_document_item_latest
distkey
    (sls_dstrbn_document_nbr) auto refresh yes AS
SELECT
    *
FROM
    dm.sales_document_item
where
    dm_is_current = '1' ;

create materialized view archdm.sales_document_header_latest
distkey
    (sls_dstrbn_document_nbr) auto refresh yes AS
SELECT
    *
FROM
    dm.sales_document_header
where
    dm_is_current = '1';

CREATE MATERIALIZED VIEW archdm.matr_master_latest DISTSTYLE ALL AUTO REFRESH YES AS
SELECT
    *
FROM
    dm.matr_master
where
    dm_is_current = '1';

create materialized view archdm.customer_master_latest diststyle all auto refresh yes AS
SELECT
    *
FROM
    dm.customer_master
where
    dm_is_current = '1';

create materialized view archdm.sales_delivery_header_latest
distkey
    (sls_dstrbn_document_nbr) auto refresh yes AS
SELECT
    *
FROM
    dm.sales_delivery_header
where
    dm_is_current = '1';

create materialized view archdm.delivery_item_latest
distkey
    (sls_dstrbn_document_nbr) auto refresh yes AS
SELECT
    *
FROM
    dm.delivery_item
where
    dm_is_current = '1';

Create materialized view archdm.billing_document_header_latest
distkey
    (sls_dstrbn_document_nbr) auto refresh yes AS
SELECT
    *
FROM
    dm.billing_document_header
where
    dm_is_current = '1' ;

create materialized view archdm.billing_document_item_latest
distkey
    (sls_dstrbn_document_nbr) auto refresh yes AS
SELECT
    *
FROM
    dm.billing_document_item
where
    dm_is_current = '1' ;

--Materialised View sample for Consumption (Building on the above )

/*
CREATE MATERIALIZED VIEW archdm.salesorders AS
    select  h.sls_dstrbn_document_nbr,
            h.sales_document_type,
            h.order_reason,
            h.record_create_date,
            h.sold_to_party,
            h.sales_organization,
            i.material_number,
            i.net_price,
            i.number_of_order_items
    from archdm.sales_document_header_latest h
    left join archdm.sales_document_item_latest i on 
      h.sls_dstrbn_document_nbr = i.sls_dstrbn_document_nbr;    
*/


