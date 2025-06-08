-- These  scripts are meant to define the DDL (Data Definition Language) of the bronze table
-- Be cautious before running these scripts as it could delete existing tables if it already exist

USE DataWarehouse;
GO

drop table if exists bronze.crm_cust_info;
GO

CREATE TABLE bronze.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(30),
    cst_lastname VARCHAR(30),
    cst_marital_status VARCHAR(15),
    cst_gndr VARCHAR(10),
    cst_create_date DATE
);
GO

drop table if exists bronze.crm_prd_info;
GO

CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key VARCHAR(50),
    prd_nm VARCHAR(50),
    prd_cost INT,
    prd_line VARCHAR(10),
    prd_start_dt DATETIME,
    prd_end_dt DATETIME
);
GO

drop table if exists bronze.crm_sales_details;
GO

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt INT,
    sls_ship_dt INT,
    sls_due_dt INT,
    sls_sales INT,
    sls_quantity INT,
    sls_price INT
);
GO

drop table if exists bronze.erp_cust_az12;
GO

CREATE TABLE bronze.erp_cust_AZ12 (
    CID VARCHAR(50),
    BDATE DATE,
    GEN VARCHAR(15)
);
GO

drop table if exists bronze.erp_loc_a101;
GO
CREATE TABLE bronze.erp_loc_a101 (
    CID VARCHAR(50),
    CNTRY VARCHAR(40)
);
GO

drop table if exists bronze.erp_px_cat_g1v2;
CREATE TABLE bronze.erp_px_cat_g1v2 (
    ID VARCHAR(50),
    CAT VARCHAR(50),
    SUBCAT VARCHAR(50),
    MAINTENANCE VARCHAR(10)
);
GO