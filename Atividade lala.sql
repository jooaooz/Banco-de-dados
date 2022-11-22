drop database db_CDS;

create database db_CDS;

use db_CDS;

create table artistas(
cod_art int not null auto_increment,
nome_art varchar(100) not null unique, 
primary key(cod_art)
);

create table gravadoras(
cod_grav int not null auto_increment,
nome_grav varchar (50) not null unique,
primary key(cod_grav)
);
create table categorias(
cod_cat int not null auto_increment,
nome_cat varchar(50) not null unique,
primary key(cod_cat)
);

create table estados(
sigla_est char(2) not null,
nome_est varchar(50) not null unique,
primary key(sigla_est)
);

create table cidades( 
cod_cid int not null auto_increment,
sigla_est char (2) not null,
nome_cid varchar(50) not null,
primary key (cod_cid),
foreign key (sigla_est) references estados(sigla_est)
);

create table clientes(
cod_cli int not null auto_increment,
cod_cid int not null,
nome_cli varchar (50) not null,
end_cli varchar(100) not null,
renda_cli decimal(9,2) not null default 0 check (renda_cli >=0),
sexo_cli char(1) not null  default 'f' check (sexo_cli in('f','m')),
primary key(cod_cli),
foreign key (cod_cid) references cidades (cod_cid)
);

create table conjugue(
cod_cli int not null,
nome_conj varchar(50) not null,
renda_conj decimal(9,2) not null default 0 check (renda_conj >=0),
sexo_conj char(1) not null default 'f' check (sexo_conj in ('f','m')),
primary key (cod_conj),
foreign key (cod_cli) references clientes (cod_cli)
);

create table funcionarios(
cod_func int not null auto_increment,
nome_func varchar (50) not null,
end_func varchar (100) not null,
sal_func decimal(9,2) not null default 0 check (sal_func >= 0),
primary key (cod_func),
sexo_func char(1) not null default 'f' check (sexo_func in ('f','m'))
);

create table dependentes(
cod_dep int not null auto_increment,
cod_func int not null,
nome_dep varchar(100) not null,
sexo_dep char (1) not null default 'f' check (sexo_dep in ('f','m')),
primary key (cod_dep)
);
create table titulos(
cod_tit int not null auto_increment,
cod_cat int not null,
cod_grav int not null,
nome_cd varchar (50) not null unique,
val_cd decimal(9,2) not null check (val_cd >= 0),
qtd_estq int not null check (qtd_estq >= 0),
primary key (cod_tit),
foreign key (cod_cat) references categorias (cod_cat),
foreign key (cod_grav) references gravadoras (cod_grav)
);
create table pedidos(
num_ped int not null auto_increment,
cod_cli int not null,
cod_func int not null,
data_ped  datetime not null,
val_ped decimal(9,2) not null default 0 check (val_ped >= 0),
primary key (cod_ped),
foreign key (cod_cli) references clientes (cod_cli),
foreign key (cod_func) references funcionarios (cod_func)
);
create table titulos_pedidos(
num_titped int not null,
cod_tit int not null,
qtd_cd int not null default 0  check (qnt_cd >=1)
val_cd decimal (9,2) not null default 0 check (val_cd >=0)
primary key (cod_titped),
foreign key (cod_ped) references pedidos (cod_ped),
foreign key (cod_tit) references titulos (cod_tit)
);
create table titulos_artista(
cod_titleart int not null,
cod_art int not null,
primary key (cod_titped),
foreign key (cod_tit) references titulos (cod_tit),
foreign key (cod_art) references artistas (cod_art)
);
 
 -- insert artista

insert into artistas(nome_art)
values('Marisa Monte');

insert into artistas(nome_art)
values('Gilberto gil');

insert into artistas(nome_art)
values('Caetano veloso');

insert into artistas(nome_art)
values('Milton Nascimento');

insert into artistas(nome_art)
values('Legiâo urbana');

insert into artistas(nome_art)
values('the beatles');

