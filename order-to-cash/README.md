### Order-To-Cash (OTC)

The Order to cash accelerator utilises SAP provided standard business content extractors to extract data from your underlying SAP system, targeting changes, utilising the SAP built in delta mechanism.

The key transactional data extractors used are:

*2lis_11_vaitm* - Sales Order Item \
*2lis_11_vahdr* - Sales Order Header \
*2lis_12_vchdr* - Deliveries Header \
*2lis_12_vcitm* - Deliveries Item \
*2lis_13_vdhdr* - Billing Document Header \
*2lis_13_vditm* - Billing Document Item 

In addition, key master data extractors included are:

*0material_attr* - Material Master attributes \
*0material_text* - Material Master texts \
*0customer_attr* - Customer Master attributes \
*0customer_text* - Customer Master texts 

Master data text extractors included are: 

*0matl_grp_1_text* - Material Group 1 text  
*0matl_grp_2_text* - Material Group 2 text \
*0matl_grp_3_text* - Material Group 3 text \
*0matl_grp_4_text* - Material Group 4 text \
*0matl_grp_5_text* - Material Group 5 text \
*0cust_grp_1_text* - Customer Group 1 text \
*0cust_grp_2_text* - Customer Group 2 text \
*0cust_grp_3_text* - Customer Group 3 text \
*0cust_grp_4_text* - Customer Group 4 text \
*0cust_grp_5_text* - Customer Group 5 text 

Additional extractors, both transactional and master data can be added into your build by using these accelerators as a guide.

#### Accelerator implementation steps 

1.  Complete the pre-requisite steps as detailed in the main readme.  This includes: \
    a.)  Installing the above extractors in your SAP system (RSA6) and relevant configuration as per the README  \
    b.)  Exposing these datasources as an ODP service (SEGW) \
    c.)  Creating the system connection between Amazon AppFlow and your SAP source system.
    d.)  Creating Redhisft cluster in preview, with preview track **preview_2022**, to support the S3 autocopy feature

2.  In order, the execute deployments, as per below \
    a.)  Cloudformation scripts for AppFlow.  These can be executed in any order \
    b.)  Once data has loaded, run Cloudformation for Glue Data Catalog.  This will deploy the Glue Data Catalog entries. \
    c.)  Redshift samples, DDLs scripts should be run first. (be sure to create your own database in Redshift if not deploying to default before the DDLs) Execute in order of\
        1.  stg_ddl.sql\
        2.  dm_ddl.sql\
        3.  archdm_ddl.sql\
        Then these scripts, should be executed in the following order \
        4.  reporting_mvs.sql \
        5.  auto_copy_data_jobs.sql (**NOTE at time of making this repo publicly available, autocopy utilised in this script is only available in preview, please reference this link for updates (https://docs.aws.amazon.com/redshift/latest/dg/loading-data-copy-job.html), before executing please find and replace all entries with 'acc-sap-corpmem' bucket with your S3 bucket name and the iam_role with the appropriate role within your Redshift environment \
        6.  each incremental*.sql script\
        7.  orchestration.sql\
    d.)  Cloudformation for Step Functions \
    e.)  Connection to your Redshift cluster for Quicksight, and then the Cloudformation scripts for datasources. \
    f.)  Once the datasources are created, Cloudformation for the datasets
