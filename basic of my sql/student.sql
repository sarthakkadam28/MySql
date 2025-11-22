CREATE TABLE User
(
UserId int primary key,
Name varchar (100) not null
);

create table Projects
(
 ProjectId int primary key,
 ProjectName varchar(100) not null
);
drop table projects;

create table ProjectAssignments
(
AssignmentId int primary key,
UserId int not null,
ProjectId int not null,
Role varchar(100)not null,
foreign key(UserId)references User(UserId),
foreign key(ProjectId) references projects(ProjectId)
);
create database students;
create table Department(
DepartmentId int not null,
DepartmentName varchar(40) not null,
primary key(DepartmentId),
unique(DepartmentName)
);
create table students(
StudentId int not null,
FullName varchar(50)not null,
Email varchar(100),
ContactNo int,
DepartmentId int not null,
primary key(StudentId),
unique(Email),
Foreign key(DepartmentId) References Department(DepartmentId)
); 
create table Courses(
CourseId int primary key,
CourseName varchar(50),
credits int 
);
create table StudentCourses(
StudentId int,
CourseId int,
EnrollmentDate date,
Foreign key(StudentId) References students(StudentId),
Foreign key(CourseId) References Courses(CourseId) 
);
create table UsersTable(
UserId int Primary key,
UserName varchar(50) unique,
Password varchar(50),
RoleId int 
);
create table RoleTable(
RoleId int primary key,
RoleName varchar(50)
);
create table Attendance(
AttendanceId int primary key,
StudentId int,
Date date,
Status varchar(30)
);
create table Marks(
MarkId int primary key,
StudentId int,
CourseId int,
MarksObtained int,
ExamDate date
);
