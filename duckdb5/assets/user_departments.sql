/* @bruin
name: user_departments
type:  pg.sql
materialization:
   type: table
   
columns:
  - name: user_id
    type: integer
    description: User ID
  - name: department
    type: text
    description: Department name

@bruin */

SELECT * FROM data_user_departments