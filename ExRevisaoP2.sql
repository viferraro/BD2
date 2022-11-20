#a
select a.nm_assinante as 'Nome', 
	   concat(e.ds_endereco, ', ', e.complemento, ', ', e.bairro, ', ', e.cep) as 'Endereço', 
       concat('(', t.ddd, ')', t.n_fone) as 'Telefone'
from assinante a inner join endereco e
on a.cd_assinante = e.cd_assinante_fk
inner join telefone t
on t.cd_endereco_fk = e.cd_endereco;

#b.1
select a.nm_assinante as 'Nome', r.ds_ramo as 'Ramo'
from assinante a, ramo_atividade r
where a.cd_ramo_fk = r.cd_ramo
order by r.ds_ramo;

#b.2
select a.nm_assinante as 'Nome', r.ds_ramo as 'Ramo'
from assinante a, ramo_atividade r
where a.cd_ramo_fk = r.cd_ramo
order by a.nm_assinante;

#c
select a.nm_assinante as 'Nome'
from assinante a inner join tipo_assinante tp
on a.cd_tipo_fk = tp.cd_tipo
and tp.ds_tipo = 'Residencial'
inner join endereco e
on e.cd_assinante_fk = a.cd_assinante
inner join municipio m
on  e.cd_municipio_fk = m.cd_municipio
and m.ds_municipio = 'Pelotas';

#d
select a.nm_assinante as 'Nome'
from assinante a inner join endereco e
on a.cd_assinante = e.cd_assinante_fk
inner join telefone t
on t.cd_endereco_fk = e.cd_endereco
group by e.cd_endereco
having count(t.cd_fone) >1;

#e
select a.nm_assinante as 'Nome', 
	   concat('(', t.ddd, ')', t.n_fone) as 'Telefone',
       tp.ds_tipo as 'Tipo de Assinante',
       m.ds_municipio as 'Município'
from assinante a inner join tipo_assinante tp
on a.cd_tipo_fk = tp.cd_tipo
and tp.ds_tipo = 'Comercial'
inner join endereco e
on e.cd_assinante_fk = a.cd_assinante
inner join municipio m
on  e.cd_municipio_fk = m.cd_municipio
and m.ds_municipio = 'Natal' or 'João Câmara'
inner join telefone t
on t.cd_endereco_fk = e.cd_endereco;
