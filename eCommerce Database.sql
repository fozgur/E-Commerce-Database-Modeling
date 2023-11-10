REATE TABLE Address1 (AddressID integer PRIMARY KEY,
					  City varchar(40),
					  District varchar(40),
					  Street varchar(40),
					  Apartment integer,
					  NO integer)
					  
CREATE TABLE Customer11 (CustomerID integer PRIMARY KEY,
						 FirstName varchar(40),
						 LastName varchar(40),
						 Email varchar(150),
						 Phone varchar(10) CONSTRAINT first_cant_zero CHECK (substr(Phone,1,1) <> '0'),
						 AddressID integer REFERENCES Address1 (AddressID))
						 
CREATE TABLE Product (SKU integer PRIMARY KEY,
					  Description varchar(150),
					  StockAmount int CONSTRAINT positive_stock CHECK (StockAmount>0))

CREATE TABLE COMMENTS (CommentID integer PRIMARY KEY,
					  CustomerID integer REFERENCES Customer11 (CustomerID),
					  ProducID integer REFERENCES Product (SKU),
					  Rating integer CONSTRAINT rating_range CHECK (Rating BETWEEN 0 AND 5))
					
CREATE TABLE CreditCard (CardID integer PRIMARY KEY,
						 CustomerID integer REFERENCES Customer11(CustomerID),
						 CardNo varchar2(16) CONSTRAINT credit_card_length CHECK (LENGTH(CardNo)=16),
						 ExpiryMMYY varchar2(5) CONSTRAINT month_eligibility CHECK (substr(expiryMMYY,1,2)<=31)
						 						CONSTRAINT year_eligibility CHECK (substr(expiryMMYY,4,2)<=99),
						 CVV integer CONSTRAINT positive check(CVV>0)
						 			 CONSTRAINT lenght_check CHECK (LENGTH(CVV)=3))
		
CREATE TABLE Payment (PaymentID integer PRIMARY KEY,
					  CardID integer REFERENCES CreditCard(CardID),
					  DateDone DATE NOT NULL)
					
CREATE TABLE Campaign (CampaignID integer PRIMARY KEY,
					   DiscountRate integer CONSTRAINT positivity_check CHECK (DiscountRate>0))
					
CREATE TABLE Shipping (TrackingID integer PRIMARY KEY,
					   ShipMethod varchar(50) NOT NULL
					   )
					   
CREATE TABLE Merchant (MerchantID integer PRIMARY KEY,
					   AddressID integer REFERENCES Address1 (AddressID),
					   Name varchar2(150),
					   Rating integer CONSTRAINT rating_cant_logic CHECK (Rating BETWEEN 0 AND 5))

CREATE TABLE ORDERHW4 (OrderID integer PRIMARY KEY,
					   CustomerID integer REFERENCES customer11 (CustomerID),
					   ShippingID integer REFERENCES Shipping (TrackingID),
					   PaymentID integer REFERENCES Payment (PaymentID),
					   MerchantID integer REFERENCES Merchant (MerchantID),
					   CampaignID integer REFERENCES Campaign (CampaignID))
					   
CREATE TABLE OrderDetails (ProductID integer REFERENCES Product(SKU),
						   OrderID integer REFERENCES OrderHW4 (OrderID),
						   Price integer CONSTRAINT must_be_positive CHECK (Price>0),
						   Quantity integer CONSTRAINT must_be_positive_quantity CHECK (Quantity>0))
						   

INSERT ALL
  INTO Address1 (AddressID, City, District, Street, Apartment, NO) VALUES (1, 'İstanbul', 'Kadıköy', 'Bağdat Caddesi', 4, 15)
  INTO Address1 (AddressID, City, District, Street, Apartment, NO) VALUES (2, 'Ankara', 'Çankaya', 'Atatürk Bulvarı', 7, 23)
  INTO Address1 (AddressID, City, District, Street, Apartment, NO) VALUES (3, 'İzmir', 'Karşıyaka', 'Mithatpaşa Caddesi', 2, 11)
  INTO Address1 (AddressID, City, District, Street, Apartment, NO) VALUES (4, 'Bursa', 'Osmangazi', 'İnönü Caddesi', 6, 45)
  INTO Address1 (AddressID, City, District, Street, Apartment, NO) VALUES (5, 'Adana', 'Seyhan', 'Atatürk Caddesi', 3, 19)
