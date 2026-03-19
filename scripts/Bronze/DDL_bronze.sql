if object_id ('bronze.cust_info','U') is not null 
	drop table bronze.cust_info;
create table bronze.cust_info (
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_material_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE
);
--EXEC sp_rename 'bronze.cust_info.cst_crete_date', 'cst_create_date', 'COLUMN';

if object_id ('bronze.prd_info','U') is not null 
	drop table bronze.prd_info;
create table bronze.prd_info (
	prd_id INT,
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATETIME,
	prd_end_dt DATETIME
);

if object_id ('bronze.sales_details','U') is not null 
	drop table bronze.sales_details;
create table bronze.sales_details (
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt INT,
	sls_ship_dt INT,
	sls_due_dt INT,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT
);

if object_id ('bronze.erp_CUST_AZ12','U') is not null 
	drop table bronze.erp_CUST_AZ12;
create table bronze.erp_CUST_AZ12 (
	CID NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50)
);

if object_id ('bronze.erp_LOC_A101','U') is not null 
	drop table bronze.erp_LOC_A101;
create table bronze.erp_LOC_A101 (
	CID NVARCHAR(50),
	CNTRY NVARCHAR(50)
);

if object_id ('bronze.erp_PX_CAT_G1V2','U') is not null 
	drop table bronze.erp_PX_CAT_G1V2;
create table bronze.erp_PX_CAT_G1V2 (
	ID NVARCHAR(50),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50)
);
