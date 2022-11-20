#a)
select *
from evento E
inner join palestra P
on E.palestra_fk = P.id
inner join localizacao L
on P.local_fk = L.id
where L.cidade = 'Niteroi';


#b)
select *
from palestrante
where nome like 'M%'
order by nome desc;

#c)
select *
from localizacao
where (capacidade >= 500
  and capacidade <= 1000);

#d)
select *
from localizacao
where (capacidade >= 500
  and capacidade <= 1000)
  and (cidade = "Rio de Janeiro");

#e)
select *
from localizacao
where (capacidade < 500
  or capacidade > 1000)
  and (cidade = "Rio de Janeiro"
  or cidade = "São Gonçalo");

#f)
select *
from palestrante
where email like '%@apple.com'
  and (profissao = "TI"
  or formacao = "Superior");

#g)
delete from
	   participante
       where endereco = 'Rua Alice';
       
#h)
update localizacao
set capacidade = capacidade * 30/100;
       