CREATE DATABASE DeMetric;
USE DeMetric;

-- TABELA 1 CADASTRO
CREATE TABLE cadastro (
	idCadastro INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(50),
    senha VARCHAR(50),
    cnpj CHAR(14) UNIQUE,
    email VARCHAR(50) UNIQUE,
    dtRegistro DATETIME DEFAULT CURRENT_TIMESTAMP,
    UFestado CHAR(2),
    cidade VARCHAR(30),
    cep CHAR(8)
);
INSERT INTO cadastro(nomeEmpresa, senha, cnpj, email, UFestado, cidade, cep) VALUES 
	('Empresa1', 'minhaSenha123', '75111946000124', 'pedro.almeida@email.com', 'RS', 'Porto Alegre', '90000000'),  
	('Empresa2', 'seguranca456', '37281060000130', 'larissa.fonseca@email.com', 'SC', 'Florianópolis', '88000000'),  
	('Empresa3', 'andre789', '06762026000153', 'andre.luiz@email.com', 'PR', 'Curitiba', '80000000'),  
	('Empresa4', 'nextGenPass', '09491417000179', 'susana.martins@email.com', 'BA', 'Salvador', '40000000'),  
	('Empresa5', 'marcosSenha', '94163378000150', 'marcos.lima@email.com', 'PE', 'Recife', '50000000');
    
SELECT nomeEmpresa AS 'Empresa', senha AS 'Senha', cnpj AS 'CNPJ', dtRegistro AS 'Data de Registro',
 UFestado AS 'Estado', cidade AS 'Cidade', cep AS 'CEP' FROM cadastro;
 
select * from cadastro;

-- TABELA 2 DADOS DO SENSOR
CREATE TABLE sensor(
	idSensor int primary key auto_increment,
	nomeArmazem varchar(30),
    umidade decimal(4,2),
    temperatura decimal(4,2),
    dataInfo datetime default current_timestamp,
    dtInstalacao datetime
);
INSERT INTO sensor (nomeArmazem, umidade, temperatura, dtInstalacao)  
VALUES  
('Armazem Norte', 45.30, 22.50, '2024-12-01 08:30:00'),  
('Armazem Sul', 50.75, 24.10, '2024-11-15 10:45:00'),  
('Armazem Leste', 38.60, 21.80, '2025-01-05 14:20:00'),  
('Armazem Oeste', 55.20, 26.30, '2024-10-10 07:10:00'),  
('Armazem Central', 42.90, 23.70, '2024-09-25 12:00:00');

SELECT concat('O sensor ', idSensor, ' registrou uma umidade relativa no ar de ', umidade, '% e uma temperatura de ', temperatura,
 '°C no ', nomeArmazem, ' no dia ', date_format(dataInfo, ' %d/%m/%y %H:%m')) as 'Histórico de Registro' FROM sensor;
 
SELECT nomeArmazem AS 'Nomde do Armazém', concat(umidade, '%') AS 'Umidade Relativa', concat(temperatura, '°C') AS 'Temperatura',
 date_format(dataInfo, ' %d/%m/%Y %H:%m') AS 'Horário de Registro' FROM sensor;

SELECT date_format(dtInstalacao, ' %d/%m/%Y') AS 'Data de Instalação' FROM sensor;

-- TABELA 3 LOGIN
CREATE TABLE login (
	idCNPJ int primary key auto_increment,
    cnpj varchar(14),
    senha CHAR(8)
    );
    
INSERT INTO login (cnpj, senha) VALUES 
('30381245000177','1234567@'),
('26742839000199','0102030!'),
('99860543000146','#0012233'),
('44014816000140','987654@1'),
('47815632000177','9292929!'),
('70500337000143','1234@567');

SELECT idCNPJ AS ID, cnpj AS CNPJ, senha AS Senha FROM login;

UPDATE login SET senha = '1234567!' WHERE idCNPJ=1;

ALTER TABLE login RENAME COLUMN cnpj TO cnpj_usuario;

SELECT * FROM login;

SELECT idCNPJ AS ID, cnpj_usuario AS USUARIO, senha AS SENHA FROM login;