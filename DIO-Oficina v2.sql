-- drop database oficina; 
create database oficina;

use oficina;



-- -----------------------------------------------------
-- Table `cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idcliente`));


-- -----------------------------------------------------
-- Table `fabricante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `fabricante` (
  `idfabricante` INT NOT NULL AUTO_INCREMENT,
  `fabricante` VARCHAR(45) NULL,
  PRIMARY KEY (`idfabricante`));


-- -----------------------------------------------------
-- Table `modelo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `modelo` (
  `idmodelo` INT NOT NULL AUTO_INCREMENT,
  `modelo` VARCHAR(45) NOT NULL,
  `fabricante_idfabricante` INT NOT NULL,
  PRIMARY KEY (`idmodelo`, `fabricante_idfabricante`),
  CONSTRAINT `fk_modelo_fabricante1`
    FOREIGN KEY (`fabricante_idfabricante`)
    REFERENCES `fabricante` (`idfabricante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `veículo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `veículo` (
  `idveículo` INT NOT NULL AUTO_INCREMENT,
  `cliente_idcliente` INT NOT NULL,
  `cor` VARCHAR(45) NULL,
  `placa` VARCHAR(45) NOT NULL,
  `modelo_idmodelo` INT NOT NULL,
  PRIMARY KEY (`idveículo`, `cliente_idcliente`, `modelo_idmodelo`),
  CONSTRAINT `fk_veículo_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_veículo_modelo1`
    FOREIGN KEY (`modelo_idmodelo`)
    REFERENCES `modelo` (`idmodelo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `equipe_mecânicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `equipe_mecânicos` (
  `idequipe_mecânicos` INT NOT NULL AUTO_INCREMENT,
  `nome_equipe` VARCHAR(45) NULL,
  `veículo_idveículo` INT NOT NULL,
  `veículo_cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (`idequipe_mecânicos`, `veículo_idveículo`, `veículo_cliente_idcliente`),
  CONSTRAINT `fk_equipe_mecânicos_veículo1`
    FOREIGN KEY (`veículo_idveículo` , `veículo_cliente_idcliente`)
    REFERENCES `veículo` (`idveículo` , `cliente_idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



-- -----------------------------------------------------
-- Table `serviço`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `serviço` (
  `idserviço` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`idserviço`));


-- -----------------------------------------------------
-- Table `peças`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `peças` (
  `idpeças` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `valor` FLOAT NULL,
  PRIMARY KEY (`idpeças`));





-- -----------------------------------------------------
-- Table `Especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Especialidade` (
  `idEspecialidade` INT NOT NULL AUTO_INCREMENT,
  `Descrição` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEspecialidade`));



-- -----------------------------------------------------
-- Table `mecânico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mecânico` (
  `idmecânico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NULL,
  `endereço` VARCHAR(45) NULL,
  `Especialidade_idEspecialidade` INT NOT NULL,
  `equipe_mecânicos_idequipe_mecânicos` INT NOT NULL,
  `equipe_mecânicos_veículo_idveículo` INT NOT NULL,
  `equipe_mecânicos_veículo_cliente_idcliente` INT NOT NULL,
  PRIMARY KEY (
    `idmecânico`,
    `Especialidade_idEspecialidade`,
    `equipe_mecânicos_idequipe_mecânicos`,
    `equipe_mecânicos_veículo_idveículo`,
    `equipe_mecânicos_veículo_cliente_idcliente`
  ),
  CONSTRAINT `fk_mecânico_Especialidade1` FOREIGN KEY (`Especialidade_idEspecialidade`) REFERENCES `Especialidade` (`idEspecialidade`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_mecânico_equipe_mecânicos1` FOREIGN KEY (
    `equipe_mecânicos_idequipe_mecânicos`,
    `equipe_mecânicos_veículo_idveículo`,
    `equipe_mecânicos_veículo_cliente_idcliente`
  ) REFERENCES `equipe_mecânicos` (
    `idequipe_mecânicos`,
    `veículo_idveículo`,
    `veículo_cliente_idcliente`
  ) ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- -----------------------------------------------------
-- Table `os`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `os` (
  `idos` INT NOT NULL AUTO_INCREMENT,
  `data_emissão` DATE NULL,
  `status_os` ENUM('Pendente', 'Em Andamento', 'Fechada', 'Cancelada') NULL DEFAULT 'Pendente',
  `data_conclusão` DATE NULL,
  `equipe_mecânicos_idequipe_mecânicos` INT NOT NULL,
  `equipe_mecânicos_veículo_idveículo` INT NOT NULL,
  `equipe_mecânicos_veículo_cliente_idcliente` INT NOT NULL,
  `serviço_idserviço` INT NOT NULL,
  `os_peças_peças_idpeças` INT NOT NULL,
  `peças_idpeças` INT NOT NULL,
  `data_autorizacao_execucao_cliente` DATE NULL,
  PRIMARY KEY (`idos`, `equipe_mecânicos_idequipe_mecânicos`, `equipe_mecânicos_veículo_idveículo`, `equipe_mecânicos_veículo_cliente_idcliente`, `serviço_idserviço`, `os_peças_peças_idpeças`, `peças_idpeças`),
  CONSTRAINT `fk_os_equipe_mecânicos1`
    FOREIGN KEY (`equipe_mecânicos_idequipe_mecânicos` , `equipe_mecânicos_veículo_idveículo` , `equipe_mecânicos_veículo_cliente_idcliente`)
    REFERENCES `equipe_mecânicos` (`idequipe_mecânicos` , `veículo_idveículo` , `veículo_cliente_idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_serviço1`
    FOREIGN KEY (`serviço_idserviço`)
    REFERENCES `serviço` (`idserviço`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_os_peças1`
    FOREIGN KEY (`peças_idpeças`)
    REFERENCES `peças` (`idpeças`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);



desc cliente;
desc veículo;
desc equipe_mecânicos;
desc mecânico;
desc modelo;
desc fabricante;
desc os;
desc serviço;
desc peças;
desc Especialidade;

SET SQL_MODE='ALLOW_INVALID_DATES';

SELECT * FROM cliente;
SELECT * FROM veículo;
SELECT * FROM equipe_mecânicos;
SELECT * FROM mecânico;
SELECT * FROM modelo;
SELECT * FROM fabricante;
SELECT * FROM serviço;
SELECT * FROM peças;
SELECT * FROM Especialidade;
SELECT * FROM os;


alter table clients auto_increment=1;

