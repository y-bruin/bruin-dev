/* @bruin
name: user_stats
type:  pg.sql
materialization:
   type: table
   
depends:
  - users
  - user_departments

@bruin */

 WITH RECURSIVE user_hierarchy AS (
        SELECT id, manager_id, name, hire_date, 1 as level
        FROM users
        WHERE manager_id IS NULL
        UNION ALL
        SELECT u.id, u.manager_id, u.name, u.hire_date, uh.level + 1
        FROM users u
        JOIN user_hierarchy uh ON u.manager_id = uh.id
    )
    SELECT 
        name,
        level,
        array_agg(DISTINCT department) as departments,
        jsonb_object_agg(
            department,
            jsonb_build_object(
                'count', COUNT(*),
                'avg_tenure', AVG(EXTRACT(YEAR FROM age(current_date, user_hierarchy.hire_date)))
            )
        ) as dept_stats
    FROM user_hierarchy
    LEFT JOIN user_departments ud ON ud.user_id = user_hierarchy.id
    GROUP BY name, level;