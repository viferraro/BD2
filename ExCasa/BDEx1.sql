create database BDEscolhas;

 use BDEscolhas;
 
create table veiculo(
cd_veiculo integer not null auto_increment,
modelo varchar(127) not null,
ano varchar(4) not null,
serie varchar(20) not null,
montadora varchar(30) not null,
valor decimal not null,
primary key(cd_veiculo)
);

create table computador(
cd_computador integer not null auto_increment,
memoria integer not null,
armazenamento varchar(20) not null,
placa_video varchar(20) not null,
processador varchar(30) not null,
som varchar(20),
primary key(cd_computador)
);

create table pessoa(
cd_pessoa integer not null auto_increment,
nome varchar(127) not null,
cpf varchar(11) not null,
endereco varchar(255) not null,
cidade varchar(50) not null,
estado varchar(2) not null,
pais varchar(30) not null,
cep varchar(8) not null,
email varchar(80) not null,
telefone varchar(11) not null,
veiculo_preferido_fk integer not null,
configuracao_preferida_fk integer not null,
primary key(cd_pessoa, veiculo_preferido_fk, configuracao_preferida_fk),
foreign key(veiculo_preferido_fk) references veiculo(cd_veiculo),
foreign key(configuracao_preferida_fk) references computador(cd_computador)
);

insert into veiculo
(modelo, ano, serie, montadora, valor)
values
('Discovery', '2023', 'Metropolitan Edition', 'Land Rover', 742950.00);

insert into computador
(memoria, armazenamento, placa_video, processador, som)
values
(64, 'Samsung EVO 970 2TB', 'RTX 3090', 'Intel Core i9-12900KS', 'Não ligo');

insert into pessoa
(nome, cpf, endereco, cidade, estado, pais, cep, email, telefone, veiculo_preferido_fk, configuracao_preferida_fk)
values
('Vivian', '02958835501', 'Rua Uruguai, 284', 'Rio de Janeiro', 'RJ', 'Brasil', '20530870', 'viferraro@edu.unirio.br', '21999923286', 1, 1);

