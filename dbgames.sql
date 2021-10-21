create database dbgames;
drop database dbgames;
use dbgames;


create table usuarios
( id int primary key auto_increment,
usuario varchar(50) not null,
login varchar(50) not null unique,
senha varchar(200) not null,
perfil varchar(50) not null);

insert into usuarios (usuario,login,senha,perfil)
values ('Daniel dias','admin',md5('123@games'),'administrador');
insert into usuarios (usuario,login,senha,perfil)
values('Pedro Henrique','tecph',md5('123@games'),'tecnico');
insert into usuarios(usuario,login,senha,perfil)
values('Victor kenji','tecjapa',md5('123@games'),'tecnico');

select * from usuarios;
select * from usuarios where login='admin' and senha=md5('123@games');

create table clientes(
idcliente int primary key auto_increment,
email varchar(50) unique,
nome varchar(50) not null,
cpf varchar(11) unique not null,
cep char(8),
endereco varchar(50) not null,
numero varchar(12) not null,
complemento varchar(30),
bairro varchar(50) not null,
cidade varchar(50) not null,
uf char(2) not null,
fone varchar(50) not null);
describe clientes;

insert into clientes(email,nome,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
values('romario@email.com','Romario Silva',09876543210,03477000,'rua lala',1313,'apt 32 t1','vila antonieta','sao paulo','SP','0000-0000');

insert into clientes(email,nome,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
values('wesleyMarques@email.com','Wesley Marques',98754312309,03412300,'rua jaja',1234,'apt 52 t1','vila jaco','sao paulo','SP','1234-1236');

insert into clientes(email,nome,cpf,cep,endereco,numero,bairro,cidade,uf,fone)
values('Jose@email.com','Jose Oliveira',13579853215,03433300,'rua Rio das pedras',1224,'vila andrade','sao paulo','SP','1234-1237');

insert into clientes(email,nome,cpf,cep,endereco,numero,complemento,bairro,cidade,uf,fone)
values('paulo@email.com','Paulo Henrique',98754123789,03772300,'rua Inconfidência',123,'casa 3','vila matilde','sao paulo','SP','1234-1222');

insert into clientes(email,nome,cpf,cep,endereco,numero,bairro,cidade,uf,fone)
values('vitor@email.com','Vitor Hugo',09876123450,03411300,'rua tuiuti',12,'vila carmosina','sao paulo','SP','1334-1236');

insert into clientes(email,nome,cpf,cep,endereco,numero,bairro,cidade,uf,fone)
values('willian@email.com','Willian Ferrer',14566985410,04412300,'rua tiradentes',134,'tiradente','sao paulo','SP','1777-1236');

insert into clientes(email,nome,cpf,cep,endereco,numero,bairro,cidade,uf,fone)
values('valmir@email.com','Valmir Andrade ',74125896301,03412300,'rua jaja',1234,'vila jaco','sao paulo','SP','1234-1236');

insert into clientes(email,nome,cpf,cep,endereco,numero,bairro,cidade,uf,fone)
values('jaco@email.com','Jacó Abud',00033311197,03412300,'rua jacinto',14,'vila carmosa','sao paulo','SP','1234-1236');

insert into clientes(email,nome,cpf,cep,endereco,numero,bairro,cidade,uf,fone)
values('wesley@email.com','Wesley Silva',45871236904,03412400,'rua jaja',134,'vila jaçanâ','sao paulo','SP','1234-1236');

insert into clientes(email,nome,cpf,cep,endereco,numero,bairro,cidade,uf,fone)
values('carlitos@email.com','Carlistos Hernanes',12345678999,03312300,'rua Faria lima',12342,'itaim bibi','sao paulo','SP','1234-4236');

update clientes set fone = '4136-5966' where idcliente = 10 ;

select * from clientes;

create table tbos(
os int primary key auto_increment,
dataos timestamp default current_timestamp,
tipo varchar(20) not null,
osstatus varchar(30) not null,
console varchar(200) not null,
fabricante varchar(200),
defeito varchar(200) not null,
tecnico varchar(50),
valor decimal(10,2),
idcliente int not null,
frete decimal(10,2),
dataret date,
foreign key (idcliente) references clientes(idcliente)
);
insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,idcliente)
values('orçamento','aguardando aprovação','Atari 2600','Atari','Super aquecendo','Victor','120','15',1);

insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,idcliente)
values('serviço','bancada','Game Boy','Nintendo','Sujeira','Pedro','60','15',2);

insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,idcliente)
values('orçamento','aguardando aprovação','Game Gear','Sega','Nao liga','Victor','100','15',3);

insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,dataret,idcliente)
values('serviço','retirado','ColecoVision','Coleco','Botao travado','Pedro','70','15',20211014,4);

insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,idcliente)
values('orçamento','aguardando aprovação','Super Nintendo','Nintendo','controle mau contato','Victor','60','15',5);

insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,idcliente)
values('serviço','bancada','Fliperama','Fliperama','Botao travado','pedro','80','15',6);

insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,idcliente)
values('orçamento','aguardando aprovação','Nintendo 64','Nintendo','sujeira','victor','60','15',7);

insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,idcliente)
values('serviço','bancada','PocketStation','Sony','Super aquecendo','Pedro','120','15',8);

insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,idcliente)
values('orçamento','aguardando aprovação','PlayStation 2','Sony','erro na leitura de disco','Pedro','110','15',9);

insert into tbos (tipo,osstatus,console,fabricante,defeito,tecnico,valor,frete,idcliente)
values('serviço','bancada','Atari Jaguar','Atari','Sujeira','victor','60','15',10);

select * from tbos;

update  tbos set osstatus = 'retirado',dataret = 20211031 where idcliente = 1;
update  tbos set osstatus = 'bancada' where idcliente = 9;
update  tbos set osstatus = 'retirado',dataret = 20210301 where idcliente = 10;


-- relatorios
select tbos.console,tbos.fabricante,tbos.defeito,tbos.osstatus as status_os,tbos.valor,
clientes.nome,clientes.fone from  tbos inner join clientes on tbos.idcliente = clientes.idcliente where osstatus = 'aguardando aprovação';

select tbos.console,tbos.fabricante,tbos.defeito,tbos.osstatus as status_os,tbos.valor,
clientes.nome,clientes.fone from  tbos inner join clientes on tbos.idcliente = clientes.idcliente where osstatus = 'bancada';

select tbos.console,tbos.fabricante,tbos.defeito,tbos.osstatus as status_os,tbos.valor,
clientes.nome,clientes.fone from  tbos inner join clientes on tbos.idcliente = clientes.idcliente where osstatus = 'retirado';

select sum(frete + valor) as faturamento from tbos where osstatus = 'retirado'; 

-- relatório de retirada
select os as ordem_serviço, console,date_format(dataret,'%d/%m/%Y') as data_retirada from tbos;

