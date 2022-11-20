use exercicio_empresa;

#b
select concat(f.nome, f.segundo_nome, f.ultimo_nome) as "Nome Completo"
from funcionario f
where f.salario > 1000
order by f.nome asc;

#d
select concat(f.nome, f.segundo_nome, f.ultimo_nome) as "Nome Completo"
from funcionario f
order by f.nome asc;

#f
select f.nome, d.nome as departamento, f.funcao
from funcionario f inner join departamento d
on f.cod_departamento_fk = cod_departamento;

#i
select d.nome as departamento
from departamento d inner join funcionario f
on f.cod_departamento_fk = d.cod_departamento
and f.funcao = "supervisor";

#o
select concat(f.nome, f.segundo_nome, f.ultimo_nome) as "Nome"
from funcionario f
where f.cidade = "Recife"
and f.funcao = "telefonista";

#p
select concat(f.nome, f.segundo_nome, f.ultimo_nome) as "Nome"
from funcionario f inner join departamento d
on f.cod_departamento_fk = d.cod_departamento
and d.nome = "departamento pessoal";

