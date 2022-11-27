create database exercicio_empresa;

use exercicio_empresa;

create table departamento(
cod_departamento integer not null auto_increment,
nome varchar(128) not null,
localizacao varchar(50) not null,
cod_funcionario_gerente integer not null,
primary key (cod_departamento, cod_funcionario_gerente)

);

create table funcionario(
 cod_funcionario integer not null auto_increment,
 nome varchar(256) not null,
 segundo_nome varchar(256) not null,
 ultimo_nome varchar(256) not null,
 dt_nascimento date not null,
 cpf varchar(11) not null,
 rg varchar(9) not null,
 endereco varchar(512) not null,
 cep varchar(8) not null,
 cidade varchar(50) not null,
 telefone varchar(11) not null,
 cod_departamento_fk integer not null,
 funcao varchar(50) not null,
 salario decimal(5,2) not null,
 primary key (cod_funcionario, cod_departamento_fk),
 foreign key (cod_departamento_fk) references departamento(cod_departamento)
 );
 
 alter table departamento
 add constraint foreign key(cod_funcionario_gerente) references funcionario (cod_funcionario);

