CREATE DATABASE CONTROLE_DE_TRAFEGO;

USE CONTROLE_DE_TRAFEGO;

CREATE TABLE EMPRESA
(
codemp INTEGER PRIMARY KEY not null auto_increment,
nome VARCHAR(80) not null
);

CREATE TABLE AVIAO
(
codaviao INTEGER PRIMARY KEY not null auto_increment,
codemp INTEGER not null,
tipo VARCHAR(20) not null,
capacidade INTEGER not null,
constraint aviao_fk FOREIGN KEY (codemp) references EMPRESA (codemp)
);

CREATE TABLE VOO
(
codvoo INTEGER PRIMARY KEY not null auto_increment,
codemp INTEGER not null,
constraint voo_fk FOREIGN KEY (codemp) references EMPRESA (codemp)
);

CREATE TABLE TRECHO
(
origem VARCHAR(30) not null,
destino VARCHAR(30) not null,
distancia INTEGER not null,
constraint trecho primary key (origem, destino)
);

CREATE TABLE ROTA
(
codrota INTEGER PRIMARY KEY not null auto_increment,
origem VARCHAR(30) not null,
destino VARCHAR(30) not null,
codvoo INTEGER not null,
h_saida DATETIME not null,
h_chegada DATETIME not null
);

alter table rota ADD constraint rota_trecho_fk FOREIGN KEY (origem, destino) references TRECHO (origem, destino);

alter table rota add constraint rota_fk FOREIGN KEY (codvoo) references VOO (codvoo);

CREATE TABLE VIAGEM
(
codrota INTEGER not null,
data_voo DATE not null,
codaviao INTEGER not null,
h_saida_real DATETIME not null,
h_chegada_real DATETIME not null,
constraint viagem primary key (codrota, data_voo)
);

alter table viagem add constraint viagem_rota_fk FOREIGN KEY (codrota) references ROTA (codrota);

alter table viagem add constraint viagem_aviao_fk FOREIGN KEY (codaviao) references AVIAO (codaviao);
