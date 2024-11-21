/* @bruin
name: example2
type: duckdb.sql
materialization:
   type: table

depends:
  - example3

@bruin */

select * from example3;