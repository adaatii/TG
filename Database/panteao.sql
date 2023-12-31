CREATE DATABASE PANTEAO;

USE PANTEAO;

CREATE  TABLE employee(	
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name varchar(100) not null,
    cpf varchar(11) Unique not null,
    email  varchar(150) unique,
    passwd varchar (150) not null,
    status INTEGER not null,
    updatedDate varchar(20) not null,
    createdDate varchar(20) not null
);

CREATE TABLE category (
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	description VARCHAR(200) UNIQUE not null,
	status integer not null,
	updatedDate VARCHAR(20) not null,
	createdDate VARCHAR(20) not null
);

CREATE  TABLE subCategory(	
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	description VARCHAR(200) UNIQUE not null,
	status integer not null,
	updatedDate VARCHAR(20) not null,
	createdDate VARCHAR(20) not null,
	idCategory INTEGER not null
);

CREATE  TABLE product(	
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	description VARCHAR(200) UNIQUE not null,
	price FLOAT not null,
	updatedDate VARCHAR(20) not null,
	createdDate VARCHAR(20) not null,
	idSubCategory INTEGER not null,
	status Integer
);

CREATE  TABLE sale(	
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idEmployee INTEGER not null,
	createdDate VARCHAR(20) not null,
	status INTEGER not null
);

CREATE  TABLE itensSale(	
	id INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
	idSale INTEGER not null,
	idProduct INTEGER not null,
	quantity INTEGER not null
);


ALTER TABLE subCategory
ADD CONSTRAINT FK_SUBCATEGORY_CATEGORY FOREIGN KEY (idCategory) REFERENCES category (id);

ALTER TABLE product
ADD CONSTRAINT FK_PRODUCT_SUBCATEGORY FOREIGN KEY (idSubCategory) REFERENCES subCategory (id);

ALTER TABLE sale
ADD CONSTRAINT FK_SALE_EMPLOYEE FOREIGN KEY (idEmployee) REFERENCES employee (id);

ALTER TABLE itensSale
ADD CONSTRAINT FK_ITENSSALE_SALE FOREIGN KEY (idSale) REFERENCES sale (id);

ALTER TABLE itensSale
ADD CONSTRAINT FK_ITENSSALE_PRODUCT FOREIGN KEY (idProduct) REFERENCES product (id);




INSERT INTO employee (name, cpf, email, passwd, status, updatedDate, createdDate)
VALUES ("LUCAS","65743244432","LUCAS@GMAIL.COM","123","0","24/10/2023 16:50:19","28/06/2023 08:31:46");

INSERT INTO category (description, status, updatedDate, createdDate)
VALUES ("CAFES","1","04/07/2023 07:48:13","27/06/2023 13:39:33");

INSERT INTO category (description, status, updatedDate, createdDate)
VALUES ("SALGADOS","1","24/10/2023 21:13:29","24/10/2023 21:13:29");

INSERT INTO subCategory (description, status, updatedDate, createdDate, idCategory)
VALUES ("ESPRESSO","1","24/10/2023 21:46:48","24/10/2023 21:46:48", "1");

INSERT INTO product (description, price, updatedDate, createdDate, idSubCategory, status)
VALUES ("ESPRESSO DUPLO","12","25/10/2023 20:52:29","25/10/2023 20:52:29", "1", "1");
