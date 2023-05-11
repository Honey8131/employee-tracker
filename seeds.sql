USE employees_DB;

INSERT INTO Departments (department_name)
VALUES ('HR'), ('IT'), ('Warehouse'), ('Production'), ('Shipping'), ('Receiving');

INSERT INTO Roles (title, salary, department_id)
VALUES ('Recruiter', 19000, 1), ('HR Manager', 70000, 1),
('Web Developer', 100000, 2), ('Warehouse Manager', 80000, 3), ('IT Manager', 90000, 2),
('Software Engineer', 130000, 3), ('Production Manager', 70000, 4), ('Shipping Manager', 70000, 5), ('Warehouse Manager 2', 120000, 3), ('Receiving Manager', 75000, 6);

INSERT INTO Employees (first_name, last_name, role_id, manager_id)
VALUES ('Skywalker', 'Luke', 1, 4), ('Solo', 'Han', 2, 4), ('Organa', 'Leia', 3, 4), ('Skywalker', 'Anakin', 4, NULL), ('Palpatine', 'Rey', 5, 8), ('Dameron', 'Poe', 6, 8);

SELECT * FROM Departments;
SELECT * FROM Roles;
SELECT * FROM Employees;

SELECT *
FROM Employees, Roles, Departments
WHERE Employees.role_id = Role.role_id AND Roles.department_id = Departments.department_id;


SELECT * FROM Employees
WHERE manager_id = 8;

SELECT Departments.department_id AS 'id', department_name AS 'department',
CONCAT(Employees.first_name, ' ', Employees.last_name) AS 'employee', salary
FROM Departments
LEFT JOIN Roles ON Departments.department_id = Roles.department_id
LEFT JOIN Employees ON Employees.role_id = Roles.role_id;

SELECT Departments.department_id AS 'id', department_name AS 'department', SUM(salary)
FROM Departments
LEFT JOIN Roles ON Departments.department_id = Roles.department_id
LEFT JOIN Employees ON Employees.role_id = Roles.role_id
GROUP BY Departments.department_id, department_id