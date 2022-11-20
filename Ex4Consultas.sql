#a)
select *
from palestra P
where P.local_fk in (select L.id
			         from localizacao L
					 where L.cidade = 'Niterói');
                    
#b)
select P.nome, P.cpf
from participante P
inner join inscricao I
on P.id = I.participante_fk
inner join palestra PL
on I.palestra_fk = PL.id
inner join localizacao L
on PL.local_fk = L.id
where L.cidade = 'Niteroi';

#c)
select cidade, sum(capacidade) as 'Capacidade de Lugares'
from localizacao
group by cidade;

#d)
select cidade, sum(capacidade) as 'Capacidade de Lugares'
from localizacao
group by cidade
having sum(capacidade) < 3000;

#e)
select *
from palestra P
where P.local_fk in (select L.id
			         from localizacao L
					 where L.cidade = 'Niterói'
                     and P.duracao_total > 50);
