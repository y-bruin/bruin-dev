/* @bruin
name: transformed_data
type:  sf.sql
materialization:
   type: table
   
depends:
  - data

@bruin */

SELECT 
  $1:id::INTEGER as id,
  $1:user.name::STRING as user_name,
  ARRAY_SIZE($1:items) as item_count,
  PARSE_JSON($1:metadata)::VARIANT as metadata,
  current_timestamp() as processed_at
FROM data
QUALIFY ROW_NUMBER() OVER (PARTITION BY id ORDER BY item_count DESC) = 1