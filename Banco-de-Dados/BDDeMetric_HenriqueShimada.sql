create database demetric;
use demetric;

-- cadastro
create table cadastro (
	idCadastro int primary key auto_increment,
    nomeEmpresa varchar(30),
    senha varchar(30),
    cnpj char(14) unique,
    email varchar(30) unique,
    dtRegistro datetime default current_timestamp,
    UF char(2),
    cidade varchar(30),
    cep char(8)
);
insert into cadastro(nomeEmpresa, senha, cnpj, email, UF, cidade, cep) values
	('Madrigal', 'breakingbad123489', '75111946000124', 'madrigal.pollos@email.com', 'RS', 'Porto Alegre', '48208010'),  
	('TerraFertil Commodities', '090909jBJi02', '37281007906130', 'terra.fertil@email.com', 'SC', 'Ouro verde', '37590270'),  
	('InGen BioFarms', 'cafecomleitegostomuito20', '20972482000153', 'Bio.Farm@email.com', 'MG', 'Cuiabá', '9864794'),  
	('Vault-Tec', 'fallout190929', '90491417000179', 'vault.tec@email.com', 'GO', 'Goiania', '80987468'),  
	('Umbrella AgroTech', 'Resident19828392', '94163378083270', 'umbrella.agro@email.com', 'PE', 'Recife', '09835789');
    
select nomeEmpresa as 'Empresa', senha as 'Senha', cnpj as 'CNPJ', dtRegistro as 'Data de Registro', UF as 'Estado', cidade as 'Cidade', cep as 'CEP' from cadastro;
 
select * from cadastro;
delete from cadastro where idCadastro = 3;
alter table cadastro add column dono varchar(30);

update cadastro set dono = 'Gustavo Frieng' where idCadastro = 1;
update cadastro set dono = 'Joaquim Junior' where idCadastro = 2;
update cadastro set dono = 'Francisco Medina' where idCadastro =3;
update cadastro set dono = 'Mariana Muniz' where idCadastro =4;
update cadastro set dono = 'Ada Wong' where idCadastro =5;

-- dados do sensor
create table sensor(
	idSensor int primary key auto_increment,
	nomeArmazem varchar(30),
    umidade decimal(4,2),
    temperatura decimal(4,2),
    dataInfo datetime default current_timestamp,
    dtInstalacao datetime
);
insert into sensor (nomeArmazem, umidade, temperatura, dtInstalacao) values 
('Armazem 1', 41.00, 19.30, '2025-04-20 08:55:01'),  
('Armazem 2', 31.23, 22.22, '2025-03-21 10:45:30'),  
('Armazem 3', 36.75, 21.80, '2025-01-05 14:20:00'),  
('Armazem 4', 55.20, 26.30, '2025-10-10 07:10:00'),  
('Armazem 5', 42.90, 23.70, '2025-09-25 12:00:00');

select concat('O sensor ', idSensor, ' registrou uma umidade relativa no ar de ', umidade, '% e uma temperatura de ', temperatura,
 '°C no ', nomeArmazem, ' no dia ', date_format(dataInfo, '%d/%m/%y %H:%m')) as 'Histórico de Registro' from sensor;
 
select nomeArmazem as 'Nomde do Armazém', concat(umidade, '%') as 'Umidade Relativa', concat(temperatura, '°C') as 'Temperatura',
 date_format(dataInfo, '%d/%m/%Y %H:%m') as 'Hora do Registro', date_format(dtInstalacao, '%d/%m/%Y') as 'Data da instalacao' from sensor;


-- parâmetros do grão
create table parametroGrao (
	idArmazem int primary key auto_increment,
    nomeArmazem varchar(20),
    maxUmidade decimal(4,2),
    minUmidade decimal(4,2),
    temperaturaMax decimal(4,2),
    temperaturaMin decimal(4,2)
);  
insert into parametroGrao (nomeArmazem, maxUmidade, minUmidade, temperaturaMax, temperaturaMin) values  
('Armazem Norte', 13.00, 11.00, 28.00, 12.00),
('Armazem Sul', 12.00, 11.00, 21.00, 17.00);

select idArmazem, nomeArmazem as 'Nome do armazem',  concat(maxUmidade, '%') as 'Umidade maxima', 
concat(minUmidade, '%') as 'Umidade mínima', concat(temperaturaMax, '°C') as 'Temperatura máxima', concat(temperaturaMin, '°C') as 'Temperatura mínima'
from parametroGrao;

delete from parametroGrao where idArmazem = 2;