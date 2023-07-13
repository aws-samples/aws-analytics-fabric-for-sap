-- This functionality will be moved to Step Functions eventually

CREATE OR REPLACE PROCEDURE public.incremental_sync_master_tables()
 LANGUAGE plpgsql
AS $$

BEGIN
  CALL incremental_sync_material_attr();
  CALL incremental_sync_customer_attr();
END;
$$

CREATE OR REPLACE PROCEDURE public.incremental_sync_transaction_tables()
 LANGUAGE plpgsql
AS $$

BEGIN
  CALL incremental_sync_sales_document_header();
  CALL incremental_sync_sales_document_item();
END;
$$

CREATE OR REPLACE PROCEDURE public.incremental_sync_all_tables()
 LANGUAGE plpgsql
AS $$

BEGIN
  CALL incremental_sync_master_tables();
  CALL incremental_sync_transaction_tables();
END;
$$

-- Execute incremental_sync_all_tables() to populate the DM tables and Materialized views. 
-- Once this procedure is done, call a procedure to refresh the reporting MVs built on top of the archdm MVs
