WITH RankedEmployees AS (
    SELECT
        e.department_id,
        e.employee_id,
        e.name,
        p.rating,
        ROW_NUMBER() OVER (PARTITION BY e.department_id ORDER BY p.rating DESC) AS rank
    FROM
        Employees e
        JOIN Performance p ON e.employee_id = p.employee_id
    WHERE
        p.year = 2023
)
SELECT
    department_id,
    employee_id,
    name,
    rating
FROM
    RankedEmployees
WHERE
    rank = 1;
 -- the outcome was simple as the given data and fields were properly allocated and entered into the table
