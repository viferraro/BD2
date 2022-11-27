use eventos;

insert into localizacao
(nome,rua,cidade,cep,ponto_referencia,capacidade)
values
('chalet', 'rua pq', 'Niterói', 289778270, 'perto', 400);

insert into localizacao
(nome,rua,cidade,cep,ponto_referencia,capacidade)
values
('maloca', 'rua tj', 'São Gonçalo', 895982270, 'longe', 1200);

insert into localizacao
(nome,rua,cidade,cep,ponto_referencia,capacidade)
values
('mansio', 'rua gd', 'Rio de Janeiro', 209508270, 'aqui', 900);

insert into localizacao
(nome,rua,cidade,cep,ponto_referencia,capacidade)
values
('tofel', 'rua av', 'Rio de Janeiro', 203008270, 'ca', 1100);

insert into palestra
(data_hora,titulo,local_fk,descricao,duracao_total,valor)
values
('2023-01-01', 'ForaBolsonaro', 1, 'Vai pro inferno', '60', 9000);

insert into participante
(nome,cpf,endereco,email,telefone)
values
('José', '02639686510', 'rua av JB', 'jbarreiras@fmail.com', 21765422296);

insert into participante
(nome,cpf,endereco,email,telefone)
values
('Luís', '02639649670', 'Rua Alice', 'luis@fmail.com', 21760592296);

insert into inscricao
(participante_fk, palestra_fk, forma_pagamento)
values
(1, 4, 3);

insert into evento
(palestra_fk, palestrante_fk, duracao)
values
(2, 1, 80);

insert into palestrante
(nome,cpf,profissao,formacao,email,telefone)
values
('Maria', '02639584710', 'professora', 'Superior', 'Maria@apple.com', 21925459296);

