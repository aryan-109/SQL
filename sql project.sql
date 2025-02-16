-- EMPLOYEE MANAGEMENT SYSTEM --



create database employees;

use employees;

create table employees1(EmployeeID int primary key auto_increment,
FirstName varchar(100) not null,
LastName varchar(100) not null,
email varchar(100) not null,
PhoneNo varchar(20),
HireDate date not null,
JobTitle varchar(50),
DepartmentId int,
foreign key (DepartmentId) references departments(DepartmentId));

CREATE TABLE departments (
    DepartmentId INT PRIMARY KEY auto_increment,
    DepartmentName VARCHAR(100) unique not null);
    
create table salaries1(
SalaryId int primary key auto_increment,
EmployeeId int unique,
salary decimal(10,2) not null,
bonus decimal(10,2),
foreign key(EmployeeId) references employees1(EmployeeId));

create table projects1(
ProjectId int primary key auto_increment,
ProjectName varchar(100),
StartDate date not null,
EndDate date);

create table employees_projects1(
EmployeeId int,
ProjectId int,
Role varchar(50),
primary key(EmployeeId , ProjectId), foreign key (EmployeeId) references employees1(EmployeeId),
foreign key(ProjectId) references projects1(ProjectId));


insert into departments (DepartmentName)
values ('HR'),('IT'),('Finance'),('Marketing');

insert into employees1 (FirstName , LastName , email , PhoneNo , HireDate , JobTitle , DepartmentId)
values ('Sahil' , 'Chauhan' , 'sahil@123.com' , '1234567890' , '2021-2-12' , 'finance Analyst' , '1' ),
('Sajal' , 'Oberoi' , 'sajal@234.com' , '0987654321' , '2020-2-20' , 'HR Manager' , '2');

insert into salaries1( EmployeeId , salary , bonus)
values( 1 , 65000 , 5000),
(2 , 70000 , 6000);

insert into projects1 (ProjectName , StartDate , EndDate)
values ('Financial Report Analysis' , '2022-02-12' , '2022-05-15'),
('Employee Training' , '2022-01-10' , '2022-03-13');

insert into employees_projects1 (EmployeeId , ProjectId , Role)
values (1, 1, 'Analyst'),
(2,2,'Trainer');


-- some Queries --

select e.EmployeeId , e.FirstName ,  e.LastName, p.ProjectName , ep.Role
from employees_projects1 ep join employees1 e on ep.EmployeeId = e.EmployeeId
join  projects1 p on ep.ProjectID = p.ProjectId where p.ProjectName = 'Employee Training';

select e.EmployeeId , e.FirstName , e.email , s.salary , p.ProjectName
from employees1 e  join salaries1 s on e.EmployeeId = s.EmployeeId 
join employees_projects1 ep on e.EmployeeId = ep.EmployeeId 
join projects1 p on p.ProjectId = ep.ProjectId ; 

select e.FirstName , d.DepartmentName 
from employees1 e join departments d on e.DepartmentId = d.DepartmentId ; 