insert into artistas(nome_art)
values('rita lee');

-- gravadoras insert
insert into gravadoras (nome_grav)
values('polygram');
insert into gravadoras (nome_grav)
values('emi');
insert into gravadoras (nome_grav)
values('som livre');
insert into gravadoras (nome_grav)
values('som music');

-- categorias insert
insert into categorias (nome_cat)
values('mpb');
insert into categorias (nome_cat)
values('trilha sonora');
insert into categorias (nome_cat)
values('rock internacional');
insert into categorias (nome_cat)
values('rock nacional');

--estados insert 
insert into estados ( sigla_est, nome_est)
values('SP','São Paulo');
insert into estados ( sigla_est, nome_est)
values('MG','Minas gerais');
insert into estados ( sigla_est, nome_est)
values('RJ','Rio de Janeiro');
insert into estados ( sigla_est, nome_est)
values('ES','Espirito Santo');

--insert cidade
insert into cidades (sigla_est,nome_cid)
values('SP', 'São Paulo');
insert into cidades (sigla_est,nome_cid)
values('SP', 'Sorocaba');
insert into cidades (sigla_est,nome_cid)
values('SP', 'Jundiai');
insert into cidades (sigla_est,nome_cid)
values('SP', 'Americana');
insert into cidades (sigla_est,nome_cid)
values('SP', 'Araraquara');
insert into cidades (sigla_est,nome_cid)
values('MG', 'Ouro Preto');
insert into cidades (sigla_est,nome_cid)
values('ES', 'Cachoeira do 	Itapemirim');

-- Insert clientes
insert into (cod_cid,nome_cli,end_cli,renda_cli,sexo_cli)
values 
(1,'Jose nogueira',' Rua a',1500.00,'m'),
(1,'Angelo pereira',' Rua b',2000.00,'m'),
(1,'Alem mar paranhos','Rua c',1500.00,'m'),
(1, 'CATARINA SOUZA', 'RUA D', 892.00, 'F'),
(1, 'VAGNER COSTA', 'RUA E', 950.00, 'M'), 
(2, 'ANTENOR DA COSTA','RUA F', 1582.00, 'M'),
(2, 'MARIA AMÉLIA DE SOUZA', 'RUA G', 1152.00, 'F'),
(2, 'PAULO ROBERTO SILVA', 'RUA H', 3250.00, 'M'),
(3, 'FÁTIMA SOUZA', 'RUA I', 1632.00, 'F'),
(3, 'JOEL DA ROCHA', 'RUA J', 2000.00, 'M');

-- insert conjuge
insert into (cod_cli, nome_conj, renda_conj, sexo_conj)
values
(1, 'CARLA NOGUEIRA', 2500.00, 'F'),
(2, 'EMILIA PEREIRA', 5500.00, 'F'),
(6, 'ALTIVA DA COSTA', 3000.00, 'F'),
(7, 'CARLOS DE SOUZA', 3250.00, 'M');

-- insert funcionario
insert into funcionarios (cod_func, nome_func,end_func,sal_func,sexo_func)
values
('VÂNIA GABRIELA PEREIRA', 'RUA A', 2500.00 'F'),
('NORBERTO PEREIRA DA SILVA', 'RUA B', 300.00 'M'),
('OLAVO LINHARES', 'RUA C', 580.00 'M'),
('PAULA DA SILVA', 'RUA D', 3000.00 'F'),
('ROLANDO ROCHA', 'RUA E', 2000.00 'M'); 
--insert dependentes
insert into dependentes (cod_func, nome_dep, sexo_dep)
values 
(1, 'ANA PEREIRA', 'F'),
(1, 'ROBERTO PEREIRA', 'M'),
(1, 'CELSO PEREIRA', 'M'),
(3, 'BRISA LINHARES', 'F'),
(3, 'MARI SOL LINHARES', 'F'),
(4, 'SONIA DA SILVA', 'F'); 






