CREATE TABLE IF NOT EXISTS `web_store_test`.`category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(155) NULL DEFAULT NULL,
  `alias` VARCHAR(255) NOT NULL,
  `image` VARCHAR(255) NOT NULL DEFAULT 'default.png',
  `enabled` TINYINT(4) NOT NULL,
  `parent_id` INT NULL,
  `all_parent_ids` VARCHAR(255) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `title_UNIQUE` (`title` ASC) VISIBLE,
  INDEX `fk_category_category1_idx` (`parent_id` ASC) VISIBLE,
  UNIQUE INDEX `alias_UNIQUE` (`alias` ASC) VISIBLE,
  CONSTRAINT `fk_category_category1`
    FOREIGN KEY (`parent_id`)
    REFERENCES `web_store_test`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `web_store_test`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(155) NOT NULL,
  `password` VARCHAR(155) NOT NULL,
  `role` ENUM('USER', 'ADMIN') NOT NULL DEFAULT 'USER',
  PRIMARY KEY (`id`))
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `web_store_test`.`user_info` (
  `user_info_id` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `surname` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`user_info_id`),
  CONSTRAINT `fk_user_details_user1`
    FOREIGN KEY (`user_info_id`)
    REFERENCES `web_store_test`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB



CREATE TABLE IF NOT EXISTS `web_store_test`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `order_status` ENUM('Оплачено', 'Отмена', 'Ожидание', 'Обработка', 'Выполнен') NOT NULL,
  `user_id` INT NOT NULL,
  `shipping_type` INT NOT NULL,
  `city` VARCHAR(155) NULL,
  `address` VARCHAR(155) NULL,
  `total_price` FLOAT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orders_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `web_store_test`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `web_store_test`.`delivery` (
  `orders_id` INT NOT NULL,
  `status` ENUM('Обработка', 'Отправлено', 'Отмена', 'Доставлено') NOT NULL DEFAULT 'Обработка',
  INDEX `fk_delivery_orders1_idx` (`orders_id` ASC) VISIBLE,
  PRIMARY KEY (`orders_id`),
  CONSTRAINT `fk_delivery_orders1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `web_store_test`.`orders` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `web_store_test`.`vendor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB


CREATE TABLE IF NOT EXISTS `web_store_test`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(155) NOT NULL,
  `alias` VARCHAR(255) NULL,
  `description` LONGTEXT NULL,
  `price` INT(11) NOT NULL,
  `image` VARCHAR(255) NULL,
  `vendor_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_vendor1_idx` (`vendor_id` ASC) VISIBLE,
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  FULLTEXT INDEX `product_FTS` (`title`, `description`) VISIBLE,
  CONSTRAINT `fk_product_vendor1`
    FOREIGN KEY (`vendor_id`)
    REFERENCES `web_store_test`.`vendor` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `web_store_test`.`category` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB



CREATE TABLE IF NOT EXISTS `web_store_test`.`order_basket` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `quantity` INT(11) NOT NULL,
  INDEX `fk_order_basket_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_order_basket_user1_idx` (`user_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_order_basket_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `web_store_test`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_basket_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `web_store_test`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB