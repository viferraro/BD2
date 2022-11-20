create database LOJA;

use LOJA;

create table cliente(
cpf varchar(11) not null,
nome varchar(256) not null,
telefone varchar(11) not null,
email varchar(256) not null,
endereco varchar(512) not null,
primary key (cpf)
);

create table produto(
id_produto integer not null auto_increment,
nome varchar(128) not null,
modelo varchar(50) not null,
preco decimal(15,2) not null,
marca varchar(50) not null,
primary key (id_produto)
);

create table pedido(
id_pedido integer not null auto_increment,
cpf varchar(11) not null,
data_de_entrega date not null,
quantidade integer not null,
primary key (id_pedido),
FOREIGN KEY (cpf) references cliente (cpf)
);

create table contem(
id_produto integer not null,
id_pedido integer not null,
primary key (id_produto, id_pedido),
FOREIGN KEY (id_produto) references produto (id_produto),
FOREIGN KEY (id_pedido) references pedido (id_pedido)
);

create table administrador(
id_administrador integer not null auto_increment,
nome varchar(256) not null,
primary key (id_administrador)
);

create table funcionario(
id_funcionario integer not null auto_increment,
nome varchar(256) not null,
primary key (id_funcionario)
);

create table gerencia_f(
id_administrador integer not null,
id_funcionario integer not null,
primary key (id_administrador, id_funcionario),
FOREIGN KEY (id_administrador) references administrador (id_administrador),
FOREIGN KEY (id_funcionario) references funcionario (id_funcionario)
);

create table atualiza(
id_produto integer not null,
id_funcionario integer not null,
primary key (id_produto, id_funcionario),
FOREIGN KEY (id_produto) references produto (id_produto),
FOREIGN KEY (id_funcionario) references funcionario (id_funcionario)
);





