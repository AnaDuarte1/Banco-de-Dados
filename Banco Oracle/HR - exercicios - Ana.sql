-- 1. 
SELECT first_name, last_name
FROM employees
WHERE salary > 5000;

-- 2. 
SELECT first_name, last_name
FROM employees
WHERE salary BETWEEN 8000 AND 10000;

-- 3. 
SELECT e.last_name, e.phone_number, e.email
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND j.job_title = 'Programmer';

-- 4. 
SELECT e.first_name, e.last_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND d.department_name = 'Marketing';

-- 5.
SELECT l.location_id, l.street_address, l.postal_code, l.city, l.state_province, l.country_id
FROM locations l, countries c
WHERE l.country_id = c.country_id
AND c.country_name = 'Canada';

-- 6. 
SELECT c.country_name
FROM countries c, regions r
WHERE c.region_id = r.region_id
AND r.region_name = 'Europe';

-- 7. 
SELECT d.department_name, e.last_name AS manager_last_name
FROM departments d, employees e
WHERE d.manager_id = e.employee_id;

-- 8. 
SELECT d.department_name, l.city
FROM departments d, locations l
WHERE d.location_id = l.location_id;

-- 9. 
SELECT d.department_name, l.city, c.country_name
FROM departments d, locations l, countries c
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id;

-- 10.
SELECT d.department_name, l.city, c.country_name
FROM departments d, locations l, countries c
WHERE d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.country_name LIKE '%United%';

-- 11. 
SELECT e.first_name, e.last_name, e.email
FROM employees e, departments d, locations l, countries c, regions r
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.country_id = c.country_id
AND c.region_id = r.region_id
AND r.region_name = 'Europe';