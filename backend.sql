DROP DATABASE IF EXISTS H3;

CREATE DATABASE H3;

GRANT ALL PRIVILEGES ON H3.* to h3@localhost IDENTIFIED BY 'kimparkryu';

USE H3;

CREATE TABLE Products(
	maker VARCHAR(256) NOT NULL,
	productId VARCHAR(256) NOT NULL,
	type VARCHAR(256) NOT NULL,
	PRIMARY KEY (productId)
);

INSERT INTO Products (maker, productId,type) VALUES ('LG','OLED77W9WNA','TV');
INSERT INTO Products (maker, productId,type) VALUES ('Samsung','QN82Q950RBFXKR','TV');
INSERT INTO Products (maker, productId,type) VALUES ('Sony','XBR Z9F','TV');
INSERT INTO Products (maker, productId,type) VALUES ('LG','32LM583BKND','TV');
INSERT INTO Products (maker, productId,type) VALUES ('Samsung','QN75Q950RBFXKR','TV');

INSERT INTO Products (maker, productId,type) VALUES ('LG','F872MT95T','Fridge');
INSERT INTO Products (maker, productId,type) VALUES ('LG','F872SN35T','Fridge');
INSERT INTO Products (maker, productId,type) VALUES ('LG','F872MT75T','Fridge');
INSERT INTO Products (maker, productId,type) VALUES ('Samsung','RF85N96B1XF','Fridge');
INSERT INTO Products (maker, productId,type) VALUES ('Samsung','RF85N95A2SG','Fridge');

INSERT INTO Products (maker, productId,type) VALUES ('LG','F21VDTM','Washer');
INSERT INTO Products (maker, productId,type) VALUES ('LG','F21VDT','Washer');
INSERT INTO Products (maker, productId,type) VALUES ('Samsung','WF21N8750TP','Washer');
INSERT INTO Products (maker, productId,type) VALUES ('Samsung','WA22R7870GV','Washer');
INSERT INTO Products (maker, productId,type) VALUES ('Samsung','WA30F1K6QSA','Washer');

INSERT INTO Products (maker, productId,type) VALUES ('LG','FQ17S9DWP2','AC');
INSERT INTO Products (maker, productId,type) VALUES ('LG','SQ06M9JWAS','AC');
INSERT INTO Products (maker, productId,type) VALUES ('LG','FQ19L9DRA1','AC');
INSERT INTO Products (maker, productId,type) VALUES ('Samsung','AF25RX975CAN','AC');
INSERT INTO Products (maker, productId,type) VALUES ('Samsung','AF16R5773WSR','AC');

CREATE TABLE productStock(
	productId VARCHAR(256) NOT NULL,
  stockId INTEGER NOT NULL,
	quantity INTEGER,
  PRIMARY KEY(stockId)
);

