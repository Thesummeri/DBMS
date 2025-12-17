create database employee;
use employee;
create table employee (emp_id int(10), emp_name varchar (20), emp_dob date, emp_designation varchar(20),emp_salary int(20));
INSERT INTO employee VALUES (1, 'Yogananda V', '2001-02-17', 'Web Developer', 600000);
INSERT INTO employee VALUES (2, 'John Doe', '1990-08-25', 'Software Engineer', 750000);
INSERT INTO employee VALUES (3, 'Alice Smith', '1985-04-12', 'Administrator', 90000);
INSERT INTO employee VALUES (4, 'Bob Johnson', '1995-11-03', 'UX Designer', 55000);
INSERT INTO employee VALUES (5, 'Sara Williams', '1988-06-19', 'System Analyst', 80000);
INSERT INTO employee VALUES (6, 'Mike Anderson', '1993-09-10', 'Network Engineer', 70000);
select * from employee;

SET SQL_SAFE_UPDATES = 0;
DELETE FROM employee WHERE emp_id = 6;
SET SQL_SAFE_UPDATES = 1;
select * from employee;

SET SQL_SAFE_UPDATES = 0;
ALTER TABLE employee ADD gender varchar(7);
SET SQL_SAFE_UPDATES = 1;
select * from employee;

SET SQL_SAFE_UPDATES = 0;
UPDATE employee SET gender = 'Male';
SET SQL_SAFE_UPDATES = 0;

SET SQL_SAFE_UPDATES = 0;
update employee set gender='female' where emp_id=3;
SET SQL_SAFE_UPDATES = 1;
SET SQL_SAFE_UPDATES = 0;
update employee set gender='female' where emp_id=5;
SET SQL_SAFE_UPDATES = 1;
select * from employee;

SET SQL_SAFE_UPDATES = 0;
alter table employee DROP column gender;
SET SQL_SAFE_UPDATES = 1;
select * from employee;

truncate table employee;
select * from employee;

drop table employee;
select * from employee;

create view employee_view as select emp_name,emp_dob from employee where emp_salary>80000;
select * from employee_view;









