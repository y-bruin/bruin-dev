/* @bruin
name: people
type: duckdb.sql
materialization:
   type: table

depends:
  - users
@bruin */

select 
    id, 
    name, 
    last_name,
    now() as current_timestamp 
from users;