drop database modDB
create database IIHT_modDB

use IIHT_modDB


create table [skill](
	[id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[name] [varchar](30) NOT NULL,
	[toc] [varchar](40) NOT NULL,
	[prerequistes] [varchar](100) NULL
)

create table [user](
	[id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[user_name] [varchar](100) NOT NULL,
	[password][varchar] (100) NOT NULL,
	[first_name] [varchar](50) NOT NULL,
    [last_name] [varchar](50) NOT NULL,
	[contact_number][bigint] NOT NULL,
	[reg_code] [varchar] (50) NULL,
	[role][varchar] (10) NOT NULL,
	[linkedin_url][varchar](200) NULL,
	[years_of_experience] [int] NOT NULL,
	[active][bit] NOT NULL,
	[reject][bit] NOT NULL,
	[comments][varchar](100)NULL
)

create table [course](
	[id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[name] [varchar] (100) NOT NULL,
	[status] [bit] NOT NULL,
	[skill_id] [bigint] NOT NULL,
	[skill_name] [varchar] (30) NOT NULL,
	[mentor_id] [bigint] NOT NULL,
	[mentor_name] [varchar](50) NOT NULL,
	[mentor_years_of_exp] [int] NOT NULL,
	[fees] [bigint] NOT NULL,
	[commission_amount] [float] NOT NULL,
	[rating] [int] NOT NULL,
	[approved] [bit] NOT NULL,
	[duration] [int] NOT NULL 
)

create table [training](
	[id] [bigint] IDENTITY(1,1) primary key NOT NULL,
	[course_id] [bigint] NOT NULL,
	[course_name] [varchar] (100) NOT NULL,
	[completed] [bit] NOT NULL,
	[progress] [int] NOT NULL,
	[skill_id] [bigint] NOT NULL,
	[skill_name] [varchar] (30) NOT NULL,
	[mentor_id] [bigint] NOT NULL,
	[mentor_name] [varchar](50) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[approved] [bit] NOT NULL,
	[rejected] [bit] NOT NULL,
	[start_date] [date] NOT NULL,
	[end_date] [date] NULL,
	[part_one] [bit] NOT NULL,
	[part_two] [bit] NOT NULL,
	[part_three] [bit] NOT NULL,
	[part_four] [bit] NOT NULL,
	[rating] [int] NOT NULL,
	[payment_status] [bit] NOT NULL,
	[payment_id] [bigint] NULL,
	[amount_paid] [bigint] NULL,
	[fees] [bigint] NOT NULL,
	[commission_amount] [float] NOT NULL,
)

CREATE TABLE payment(
    [id] [bigint] IDENTITY(12980,1) primary key NOT NULL,
    [user_id] [bigint] NOT NULL,
    [payment_method] [varchar](20) NULL,
    [amount_paid][bigint] NULL,
    [transaction_status][varchar](10) NOT NULL,
)

CREATE TABLE wallet(
	[id] [bigint] IDENTITY(23698,1) primary key NOT NULL,
	[user_id] [bigint] NOT NULL,
	[balance] [bigint] NOT NUll,
)

select * from [skill]
select * from [user]
select * from [course]
select * from [training]
select * from [payment]
select * from [wallet]

--drop table [skill]
--drop table [user]
--drop table [course]
--drop table [training]
--drop table [payment]
--drop table [wallet]


insert into [user] values 
('gowthami@gmail.com','Gowthami@123','Gowthami','Beegal',8897899479,808121,'admin',null,0,1,0,'')

insert into [wallet] values
(1,0)

insert into skill values
('Angular','Components, Guard, Service','basic knowledge in typescript')
insert into skill values
('Flutter','Dart, Container, Cross-Platform','interest in programming')
insert into skill values
('C-Sharp','OOPS, files, arrays, exception','interest in programming')
insert into skill values
('Python','python programming, data science','interest in programming') 

update [training] set progress = 40 where id = 1


--dotnet ef dbcontext scaffold "server=PCIN480260;database=modDB;trusted_connection=yes" Microsoft.EntityFrameworkCore.SqlServer -o Models -f 