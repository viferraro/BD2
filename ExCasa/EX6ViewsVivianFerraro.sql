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
l.Language as 'Linguagem'
from countrylanguage l
inner join country c
on  c.code = l.countrycode
and (l.language = 'Chinese'
or l.language = 'Japanese');

#2c
create view vw_cidades as
select ci.name as 'Cidades com menos de 100 mil habitantes',
ci.district as 'Estado'
from city ci
inner join country c
on ci.countrycode = c.code
and (ci.district = 'Rio de Janeiro'
	or ci.district like 'S%Paulo')
and ci.population < 100000;

#2d
create view vw_capitais as
select c.name as 'País',
ci.name as 'Capital'
from country c
inner join city ci
on c.capital = ci.id;

#2e
create view vw_lingua_oficial as
select c.name as 'País',
l.language as 'Língua Oficial',
l.percentage as 'Porcentagem de falantes'
from country c
inner join countrylanguage l
on c.code = l.countrycode
and l.isofficial = 'T';

#2f
create view vw_paises_falantes as
select l.language as 'Língua',
count(c.code) as 'Quantidade de países falantes'
from countrylanguage l
inner join country c
on l.countrycode = c.code
group by l.language;

#2g
create view vw_forma_governo as
select distinct(c.governmentform) as 'Forma de governo',
count(c.code) as 'Quantidade de países'
from country c
group by c.governmentform;

#2h
create view vw_populacao_mundial as
select sum(c.population) as 'População Mundial'
from country c;

#2i
create view vw_tamanho_territorial as
select c.name as 'País',
c.surfacearea as 'Tamanho Territorial'
from country c;

#2j
create view vw_paises_falantes_territorial as
select l.language as 'Língua',
sum(c.surfacearea) as 'Tamanho Territorial',
sum(c.population) as 'Quantidade de falantes'
from countrylanguage l
inner join country c
on l.countrycode = c.code
group by l.language;

#2k
create view vw_terriotorial_falantes_menor10mil as
select l.language as 'Língua',
sum(c.surfacearea) as 'Tamanho Territorial',
sum(c.population) as 'Quantidade de falantes'
from countrylanguage l
inner join country c
on l.countrycode = c.code
group by l.language
having sum(population) < 10000;

