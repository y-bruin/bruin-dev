/* @bruin
name: example
type: duckdb.sql
materialization:
   type: table

depends:
  - example2

@bruin */

select * from example2;