SELECT * FROM dual;


INSERT ALL
  INTO Customer11 (CustomerID, FirstName, LastName, Email, Phone, AddressID) VALUES (1, 'Ahmet', 'Yılmaz', 'ahmet@example.com', '5311234567', 1)
  INTO Customer11 (CustomerID, FirstName, LastName, Email, Phone, AddressID) VALUES (2, 'Ayşe', 'Kara', 'ayse@example.com', '5429876543', 2)
  INTO Customer11 (CustomerID, FirstName, LastName, Email, Phone, AddressID) VALUES (3, 'Mehmet', 'Demir', 'mehmet@example.com', '5058765432', 3)
  INTO Customer11 (CustomerID, FirstName, LastName, Email, Phone, AddressID) VALUES (4, 'Fatma', 'Bakır', 'fatma@example.com', '5377654321', 4)
  INTO Customer11 (CustomerID, FirstName, LastName, Email, Phone, AddressID) VALUES (5, 'Emre', 'Yıldız', 'emre@example.com', '5556543210', 5)
SELECT * FROM dual;


INSERT ALL
  INTO Product (SKU, Description, StockAmount) VALUES (101, 'Akıllı Telefon', 100)
  INTO Product (SKU, Description, StockAmount) VALUES (102, 'Bilgisayar', 50)
  INTO Product (SKU, Description, StockAmount) VALUES (103, 'Televizyon', 30)
  INTO Product (SKU, Description, StockAmount) VALUES (104, 'Kamera', 70)
  INTO Product (SKU, Description, StockAmount) VALUES (105, 'Kulaklık', 120)
SELECT * FROM dual;


INSERT ALL
  INTO COMMENTS (CommentID, CustomerID, ProducID, Rating) VALUES (1, 1, 101, 4)
  INTO COMMENTS (CommentID, CustomerID, ProducID, Rating) VALUES (2, 2, 102, 5)
  INTO COMMENTS (CommentID, CustomerID, ProducID, Rating) VALUES (3, 3, 103, 3)
  INTO COMMENTS (CommentID, CustomerID, ProducID, Rating) VALUES (4, 4, 104, 2)
  INTO COMMENTS (CommentID, CustomerID, ProducID, Rating) VALUES (5, 5, 105, 4)
SELECT * FROM dual;


INSERT ALL
  INTO CreditCard (CardID, CustomerID, CardNo, ExpiryMMYY, CVV) VALUES (1, 1, '1234567890123456', '12/25', 123)
  INTO CreditCard (CardID, CustomerID, CardNo, ExpiryMMYY, CVV) VALUES (2, 2, '9876543210987654', '06/24', 456)
  INTO CreditCard (CardID, CustomerID, CardNo, ExpiryMMYY, CVV) VALUES (3, 3, '1111222233334444', '09/23', 789)
  INTO CreditCard (CardID, CustomerID, CardNo, ExpiryMMYY, CVV) VALUES (4, 4, '4444333322221111', '03/27', 321)
  INTO CreditCard (CardID, CustomerID, CardNo, ExpiryMMYY, CVV) VALUES (5, 5, '5555666677778888', '08/26', 654)
SELECT * FROM dual;

