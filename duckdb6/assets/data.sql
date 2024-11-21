/* @bruin
name: data
type:  sf.sql
materialization:
   type: table


columns:
  - name: name
    type: varchar
    description: "User name"
    primary_key: true
    checks:
      - name: not_null
      - name: unique

  - name: level
    type: integer 
    description: "Hierarchical level in the organization structure"
    checks:
      - name: not_null
      - name: positive

  - name: departments
    type: array
    description: "Array of distinct departments the user belongs to"
    checks:
      - name: not_null

  - name: dept_stats
    type: jsonb
    description: "Department-wise statistics including employee count and average tenure"
    checks:
      - name: not_null
@bruin */

SELECT * FROM data_user_stats