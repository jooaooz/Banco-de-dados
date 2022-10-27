create database if not exists sucos;

 use sucos;
 
 -- CRIA A TABELA TBCLIENTE
 
create table tbcliente
(CPF varchar (11),
nome varchar (100),
ENDERECO1 varchar (150),
ENDERECO2 varchar (150),
BAIRRO varchar (50),
CIDADE varchar (50),
ESTADO varchar (2),
CEP varchar (8),
IDADE smallint,
SEXO varchar (1),
LIMITE_CREDITO float,
VOLUME_COMPRA float,
PRIMEIRA_COMPRA bit);

-- CRIAR A TABELA TBCLIENTE

create table tbprodutor 
(PRODUTO varchar(20),
NOME VARCHAR (150),
EMBALAGEM VARCHAR (50),
TAMANHO VARCHAR (50),
SABOR VARCHAR (50),
PRECO_LISTA float);

-- retorna todas as colunas de tabela tbcliente
SELECT * FROM TBCLIENTE;
-- retorna todas as colunas de tabela tbprodutor
SELECT * FROM TBPRODUTOR; -- Visualizando

-- inserir dados na tabela de produtos 
insert into tbprodutor (produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('1040107', 'light - 350ml - Melância','Lata', '350ml', 'Melância', 4.56);  

insert into tbprodutor (produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('1037797', 'clean - 2 Litros - Laranja','PET', '2 Litros', 'Laranja', 16.01);  

insert into tbprodutor (produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('100889', 'Sabor da montanha - 700 ml - Uva','Garrafa', '700 ml', 'Uva', 6.31);  

insert into tbprodutor (produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('1004327', 'Videira do Campo - 1,5 Litros - Melância','PET', '1,5 Litros', 'Melância', 19.51); 

insert into tbprodutor (produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('544931', 'Frescor de Verão - 350 ml - Limão','PET', '350 ml', 'Limão', 3.20); 

insert into tbprodutor (produto, nome, embalagem, tamanho, sabor, preco_lista)
values
('1078680', 'Frescor de Verão - 470 ml - Manga','Lata', '470 ml', 'Manga', 5.18); 

update tbprodutor set Embalagem = 'Garrafa', preco_lista = 2.60 where produto = '1078680';

select * from tbprodutor;

alter table tbprodutor add primary key (produto);

select * from tbcliente;

alter table tbcliente add column (data_nascimento date);

insert into tbcliente (cpf, nome, endereco1, endereco2,  bairro, cidade, estado, cep,
idade, sexo, limite_credito, volume_compra, primeira_compra, data_nascimento)
values
('00388934505', 'João da Silva', 'Rua Projeta A número 10', '', 'Vila Roman',
'Caratinga','AM', '06836001', 30, 'M', 1000.000, 2000, 0 , '1989-10-05');

insert into tbcliente (cpf, nome, endereco1, endereco2,  bairro, cidade, estado, cep,
idade, sexo, limite_credito, volume_compra, primeira_compra, data_nascimento)
values
('00388934555', 'João', 'Rua Projeta A número 10', '', 'Vila Roman',
'Caratinga','AM', '06836001', 30, 'M', 1000.000, 2000, 0 , '1989-10-05');

insert into tbcliente (cpf, nome, endereco1, endereco2,  bairro, cidade, estado, cep,
idade, sexo, limite_credito, volume_compra, primeira_compra, data_nascimento)
values
('00386734505', 'Lucas', 'Rua Projeta A número 10', '', 'Vila Roman',
'Caratinga','AM', '06836001', 30, 'M', 1000.000, 2000, 0 , '1989-10-05');