INSERT ALL
  INTO Payment (PaymentID, CardID, DateDone) VALUES (1, 1 , TO_DATE('2023-11-08', 'YYYY-MM-DD'))
  INTO Payment (PaymentID, CardID, DateDone) VALUES (2, 2, TO_DATE('2023-11-09', 'YYYY-MM-DD'))
  INTO Payment (PaymentID, CardID, DateDone) VALUES (3, 3, TO_DATE('2023-11-10', 'YYYY-MM-DD'))
  INTO Payment (PaymentID, CardID, DateDone) VALUES (4, 4, TO_DATE('2023-11-11', 'YYYY-MM-DD'))
  INTO Payment (PaymentID, CardID, DateDone) VALUES (5, 5, TO_DATE('2023-11-12', 'YYYY-MM-DD'))
SELECT * FROM dual;


INSERT ALL
  INTO Campaign (CampaignID, DiscountRate) VALUES (1, 10)
  INTO Campaign (CampaignID, DiscountRate) VALUES (2, 15)
  INTO Campaign (CampaignID, DiscountRate) VALUES (3, 20)
  INTO Campaign (CampaignID, DiscountRate) VALUES (4, 25)
  INTO Campaign (CampaignID, DiscountRate) VALUES (5, 30)
SELECT * FROM dual;


INSERT ALL
  INTO Shipping (TrackingID, ShipMethod) VALUES (1, 'Kargo')
  INTO Shipping (TrackingID, ShipMethod) VALUES (2, 'Kurye')
  INTO Shipping (TrackingID, ShipMethod) VALUES (3, 'Posta')
  INTO Shipping (TrackingID, ShipMethod) VALUES (4, 'Hızlı Kargo')
  INTO Shipping (TrackingID, ShipMethod) VALUES (5, 'Ambar')
SELECT * FROM dual;


INSERT ALL
  INTO Merchant (MerchantID, AddressID, Name, Rating) VALUES (1, 1, 'Teknoloji Mağazası', 4)
  INTO Merchant (MerchantID, AddressID, Name, Rating) VALUES (2, 2, 'Bilgisayar Dünyası', 5)
  INTO Merchant (MerchantID, AddressID, Name, Rating) VALUES (3, 3, 'Elektronik Bazaar', 3)
  INTO Merchant (MerchantID, AddressID, Name, Rating) VALUES (4, 4, 'Fotoğraf Market', 2)
  INTO Merchant (MerchantID, AddressID, Name, Rating) VALUES (5, 5, 'Ses Teknolojileri', 4)
SELECT * FROM dual;


INSERT ALL
  INTO ORDERHW4 (OrderID, CustomerID, ShippingID, PaymentID, MerchantID, CampaignID) VALUES (1, 1, 1, 1, 1, 1)
  INTO ORDERHW4 (OrderID, CustomerID, ShippingID, PaymentID, MerchantID, CampaignID) VALUES (2, 2, 2, 2, 2, 2)
  INTO ORDERHW4 (OrderID, CustomerID, ShippingID, PaymentID, MerchantID, CampaignID) VALUES (3, 3, 3, 3, 3, 3)
  INTO ORDERHW4 (OrderID, CustomerID, ShippingID, PaymentID, MerchantID, CampaignID) VALUES (4, 4, 4, 4, 4, 4)
  INTO ORDERHW4 (OrderID, CustomerID, ShippingID, PaymentID, MerchantID, CampaignID) VALUES (5, 5, 5, 5, 5, 5)
SELECT * FROM dual;


INSERT ALL
  INTO OrderDetails (ProductID, OrderID, Price, Quantity) VALUES (101, 1, 1000, 2)
  INTO OrderDetails (ProductID, OrderID, Price, Quantity) VALUES (102, 2, 1500, 1)
  INTO OrderDetails (ProductID, OrderID, Price, Quantity) VALUES (103, 3, 2000, 3)
  INTO OrderDetails (ProductID, OrderID, Price, Quantity) VALUES (104, 4, 500, 2)
  INTO OrderDetails (ProductID, OrderID, Price, Quantity) VALUES (105, 5, 800, 4)
SELECT * FROM dual;


COMMIT;