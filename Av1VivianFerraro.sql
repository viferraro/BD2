use superhero;

#A
SELECT s.full_name as 'Nome verdadeiro'
from superhero s
where s.superhero_name = 'Punisher';

#B
select s.superhero_name as 'Nome', s.weight_kg as 'Peso'
from superhero s
where s.weight_kg >0 and s.weight_kg <50
order by s.weight_kg desc;

#C
select s.superhero_name as 'Nome', s.full_name as 'Identidade'
from superhero s inner join race r
on s.race_id = r.id
and r.race = 'Alien';

#D
select a.alignment as 'Alinhamento', count(s.id) as 'Quantidade de heróis'
from superhero s inner join alignment a
on s.alignment_id = a.id
group by s.alignment_id
having count(s.id) > 200
order by count(s.id) asc;

#E
select s.superhero_name as 'Nome', s.height_cm as 'Tamanho', s.weight_kg as 'Peso'
from superhero s
group by s.superhero_name
having max(s.height_cm) or min(s.weight_kg) >0
order by s.superhero_name asc;

#F
select s.superhero_name as 'Nome', count(h.power_id) as 'Quantidade de super poderes'
from superhero s inner join hero_power h
on s.id = h.hero_id
inner join publisher p
on s.publisher_id = p.id
and p.publisher_name = 'Marvel Comics'
having count(h.power_id) > 25
order by count(h.power_id) desc;

#G
select s.superhero_name as 'Nome', a.attribute_name as 'Atributo'
from superhero s inner join hero_attribute ha
on s.id = ha.hero_id
inner join attribute a
on ha.attribute_id = a.id
and a.attribute_name = 'Intelligence' or 'Combat'
inner join gender g
on g.id = s.gender_id
and g.gender = 'feminino'
inner join race r
on s.race_id = r.id
and r.race = 'Mutant'
order by s.superhero_name;





