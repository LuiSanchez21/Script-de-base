create database Inmuebles on
(
	name = Inmuebles_dat,
	filename = 'C:\SQLData\MSSQL16.SQLEXPRESS\MSSQL\DATA\Inmuebles.mdf',
	size = 10MB,
	maxsize = 60MB,
	filegrowth = 5MB
)
log on 
(
	name = Inmuebles_log,
	filename = 'C:\SQLData\MSSQL16.SQLEXPRESS\MSSQL\DATA\Inmuebles.ldf',
	size = 5MB,
	maxsize = 30MB,
	filegrowth = 5MB
);

use Inmuebles;
go

create table cat_TipoUsuario
(
	id_tipousario smallint primary key,
	nom_tipousuario varchar(20) not null
);

create table cat_Usuarios
(
	id_usuario smallint primary key,
	tip_usuario smallint not null,
	nom_usuario varchar(25) not null,
	apa_usuario varchar(15) not null,
	ama_usuario varchar(15) not null,
	fna_usuario date not null,
	ncel_usuario varchar(10) not null,
	email_usuario varchar(50) not null,
	contr_usuario varchar(40) not null,
	constraint "fk_tipousu" foreign key(tip_usuario) references cat_TipoUsuario(id_tipousario),
);

create table cat_Propietario
(
	id_propietario smallint primary key,
	constraint "fk_idprop" foreign key(id_propietario) references cat_Usuarios(id_usuario),
);

create table cat_Instituto
(
	id_intituto smallint primary key,
	nombre_instituto varchar(40) not null
);

create table cat_Estudiante
(
	id_estudiante smallint primary key,
	ins_estudiante smallint not null,
	constraint "fk_idestu" foreign key(id_estudiante) references cat_Usuarios(id_usuario),
	constraint "fk_insestu" foreign key(ins_estudiante) references cat_Instituto(id_intituto)
);

create table cat_Evaluacion
(
	id_evaluacion smallint primary key,
	comen_evaluacion varchar(200) not null,
	cal_evaluacion int not null
);

create table cat_DetallesPubli
(
	id_detalpubli smallint primary key,
	publi_detalpubli smallint not null,
	evalu_detalpubli smallint not null
	constraint "fk_publdeta" foreign key(publi_detalpubli) references cat_Publicacion(id_publicacion),
	constraint "fk_evadeta" foreign key(evalu_detalpubli) references cat_Evaluacion(id_evaluacion)
);

create table cat_Cliente
(
	id_cliente smallint primary key,
	est_cliente smallint not null,
	publ_cliente smallint not null,	
	constraint "fk_cliest" foreign key(est_cliente) references cat_Estudiante(id_estudiante),
	constraint "fk_clipub" foreign key(publ_cliente) references cat_Publicacion(id_publicacion)
);

create table cat_Publicacion
(
	id_publicacion smallint primary key,
	propi_publicacion smallint not null,
	inmu_publicacion smallint not null,
	fecha_publicacion date not null
);
alter table cat_Publicacion add constraint "fk_inmpubl" foreign key(inmu_publicacion) references cat_Inmueble (id_inmueble);
alter table cat_Publicacion add constraint "fk_propubl" foreign key(propi_publicacion) references cat_Propietario (id_propietario);

create table cat_TipoInmueble
(
	id_tipoinmu smallint primary key,
	nom_tipoinmu varchar(20),
);

create table cat_Inmueble
(
	id_inmueble smallint primary key,
	publi_inmueble smallint not null,
	clien_inmueble smallint not null,
	tipo_inmueble smallint not null,
	ubi_inmueble varchar(50) not null,
	desc_inmueble varchar(200) not null,
	prec_inmueble int not null,
	esta_inmueble varchar(10) not null,
	constraint "fk_tipoinmu" foreign key(tipo_inmueble) references cat_TipoInmueble(id_tipoinmu),
);

create table Administrador
(
	id_admin smallint primary key,
);

