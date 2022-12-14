drop database dbEmpresa;

create database dbEmpresa;

use dbEmpresa;

create table tbFuncionarios(
codfunc int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
salario decimal(9,2) not null default 0 check(salario >= 0),
sexo char(1) default 'F' check(sexo in('F','M')),
primary key(codfunc)
);


create table tbUsuarios(
codusu int not null auto_increment,
nome varchar(20) not null,
senha varchar(20) not null,
codfunc int not null,
primary key(codusu),
foreign key(codfunc)references tbFuncionarios(codfunc)
);

create table tbFornecedores(
codForn int not null auto_increment,
nome varchar (100),
cnpj char(18),
inscrEst char (15),
email varchar (100),
telefone char (10),
primary key(codForn)
);

create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
quantidade int default 0 check(quantidade >= 0),
valor decimal(9,2) check(valor >= 0),
codusu int not null,
codForn int not null,
primary key(codProd),
foreign key(codusu)references tbUsuarios(codusu),
foreign key (codForn) references tbFornecedores(codForn)
);

create table tbclientes(
codcli int not null auto_increment,
nome varchar(100),
email varchar(100),
cpf char(14) not null unique,
telefone char(10),
primary key (codcli)
);


create table tbvendas(
codvend int not null  auto_increment,
codProd int not null,
codcli int not null,
codusu int not null,
datavenda date,
horavenda time,
quantidade int,
primary key (codvend),
foreign key (codProd)references tbProdutos(codProd),
foreign key (codcli)references tbclientes(codcli),
foreign key (codusu)references tbUsuarios(codusu)
);

desc tbProdutos;
desc tbUsuarios;
desc tbFuncionarios;
desc tbFornecedores;

insert into tbFuncionarios(nome,email,cpf,salario,sexo)
values('Paulo Miranda da Silva','paulo.msilva@hotmail.com','258.247.248-00','1500.00','M');

insert into tbUsuarios(nome,senha,codfunc)values('paulo.msilva','123456',1);

insert into tbFornecedores(nome,cnpj, inscrEst,email,telefone)
 values ('fabricantes S/A', '25.235.0001/38','253.253.147-110','sac@empresa.com.br','97485-8574');

insert into tbProdutos(descricao,quantidade,valor,codusu, codForn)values('Banana',12,10.35,1,1);

insert into tbclientes(nome,email,cpf,telefone)
 values('Paulo albuquerque da vila','paulo.avila@hotmail.com','254.236.852-99','97852-1475');
 insert into tbvendas(codProd, codcli, codusu, datavenda, horavenda, quantidade)
    values (1,1,1,'2022/11/17','15:42:02',10);

select * from tbFuncionarios;
select * from tbUsuarios;
select * from tbFornecedores;
select * from tbProdutos;



