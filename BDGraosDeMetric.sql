/*
GRUPO 5

Beatriz Silva Santos 090
Claudiana dos Santos 065
Dennis W. Serrano Medrano 063
Eduardo Gomes de Camargo 062
Henrique Shimada Pinto 129
Henry Gabriel de Lara Garcia 103
Isabelle de Carvalho Cruz 087
Vique da Silva Peixoto 078
*/
CREATE DATABASE DeMetric;
USE DeMetric;

-- TABELA 1 CADASTRO DA EMPRESA
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
-- Inserindo dados na tabela
INSERT INTO cadastro(nomeEmpresa, senha, cnpj, email, UFestado, cidade, cep) VALUES 
	('Empresa1', '678765432', '75111946000124', 'empresa.emp1@email.com', 'RS', 'Porto Alegre', '90000000'),  
	('Empresa2', 'sAgu256nca456', '37281060000130', 'empresa.emp2@email.com', 'SC', 'Florianópolis', '88000000'),  
	('Empresa3', 'an1aW1e789', '06762026000153', 'empresa.emp3@email.com', 'PR', 'Curitiba', '80000000'),  
	('Empresa4', 'nRxtGe38330ss', '09491417000179', 'empresa.emp4@email.com', 'BA', 'Salvador', '40000000'),  
	('Empresa5', 'marh1q5osAexdyt', '94163378000150', 'empresa.emp5@email.com', 'PE', 'Recife', '50000000');
    
SELECT nomeEmpresa AS 'Empresa', senha AS 'Senha', cnpj AS 'CNPJ', email, dtRegistro AS 'Data de Registro',
 UFestado AS 'Estado', cidade AS 'Cidade', cep AS 'CEP' FROM cadastro;
 
 
-- TABELA 2 FUNCIONÁRIO
CREATE TABLE funcionario(
	idFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nomeFuncionario VARCHAR(50),
    email VARCHAR(30),
    senha VARCHAR(50),
    nvlAcesso varchar(20),
    CONSTRAINT chkNvlAcesso CHECK (nvlAcesso IN('Admin','User')),
	codeEmpresa INT
); desc funcionario;
-- Inserindo dados na tabela
INSERT INTO funcionario (nomeFuncionario, email, senha, nvlAcesso, codeEmpresa) VALUES
	('Dennis Wilson Serrano', 'dennis.wilson@gmail.com', 'lknregnj', 'Admin', 1),
	('Beatriz Silva Santos', 'beatriz.silva@gmail.com', 'dsghr', 'User', 2),
	('Hannah Baker', 'hannah.baker@gmail.com', '12435yu', 'User', 3);
    
SELECT nomeFuncionario AS 'Nome do Funcionário', email AS 'Email', senha AS 'Senha', nvlAcesso AS 'Nivel de Acesso',
codeEmpresa AS 'Código da empresa' FROM funcionario;

-- TABELA 3 DADOS DO SENSOR
CREATE TABLE sensor(
	idSensor int primary key auto_increment,
	nomeArmazem varchar(30),
    umidade decimal(4,2),
    temperatura decimal(4,2),
    dataInfo datetime default current_timestamp,
    dtInstalacao datetime
);
-- Inserindo dados na tabela
INSERT INTO sensor (nomeArmazem, umidade, temperatura, dtInstalacao)  
VALUES  
('Armazem Norte', 45.30, 22.50, '2024-12-01 08:30:00'),  
('Armazem Sul', 50.75, 24.10, '2024-11-15 10:45:00'),  
('Armazem Leste', 38.60, 21.80, '2025-01-05 14:20:00'),  
('Armazem Oeste', 55.20, 26.30, '2024-10-10 07:10:00'),
('Armazem Central', 42.90, 23.70, '2024-09-25 12:00:00');
 
SELECT nomeArmazem AS 'Nome do Armazém', concat(umidade, '%') AS 'Umidade Relativa', concat(temperatura, '°C') AS 'Temperatura',
 date_format(dataInfo, ' %d/%m/%Y %H:%m') AS 'Horário de Registro' FROM sensor;
 
-- Data de instalação do sensor
SELECT date_format(dtInstalacao, ' %d/%m/%Y') AS 'Data de Instalação' FROM sensor;

-- TABELA 4 PARÂMETROS DO GRÃO
CREATE TABLE parametroGrao (
	idArmazem INT PRIMARY KEY AUTO_INCREMENT,
    nomeArmazem VARCHAR(30),
    maxUmidade DECIMAL(4,2),
    minUmidade DECIMAL(4,2),
    temperaturaMax DECIMAL(4,2),
    temperaturaMin DECIMAL(4,2)
);
-- Inserindo dados na tabela
INSERT INTO parametroGrao (nomeArmazem, maxUmidade, minUmidade, temperaturaMax, temperaturaMin)  
VALUES  
('Armazem Norte', 13.00, 11.00, 28.00, 12.00),
('Armazem Sul', 12.00, 11.00, 21.00, 17.00),
('Armazem Leste', 13.00, 11.00, 28.00, 12.00),
('Armazem Oeste', 13.00, 11.00, 28.00, 12.00),
('Armazem Central', 13.00, 11.00, 28.00, 12.00);

SELECT nomeArmazem AS 'Nome do armazem',  concat(maxUmidade, '%') AS 'Umidade maxima', 
concat(minUmidade, '%') AS 'Umidade mínima', concat(temperaturaMax, '°C') AS 'Temperatura máxima', concat(temperaturaMin, '°C') AS 'Temperatura mínima'
FROM parametroGrao;