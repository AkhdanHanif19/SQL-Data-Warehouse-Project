-- Creating csv files full load stored procedure with truncate and bulk insert into tables

CREATE OR ALTER PROCEDURE Bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @process_start_time DATETIME, @process_end_time DATETIME;
	
	BEGIN TRY
	SET  @process_start_time = GETDATE();
		PRINT '=========================================';
		PRINT 'Loading Bronze Layer';
		PRINT '=========================================';

		PRINT '-----------------------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '-----------------------------------------';
	
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_cust_info <<';
		TRUNCATE TABLE Bronze.crm_cust_info;
	
		PRINT '>> Inserting Table: Bronze.crm_cust_info <<';
		BULK INSERT Bronze.crm_cust_info
		FROM 'D:\Hanif\Cari Kerja\SQL Data Warehouse Project\datasets\source_crm\cust_info.csv'
		WITH	(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
				);
		SET @end_time = GETDATE();
		PRINT 'Bronze.crm_cust_info Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------';
		
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_prd_info <<';
		TRUNCATE TABLE Bronze.crm_prd_info;

		PRINT '>> Inserting Table: Bronze.crm_prd_info <<';
		BULK INSERT Bronze.crm_prd_info
		FROM 'D:\Hanif\Cari Kerja\SQL Data Warehouse Project\datasets\source_crm\prd_info.csv'
		WITH	(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
				);
		SET @end_time = GETDATE();
		PRINT 'Bronze.crm_prd_info Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_sales_details <<';
		TRUNCATE TABLE Bronze.crm_sales_details;

		PRINT '>> Inserting Table: Bronze.crm_sales_details <<';
		BULK INSERT Bronze.crm_sales_details
		FROM 'D:\Hanif\Cari Kerja\SQL Data Warehouse Project\datasets\source_crm\sales_details.csv'
		WITH	(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
				);
		SET @end_time = GETDATE();
		PRINT 'Bronze.crm_sales_details Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------';

		PRINT '-----------------------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '-----------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_cust_AZ12 <<';
		TRUNCATE TABLE Bronze.erp_cust_AZ12;

		PRINT '>> Inserting Table: Bronze.erp_cust_AZ12 <<';
		BULK INSERT Bronze.erp_cust_AZ12
		FROM 'D:\Hanif\Cari Kerja\SQL Data Warehouse Project\datasets\source_erp\CUST_AZ12.csv'
		WITH	(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
				);
		SET @end_time = GETDATE();
		PRINT 'Bronze.erp_cust_AZ12 Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_loc_a101 <<';
		TRUNCATE TABLE Bronze.erp_loc_a101;

		PRINT '>> Inserting Table: Bronze.erp_loc_a101 <<';
		BULK INSERT Bronze.erp_loc_a101
		FROM 'D:\Hanif\Cari Kerja\SQL Data Warehouse Project\datasets\source_erp\LOC_A101.csv'
		WITH	(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
				);
		SET @end_time = GETDATE();
		PRINT 'Bronze.erp_loc_a101 Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------';

		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_px_cat_g1v2 <<';
		TRUNCATE TABLE Bronze.erp_px_cat_g1v2;
	
		PRINT '>> Inserting Table: Bronze.erp_px_cat_g1v2 <<';
		BULK INSERT Bronze.erp_px_cat_g1v2
		FROM 'D:\Hanif\Cari Kerja\SQL Data Warehouse Project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH	(
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
				);
		SET @end_time = GETDATE();
		PRINT 'Bronze.erp_px_cat_g1v2 Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '-----------------------------------------';
		PRINT '=========================================';
		PRINT 'Bronze Layer Load Finished';
		PRINT '=========================================';
		
		SET @process_end_time = GETDATE();
		PRINT 'Bronze Layer Load Duration: ' + CAST(DATEDIFF(second, @process_start_time, @process_end_time) AS NVARCHAR) + ' seconds';
	END TRY

	BEGIN CATCH
	PRINT '\\\\\\\\\\\\\\\\\\\\\\\\\\';
	PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
	PRINT 'Error Message' + ERROR_MESSAGE();
	PRINT 'Error Message' + CAST(ERROR_NUMBER() AS NVARCHAR);
	PRINT 'Error Message' + CAST(ERROR_STATE() AS NVARCHAR);
	PRINT '\\\\\\\\\\\\\\\\\\\\\\\\\\';
	END CATCH
END
