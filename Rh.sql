CREATE DATABASE `Rh` /*!40100 COLLATE 'utf8mb4_general_ci' */

CREATE TABLE `funcionarios` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`data_nascimento` DATE NULL DEFAULT NULL,
	`endereco` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`cidade` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`cpf` CHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`cargo` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`telefone` VARCHAR(11) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	`email` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `cpf` (`cpf`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=10
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
AUTO_INCREMENT=2
;
CREATE TABLE `cargos` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`salario` DECIMAL(20,6) NOT NULL,
	`setor` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=6
;
CREATE TABLE `empresas_funcionarios` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`id_empresa` INT(11) NOT NULL,
	`id_funcionario` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id_empresa` (`id_empresa`) USING BTREE,
	INDEX `id_funcionario` (`id_funcionario`) USING BTREE,
	CONSTRAINT `empresas_funcionarios_ibfk_1` FOREIGN KEY (`id_empresa`) REFERENCES `empresas` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `empresas_funcionarios_ibfk_2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `funcionarios_cargos` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`id_funcionario` INT(11) NOT NULL,
	`id_cargo` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id_funcionario` (`id_funcionario`) USING BTREE,
	INDEX `id_cargo` (`id_cargo`) USING BTREE,
	CONSTRAINT `funcionarios_cargos_ibfk_1` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionarios` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `funcionarios_cargos_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargos` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
INSERT INTO cargos (nome,salario,setor) VALUES ('analista de sistemas','150000','Tecnologia');

INSERT INTO cargos (nome,salario,setor) VALUES ('Desenvolvedor Python SR','8000,0','Tecnologia');

INSERT INTO cargos (nome,salario,setor) VALUES ('assistente de marketing digital','3000,0','Marketing');

INSERT INTO cargos (nome,salario,setor) VALUES ('assistente de marketing digital','6000,0','Recursos Humanos');

INSERT INTO cargos (nome,salario,setor) VALUES ('Jogador de futebol','600000,0','goleiro');


INSERT INTO cargos (nome,salario,setor) VALUES ('Gerente Tecnologia','60000,0','Tecnologia');

INSERT INTO funcionarios (nome,data_nascimento,endereco,cidade,cpf,cargo,telefone,email) VALUES ('Gustavo Lima Fajardo','19980424','Rua Ismael Almeida de souza. Bairro Jardim Iracema n°46','Teófilo Otoni','13230233646','Desenvolvedor Python SR','33988713155','limafajardo1998@gmail.com');

INSERT INTO funcionarios (nome,data_nascimento,endereco,cidade,cpf,cargo,telefone,email) VALUES ('Adriano Lima Matos','19800625','Rua X. Bairro Y n°1000','Teófilo Otoni','13230233646','Gerente Tecnologia','33988152290','adriano.lima@farmaciaindiana.com.com');

INSERT INTO funcionarios (nome,data_nascimento,endereco,cidade,cpf,cargo,telefone,email) VALUES ('Rafael Cabral','19900520','Rua B. Bairro A n°1000','Belo Horizonte','23215033646','Jogador de futebol','33988182290','rafel.cabral@cruzeiro.com');

INSERT INTO empresas (nome,endereco,cidade,cnpj,email,nicho,telefone) VALUES ('cruzeiro',' Rua dos Guajajaras, 1722, Barro Preto,'Belo Horizonte','25102146012173','Futebol','3335288300','cruzeiro@cruzeiro.com');


INSERT INTO empresas (nome,endereco,cidade,cnpj,email,nicho,telefone) VALUES ('Cruzeiro Esporte Clube', ' Rua dos Guajajaras n°1722 Barro Preto', 'Belo Horizonte', '44490706000154','cruzeiro@email.com.br', 'Futebol', '3131956946')


INSERT INTO empresas_funcionarios (id_empresa, id_funcionario) VALUES (1, 1);
INSERT INTO empresas_funcionarios (id_empresa, id_funcionario) VALUES (1, 2);
INSERT INTO empresas_funcionarios (id_empresa, id_funcionario) VALUES (2, 3);