INSERT INTO productStock (productId,stockId,quantity) VALUES ('OLED77W9WNA',111101,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('QN82Q950RBFXKR',111102,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('XBR Z9F',111103,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('32LM583BKND',986702,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('QN75Q950RBFXKR',765321,20);

INSERT INTO productStock (productId,stockId,quantity) VALUES ('F872MT95T',321432,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('F872SN35T',214354,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('F872MT75T',657865,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('RF85N96B1XF',765098,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('RF85N95A2SG',436897,20);

INSERT INTO productStock (productId,stockId,quantity) VALUES ('F21VDTM',234567,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('F21VDT',123456,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('WF21N8750TP',567890,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('WA22R7870GV',876543,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('WA30F1K6QSA',765432,20);

INSERT INTO productStock (productId,stockId,quantity) VALUES ('FQ17S9DWP2',432109,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('SQ06M9JWAS',210987,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('FQ19L9DRA1',125678,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('AF25RX975CAN',444444,20);
INSERT INTO productStock (productId,stockId,quantity) VALUES ('AF16R5773WSR',485672,20);

create table TV (
	productId VARCHAR(256) NOT NULL,
	cost integer, 
	maker varchar(16),
	PRIMARY KEY(productId),
	FOREIGN KEY (productId) REFERENCES Products(productId) ON DELETE CASCADE);
	
INSERT INTO TV (productId, cost, maker) VALUES ('OLED77W9WNA',16130350,'LG');
INSERT INTO TV (productId, cost, maker)  VALUES ('32LM583BKND',799990,'LG');
INSERT INTO TV (productId, cost, maker)  VALUES ('QN82Q950RBFXKR',14433570,'Samsung');
INSERT INTO TV (productId, cost, maker)  VALUES ('QN75Q950RBFXKR',8806000,'Samsung');
INSERT INTO TV (productId, cost, maker)  VALUES ('XBR Z9F',3326388,'Sony');

create table Fridge (
	productId VARCHAR(256) NOT NULL,
	cost integer, 
	maker varchar(16),
	PRIMARY KEY(productId),
	FOREIGN KEY (productId) REFERENCES Products(productId) ON DELETE CASCADE);
	

INSERT INTO Fridge (productId, cost, maker) VALUES ('F872MT95T',3627000,'LG');
INSERT INTO Fridge (productId, cost, maker) VALUES ('F872SN35T',863880,'LG');
INSERT INTO Fridge (productId, cost, maker) VALUES ('F872MT75T',3738850,'LG');
INSERT INTO Fridge (productId, cost, maker) VALUES ('RF85N96B1XF',2632350,'Samsung');
INSERT INTO Fridge (productId, cost, maker) VALUES ('RF85N95A2SG',2990000,'Samsung');
	
CREATE TABLE Washer(
	productId VARCHAR(256) NOT NULL,
	cost integer,
	maker varchar(16),
	PRIMARY KEY(productId),
	FOREIGN KEY (productId) REFERENCES Products(productId) ON DELETE CASCADE);


INSERT INTO Washer (productId, cost, maker) VALUES ('F21VDTM',1823880,'LG');
INSERT INTO Washer (productId, cost, maker) VALUES ('F21VDT',1346380,'LG');
INSERT INTO Washer (productId, cost, maker) VALUES ('WF21N8750TP',1321860,'Samsung');
INSERT INTO Washer (productId, cost, maker) VALUES ('WA22R7870GV',982430,'Samsung');
INSERT INTO Washer (productId, cost, maker) VALUES ('WA30F1K6QSA',348740,'Samsung');

CREATE TABLE AC (
	productId VARCHAR(256) NOT NULL,
	cost integer,
	maker varchar(16),
	PRIMARY KEY(productId),
	FOREIGN KEY (productId) REFERENCES Products(productId) ON DELETE CASCADE);


INSERT INTO AC (productId, cost, maker) VALUES ('FQ17S9DWP2',2910120,'LG');
INSERT INTO AC (productId, cost, maker) VALUES ('SQ06M9JWAS',348740,'LG');
INSERT INTO AC (productId, cost, maker) VALUES ('FQ19L9DRA1',348740,'LG');
INSERT INTO AC (productId, cost, maker) VALUES ('AF25RX975CAN',5701970,'Samsung');
INSERT INTO AC (productId, cost, maker) VALUES ('AF16R5773WSR',1845860,'Samsung');

CREATE TABLE Cart (
	cartId INTEGER, 
	productId VARCHAR(256),
	clientId INTEGER, 
	orderDate Date,
	startDate Date,
	endDate Date, 
	numberofItem INTEGER,
	PRIMARY KEY (cartId)); 
	
CREATE TABLE Admin (
	name VARCHAR(16),
	adminId INTEGER NOT NULL, 
	pw VARCHAR(20),
	address VARCHAR(40), 
	phoneNumber INTEGER,
	email VARCHAR(30), 
	dateofbirth Date,
	PRIMARY KEY (adminId, phoneNumber));

INSERT INTO Admin (name, adminId, pw, address, phoneNumber,email, dateofbirth) VALUES ('San Hae Kim',00001,'San01','Seocho 99', 01011112222, 'San@H3.com', '1996-1-17');
INSERT INTO Admin (name, adminId, pw, address, phoneNumber,email, dateofbirth) VALUES ('Kyu Hee Park',00002,'Kyu02','Busan 99', 01055551111, 'Kyu@H3.com', '1997-3-20');
INSERT INTO Admin (name, adminId, pw, address, phoneNumber,email, dateofbirth) VALUES ('Song Hee Ryu',00003,'Song03','Hongdae 99', 01033335555, 'Song@H3.com', '1996-7-04');
INSERT INTO Admin (name, adminId, pw, address, phoneNumber,email, dateofbirth) VALUES ('Soo Hee Kim',00004,'Soo04','Itewon 99', 01022221111, 'Soo@H3.com', '1996-1-17');
INSERT INTO Admin (name, adminId, pw, address, phoneNumber,email, dateofbirth) VALUES ('Yooree Lee',00005,'Yoo05','Panggo 99', 01055552222, 'Yoo@H3.com', '1994-6-20');

CREATE TABLE Client (
	name VARCHAR(16),
	clientId INTEGER NOT NULL,
	pw VARCHAR(20),	
	address VARCHAR(40), 
	phoneNumber INTEGER,
	email  VARCHAR(30), 
	dateofbirth DATE,
	PRIMARY KEY (clientId, phoneNumber)); 

INSERT INTO Client (name, clientId, pw, address, phoneNumber,email, dateofbirth) VALUES ('Sam Kim',11101,'Sam01','Gangman 114',01011111112, 'sam@gmail.com', '1990-7-04');
INSERT INTO Client (name, clientId, pw, address, phoneNumber,email, dateofbirth) VALUES ('John Park',11102,'John02','Songdo 119',01022221112, 'john@gmail.com','1950-7-04');
INSERT INTO Client (name, clientId, pw, address, phoneNumber,email, dateofbirth) VALUES ('Art Lee',11103,'Art03','Sinsa 132', 01033331112,'art@gmail.com', '1991-7-04');
INSERT INTO Client (name, clientId, pw, address, phoneNumber,email, dateofbirth) VALUES ('John Doe',11104,'John04','Seocho 101', 01044441112,'johnD@gmail.com', '1989-7-04');
INSERT INTO Client (name, clientId, pw, address, phoneNumber,email, dateofbirth) VALUES ('Brian Seok',11105,'Brian05','Busan 99', 01055551112, 'Brian@gmail.com', '1992-7-04');

CREATE TABLE Discount (
	discountId INTEGER NOT NULL, 
	discountName VARCHAR(20),
	discountPercentage DOUBLE,
	PRIMARY KEY(discountId));


CREATE TABLE Shipping (
	deliveryId INTEGER NOT NULL,
	deliveryDate DATE,
	address varchar(40),
	cartId INTEGER NOT NULL, 
	PRIMARY KEY (deliveryId, cartId));
	
CREATE TABLE Payment (
	billId VARCHAR(40) NOT NULL,
	payDate DATE, 
	totalAmount FLOAT, 
	clientId INTEGER NOT NULL, 
	creditCardNumber VARCHAR(20) NOT NULL, 
	name VARCHAR(16), 
	expireDate DATE, 
	cvc VARCHAR(3), 
	discountId INTEGER NOT NULL, 
	PRIMARY KEY(billId));
	
CREATE TABLE Manages(
  adminId INTEGER,
  clientId INTEGER, 
  productId VARCHAR(256),
  cartId INTEGER,
  deliveryId INTEGER,
  discountId INTEGER,
  PRIMARY KEY(adminId, clientId, productId, cartId, deliveryId, discountId),
  FOREIGN KEY(adminId) REFERENCES Admin(adminId),
  FOREIGN KEY(clientId) REFERENCES Client(clientId),
  FOREIGN KEY(productId) REFERENCES Products(productId),
  FOREIGN KEY(cartId) REFERENCES Cart(cartId),
  FOREIGN KEY(deliveryId) REFERENCES Shipping(deliveryId),
  FOREIGN KEY(discountId) REFERENCES Discount(discountId)
);

CREATE TABLE QuantityCheck (
  productId VARCHAR(256),
	stockId INTEGER,
  PRIMARY KEY(productId, stockId),
  FOREIGN KEY(productId) REFERENCES Products(productId),
  FOREIGN KEY(stockId) REFERENCES productStock(stockId)
);

CREATE TABLE Rents(
	clientId INTEGER, 
  productId VARCHAR(256),
  cartId INTEGER,
  PRIMARY KEY(clientId, productId, cartId),
  FOREIGN KEY(clientId) REFERENCES Client(clientId),
  FOREIGN KEY(productId) REFERENCES Products(productId),
  FOREIGN KEY(cartId) REFERENCES Cart(cartId)
);

CREATE TABLE Makes(
	cartId INTEGER,
 	billId VARCHAR(40),
  PRIMARY KEY(cartId, billId),
  FOREIGN KEY(cartId) REFERENCES Cart(cartId),
  FOREIGN KEY(billId) REFERENCES Payment(billId)
);

CREATE TABLE shipping_of(
	deliveryId INTEGER,
  billId VARCHAR(40),
  PRIMARY KEY(deliveryId, billId),
  FOREIGN KEY(deliveryId) REFERENCES Shipping(deliveryId),
  FOREIGN KEY(billId) REFERENCES Payment(billId)
);

CREATE TABLE discount_of(
	discountId INTEGER, 
  billId VARCHAR(40),
  PRIMARY KEY(discountId, billId),
  FOREIGN KEY(discountId) REFERENCES Discount(discountId),
  FOREIGN KEY(billId) REFERENCES Payment(billId)
);


SELECT * FROM Products;
SELECT * FROM productStock;
SELECT * FROM TV;
SELECT * FROM Fridge;
SELECT * FROM Washer;
SELECT * FROM AC;
SELECT * FROM Cart;
SELECT * FROM Admin;
SELECT * FROM Client;
SELECT * FROM Discount;
SELECT * FROM Shipping;
SELECT * FROM Payment;
SELECT * FROM Manages;
SELECT * FROM QuantityCheck;
SELECT * FROM Rents;
SELECT * FROM Makes;
SELECT * FROM shipping_of;
SELECT * FROM discount_of;