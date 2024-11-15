create database Inmuebles_estudiantes on
(
	name = Inmuebles_est_dat,
	filename = 'C:\SQLData\MSSQL16.SQLEXPRESS\MSSQL\DATA\Inmuebles_est.mdf',
	size = 10MB,
	maxsize = 60MB,
	filegrowth = 5MB
)
log on 
(
	name = Inmuebles_est_log,
	filename = 'C:\SQLData\MSSQL16.SQLEXPRESS\MSSQL\DATA\Inmuebles_est.ldf',
	size = 5MB,
	maxsize = 30MB,
	filegrowth = 5MB
);

use Inmuebles_estudiantes;
go

create table user_type
(
	user_type_id int primary key,
	user_type_name varchar(20) not null
);

create table users
(
	users_id int primary key,
	user_type_id int not null,
	email varchar(50) not null,
	phonenumber varchar(10) not null,
	names varchar(25) not null,
	lastname varchar(25) not null,
	passwords varchar(40) not null,
	constraint "fk_typeuser" foreign key(user_type_id) references user_type(user_type_id),
);

create table property_type
(
	property_id int primary key,
	property_name varchar(15),
);

create table town_hall
(
	townhall_id int primary key,
	townhall_name varchar(20),
);

create table properties
(
	propertie_id int primary key,
	property_type int not null,
	townhall_id int not null,
	description_pro varchar(250) not null,
	street varchar(50) not null,
	street_number varchar(10) not null,
	street_private_number varchar(5) not null,
	cologne varchar(15) not null,
	postal_code varchar(5) not null,
	available bit not null,
	constraint "fk_propertype" foreign key(property_type) references property_type(property_id),
	constraint "fk_townhallid" foreign key(townhall_id) references town_hall(townhall_id),
);

create table schools
(
	school_id int primary key,
	school_name varchar(50),
);

create table user_schools
(
	user_school_id int primary key,
	users_id int not null,
	school_id int not null,
	constraint "fk_userscho" foreign key(users_id) references users(users_id),
	constraint "fk_schouser" foreign key(school_id) references schools(school_id)
);

create table users_rented
(
	rented_id int primary key,
	users_id int not null,
	propertie_id int not null,
	constraint "fk_userented" foreign key(users_id) references users(users_id),
	constraint "fk_properented" foreign key(propertie_id) references properties(propertie_id),
);

create table interested
(
	interested_id int primary key,
	users_id int not null,
	propertie_id int not null,
	constraint "fk_useintere" foreign key(users_id) references users(users_id),
	constraint "fk_propeintere" foreign key(propertie_id) references properties(propertie_id),
);

create table ratings
(
	rating_id int primary key,
	rented_id int not null,
	rating int not null,
	constraint "fk_ratinren" foreign key(rented_id) references users_rented(rented_id),
);

create table favorites
(
	favorite_id int primary key,
	users_id int not null,
	propertie_id int not null,
	constraint "fk_userfav" foreign key(users_id) references users(users_id),
	constraint "fk_propefav" foreign key(propertie_id) references properties(propertie_id),
);

create table comments
(
	comment_id int primary key,
	rented_id int not null,
	comment varchar(200) not null,
	constraint "fk_commren" foreign key(rented_id) references users_rented(rented_id),
);