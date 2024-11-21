/* @bruin
name: sales_summary
type: bq.sql
materialization:
   type: table

depends:
  - raw_sales

@bruin */

SELECT 	DATE_TRUNC(order_date, MONTH) as month,
									COUNT(DISTINCT customer_id) as unique_customers,
									SUM(amount) as total_sales,
									AVG(amount) as avg_sale,
									CONCAT(
										CAST(COUNT(*) as STRING),
										' orders worth $',
										CAST(SUM(amount) as STRING)
									) as summary,
									NOW() as report_generated_at
								FROM raw_sales
								GROUP BY DATE_TRUNC(order_date, MONTH)