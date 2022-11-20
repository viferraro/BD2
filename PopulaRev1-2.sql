
insert into municipio
(ds_municipio)
values
('João Câmara');

insert into tipo_assinante
(ds_tipo)
values
('Comercial');

insert into ramo_atividade
(ds_ramo)
values
('Médico');

insert into assinante
(nm_assinante, cd_tipo_fk, cd_ramo_fk)
values
('Marcio',2,2);

insert into endereco
(ds_endereco, complemento, bairro, cep, cd_municipio_fk, cd_assinante_fk)
values
('Rua bbbbbbbb, 11', 'Apto. 101', 'Centro', '49614100', 1, 4);

insert into telefone
(ddd, n_fone, cd_endereco_fk)
values
('011', '976131191', 4);