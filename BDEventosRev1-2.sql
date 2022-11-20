create database BDEventos;

use BDEventos;

create table municipio(
cd_municipio integer not null auto_increment,
ds_municipio varchar(30) not null,
primary key(cd_municipio)
);

create table tipo_assinante(
cd_tipo integer not null auto_increment,
ds_tipo varchar(127) not null,
primary key(cd_tipo)
);

create table ramo_atividade(
cd_ramo integer not null auto_increment,
ds_ramo varchar(80) not null,
primary key(cd_ramo)
);

create table assinante(
cd_assinante integer not null auto_increment,
nm_assinante varchar(127) not null,
cd_tipo_fk integer not null,
cd_ramo_fk integer not null,
primary key(cd_assinante, cd_tipo_fk, cd_ramo_fk),
foreign key(cd_tipo_fk) references tipo_assinante(cd_tipo),
foreign key(cd_ramo_fk) references ramo_atividade(cd_ramo)
);

create table endereco(
cd_endereco integer not null auto_increment,
ds_endereco varchar(255) not null,
complemento varchar(30),
bairro varchar(30) not null,
cep varchar(8) not null,
cd_municipio_fk integer not null,
cd_assinante_fk integer not null,
primary key(cd_endereco, cd_municipio_fk, cd_assinante_fk),
foreign key(cd_municipio_fk) references municipio(cd_municipio),
foreign key(cd_assinante_fk) references assinante(cd_assinante)
);

create table telefone(
cd_fone integer not null auto_increment,
ddd varchar(3) not null,
n_fone varchar(9) not null,
cd_endereco_fk integer not null,
primary key(cd_fone, cd_endereco_fk),
foreign key(cd_endereco_fk) references endereco(cd_endereco)
);