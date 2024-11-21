/* @bruin
name: users
type: pg.sql
materialization:
   type: table


columns:
  - name: id
    type: integer
    description: User ID
    primary_key: true
  - name: manager_id
    type: integer
    description: Manager's user ID
  - name: name
    type: text
    description: User's name
  - name: hire_date
    type: date
    description: Hire date


@bruin */

SELECT * FROM data_users