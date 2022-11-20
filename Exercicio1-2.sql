CREATE DATABASE VENDAS;

USE VENDAS;

CREATE TABLE CLIENTE
(
cliente_id INTEGER PRIMARY KEY not null auto_increment,
nome VARCHAR(80) not null,
endereco VARCHAR(500) not null,
cidade VARCHAR(30) not null,
cep VARCHAR(9) not null,
uf VARCHAR(2) not null,
telefone VARCHAR(12) not null
);

CREATE TABLE VENDEDOR
(
vendedor_id INTEGER PRIMARY KEY not null auto_increment,
nome VARCHAR(80) not null,
salario FLOAT not null,
faixa_comissao FLOAT not null
);

CREATE TABLE PEDIDO
(
numero_ped INTEGER PRIMARY KEY not null auto_increment,
cliente_id INTEGER not null,
vendedor_id INTEGER not null,
prazo_entrega INTEGER not null,
constraint pedido_cliente_fk FOREIGN KEY (cliente_id) references CLIENTE (cliente_id),
constraint pedido_vendedor_fk FOREIGN KEY (vendedor_id) references VENDEDOR (vendedor_id)
);

CREATE TABLE PRODUTO
(
produto_cod INTEGER PRIMARY KEY not null auto_increment,
unidade VARCHAR(30) not null,
descrição VARCHAR(500) not null,
valor_unitario FLOAT not null
);

CREATE TABLE ITEM_PEDIDO
(
numero_ped INTEGER not null,
produto_cod INTEGER not null,
quantidade INTEGER not null,
constraint ITEM_PEDIDO primary key (numero_ped, produto_cod)
);

alter table ITEM_PEDIDO ADD constraint item_numero_fk FOREIGN KEY (numero_ped) references PEDIDO (numero_ped);

alter table ITEM_PEDIDO add constraint item_produto_fk FOREIGN KEY (produto_cod) references PRODUTO (produto_cod);
