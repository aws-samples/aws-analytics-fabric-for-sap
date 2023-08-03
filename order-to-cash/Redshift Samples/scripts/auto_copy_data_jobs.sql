COPY stg.LIS_11_VAHDR
FROM 's3://acc-sap-corpmem/cf_2lis_11_vahdr/'
iam_role 'arn:aws:iam::086684561838:role/RedshiftServerlessImmersionRole'
DATEFORMAT AS 'auto'
json 'auto ignorecase'
JOB CREATE auto_copy_LIS_11_VAHDR AUTO OFF
;

COPY stg.LIS_11_VAITM
FROM 's3://acc-sap-corpmem/cf_2lis_11_vaitm/'
iam_role 'arn:aws:iam::086684561838:role/RedshiftServerlessImmersionRole'
DATEFORMAT AS 'auto'
json 'auto ignorecase' 
JOB CREATE auto_copy_LIS_11_VAITM AUTO OFF
;

COPY stg.LIS_12_VCITM
FROM 's3://acc-sap-corpmem/cf_2lis_12_vcitm/'
iam_role 'arn:aws:iam::086684561838:role/RedshiftServerlessImmersionRole'
DATEFORMAT AS 'auto'
json 'auto ignorecase'
JOB CREATE auto_copy_LIS_12_VCITM AUTO OFF;

COPY stg.LIS_12_VCHDR
FROM 's3://acc-sap-corpmem/cf_2lis_12_vcitm/'
iam_role 'arn:aws:iam::086684561838:role/RedshiftServerlessImmersionRole'
DATEFORMAT AS 'auto'
json 'auto ignorecase'
JOB CREATE auto_copy_LIS_12_VCHDR AUTO OFF;

COPY stg.LIS_13_VDITM
FROM 's3://acc-sap-corpmem/cf_2lis_13_vditm/'
iam_role 'arn:aws:iam::086684561838:role/RedshiftServerlessImmersionRole'
DATEFORMAT AS 'auto'
json 'auto ignorecase'
JOB CREATE auto_copy_lis_13_vditm AUTO OFF;

COPY stg.lis_13_vdhdr
FROM 's3://acc-sap-corpmem/cf_2lis_13_vdhdr/'
iam_role 'arn:aws:iam::086684561838:role/RedshiftServerlessImmersionRole'
DATEFORMAT AS 'auto'
json 'auto ignorecase'
JOB CREATE auto_copy_lis_13_vdhdr AUTO OFF;

COPY stg.CUSTOMER_ATTR
FROM 's3://acc-sap-corpmem/cf_customer_attr/'
iam_role 'arn:aws:iam::086684561838:role/RedshiftServerlessImmersionRole'
DATEFORMAT AS 'auto'
json 'auto ignorecase'
JOB CREATE auto_copy_CUSTOMER_ATTR AUTO OFF
;

COPY stg.MATR_ATTR
FROM 's3://acc-sap-corpmem/cf_material_attr/'
iam_role 'arn:aws:iam::086684561838:role/RedshiftServerlessImmersionRole'
DATEFORMAT AS 'auto'
json 'auto ignorecase' JOB CREATE auto_copy_MATR_ATTR AUTO OFF;


