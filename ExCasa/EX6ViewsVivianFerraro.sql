#Exercício 1
use bdescolhas;

#1a
create view vw_pessoa as
select p.nome as 'Nome',
p.cpf as 'CPF',
p.endereco as 'Endereço',
p.cidade as 'Cidade',
p.estado as 'UF',
p.pais as 'Pais',
p.cep as 'CEP',
p.email as 'Email',
p.telefone as 'Telefone'
from pessoa p
where
p.nome = 'Vivian';

#1b
create view vw_veiculo as
select v.modelo as 'Modelo',
v.ano as 'Ano',
v.serie as 'Série',
v.montadora as 'Montadora',
v.valor as 'Valor (R$)'
from veiculo v
inner join pessoa p
on p.veiculo_preferido_fk = v.cd_veiculo
and p.nome = 'Vivian';

#1c
create view vw_computador as
select c.memoria as 'Memória (GB)',
c.armazenamento as 'Armazenamento',
c.placa_video as 'Placa de vídeo',
c.processador as 'Processador',
c.som as 'Dispositivo de Som'
from computador c
inner join pessoa p
on p.configuracao_preferida_fk = c.cd_computador
and p.nome = 'Vivian';

#Exercício 2
use world;

#2a
create view vw_expectativa_vida as
select c.lifeExpectancy as 'Expectativa de Vida',
c.name as 'País'
from country c
where c.lifeExpectancy > 77;

#2b
create view vw_falantes as
select c.name as 'País',
l.percentage as 'Porcentagem',
l.language as 'Linguagem'
from country c
inner join countrylanguage l
on l.countrycode = c.code
and ((l.language = 'Chinese')
	or (l.language = 'Japanese'));
    
create view vw_falantes as
select c.name as 'País',
l.percentage as 'Porcentagem',
l.language as 'Linguagem'
from country c, countrylanguage l
where c.code in (Select l.language
				from countrylanguage l
                where c.code = l.countrycode
                and (l.language = 'Chinese')
					or (l.language = 'Japanese'));
                





