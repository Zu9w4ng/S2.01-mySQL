CREATE TABLE `PROVINCE` (
  `id_province` int PRIMARY KEY,
  `province_name` varchar(255)
);

CREATE TABLE `LOCALITY` (
  `id_locality` int PRIMARY KEY,
  `locality_name` varchar(255),
  `province` int
);

CREATE TABLE `CLIENT` (
  `id_client` int PRIMARY KEY,
  `client_name` varchar(255),
  `client_surname` varchar(255),
  `postal_code` int,
  `adress` varchar(255),
  `telf` int,
  `locality` int
);

CREATE TABLE `ORDER` (
  `id_order` int,
  `product` int,
  `quantity` int,
  `order_time` timestamp,
  `price` float,
  `client` int,
  `store` int,
  `cook` int,
  PRIMARY KEY (`id_order`, `product`)
);

CREATE TABLE `PRODUCT` (
  `id_product` int PRIMARY KEY,
  `product_name` varchar(255),
  `description` varchar(255),
  `photo` binary,
  `price` float
);

CREATE TABLE `PIZZA` (
  `id_product` int PRIMARY KEY,
  `category` int
);

CREATE TABLE `HAMBURGER` (
  `id_product` int PRIMARY KEY
);

CREATE TABLE `DRINK` (
  `id_product` int PRIMARY KEY
);

CREATE TABLE `CATEGORY` (
  `id_category` int PRIMARY KEY,
  `category_name` varchar(255)
);

CREATE TABLE `STORE` (
  `id_store` int PRIMARY KEY,
  `adress` varchar(255),
  `postal_code` int,
  `locality` int
);

CREATE TABLE `EMPLOYEE` (
  `id_employee` int PRIMARY KEY,
  `emp_name` varchar(255),
  `emp_surname` varchar(255),
  `nif` int,
  `telf` int,
  `store` int
);

CREATE TABLE `COOK` (
  `id_employee` int PRIMARY KEY
);

CREATE TABLE `DISTRIBUTOR` (
  `id_employee` int PRIMARY KEY
);

CREATE TABLE `PICKUP` (
  `id_order` int,
  `product` int,
  PRIMARY KEY (`id_order`, `product`)
);

CREATE TABLE `DELIVERY` (
  `id_order` int,
  `product` int,
  `distributor` int,
  `delivery_time` timestamp,
  PRIMARY KEY (`id_order`, `product`)
);

ALTER TABLE `LOCALITY` ADD FOREIGN KEY (`province`) REFERENCES `PROVINCE` (`id_province`);

ALTER TABLE `CLIENT` ADD FOREIGN KEY (`locality`) REFERENCES `LOCALITY` (`id_locality`);

ALTER TABLE `ORDER` ADD FOREIGN KEY (`product`) REFERENCES `PRODUCT` (`id_product`);

ALTER TABLE `ORDER` ADD FOREIGN KEY (`client`) REFERENCES `CLIENT` (`id_client`);

ALTER TABLE `ORDER` ADD FOREIGN KEY (`store`) REFERENCES `STORE` (`id_store`);

ALTER TABLE `ORDER` ADD FOREIGN KEY (`cook`) REFERENCES `COOK` (`id_employee`);

ALTER TABLE `PIZZA` ADD FOREIGN KEY (`id_product`) REFERENCES `PRODUCT` (`id_product`);

ALTER TABLE `PIZZA` ADD FOREIGN KEY (`category`) REFERENCES `CATEGORY` (`id_category`);

ALTER TABLE `HAMBURGER` ADD FOREIGN KEY (`id_product`) REFERENCES `PRODUCT` (`id_product`);

ALTER TABLE `DRINK` ADD FOREIGN KEY (`id_product`) REFERENCES `PRODUCT` (`id_product`);

ALTER TABLE `STORE` ADD FOREIGN KEY (`locality`) REFERENCES `LOCALITY` (`id_locality`);

ALTER TABLE `EMPLOYEE` ADD FOREIGN KEY (`store`) REFERENCES `STORE` (`id_store`);

ALTER TABLE `COOK` ADD FOREIGN KEY (`id_employee`) REFERENCES `EMPLOYEE` (`id_employee`);

ALTER TABLE `DISTRIBUTOR` ADD FOREIGN KEY (`id_employee`) REFERENCES `EMPLOYEE` (`id_employee`);

ALTER TABLE `PICKUP` ADD FOREIGN KEY (`id_order`) REFERENCES `ORDER` (`id_order`);

ALTER TABLE `PICKUP` ADD FOREIGN KEY (`product`) REFERENCES `ORDER` (`product`);

ALTER TABLE `DELIVERY` ADD FOREIGN KEY (`id_order`) REFERENCES `ORDER` (`id_order`);

ALTER TABLE `DELIVERY` ADD FOREIGN KEY (`product`) REFERENCES `ORDER` (`product`);

ALTER TABLE `DELIVERY` ADD FOREIGN KEY (`distributor`) REFERENCES `DISTRIBUTOR` (`id_employee`);
