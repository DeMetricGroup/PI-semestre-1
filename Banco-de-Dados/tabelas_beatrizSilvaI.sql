create database monitoramentoSoja;
use monitoramentoSoja;

-- CRIAÇÃO DE TABELA 1:

create table Empresa(
idEmpresa int primary key auto_increment,
nomeEmpresa varchar (30),
cnjp  char (14) unique,
email varchar (30) unique,
Estado varchar (30),
Cidade varchar (30),
UFestado char(2),
cep char(8),
dataRegistro datetime default current_timestamp
);

insert into Empresa(nomeEmpresa, cnjp, email, Estado, Cidade, UFestado, cep)values
('grãos&Soja', '00274924101611','Agricultura@gmail.com','São Paulo', 'São Paulo', 'SP', '22894510'),
('Soja Vida', '00274924101634','Agri_SojaSuprema@gmail.com','São Paulo', 'São Paulo', 'SP', '22001188'),
('Viva Plantação', '00274924101654', 'Planta_vivaAlimentar@gmail.com','Minas Gerais', 'Uberaba', 'MG', '20194533') ;

-- TABELA 2:
create table sensor(
idSensor int primary key  auto_increment,
umidade varchar(5),
temperatura varchar(5),
localizacaoSensor varchar (20),
dataRegistro datetime default current_timestamp);

insert into sensor (umidade, temperatura, localizacaoSensor)values
('24%', '20°C', 'Parte Norte'),
('35%', '15°C', 'Parte Sul'),
('35%', '20°C', 'Parte oeste'),
('24%', '20°C', 'Parte leste');


-- tabela 3: 
 create table funcionario(
 idFuncionario int primary key auto_increment,
    nome varchar(40),
    email varchar (40),
    senha varchar(20),
    nvlAcesso varchar(20),
    CONSTRAINT chkNvlAcesso CHECK (nvlAcesso IN('Admin','User'))
    ); 
    
    insert into funcionario (nome, email, senha, nvlAcesso) values
    ('Paulo Dennis', 'paulo200@gmail.com', 'jidiwae', 'Admin'),
    ('Pedro joselio', 'joselio_121@gmail.com', 'dwknedgw', 'User'),
    ('Bianaca Estelina', 'bianca_estelina200@gmail.com', '@2Y23', 'User'),
    ('Thalita Mendes', 'thalita_mendes@gmail.com', 'lfjmwe', 'User'),
    ('Thamires Fernandes', 'thamires_fernandes500@gmail.com', 'mrjkt', 'Admin');
    
 -- execução dos comandos:
 select * from Empresa;
 select * from sensor;
 select * from Funcionario; 
 
 
 update empresa set nomeEmpresa='soja Agrivida' where idEmpresa=2;
 update empresa set nomeEmpresa='Cultivare' where idEmpresa=1;
 update empresa set nomeEmpresa='soja universal' where idEmpresa=3; 
 
 update sensor set localizacaoSensor='zona norte' where idSensor=1;
 update sensor set localizacaoSensor='zona sul' where idSensor=2;
 update sensor set localizacaoSensor='zona oeste' where idSensor=3;
 update sensor set localizacaoSensor='zona leste' where idSensor =4; 
 
 
 alter table funcionario drop constraint chkNvlAcesso;
 insert into funcionario(nome, email, senha, nvlAcesso) values
('José Tavares Medina', 'oseT@gmail.com', 'debfhw', 'proprietário');
 
describe funcionario;
describe sensor;
describe empresa; 
 
 alter table funcionario add column data_cadastro datetime default current_timestamp ;
 
 
