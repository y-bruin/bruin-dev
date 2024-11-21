/* @bruin
name: sales_report
type:  rs.sql
materialization:
   type: table
   
depends:
  - raw_sales
  

@bruin */

SELECT DATE_TRUNC('month', sale_date) as sale_month,
				LISTAGG(DISTINCT category, ', ') WITHIN GROUP (ORDER BY category) as categories,
				SUM(amount) as total_sales,
				AVG(amount) as avg_sale,
				COUNT(DISTINCT customer_id) as unique_customers
			FROM raw_sales
			WHERE sale_date BETWEEN GETDATE() - INTERVAL '1 year' AND GETDATE()
			GROUP BY 1
