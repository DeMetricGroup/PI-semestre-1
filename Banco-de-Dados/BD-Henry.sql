create database graos;
use graos;

-- TABELA 1 
CREATE TABLE login (
	idEmpresa INT primary key auto_increment,
	nomeEmpresa varchar(40),
	cnpj char(14) unique,
	email varchar(50) unique,
    senha varchar(50),
    cidade varchar(30),
    UF char(2),
    dtRegistro datetime default current_timestamp,
    cep char(8)
);
INSERT INTO login (nomeEmpresa, senha, cnpj, email, UFestado, cidade, cep) VALUES 
      ('SoftWave', 'minhaSenha123', '45678912000122', 'pedro.almeida@email.com', 'RS', 'Porto Alegre', '90000000'),  
      ('CodeMasters', 'seguranca456', '99123456000133', 'larissa.fonseca@email.com', 'SC', 'Florianópolis', '88000000'),  
      ('CyberNet', 'andre789', '11223344000144', 'andre.luiz@email.com', 'PR', 'Curitiba', '80000000'),  
      ('NextGenTech', 'nextGenPass', '22334556000155', 'susana.martins@email.com', 'BA', 'Salvador', '40000000'),  
      ('InovaSoft', 'marcosSenha', '33445667000166', 'marcos.lima@email.com', 'PE', 'Recife', '50000000');

UPDATE login SET nomeEmpresa = 'QuerSoja' WHERE idEmpresa = 4;
DELETE FROM login WHERE idEmpresa = 1;
SELECT * FROM login;

ALTER TABLE login DROP COLUMN nomeUsuario, DROP COLUMN nvlAcesso;

-- TABELA 2 
CREATE TABLE sensor(
    idSensor int primary key auto_increment,
    umidade decimal(4,2),
    temperatura decimal(4,2),
    nomeArmazem varchar(30),
    dataInfo datetime default current_timestamp,
    dtInstalacao datetime
);

INSERT INTO sensor (umidade, temperatura, nomeArmazem, dtInstalacao)  VALUES  
(45.30, 22.50, 'Armazem Sul', '2024-12-01 08:30:00'),  
(50.75, 24.10, 'Armazem Norte', '2024-11-15 10:45:00'),  
(38.60, 21.80, 'Armazem Central', '2025-01-05 14:20:00'),  
(55.20, 26.30, 'Armazem Oeste', '2024-10-10 07:10:00'),  
(42.90, 23.70, 'Armazem Central', '2024-09-25 12:00:00');

UPDATE sensor SET dtInstalacao = '2025-01-25' WHERE idSensor = 4;
DELETE FROM sensor WHERE idSensor = 2;
SELECT * FROM sensor;
     
-- TABELA 3 
CREATE TABLE grao (
      idGrao INT PRIMARY KEY AUTO_INCREMENT,
    nomeArmazem VARCHAR(20),
    maxUmidade DECIMAL(4,2),
    minUmidade DECIMAL(4,2), -- UMIDADE RELATIVA; %
    temperaturaMax DECIMAL(4,2),
    temperaturaMin DECIMAL(4,2)
);  
INSERT INTO grao (nomeGrao, maxUmidade, minUmidade, temperaturaMax, temperaturaMin)  
VALUES  
('Soja', 13.00, 11.00, 28.00, 12.00);

ALTER TABLE grao RENAME COLUMN idGrao to idArmazem;
SELECT * FROM grao;