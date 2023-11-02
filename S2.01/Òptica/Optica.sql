CREATE TABLE `AGENT` (
  `NIF` int PRIMARY KEY,
  `name` varchar(255),
  `street` varchar(255),
  `number` int,
  `door` char,
  `city` varchar(255),
  `postal_code` int,
  `country` varchar(255),
  `telf` int
);

CREATE TABLE `PROVIDER` (
  `NIF` int PRIMARY KEY,
  `fax` int
);


CREATE TABLE `CLIENT` (
  `NIF` int PRIMARY KEY,
  `email` varchar(255),
  `registration_date` date,
  `referenced_by` int
);

CREATE TABLE `EMPLOYEE` (
  `NIF` int PRIMARY KEY
);

CREATE TABLE `GLASSES` (
  `glasses_id` int PRIMARY KEY,
  `brand` varchar(255),
  `model` varchar(255),
  `grad_left` float,
  `grad_right` float,
  `frame` varchar(255),
  `frame_color` varchar(255),
  `glass_color` varchar(255),
  `price` float
);

CREATE TABLE `BRAND_PROV` (
  `brand` varchar(255) PRIMARY KEY,
  `provider` int
);

CREATE TABLE `TRANSACTION` (
  `transaction_id` int,
  `product_id` int,
  `seller` int,
  `buyer` int,
  `time` timestamp,
  PRIMARY KEY (`transaction_id`, `product_id`)
);

ALTER TABLE `PROVIDER` ADD FOREIGN KEY (`NIF`) REFERENCES `AGENT` (`NIF`);

ALTER TABLE `CLIENT` ADD FOREIGN KEY (`NIF`) REFERENCES `AGENT` (`NIF`);

ALTER TABLE `CLIENT` ADD FOREIGN KEY (`referenced_by`) REFERENCES `CLIENT` (`NIF`);

ALTER TABLE `EMPLOYEE` ADD FOREIGN KEY (`NIF`) REFERENCES `AGENT` (`NIF`);

ALTER TABLE `GLASSES` ADD FOREIGN KEY (`brand`) REFERENCES `BRAND_PROV` (`brand`);

ALTER TABLE `BRAND_PROV` ADD FOREIGN KEY (`provider`) REFERENCES `PROVIDER` (`NIF`);

ALTER TABLE `TRANSACTION` ADD FOREIGN KEY (`product_id`) REFERENCES `GLASSES` (`glasses_id`);

ALTER TABLE `TRANSACTION` ADD FOREIGN KEY (`seller`) REFERENCES `EMPLOYEE` (`NIF`);

ALTER TABLE `TRANSACTION` ADD FOREIGN KEY (`buyer`) REFERENCES `CLIENT` (`NIF`);
