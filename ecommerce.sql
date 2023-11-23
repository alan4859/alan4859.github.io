SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `ecommerce_teste`
  CHARACTER SET `latin1`
  COLLATE `latin1_swedish_ci`;

USE `ecommerce_teste`;

/* Tables */
CREATE TABLE `categorias` (
  `id`        int AUTO_INCREMENT NOT NULL,
  `cat_nome`  varchar(30),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE `admin` (
  `id` int(11) NOT NULL auto_increment,
  `usuario` varchar(20) default NULL,
  `senha` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB;

CREATE TABLE `end_entrega` (
  `usuario_id`  int,
  `endereco`    varchar(200),
  `bairro`      varchar(50),
  `cidade`      varchar(50),
  `estado`      char(2),
  `cep`         char(9)
) ENGINE = InnoDB;

CREATE TABLE `itens_pedido` (
  `ped_id`   int,
  `prod_id`  int,
  `qtd`      int,
  `preco`    decimal(10,2)
) ENGINE = InnoDB;

CREATE TABLE `pedidos` (
  `id`          int AUTO_INCREMENT NOT NULL,
  `usuario_id`  int,
  `cc_nome`     varchar(50),
  `cc_tipo`     int,
  `cc_numero`   varchar(20),
  `cc_m_exp`    tinyint,
  `cc_a_exp`    tinyint,
  `data_ped`    datetime,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE `produtos` (
  `id`         int AUTO_INCREMENT NOT NULL,
  `prod_nome`  varchar(40),
  `cat_id`     int,
  `preco`      decimal(10,2),
  `desc_peq`   varchar(400),
  `desc_gd`    text,
  `imagem`     varchar(100),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

CREATE TABLE `usuarios` (
  `id`           int AUTO_INCREMENT NOT NULL,
  `nome`         varchar(50),
  `email`        varchar(100),
  `senha`        varchar(20),
  `endereco`     varchar(20),
  `bairro`       varchar(20),
  `cidade`       varchar(20),
  `estado`       char(20),
  `cep`          char(20),
  `end_entrega`  tinyint(1),
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

/* Foreign Keys */
ALTER TABLE `end_entrega`
  ADD CONSTRAINT `fk_usuario`
  FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `fk_produto`
  FOREIGN KEY (`prod_id`)
    REFERENCES `produtos`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE `itens_pedido`
  ADD CONSTRAINT `fk_pedido`
  FOREIGN KEY (`ped_id`)
    REFERENCES `pedidos`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_usuarios`
  FOREIGN KEY (`usuario_id`)
    REFERENCES `usuarios`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;

ALTER TABLE `produtos`
  ADD CONSTRAINT `fk_categorias`
  FOREIGN KEY (`cat_id`)
    REFERENCES `categorias`(`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE;
