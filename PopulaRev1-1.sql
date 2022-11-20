use exercicio_empresa;

insert into departamento2
(nome)
values
('contabilidade');

insert into funcionario
(nome,segundo_nome, ultimo_nome, dt_nascimento, cpf, rg, endereco, cep,cidade, telefone,cod_departamento_fk, funcao, salario)
values
('karina', 'Machado', 'Zeia', '1990-06-15', '94754065461', '304961159', 'rua tjl', '22549903','Niteroi', '21996754832', 2, 'chefe', 21000.00);

insert into funcionario2
(nome,segundo_nome, ultimo_nome, dt_nascimento, cpf, salario, cod_departamento_fk, funcao)
values
('karina', 'Machado', 'Zeia', '1990-06-15', '94754065461', 20000, 3, 'supervisor');

