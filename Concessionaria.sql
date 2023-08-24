REATE DATABASE `concessionaria` /*!40100 COLLATE 'utf8mb4_general_ci' */

CREATE TABLE `carro` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`marca` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`ano` YEAR NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `loja` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	`endereco` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `marca` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`nome` VARCHAR(255) NOT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `carros_marcas` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`id_carro` INT(11) NOT NULL,
	`id_marca` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id_carro` (`id_carro`) USING BTREE,
	INDEX `id_marca` (`id_marca`) USING BTREE,
	CONSTRAINT `carros_marcas_ibfk_1` FOREIGN KEY (`id_carro`) REFERENCES `carro` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `carros_marcas_ibfk_2` FOREIGN KEY (`id_marca`) REFERENCES `marca` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
CREATE TABLE `carros_lojas` (
	`id` INT(11) NOT NULL AUTO_INCREMENT,
	`id_carro` INT(11) NOT NULL,
	`id_loja` INT(11) NOT NULL,
	PRIMARY KEY (`id`) USING BTREE,
	INDEX `id_carro` (`id_carro`) USING BTREE,
	INDEX `id_loja` (`id_loja`) USING BTREE,
	CONSTRAINT `carros_lojas_ibfk_1` FOREIGN KEY (`id_carro`) REFERENCES `carro` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT,
	CONSTRAINT `carros_lojas_ibfk_2` FOREIGN KEY (`id_loja`) REFERENCES `loja` (`id`) ON UPDATE RESTRICT ON DELETE RESTRICT
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
