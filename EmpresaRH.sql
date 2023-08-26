
CREATE TABLE `cargos` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`salario` DECIMAL(20,6) NOT NULL,
	`setor` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
UNIQUE INDEX `nome` (`nome`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;


CREATE TABLE `empresas` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`endereco` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`cidade` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`cnpj` CHAR(14) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(255) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	`nicho` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`telefone` VARCHAR(11) NOT NULL DEFAULT '' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `cnpj` (`cnpj`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;
CREATE TABLE `funcionarios` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`data_nascimento` DATE NULL DEFAULT NULL,
	`endereco` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`cidade` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`cpf` CHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`id_cargo` INT NOT NULL,
	id_empresa INT NOT NULL,
	`telefone` VARCHAR(11) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `cpf` (`cpf`) USING BTREE,
	CONSTRAINT funcionarios_cargos
FOREIGN KEY (id_cargo) 
REFERENCES cargos (id),
CONSTRAINT funcionarios_empresa
FOREIGN KEY (id_empresa) 
REFERENCES empresas (id)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=1
;


INSERT INTO cargos (nome,salario,setor) VALUES ('analista de sistemas','1500,0','Tecnologia');

INSERT INTO cargos (nome,salario,setor) VALUES ('Desenvolvedor Python SR','8000,0','Tecnologia');

INSERT INTO cargos (nome,salario,setor) VALUES ('assistente de marketing digital','3000,0','Marketing');

INSERT INTO cargos (nome,salario,setor) VALUES ('Gestor de recrutamento e seleção','6000,0','Recursos Humanos');

INSERT INTO cargos (nome,salario,setor) VALUES ('Jogador de futebol','600000,0','goleiro');

INSERT INTO cargos (nome,salario,setor) VALUES ('Gerente Tecnologia','60000,0','Tecnologia');




INSERT INTO empresas (nome,endereco,cidade,cnpj,email,nicho,telefone) VALUES ('Cruzeiro Esporte Clube', ' Rua dos Guajajaras n°1722 Barro Preto', 'Belo Horizonte', '44490706000154','cruzeiro@email.com.br', 'Futebol', '3131956946')


INSERT INTO empresas (nome,endereco,cidade,cnpj,email,nicho,telefone) VALUES ('Farmácia Indiana','R. Cel. Mario Cordeiro, 982 - Pampulhinha','Teófilo Otoni','25102146000179','farmaciaindianafarmaciaindiana.com','Farmacêutico','3335291300',);


INSERT INTO funcionarios (nome,data_nascimento,endereco,cidade,cpf,id_cargo,id_empresa,telefone,email) VALUES ('Gustavo Lima Fajardo','19980424','Rua Ismael Almeida de souza. Bairro Jardim Iracema n°46','Teófilo Otoni','13230233646','2','2','33988713155','limafajardo1998@gmail.com');

INSERT INTO funcionarios (nome,data_nascimento,endereco,cidade,cpf,id_cargo,id_empresa,telefone,email) VALUES ('Adriano Lima Matos','19800625','Rua X. Bairro Y n°1000','Teófilo Otoni','13230233646','6','2','33988152290','adriano.lima@farmaciaindiana.com.com');

INSERT INTO funcionarios (nome,data_nascimento,endereco,cidade,cpf,id_cargo,id_empresa,telefone,email) VALUES ('Rafael Cabral','19900520','Rua B. Bairro A n°1000','Belo Horizonte','23215033646','5','1','33988182290','rafel.cabral@cruzeiro.com');

\\SELECT\\

Retorna todos funcionarios da empresa de ID = 2

SELECT *FROM funcionarios AS f

 INNER JOIN empresas AS e

ON f.id_empresa = e.id
WHERE e.id = 2


retorna todos funcinarios da empresa com id = 2 com salario > 10000,00

SELECT *FROM funcionarios AS f

 INNER JOIN empresas AS e
 ON f.id_empresa = e.id
 
 INNER JOIN cargos AS c
ON f.id_cargo = c.id

WHERE e.id = 2 AND c.salario < '10000,0'



Retorna todos funcionarios das empresas da cidade de teofilo otoni

SELECT *FROM funcionarios AS f

 INNER JOIN empresas AS e
 ON f.id_empresa = e.id

WHERE e.cidade = 'Teófilo Otoni'



Retorno todas empresas do nicho futebol

SELECT *FROM empresas WHERE nicho = 'futebol'



retorna todos funcionarios da empresa id =2  com endereço = Rua Ismael Almeida de souza. Bairro Jardim Iracema n°46

SELECT *FROM funcionarios AS f

 INNER JOIN empresas AS e
 ON f.id_empresa = e.id

WHERE e.id = '2' AND f.endereco = 'Rua Ismael Almeida de souza. Bairro Jardim Iracema n°46'



Retorna nome do funcionario e da empresa que ele está atribuido 

SELECT	f.nome AS Funcionario,
			e.nome AS Empresa
FROM funcionarios AS f

 INNER JOIN empresas AS e

ON f.id_empresa = e.id



Retorna o nome do funcionario a empresa que ele está vinculado, o cargo e seu salário.

SELECT	f.nome AS Funcionario,
			e.nome AS Empresa,
			c.nome AS Cargo,
			f.endereco AS 'Endereço do Funcionario',
			c.salario AS Salário
FROM funcionarios AS f

 INNER JOIN empresas AS e
 ON f.id_empresa = e.id
 INNER JOIN cargos AS c
 ON f.id_cargo = c.id




