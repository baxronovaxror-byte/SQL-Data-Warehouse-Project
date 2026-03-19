EXEC bronze.load_data

CREATE OR ALTER PROCEDURE bronze.load_data AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
		BEGIN TRY
			SET @batch_start_time = GETDATE();
			PRINT '==============================================================';
			PRINT 'Loading Bronze Layer';
			PRINT '==============================================================';

			PRINT '--------------------------------------------------------------';
			PRINT 'Loading CRM tables';
			PRINT '--------------------------------------------------------------';
			
			SET @start_time = GETDATE();
			PRINT '>>Truncating table:bronze.cust_info';
			TRUNCATE TABLE bronze.cust_info;

			PRINT '>>Inserting Data Into:bronze.cust_info';
			BULK INSERT bronze.cust_info
			FROM 'C:\Users\baxro\OneDrive\Desktop\my_projects\sql-data-warehouse-project\datasets\source_crm\cust_info.csv' 
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>>Loading Duration: ' + CAST(DATEDIFF(second, @start_time,@end_time)  AS NVARCHAR) + ' seconds';
			PRINT '-----------------------';
			SET @start_time = GETDATE();
			PRINT '>>Truncating table:bronze.prd_info';
			TRUNCATE TABLE bronze.prd_info;

			PRINT '>>Inserting Data Into:bronze.prd_info';
			BULK INSERT bronze.prd_info
			FROM 'C:\Users\baxro\OneDrive\Desktop\my_projects\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>>Loading Duration: ' + CAST(DATEDIFF(second, @start_time,@end_time)  AS NVARCHAR) + ' seconds';
			PRINT '-----------------------';

			SET @start_time = GETDATE();
			PRINT '>>Truncating table:bronze.sales_details';
			TRUNCATE TABLE bronze.sales_details;

			PRINT '>>Inserting Data Into:bronze.sales_details';
			BULK INSERT bronze.sales_details
			FROM 'C:\Users\baxro\OneDrive\Desktop\my_projects\sql-data-warehouse-project\datasets\source_crm\sales_details.csv' 
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>>Loading Duration: ' + CAST(DATEDIFF(second, @start_time,@end_time)  AS NVARCHAR) + ' seconds';
			PRINT '-----------------------';

			PRINT '---------------------------------------------------------------';
			PRINT 'Loading ERP Tables';
			PRINT '---------------------------------------------------------------';

			SET @start_time = GETDATE();
			PRINT '>>Truncating table:bronze.erp_CUST_AZ12';
			TRUNCATE TABLE bronze.erp_CUST_AZ12;

			PRINT '>>Inserting Data Into:bronze.erp_CUST_AZ12';
			BULK INSERT bronze.erp_CUST_AZ12
			FROM 'C:\Users\baxro\OneDrive\Desktop\my_projects\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.CSV'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>>Loading Duration: ' + CAST(DATEDIFF(second, @start_time,@end_time)  AS NVARCHAR) + ' seconds';
			PRINT '-----------------------';

			SET @start_time = GETDATE();
			PRINT '>>Truncating table:bronze.erp_LOC_A101';
			TRUNCATE TABLE bronze.erp_LOC_A101;

			PRINT '>>Inserting Data Into:bronze.erp_LOC_A101';
			BULK INSERT bronze.erp_LOC_A101
			FROM 'C:\Users\baxro\OneDrive\Desktop\my_projects\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>>Loading Duration: ' + CAST(DATEDIFF(second, @start_time,@end_time)  AS NVARCHAR) + ' seconds';
			PRINT '-----------------------';

			SET @start_time = GETDATE();
			PRINT '>>Truncating table:bronze.erp_PX_CAT_G1V2';
			TRUNCATE TABLE bronze.erp_PX_CAT_G1V2;

			PRINT '>>Inserting Data Into:bronze.erp_PX_CAT_G1V2';
			BULK INSERT bronze.erp_PX_CAT_G1V2
			FROM 'C:\Users\baxro\OneDrive\Desktop\my_projects\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
			PRINT '>>Loading Duration: ' + CAST(DATEDIFF(second, @start_time,@end_time)  AS NVARCHAR) + ' seconds';
			PRINT '-----------------------';

			SET @batch_end_time = GETDATE();
			PRINT 'lOADING BRONZE LAYER IS COMPLEATED!';
			PRINT 'Total Loading Duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		END TRY
		BEGIN CATCH
			PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
			PRINT 'Error message' + ERROR_STATE();
			PRINT 'Error message' + CAST(ERROR_NUMBER() AS NVARCHAR);
		END CATCH
END;
