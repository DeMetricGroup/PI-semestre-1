use adsa;
show tables;

create table Cadastro(
idEmpresa int primary key auto_increment,
nome varchar(30),
senha varchar(20),
dtaCadastro datetime default current_timestamp,
estado varchar(2),
cidade varchar (30)
);

create table Armazém(
idArmazem int primary key auto_increment,
dtaCadastro datetime default current_timestamp,
senha varchar(20),
qtdGraos varchar(10)
);

create table Sensor(
idSensor int primary key auto_increment,
dtaCadastro datetime default current_timestamp,
Temperatura varchar(5),
Umidade varchar(5)
);

select * from Cadastro;
select * from Armazém;
select * from Sensor;

insert into Cadastro (nome,senha,estado,cidade) values
('SoySaver','du;2WJ0-PjL8','RS','Porto Alegre'),
('AMPETRIC','6XQPwb2Xyn:2','SP','Santos'),
('Damatric','@fm7[D5M1!bp','BA','Salvador');

insert into Armazém (senha,qtdGraos) values
('qE3jH;6P1H"I','20.542'),
('V{bEe0oS01w@','12.578');

insert into Sensor (Temperatura, Umidade) values
('21°C','34%'),
('16°C','40%');
