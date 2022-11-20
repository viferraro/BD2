create database EVENTOS;

use EVENTOS;

create table localizacao(
id integer not null auto_increment,
nome varchar(120) not null,
rua varchar(120) not null,
cidade varchar(80) not null,
cep varchar(9) not null,
ponto_referencia varchar (255) not null,
capacidade integer not null,
primary key (id)
);

create table palestra(
id integer not null auto_increment,
data_hora datetime not null,
titulo varchar(80) not null,
local_fk integer not null,
descricao varchar(255) not null,
duracao_total integer not null,
valor float not null,
primary key (id, local_fk),
FOREIGN KEY (local_fk) references localizacao (id)
);

create table palestrante(
id integer not null auto_increment,
nome varchar(120) not null,
cpf varchar(11) not null,
profissao varchar(80) not null,
formacao varchar(80) not null,
email varchar(80) not null,
telefone varchar(15) not null,
primary key (id)
);

create table evento(
palestra_fk integer not null,
palestrante_fk integer not null,
duracao integer not null,
primary key (palestra_fk, palestrante_fk),
FOREIGN KEY (palestra_fk) references palestra (id),
FOREIGN KEY (palestrante_fk) references palestrante (id)
);

create table participante(
id integer not null auto_increment,
nome varchar(120) not null,
cpf varchar(11) not null,
endereco varchar(255) not null,
email varchar(80) not null,
telefone varchar(15) not null,
primary key (id)
);

create table inscricao(
participante_fk integer not null,
palestra_fk integer not null,
forma_pagamento integer not null,
primary key (participante_fk, palestra_fk),
FOREIGN KEY (participante_fk) references participante (id),
FOREIGN KEY (palestra_fk) references palestra (id)
);
