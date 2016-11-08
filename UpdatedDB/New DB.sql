CREATE SCHEMA `custommandb` ;

CREATE TABLE `custommandb`.`usertype` (
  `usertype_id` INT NOT NULL AUTO_INCREMENT,
  `usertype_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`usertype_id`));

  CREATE TABLE `custommandb`.`producttype` (
  `producttype_id` INT NOT NULL AUTO_INCREMENT,
  `producttype_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`producttype_id`));

  
  CREATE TABLE `custommandb`.`warehousetype` (
  `warehousetype_id` INT NOT NULL AUTO_INCREMENT,
  `warehousetype_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`warehousetype_id`));

  CREATE TABLE `custommandb`.`productlogtype` (
  `productlogtype_id` INT NOT NULL AUTO_INCREMENT,
  `productlogtype_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`productlogtype_id`));

  CREATE TABLE `custommandb`.`hscode` (
  `hscode_id` INT NOT NULL AUTO_INCREMENT,
  `hscode_percentage` DECIMAL NOT NULL,
  PRIMARY KEY (`hscode_id`));

  CREATE TABLE `custommandb`.`user` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_email` VARCHAR(255) NULL,
  `user_fname` VARCHAR(255) NULL,
  `user_sname` VARCHAR(255) NULL,
  `user_password` LONGTEXT NULL,
  `usertype_id` INT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_email_UNIQUE` (`user_email` ASC),
  INDEX `usertype_id_idx` (`usertype_id` ASC),
  CONSTRAINT `usertype_id`
    FOREIGN KEY (`usertype_id`)
    REFERENCES `custommandb`.`usertype` (`usertype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	CREATE TABLE `custommandb`.`product` (
  `product_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(255) NULL,
  `product_price` DECIMAL(10,0) NULL,
  `product_quantity` INT NULL,
  `product_size` INT NULL,
  `product_location` VARCHAR(255) NULL,
  `product_arrivalDate` DATETIME NULL,
  `product_width` INT NULL,
  `product_height` INT NULL,
  `product_length` INT NULL,
  `product_producttype` INT NULL,
  `product_hscode` INT NULL,
  `product_image` LONGTEXT NULL,
  `product_exitdate` DATETIME NULL,
  `product_Expired` VARCHAR(255) NULL,
  `product_receipt` VARCHAR(255) NULL,
  `product_description` VARCHAR(255) NULL,
  `product_expirationDate` DATETIME NULL,
  `product_Insured` INT NULL,
  PRIMARY KEY (`product_id`),
  INDEX `product_producttype_idx` (`product_producttype` ASC),
  INDEX `product_hscode_idx` (`product_hscode` ASC),
  CONSTRAINT `product_hscode`
    FOREIGN KEY (`product_hscode`)
    REFERENCES `custommandb`.`hscode` (`hscode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `product_producttype`
    FOREIGN KEY (`product_producttype`)
    REFERENCES `custommandb`.`producttype` (`producttype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
CREATE TABLE `custommandb`.`warehouse` (
  `warehouse_id` INT NOT NULL AUTO_INCREMENT,
  `warehouse_name` VARCHAR(255) NULL,
  `warehouse_location` VARCHAR(255) NULL,
  `warehouse_size` INT NULL,
  `warehouse_user` INT NULL,
  `warehouse_warehousetype` INT NULL,
  `warehouse_image` VARCHAR(255) NULL,
  `warehouse_description` LONGTEXT NULL,
  `warehouse_established` DateTime NULL,
  PRIMARY KEY (`warehouse_id`),
  INDEX `warehouse_user_idx` (`warehouse_user` ASC),
  INDEX `warehouse_warehousetype_idx` (`warehouse_warehousetype` ASC),
  CONSTRAINT `warehouse_user`
    FOREIGN KEY (`warehouse_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `warehouse_warehousetype`
    FOREIGN KEY (`warehouse_warehousetype`)
    REFERENCES `custommandb`.`warehousetype` (`warehousetype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	CREATE TABLE `custommandb`.`countryrelation` (
  `countryrelation_id` INT NOT NULL AUTO_INCREMENT,
  `countryrelation_name` VARCHAR(255) NULL,
  `countryrelation_hscode` INT NULL,
  PRIMARY KEY (`countryrelation_id`),
  INDEX `countryrelation_hscode_idx` (`countryrelation_hscode` ASC),
  CONSTRAINT `countryrelation_hscode`
    FOREIGN KEY (`countryrelation_hscode`)
    REFERENCES `custommandb`.`hscode` (`hscode_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	CREATE TABLE `custommandb`.`invoice` (
  `invoice_id` VARCHAR(255) NOT NULL,
  `invoice_vat` DECIMAL(10,2) NULL,
  `invoice_penalty` DECIMAL(10,2) NULL,
  `invoice_paid` DECIMAL(10,2) NULL,
  PRIMARY KEY (`invoice_id`));

  CREATE TABLE `custommandb`.`billofentry` (
  `billofentry_id` INT NOT NULL AUTO_INCREMENT,
  `billofentry_code` VARCHAR(255) NULL,
  `billofentry_user` INT NULL,
  `billofentry_product` INT NULL,
  `billofentry_origin` VARCHAR(255) NULL,
  `billofentry_invoice` VARCHAR(255) NULL,
  PRIMARY KEY (`billofentry_id`),
  INDEX `billofentry_invoice_idx` (`billofentry_invoice` ASC),
  INDEX `billofentry_product_idx` (`billofentry_product` ASC),
  INDEX `billofentry_user_idx` (`billofentry_user` ASC),
  CONSTRAINT `billofentry_user`
    FOREIGN KEY (`billofentry_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `billofentry_product`
    FOREIGN KEY (`billofentry_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `billofentry_invoice`
    FOREIGN KEY (`billofentry_invoice`)
    REFERENCES `custommandb`.`invoice` (`invoice_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	CREATE TABLE `custommandb`.`productlog` (
  `productlog_id` INT NOT NULL AUTO_INCREMENT,
  `productlog_product` INT NULL,
  `productlog_warehouse` VARCHAR(255) NULL,
  `productlog_user` INT NULL,
  `productlog_description` VARCHAR(255) NULL,
  `productlog_dateLogged` DATETIME NULL,
  `productlog_image` VARCHAR(255) NULL,
  `productlog_type` INT NULL,
  `productlog_incidentisle` INT NULL,
  PRIMARY KEY (`productlog_id`),
  INDEX `productlog_product_idx` (`productlog_product` ASC),
  INDEX `productlog_type_idx` (`productlog_type` ASC),
  INDEX `productlog_user_idx` (`productlog_user` ASC),
  CONSTRAINT `productlog_type`
    FOREIGN KEY (`productlog_type`)
    REFERENCES `custommandb`.`productlogtype` (`productlogtype_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productlog_user`
    FOREIGN KEY (`productlog_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `productlog_product`
    FOREIGN KEY (`productlog_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	CREATE TABLE `custommandb`.`transferrequest` (
  `transferrequest_id` INT NOT NULL AUTO_INCREMENT,
  `transferrequest_from` VARCHAR(255) NULL,
  `transferrequest_to` VARCHAR(255) NULL,
  `transferrequest_verdict` VARCHAR(255) NULL,
  `transferrequest_user` INT NULL,
  `transferrequest_product` INT NULL,
  `transferrequest_description` VARCHAR(255) NULL,
  `transferrequest_reason` VARCHAR(255) NULL,
  `transferrequest_requestDate` DATETIME NULL,
  `transferrequest_approvalDate` DATETIME NULL,
  PRIMARY KEY (`transferrequest_id`),
  INDEX `transferrequest_user_idx` (`transferrequest_user` ASC),
  INDEX `transferrequest_product_idx` (`transferrequest_product` ASC),
  CONSTRAINT `transferrequest_user`
    FOREIGN KEY (`transferrequest_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `transferrequest_product`
    FOREIGN KEY (`transferrequest_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	CREATE TABLE `custommandb`.`releaserequest` (
  `releaserequest_id` INT NOT NULL AUTO_INCREMENT,
  `releaserequest_verdict` VARCHAR(255) NULL,
  `releaserequest_user` INT NULL,
  `releaserequest_product` INT NULL,
  `releaserequest_reason` VARCHAR(255) NULL,
  `releaserequest_requestDate` DATETIME NULL,
  `releaserequest_approvalDate` DATETIME NULL,
  PRIMARY KEY (`releaserequest_id`),
  INDEX `releaserequest_user_idx` (`releaserequest_user` ASC),
  INDEX `releaserequest_product_idx` (`releaserequest_product` ASC),
  CONSTRAINT `releaserequest_user`
    FOREIGN KEY (`releaserequest_user`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `releaserequest_product`
    FOREIGN KEY (`releaserequest_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	CREATE TABLE `custommandb`.`warehousestock` (
  `warehousestock_id` INT NOT NULL AUTO_INCREMENT,
  `warehousestock_lastchecked` DATETIME NULL,
  `warehousestock_warehouse` INT NULL,
  `warehousestock_product` INT NULL,
  PRIMARY KEY (`warehousestock_id`),
  INDEX `warehousestock_product_idx` (`warehousestock_product` ASC),
  INDEX `warehousestock_warehouse_idx` (`warehousestock_warehouse` ASC),
  CONSTRAINT `warehousestock_product`
    FOREIGN KEY (`warehousestock_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `warehousestock_warehouse`
    FOREIGN KEY (`warehousestock_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	CREATE TABLE `custommandb`.`transferlist` (
  `transferlist_id` INT NOT NULL AUTO_INCREMENT,
  `transferlist_to` VARCHAR(255) NULL,
  `transferlist_from` VARCHAR(255) NULL,
  `transferlist_product` INT NULL,
  PRIMARY KEY (`transferlist_id`),
  INDEX `transferlist_product_idx` (`transferlist_product` ASC),
  CONSTRAINT `transferlist_product`
    FOREIGN KEY (`transferlist_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	CREATE TABLE `custommandb`.`location` (
  `location_id` INT NOT NULL AUTO_INCREMENT,
  `location_section` VARCHAR(50) NULL,
  `location_isle` INT NULL,
  `location_row` INT NULL,
  `location_column` INT NULL,
  `location_reserve` INT NULL,
  `location_size` INT NULL,
  `location_product` INT NULL,
  `location_warehouse` INT NULL,
  `location_height` INT NULL,
  `location_width` INT NULL,
  `location_length` INT NULL,
  PRIMARY KEY (`location_id`),
  INDEX `location_product_idx` (`location_product` ASC),
  INDEX `location_warehouse_idx` (`location_warehouse` ASC),
  CONSTRAINT `location_product`
    FOREIGN KEY (`location_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `location_warehouse`
    FOREIGN KEY (`location_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	CREATE TABLE `custommandb`.`message` (
  `message_id` INT NOT NULL AUTO_INCREMENT,
  `message_convoid` INT NULL,
  `message_subject` VARCHAR(255) NULL,
  `message_to` INT NULL,
  `message_from` INT NULL,
  `message_message` LONGTEXT NULL,
  `message_stamp` DATETIME NULL,
  PRIMARY KEY (`message_id`),
  INDEX `message_to_idx` (`message_to` ASC),
  INDEX `message_from_idx` (`message_from` ASC),
  CONSTRAINT `message_to`
    FOREIGN KEY (`message_to`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `message_from`
    FOREIGN KEY (`message_from`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

	CREATE TABLE `custommandb`.`ownershiprequest` (
  `ownershiprequest_id` INT NOT NULL AUTO_INCREMENT,
  `ownershiprequest_owner` INT NULL,
  `ownershiprequest_newowner` INT NULL,
  `ownershiprequest_acceptance` VARCHAR(255) NULL,
  `ownershiprequest_product` INT NULL,
  PRIMARY KEY (`ownershiprequest_id`),
  INDEX `ownershiprequest_owner_idx` (`ownershiprequest_owner` ASC),
  INDEX `ownershiprequest_newowner_idx` (`ownershiprequest_newowner` ASC),
  INDEX `ownershiprequest_product_idx` (`ownershiprequest_product` ASC),
  CONSTRAINT `ownershiprequest_owner`
    FOREIGN KEY (`ownershiprequest_owner`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ownershiprequest_newowner`
    FOREIGN KEY (`ownershiprequest_newowner`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ownershiprequest_product`
    FOREIGN KEY (`ownershiprequest_product`)
    REFERENCES `custommandb`.`product` (`product_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
	  CREATE TABLE `custommandb`.`warehouseemployee` (
  `warehouseemployee_id` INT NOT NULL AUTO_INCREMENT,
  `warehouseemployee_employee` INT NULL,
  `warehouseemployee_warehouse` INT NULL,
  PRIMARY KEY (`warehouseemployee_id`),
  INDEX `warehouseemployee_employee_idx` (`warehouseemployee_employee` ASC),
  INDEX `warehouseemployee_warehouse_idx` (`warehouseemployee_warehouse` ASC),
  CONSTRAINT `warehouseemployee_employee`
    FOREIGN KEY (`warehouseemployee_employee`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `warehouseemployee_warehouse`
    FOREIGN KEY (`warehouseemployee_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


	CREATE TABLE `custommandb`.`warehousetask` (
  `warehousetask_id` INT NOT NULL AUTO_INCREMENT,
  `warehousetask_warehouse` INT NULL,
  `warehousetask_employee` INT NULL,
  `warehousetask_type` VARCHAR(50) NULL,
  `warehousetask_description` LONGTEXT NULL,
  `warehousetask_section` VARCHAR(45) NULL,
  `warehousetask_timestamp` DATETIME NULL,
  `warehousetask_endtime` DATETIME NULL,
  PRIMARY KEY (`warehousetask_id`),
  INDEX `warehousetask_employee_idx` (`warehousetask_employee` ASC),
    INDEX `warehousetask_warehouse_idx` (`warehousetask_warehouse` ASC), 
  CONSTRAINT `warehousetask_employee`
    FOREIGN KEY (`warehousetask_employee`)
    REFERENCES `custommandb`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `warehousetask_warehouse`
    FOREIGN KEY (`warehousetask_warehouse`)
    REFERENCES `custommandb`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('1', 'Client');
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('2', 'Custom');
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('3', 'Warehouse');
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('4', 'Warehouse Employee');
INSERT INTO `custommandb`.`usertype` (`usertype_id`, `usertype_name`) VALUES ('5', 'admin');

INSERT INTO `custommandb`.`producttype` (`producttype_id`, `producttype_name`) VALUES ('1', 'Duty Free');
INSERT INTO `custommandb`.`producttype` (`producttype_id`, `producttype_name`) VALUES ('2', 'Duty');

INSERT INTO `custommandb`.`hscode` (`hscode_id`, `hscode_percentage`) VALUES ('825', '14');
INSERT INTO `custommandb`.`hscode` (`hscode_id`, `hscode_percentage`) VALUES ('1', '6');
INSERT INTO `custommandb`.`hscode` (`hscode_id`, `hscode_percentage`) VALUES ('2', '10');

INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('China','1');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('United States of America','2');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('Japan','825');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('United Kingdom','1');
INSERT INTO `custommandb`.`countryrelation` (`countryrelation_name`,`countryrelation_hscode`) VALUES ('Australia','2');

INSERT INTO `custommandb`.`warehousetype` (`warehousetype_id`, `warehousetype_name`) VALUES ('1', 'Ordinary Storage (OS)');
INSERT INTO `custommandb`.`warehousetype` (`warehousetype_id`, `warehousetype_name`) VALUES ('2', 'Special Ordinary Storage (SOS)');

INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('I9');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('TR7');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('RR6');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('T2');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('D3');
INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('CO2');

INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client@gmail', 'Joshua', 'Kinnear', 'client', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client1@gmail', 'Keith Kwang', 'Pooe', 'client1', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('client2@gmail', 'Yusuf', 'Seedat', 'client2', '1');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('customs@gmail', 'Chuck', 'Malende', 'customs', '2');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('customs1@gmail', 'Ali', 'Baba', 'customs1', '2');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse@gmail', 'Keegan', 'Daniel', 'warehouse', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse1@gmail', 'Keith', 'Mphahlele', 'warehouse1', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse2@gmail', 'Waseem', 'Cassim', 'warehouse2', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('warehouse3@gmail', 'Shaheed', 'McPherson', 'warehouse3', '3');
INSERT INTO `custommandb`.`user` (`user_email`, `user_fname`, `user_sname`, `user_password`, `usertype_id`) VALUES ('admin@gmail', 'Tshenolo', 'Pooe', 'admin', '5');

INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`,`warehouse_description`,`warehouse_established`) VALUES ('DS Space', '11 Eva Road, Benoni, 1512', '500', '6', '1','Safe and secure Industrial Park with 24/7 security and visitor controlled access. Central to Midrand, Or Tambo and Pretoria. 3464 sqm warehouse, double volume 380 sqm office with balcony. Stand alone. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy.','2014-01-02 15:05:41');
INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`,`warehouse_description`,`warehouse_established`) VALUES ('DHL Express Warehouse', '48 Hoylake Road, Randburg, 2034', '650', '7', '2','Prominent position with excellent exposure onto the M13.This top floor unit offers clear span factory floor in 2 sections with good height and abundant natural light. The unit may divided into 2 x 720m2 units @ R38/m2. Ample office space and staff ablutions. Excellent access to M13/M19/M7. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy.','2010-01-02 15:05:41');
INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`,`warehouse_description`,`warehouse_established`) VALUES ('Old Storage', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '800', '8', '1','This well situated mini factory located just off chris hani road and within close proximity to umgeni road and the N2. Offering a total of 320m2, Workshop space has a double volume height ideal for storage, neat office component with kitchenette and 2X staff ablution facilities. Industrial park is fenced and gated with 24 hour security for peace of mind. Contact me for further information. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy.','2000-01-02 15:05:41');
INSERT INTO `custommandb`.`warehouse` (`warehouse_name`, `warehouse_location`, `warehouse_size`, `warehouse_user`, `warehouse_warehousetype`,`warehouse_description`,`warehouse_established`) VALUES ('Mount Warehousing', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '1400', '9', '2','Warehouse available in Benoni South. Offering 600sqm with a mezzanine floor. 2 Large roller doors 2 Offices available that has its own entrance. Neat unit. We are a national brokerage that specialises in the industrial property sector. We focus mainly on sales, leasing and development in the industrial and logistics sector. Great customer service is one of our main priorities, which is why we offer our clients tailored industrial solutions to suit all their business needs. We currently perform a wide range of services for various major industrial corporates and investors. Our dedicated team has a wealth of experience and expertise to support, develop, and implement your industrial property strategy.','1990-01-02 15:05:41');

INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Tubes and Pipes', '88000', '5', '13', '11 Eva Road, Benoni, 1512', '2014-12-01 17:50', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Conveyor Belts', '19999', '10', '3', 'in Transit', '2016-02-02 15:55:41', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Apple Mackbooks', '1500000', '150', '30', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-12-01 17:50', '2', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good A', '19999', '10', '3', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2016-02-02 15:55:41', '2', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good B', '88000', '5', '13', '11 Eva Road, Benoni, 1512', '2015-11-01 12:50', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good C', '19999', '10', '3', 'in Transit', '2016-01-02 15:05:41', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good D', '88000', '5', '13', '11 Eva Road, Benoni, 1512', '2016-02-01 17:50', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good E', '19999', '10', '3', 'in Transit', '2015-12-02 15:55:41', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good F', '88000', '5', '13', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2015-05-01 17:50', '2', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good G', '19999', '10', '3', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2016-01-03 15:55:41', '2', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good H', '88000', '5', '13', '11 Eva Road, Benoni, 1512', '2015-12-01 17:50', '1', '825');
INSERT INTO `custommandb`.`product` (`product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_producttype`, `product_hscode`) VALUES ('Good I', '19999', '10', '3', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2016-01-02 15:55:41', '2', '825');
UPDATE `custommandb`.`product` SET `product_width`='23', `product_height`='65', `product_length`='78' WHERE `product_id`='1';
UPDATE `custommandb`.`product` SET `product_width`='315', `product_height`='123', `product_length`='138' WHERE `product_id`='2';
UPDATE `custommandb`.`product` SET `product_width`='55', `product_height`='75', `product_length`='155' WHERE `product_id`='3';
UPDATE `custommandb`.`product` SET `product_width`='48', `product_height`='88', `product_length`='185' WHERE `product_id`='4';
UPDATE `custommandb`.`product` SET `product_width`='36', `product_height`='92', `product_length`='135' WHERE `product_id`='5';
UPDATE `custommandb`.`product` SET `product_width`='59', `product_height`='100', `product_length`='160' WHERE `product_id`='6';
UPDATE `custommandb`.`product` SET `product_width`='47', `product_height`='77', `product_length`='85' WHERE `product_id`='7';
UPDATE `custommandb`.`product` SET `product_width`='112', `product_height`='25', `product_length`='64' WHERE `product_id`='8';
UPDATE `custommandb`.`product` SET `product_width`='145', `product_height`='36', `product_length`='35' WHERE `product_id`='9';
UPDATE `custommandb`.`product` SET `product_width`='88', `product_height`='155', `product_length`='45' WHERE `product_id`='10';
UPDATE `custommandb`.`product` SET `product_width`='99', `product_height`='145', `product_length`='75' WHERE `product_id`='12';
UPDATE `custommandb`.`product` SET `product_width`='77', `product_height`='180', `product_length`='45' WHERE `product_id`='11';
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('14', 'Good UI', '900', '67', '4', '11 Eva Road, Benoni, 1512', '2014-12-01 17:50:00', '65', '55', '45', '1', '825', '2016-12-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('15', 'Good 1', '7000', '45', '67', 'In Transit', '2014-12-01 17:50:00', '4', '4', '56', '2', '825', '2018-02-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('16', 'Good 2', '6700', '3', '8', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2014-11-01 12:50:00', '4', '4', '5', '2', '825', '2015-02-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('17', 'Good 3', '3440', '5', '3', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-12-01 17:50:00', '64', '6', '7', '1', '825', '2016-12-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('18', 'Good 4', '6777', '79', '5', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2013-12-01 17:50:00', '35', '66', '67', '2', '825', '2017-02-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('19', 'Good 5', '5444', '6', '8', '11 Eva Road, Benoni, 1512', '2013-12-01 17:50:00', '56', '44', '65', '1', '825', '2018-02-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('20', 'Good 6', '3444', '54', '3', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-12-01 17:50:00', '4', '3', '57', '2', '825', '2017-11-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('21', 'Good 7', '1000', '78', '2', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2016-02-01 17:50:00', '65', '44', '45', '1', '825', '2017-02-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('22', 'Good 8', '9000', '9', '6', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2015-11-01 12:50:00', '43', '56', '56', '2', '825', '2018-02-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('23', 'Good 9', '800', '0', '8', 'In Transit', '2015-11-01 12:50:00', '44', '6', '78', '1', '825', '2017-11-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('24', 'Good 10', '500', '6', '4', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2016-02-01 17:50:00', '24', '66', '56', '2', '825', '2015-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('25', 'Good AA', '455', '4', '2', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2015-12-01 17:50:00', '65', '33', '43', '1', '825', '2016-03-05 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('26', 'Good AB', '400', '3', '6', 'In Transit', '2014-12-01 17:50:00', '87', '8', '34', '2', '825', '2017-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('27', 'Good AC', '344', '78', '7', 'In Transit', '2015-12-01 17:50:00', '23', '6', '23', '1', '825', '2017-11-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('28', 'Good AD', '200', '54', '4', '11 Eva Road, Benoni, 1512', '2013-12-01 17:50:00', '56', '44', '23', '2', '825', '2017-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('29', 'Good AE', '12000', '6', '8', 'In Transit', '2016-09-01 17:50:00', '56', '33', '233', '1', '825', '2018-02-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('30', 'Good AF', '300', '7', '4', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2013-12-01 17:50:00', '7', '67', '56', '2', '825', '2016-05-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('31', 'Good AG', '30000', '33', '8', 'In Transit', '2015-11-01 12:50:00', '86', '6', '78', '1', '825', '2016-03-05 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('32', 'Good AH', '4900', '2', '9', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2016-07-01 12:50:00', '7', '5', '89', '2', '825', '2016-12-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('33', 'Good AI', '4500', '7', '3', 'In Transit', '2016-09-01 17:50:00', '9', '44', '78', '1', '825', '2017-11-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('34', 'Good AJ', '500', '8', '2', '11 Eva Road, Benoni, 1512', '2014-12-01 17:50:00', '9', '35', '67', '2', '825', '2017-11-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('35', 'Good BA', '700', '8', '6', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2015-12-01 17:50:00', '4', '5', '55', '1', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('36', 'Good BB', '900', '6', '78', 'In Transit', '2015-12-01 17:50:00', '6', '6', '45', '2', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('37', 'Good BC', '1000', '45', '9', '11 Eva Road, Benoni, 1512', '2014-12-01 17:50:00', '43', '66', '88', '1', '825', '2018-02-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('38', 'Good BD', '2000', '3', '4', 'In Transit', '2014-12-01 17:50:00', '3', '88', '90', '2', '825', '2017-11-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('39', 'Good BE', '3000', '2', '6', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2015-11-01 12:50:00', '6', '7', '34', '1', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('40', 'Good BF', '4000', '1', '8', 'In Transit', '2016-02-01 17:50:00', '5', '23', '23', '2', '825', '2017-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('41', 'Good BG', '5000', '67', '4', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2013-01-01 12:50:00', '65', '22', '56', '1', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('42', 'Good BH', '3000', '66', '6', 'In Transit', '2015-11-01 12:50:00', '4', '67', '45', '2', '825', '2016-05-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('43', 'Good BI', '400', '54', '7', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2015-07-01 12:50:00', '32', '54', '33', '1', '825', '2016-12-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('44', 'Good BJ', '1030', '4', '8', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2016-09-01 17:50:00', '34', '32', '45', '2', '825', '2016-05-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('45', 'Good CA', '200', '3', '5', '11 Eva Road, Benoni, 1512', '2014-07-01 12:50:00', '67', '76', '33', '1', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('46', 'Good CB', '400', '35', '3', 'In Transit', '2015-12-01 17:50:00', '87', '75', '23', '2', '825', '2017-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('47', 'Good CC', '2300', '7', '3', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2016-09-01 17:50:00', '43', '5', '45', '1', '825', '2015-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('48', 'Good CE', '4300', '7', '33', 'In Transit', '2016-09-01 17:50:00', '24', '4', '67', '2', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('49', 'Good CD', '430', '5', '3', 'In Transit', '2014-12-01 17:50:00', '43', '44', '78', '1', '825', '2016-03-05 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('50', 'Good CF', '300', '4', '6', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2015-12-01 17:50:00', '34', '33', '54', '2', '825', '2018-02-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('51', 'Good CG', '56000', '78', '11', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2015-11-01 12:50:00', '54', '12', '23', '1', '825', '2016-03-05 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('52', 'Good CH', '3000', '5', '34', 'In Transit', '2015-11-01 12:50:00', '87', '11', '24', '2', '825', '2016-05-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('53', 'Good CI', '2000', '5', '5', '11 Eva Road, Benoni, 1512', '2015-12-01 17:50:00', '9', '10', '56', '1', '825', '2016-12-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('54', 'Good CJ', '100', '7', '5', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2016-09-01 17:50:00', '87', '9', '21', '2', '825', '2018-02-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('55', 'Good DA', '90', '9', '7', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2013-07-01 12:50:00', '54', '54', '233', '1', '825', '2015-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('56', 'Good DB', '400', '9', '8', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2016-02-01 17:50:00', '32', '3', '56', '2', '825', '2016-12-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('57', 'Good DC', '39000', '9', '95', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-12-01 17:50:00', '21', '46', '56', '1', '825', '2015-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('58', 'Good DD', '4000', '54', '3', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2015-12-01 17:50:00', '11', '7', '54', '2', '825', '2017-11-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('59', 'Good DE', '230000', '2', '3', 'In Transit', '2015-12-01 17:50:00', '10', '7', '32', '1', '825', '2016-03-05 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('60', 'Good DF', '3400', '34', '4', 'In Transit', '2016-09-01 17:50:00', '10', '8', '78', '2', '825', '2018-02-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('61', 'Good DG', '4000', '5', '6', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2015-02-01 12:50:00', '10', '32', '65', '1', '825', '2016-05-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('62', 'Good GH', '4333', '55', '5', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2013-12-01 17:50:00', '11', '2', '5', '2', '825', '2016-03-05 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('63', 'Good DI', '4550', '5', '3', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2014-12-01 17:50:00', '23', '67', '45', '1', '825', '2015-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('64', 'Good DJ', '5600', '5', '67', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-07-01 12:50:00', '65', '5', '67', '2', '825', '2015-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('65', 'Good EA', '5550', '5', '8', 'In Transit', '2016-02-01 17:50:00', '32', '33', '89', '1', '825', '2015-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('66', 'Good EB', '3000', '67', '9', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2014-12-01 17:50:00', '21', '57', '53', '2', '825', '2017-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('67', 'Good EC', '4500', '78', '5', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-07-01 12:50:00', '15', '8', '4', '1', '825', '2017-11-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('68', 'Good ED', '4667', '8', '3', '11 Eva Road, Benoni, 1512', '2015-11-01 12:50:00', '76', '65', '6', '2', '825', '2018-02-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('69', 'Good EE', '5700', '43', '2', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2014-12-01 12:50:00', '43', '43', '90', '1', '825', '2016-05-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('70', 'Good EF', '78000', '3', '45', 'In Transit', '2015-12-01 17:50:00', '22', '2', '3', '2', '825', '2017-11-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('71', 'Good EG', '9880', '2', '7', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2015-12-01 17:50:00', '34', '3', '67', '1', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('72', 'Good EH', '5660', '2', '8', 'In Transit', '2016-02-01 17:50:00', '6', '56', '9', '2', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('73', 'Good EI', '10000', '2', '8', 'In Transit', '2016-09-01 17:50:00', '9', '7', '56', '1', '825', '2016-03-05 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('74', 'Good EJ', '30000', '21', '5', '11 Eva Road, Benoni, 1512', '2014-07-01 12:50:00', '86', '8', '43', '2', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('75', 'Good FA', '34000', '1', '3', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2015-12-01 17:50:00', '43', '75', '3', '1', '825', '2017-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('76', 'Good FB', '450000', '1', '3', 'In Transit', '2016-02-01 17:50:00', '22', '3', '67', '2', '825', '2015-02-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('77', 'Good FC', '5600', '111', '6', 'In Transit', '2015-11-01 12:50:00', '56', '35', '89', '1', '825', '2017-11-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('78', 'Good FD', '5000', '1', '54', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2016-02-01 17:50:00', '4', '45', '5', '2', '825', '2015-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('79', 'Good FE', '4500', '5', '3', '11 Eva Road, Benoni, 1512', '2015-12-01 17:50:00', '6', '5', '3', '1', '825', '2017-02-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('80', 'Good FF', '5600', '6', '3', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2013-12-01 17:50:00', '89', '45', '11', '2', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('81', 'Good FG', '3000', '7', '1', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-07-01 12:50:00', '87', '32', '34', '1', '825', '2016-12-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('82', 'Good FH', '5000', '8', '1', '11 Eva Road, Benoni, 1512', '2014-07-01 12:50:00', '65', '21', '7', '2', '825', '2017-11-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('83', 'Good FI', '6000', '44', '11', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-12-01 17:50:00', '3', '12', '8', '1', '825', '2015-02-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('84', 'Good GA', '87000', '5', '10', 'In Transit', '2015-12-01 17:50:00', '2', '45', '98', '2', '825', '2017-02-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('85', 'Good GB', '6000', '6', '11', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2015-11-01 12:50:00', '23', '9', '65', '1', '825', '2018-02-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('86', 'Good GC', '4500', '8', '4', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2015-11-01 12:50:00', '67', '76', '45', '2', '825', '2016-05-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('87', 'Good GD', '34000', '33', '7', 'In Transit', '2014-12-01 17:50:00', '9', '56', '33', '1', '825', '2015-02-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('88', 'Good GE', '500', '67', '5', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2016-02-01 17:50:00', '45', '67', '67', '2', '825', '2018-02-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('89', 'Good GF', '700', '77', '32', '11 Eva Road, Benoni, 1512', '2015-11-01 12:50:00', '43', '8', '77', '1', '825', '2016-12-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('90', 'Good GG', '9000', '8', '2', '11 Eva Road, Benoni, 1512', '2014-07-01 12:50:00', '21', '97', '78', '2', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('91', 'Good GH', '6000', '10', '5', 'In Transit', '2016-02-01 17:50:00', '43', '54', '99', '1', '825', '2018-02-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('92', 'Good GI', '3400', '10', '6', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2016-02-01 17:50:00', '6', '3', '44', '2', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('93', 'Good GJ', '500', '10', '66', 'In Transit', '2015-11-01 12:50:00', '55', '55', '32', '1', '825', '2017-11-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('94', 'Good HA', '60000', '10', '4', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2014-07-01 12:50:00', '5', '4', '6', '2', '825', '2016-05-01 17:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('95', 'Good HB', '8000', '5', '3', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '2016-09-01 17:50:00', '3', '35', '7', '1', '825', '2016-03-05 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('96', 'Good HC', '8900', '68', '35', '11 Eva Road, Benoni, 1512', '2015-12-01 17:50:00', '23', '7', '98', '2', '825', '2017-11-01 12:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('97', 'Good HD', '6700', '9', '6', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '2015-12-01 17:50:00', '56', '8', '6', '1', '825', '2015-02-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('98', 'Good HE', '4500', '9', '8', '11 Eva Road, Benoni, 1512', '2016-02-01 17:50:00', '8', '65', '22', '2', '825', '2018-02-01 17:50:00', '0');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('99', 'Good HF', '34000', '3', '5', 'In Transit', '2015-12-01 17:50:00', '64', '33', '3', '1', '825', '2017-02-01 12:50:00', '1');
INSERT INTO `custommandb`.`product` (`product_id`, `product_name`, `product_price`, `product_quantity`, `product_size`, `product_location`, `product_arrivalDate`, `product_width`, `product_height`, `product_length`, `product_producttype`, `product_hscode`, `product_exitdate`, `product_Expired`) VALUES ('100', 'Good HG', '56000', '1', '10', 'In Transit', '2015-12-01 17:50:00', '3', '56', '45', '1', '825', '2018-02-01 17:50:00', '0');

INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('10', '2016-10-23 19:41:59', '1', '2');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('11', '2016-07-08 13:02:00', '2', '6');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('12', '2016-10-23 19:41:59', '2', '8');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('14', '2016-06-08 11:32:00', '1', '14');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('15', '2016-07-08 13:02:00', '2', '15');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('16', '2016-10-23 19:41:59', '3', '16');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('17', '2016-06-08 11:32:00', '1', '17');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('18', '2016-10-23 19:41:59', '1', '18');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('19', '2016-07-08 13:02:00', '1', '19');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('20', '2016-06-08 11:32:00', '2', '20');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('21', '2016-06-08 11:32:00', '3', '21');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('22', '2016-07-08 13:02:00', '1', '22');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('23', '2016-06-08 11:32:00', '1', '23');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('24', '2016-10-23 19:41:59', '1', '24');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('25', '2016-06-08 11:32:00', '1', '25');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('26', '2016-10-23 19:41:59', '3', '26');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('27', '2016-06-08 11:32:00', '2', '27');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('28', '2016-07-08 13:02:00', '2', '28');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('29', '2016-10-23 19:41:59', '1', '29');
INSERT INTO `custommandb`.`warehousestock` (`warehousestock_id`, `warehousestock_lastchecked`, `warehousestock_warehouse`, `warehousestock_product`) VALUES ('30', '2016-07-08 13:02:00', '1', '30');

INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('2', '360.00', '40.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('3', '220.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('4', '120.00', '4.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('1', '260.00', '122.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('5', '420.00', '678.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('6', '70.00', '123.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('7', '470.00', '220.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('8', '670.00', '1260.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('9', '80.00', '320.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('10', '67.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('11', '89.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('12', '2600.00', '370.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('13', '80.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('14', '80.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('15', '220.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('16', '260.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('17', '89.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('18', '80.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('19', '360.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('20', '220.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('21', '260.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('22', '89.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('23', '2600.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('24', '220.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('25', '2600.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('26', '67.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('27', '260.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('28', '2600.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('29', '89.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('30', '220.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('31', '80.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('32', '2600.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('33', '260.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('34', '2600.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('35', '260.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('36', '89.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('37', '67.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('38', '2600.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('39', '80.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('40', '260.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('41', '220.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('42', '89.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('43', '2600.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('44', '2600.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('45', '260.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('46', '89.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('47', '220.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('48', '67.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('49', '67.00', '0.00', '0.00');
INSERT INTO `custommandb`.`invoice` (`invoice_id`, `invoice_vat`, `invoice_penalty`, `invoice_paid`) VALUES ('50', '80.00', '0.00', '0.00');


INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('1', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('1', '1', '2', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('1', '1', '3', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('2', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('3', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('4', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('5', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('6', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('7', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('8', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('9', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('10', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('1', '1', '1', '2');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('11', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('12', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('13', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('14', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('15', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('16', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('17', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('18', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('19', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('20', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('21', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('22', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('23', '1', '1', '1');
INSERT INTO `custommandb`.`location` (`location_isle`, `location_column`, `location_row`, `location_warehouse`) VALUES ('24', '1', '1', '1');


INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('C5256', '1', '1', 'China');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('D4569', '2', '2', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CC785', '3', '3', 'UK');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('AD456', '1', '4', 'Korea');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('EE778', '1', '5', 'Australia');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CD456', '1', '6', 'UK');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('C5256', '1', '7', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CC785', '3', '8', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('EE778', '1', '9', 'China');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('C5256', '1', '10', 'China');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('CC785', '2', '11', 'USA');
INSERT INTO `custommandb`.`billofentry` (`billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`) VALUES ('AD456', '1', '12', 'UK');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('14', 'CC785', '2', '14', 'Korea', '14');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('15', 'AD456', '2', '15', 'Australia', '15');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('16', 'CC785', '2', '16', 'China', '16');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('17', 'AD456', '2', '17', 'Australia', '17');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('18', 'CC785', '2', '18', 'United States of America', '18');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('19', 'C5256', '1', '19', 'Korea', '19');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('20', 'AD456', '1', '20', 'United Kingdom', '20');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('21', 'CC785', '2', '21', 'United States of America', '21');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('22', 'C5256', '2', '22', 'Australia', '22');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('23', 'AD456', '2', '23', 'China', '23');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('24', 'C5256', '1', '24', 'Korea', '24');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('25', 'EE778', '1', '25', 'United Kingdom', '25');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('26', 'C5256', '2', '26', 'Korea', '26');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('27', 'AD456', '1', '27', 'China', '27');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('28', 'CC785', '1', '28', 'United States of America', '28');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('29', 'EE778', '2', '29', 'Korea', '29');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('30', 'C5256', '2', '30', 'Australia', '30');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('31', 'C5256', '1', '31', 'China', '31');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('32', 'CC785', '1', '32', 'United Kingdom', '32');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('33', 'CC785', '1', '33', 'Australia', '33');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('34', 'AD456', '2', '34', 'Korea', '34');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('35', 'CC785', '1', '35', 'United States of America', '35');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('36', 'EE778', '2', '36', 'United Kingdom', '36');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('37', 'C5256', '1', '37', 'Korea', '37');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('38', 'AD456', '2', '38', 'United Kingdom', '38');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('39', 'CC785', '1', '39', 'Australia', '39');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('40', 'C5256', '2', '40', 'China', '40');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('41', 'AD456', '1', '41', 'Korea', '41');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('42', 'C5256', '1', '42', 'Australia', '42');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('43', 'CC785', '1', '43', 'Korea', '43');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('44', 'AD456', '2', '44', 'United States of America', '44');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('45', 'AD456', '2', '45', 'China', '45');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('46', 'C5256', '1', '46', 'Australia', '46');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('47', 'EE778', '1', '47', 'United States of America', '47');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('48', 'CC785', '2', '48', 'Korea', '48');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('49', 'AD456', '1', '49', 'Korea', '49');
INSERT INTO `custommandb`.`billofentry` (`billofentry_id`, `billofentry_code`, `billofentry_user`, `billofentry_product`, `billofentry_origin`, `billofentry_invoice`) VALUES ('50', 'EE778', '1', '50', 'China', '50');


INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('1', '2', 'Pending', '1');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '3', 'Pending', '2');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('3', '2', 'Pending', '3');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '1', 'Pending', '5');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '1', 'Pending', '11');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '3', 'Pending', '12');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('2', '1', 'Pending', '8');
INSERT INTO `custommandb`.`ownershiprequest` (`ownershiprequest_owner`, `ownershiprequest_newowner`, `ownershiprequest_acceptance`, `ownershiprequest_product`) VALUES ('1', '3', 'Pending', '10');


INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', '3', 'Delivered : Package was delivered to the warehouse', '2016-08-08 13:40:32', '5');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', '3', 'Transfer Request : A Transfer Request was issued by the owner of the package', '2016-08-08 18:01:25', '2');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', '3', 'Release Request: A release request has been issued by the owner of the package', '2016-08-08 18:05:22', '3');

INSERT INTO `custommandb`.`releaserequest` (`releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`) VALUES ('Pending', '1', '1');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('2', 'Pending', '2', '2', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('3', 'Pending', '2', '3', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('4', 'Pending', '1', '4', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('5', 'Pending', '1', '5', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('6', 'Pending', '1', '6', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('7', 'Pending', '1', '7', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('8', 'Pending', '2', '8', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('9', 'Pending', '1', '9', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('10', 'Pending', '1', '10', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('11', 'Pending', '2', '11', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('12', 'Pending', '1', '12', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('14', 'Pending', '2', '14', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`releaserequest` (`releaserequest_id`, `releaserequest_verdict`, `releaserequest_user`, `releaserequest_product`, `releaserequest_reason`, `releaserequest_requestDate`) VALUES ('15', 'Pending', '1', '15', 'Affordablity', '2016-02-02 15:55:41');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`, `transferrequest_requestDate`) VALUES ('11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', 'Pending', '1', '1', '2016-08-08 13:40:32');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('2', '48 Hoylake Road, Randburg, 2034', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', 'Pending', '1', '10');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('3', '11 Eva Road, Benoni, 1512', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 713', 'Approved', '1', '11');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('4', 'In Transit', '11 Eva Road, Benoni, 1512', 'Pending', '2', '12');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('6', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '48 Hoylake Road, Randburg, 2034', 'Pending', '1', '2');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('7', '11 Eva Road, Benoni, 1512', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 713', 'Approved', '2', '14');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('8', 'In Transit', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', 'Approved', '1', '15');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('9', '48 Hoylake Road, Randburg, 2034', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 713', 'Pending', '1', '16');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('10', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '48 Hoylake Road, Randburg, 2034', 'Pending', '1', '3');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('11', '11 Eva Road, Benoni, 1512', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 713', 'Pending', '2', '17');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('12', '48 Hoylake Road, Randburg, 2034', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 713', 'Pending', '1', '18');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('16', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '11 Eva Road, Benoni, 1512', 'Pending', '2', '22');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('17', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', 'Pending', '2', '9');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('18', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', 'Approved', '1', '4');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('19', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 713', 'Approved', '3', '23');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('20', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '11 Eva Road, Benoni, 1512', 'Pending', '2', '24');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('21', '48 Hoylake Road, Randburg, 2034', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 713', 'Approved', '1', '25');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('22', 'In Transit', '11 Eva Road, Benoni, 1512', 'Pending', '1', '26');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('23', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '48 Hoylake Road, Randburg, 2034', 'Pending', '2', '27');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('24', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '48 Hoylake Road, Randburg, 2034', 'Pending', '1', '5');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('25', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '48 Hoylake Road, Randburg, 2034', 'Approved', '2', '6');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('26', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '11 Eva Road, Benoni, 1512', 'Pending', '1', '28');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('27', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', '48 Hoylake Road, Randburg, 2034', 'Approved', '3', '7');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('28', '48 Hoylake Road, Randburg, 2034', '17 Mount Edgecombe Drive, Mount Edgecombe, 4302', 'Approved', '1', '29');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('29', 'In Transit', '11 Eva Road, Benoni, 1512', 'Approved', '1', '30');
INSERT INTO `custommandb`.`transferrequest` (`transferrequest_id`, `transferrequest_from`, `transferrequest_to`, `transferrequest_verdict`, `transferrequest_user`, `transferrequest_product`) VALUES ('30', '16 Old Sir Lowry\'s Pass Road, Sir Lowry\'s Pass, 7133', '11 Eva Road, Benoni, 1512', 'Pending', '2', '31');

UPDATE `custommandb`.`product` SET `product_width`='23', `product_height`='65', `product_length`='78' WHERE `product_id`='1';
UPDATE `custommandb`.`product` SET `product_width`='315', `product_height`='123', `product_length`='138' WHERE `product_id`='2';
UPDATE `custommandb`.`product` SET `product_width`='55', `product_height`='75', `product_length`='155' WHERE `product_id`='3';
UPDATE `custommandb`.`product` SET `product_width`='48', `product_height`='88', `product_length`='185' WHERE `product_id`='4';
UPDATE `custommandb`.`product` SET `product_width`='36', `product_height`='92', `product_length`='135' WHERE `product_id`='5';
UPDATE `custommandb`.`product` SET `product_width`='59', `product_height`='100', `product_length`='160' WHERE `product_id`='6';
UPDATE `custommandb`.`product` SET `product_width`='47', `product_height`='77', `product_length`='85' WHERE `product_id`='7';
UPDATE `custommandb`.`product` SET `product_width`='112', `product_height`='25', `product_length`='64' WHERE `product_id`='8';
UPDATE `custommandb`.`product` SET `product_width`='145', `product_height`='36', `product_length`='35' WHERE `product_id`='9';
UPDATE `custommandb`.`product` SET `product_width`='88', `product_height`='155', `product_length`='45' WHERE `product_id`='10';
UPDATE `custommandb`.`product` SET `product_width`='99', `product_height`='145', `product_length`='75' WHERE `product_id`='12';
UPDATE `custommandb`.`product` SET `product_width`='77', `product_height`='180', `product_length`='45' WHERE `product_id`='11';

UPDATE `custommandb`.`warehouse` SET `warehouse_size`='70' WHERE `warehouse_id`='1';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='60' WHERE `warehouse_id`='2';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='50' WHERE `warehouse_id`='3';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='45' WHERE `warehouse_id`='4';

UPDATE `custommandb`.`warehouse` SET `warehouse_size`='70' WHERE `warehouse_id`='1';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='60' WHERE `warehouse_id`='2';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='50' WHERE `warehouse_id`='3';
UPDATE `custommandb`.`warehouse` SET `warehouse_size`='45' WHERE `warehouse_id`='4';


UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='6';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='7';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='8';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='12';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='13';
UPDATE `custommandb`.`productlog` SET `productlog_product`='5' WHERE `productlog_id`='14';


INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', 'DHL Express Warehouse', '3', 'Incident : Water Damage', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', 'DHL Express Warehouse', '3', 'Incident : Fire Damage', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('2', 'DHL Express Warehouse', '3', 'Incident : Wild Dog Tore The Package', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('2', 'Old Storage', '3', 'Incident : Rat Attacks', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('2', 'Old Storage', '3', 'Incident : Bowling Ball Now Has Four Holes', '2016-08-03 11:14:02', '1');
INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('1', 'Mount Warehousing', '3', 'Incident : I am running out of things to say', '2016-08-03 11:14:02', '1');

INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('1', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '1');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('2', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '2');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('3', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '3');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('4', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '4');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('5', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '5');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('6', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '6');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('7', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '7');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('8', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '8');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('9', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '9');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('10', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '10');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('12', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '11');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('13', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '12');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('15', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '14');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('16', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '15');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('17', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '16');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('18', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '17');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('19', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '18');
INSERT INTO `custommandb`.`transferlist` (`transferlist_id`, `transferlist_to`, `transferlist_from`, `transferlist_product`) VALUES ('20', '11 Eva Road, Benoni, 1512', '48 Hoylake Road, Randburg, 2034', '19');


INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`) VALUES ('1', 'payment', '1', '2', 'when will you make payment');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`) VALUES ('1', 'payment', '2', '1', 'i already paid');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('2', 'xbox', '3', '4', 'still interested in the xbox', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('2', 'xbox', '4', '3', 'yes definitely, how much are you looking for it', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('3', 'incident on golf clubs', '5', '6', 'I will just like you to know that I expect a full reinbursement for my golf sticks', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('3', 'incident on golf clubs', '6', '5', 'we are atually purhasing a new set for you rest assuredx', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('4', 'ciro', '7', '8', 'i love this service x', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('4', 'ciro', '8', '7', 'we are glad to hear that', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('5', 'package release', '7', '8', 'when will my package be released', '2016-08-03 11:14:02');
INSERT INTO `custommandb`.`message` (`message_convoid`, `message_subject`, `message_to`, `message_from`, `message_message`, `message_stamp`) VALUES ('5', 'package release', '8', '7', 'its available for collection afeter release has been accepeted', '2016-08-03 11:14:02');

UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='1' WHERE `billofentry_id`='1';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='2' WHERE `billofentry_id`='2';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='3' WHERE `billofentry_id`='3';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='4' WHERE `billofentry_id`='4';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='5' WHERE `billofentry_id`='5';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='6' WHERE `billofentry_id`='6';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='7' WHERE `billofentry_id`='7';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='8' WHERE `billofentry_id`='8';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='9' WHERE `billofentry_id`='9';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='10' WHERE `billofentry_id`='10';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='11' WHERE `billofentry_id`='11';
UPDATE `custommandb`.`billofentry` SET `billofentry_invoice`='12' WHERE `billofentry_id`='12';

INSERT INTO `custommandb`.`productlogtype` (`productlogtype_name`) VALUES ('R');

UPDATE `custommandb`.`warehouse` SET `warehouse_established`='2014-01-02 15:05:41' WHERE `warehouse_id`='2';
UPDATE `custommandb`.`warehouse` SET `warehouse_established`='2014-01-02 15:05:41' WHERE `warehouse_id`='3';
UPDATE `custommandb`.`warehouse` SET `warehouse_established`='2014-01-02 15:05:41' WHERE `warehouse_id`='4';

INSERT INTO `custommandb`.`productlog` (`productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('3', 'DS Space', '3', 'Incident : Employee accident', '2016-08-03 11:14:02', '1');
UPDATE `custommandb`.`productlog` SET `productlog_warehouse`='DS Space' WHERE `productlog_id`='5';

INSERT INTO `custommandb`.`productlog` (`productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('DS Space', '3', 'Release from warehouse', '2016-06-03 11:14:02', '6');

UPDATE `custommandb`.`productlog` SET `productlog_product`='2' WHERE `productlog_id`='12';

INSERT INTO `custommandb`.`productlog` (`productlog_id`, `productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('14', '2', 'DS Space', '3', 'Delivered to warehouse', '2016-06-03 11:14:02', '5');
INSERT INTO `custommandb`.`productlog` (`productlog_id`, `productlog_product`, `productlog_warehouse`, `productlog_user`, `productlog_description`, `productlog_dateLogged`, `productlog_type`) VALUES ('15', '2', 'DS Space', '3', 'Delivered to warehouse', '2016-06-03 11:14:02', '5');

UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-01-08 13:40:32' WHERE `transferrequest_id`='3';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-11-08 13:40:32' WHERE `transferrequest_id`='7';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-01-08 13:40:32' WHERE `transferrequest_id`='30';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-08-10 13:40:32' WHERE `transferrequest_id`='29';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-09-08 13:40:32' WHERE `transferrequest_id`='28';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-07-08 13:40:32' WHERE `transferrequest_id`='27';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-08-08 13:40:32' WHERE `transferrequest_id`='26';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-03-08 13:40:32' WHERE `transferrequest_id`='25';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-06-08 13:40:32' WHERE `transferrequest_id`='24';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-08-08 13:40:32' WHERE `transferrequest_id`='23';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-07-08 13:40:32' WHERE `transferrequest_id`='19';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-06-08 13:40:32' WHERE `transferrequest_id`='21';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-07-08 13:40:32' WHERE `transferrequest_id`='18';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_verdict`='Pending', `transferrequest_requestDate`='2016-11-08 13:40:32' WHERE `transferrequest_id`='8';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-08-08 13:40:32' WHERE `transferrequest_id`='2';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-10-08 13:40:32' WHERE `transferrequest_id`='4';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-10-08 13:40:32' WHERE `transferrequest_id`='6';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-11-08 13:40:32' WHERE `transferrequest_id`='9';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-11-08 13:40:32' WHERE `transferrequest_id`='10';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-05-08 13:40:32' WHERE `transferrequest_id`='11';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-05-08 13:40:32' WHERE `transferrequest_id`='12';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-05-08 13:40:32' WHERE `transferrequest_id`='16';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-07-08 13:40:32' WHERE `transferrequest_id`='17';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-06-08 13:40:32' WHERE `transferrequest_id`='20';
UPDATE `custommandb`.`transferrequest` SET `transferrequest_requestDate`='2016-09-08 13:40:32' WHERE `transferrequest_id`='22';
