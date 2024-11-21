/* @bruin
name: raw_sales
type:  bq.sql
materialization:
   type: table
   
columns:
  - name: order_date
    type: timestamp
    description: Order timestamp
  - name: customer_id
    type: int64
    description: Customer identifier
  - name: amount
    type: float64
    description: Sale amount

@bruin */

SELECT * FROM data_sales