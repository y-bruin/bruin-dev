/* @bruin
name: raw_sales
type: rs.sql
materialization:
   type: table


columns:
  - name: sale_date
    type: timestamp
    description: Sale timestamp
    primary_key: true
  - name: category
    type: varchar
    description: Product category
  - name: amount
    type: decimal(18,2)
    description: Sale amount
  - name: customer_id
    type: bigint
    description: Customer identifier
  


@bruin */

SELECT * FROM data_sales