create table Catering_Employee(Ssn VARCHAR2(9),
Fname VARCHAR2(20),
Lname VARCHAR2(20),
Minit VARCHAR2(2),
Phone_Number VARCHAR2(10),
Street VARCHAR2(20),
ZipCode VARCHAR(10),
PRIMARY KEY(Ssn)
);

create table Manager(Ssn VARCHAR2(9),
Email VARCHAR2(20),
PRIMARY KEY(Ssn),
CONSTRAINT FK_Mgr_Ssn FOREIGN KEY (Ssn) references Catering_Employee(Ssn) 
);

create table Delivery_Person(Ssn VARCHAR2(9),
Vehicle_id VARCHAR2(10),
PRIMARY KEY(Ssn),
CONSTRAINT FK_DP_Ssn FOREIGN KEY (Ssn) references Catering_Employee(Ssn) 
);

create table Customer(Ssn VARCHAR2(9),
Fname VARCHAR2(20),
Lname VARCHAR2(20),
Minit VARCHAR2(2),
Phone_Number VARCHAR2(10),
Email VARCHAR2(20),
City VARCHAR2(10),
Street VARCHAR2(20),
ZipCode VARCHAR2(10),
State VARCHAR2(10),
PRIMARY KEY(Ssn)
);

commit;

create table Item(Item_id VARCHAR2(9),
Name VARCHAR2(20),
Price FLOAT,
Storage_Type VARCHAR2(20),
Use_Before DATE,
PRIMARY KEY(Item_id)
);

create table Kitchen(Kitchen_id VARCHAR2(9),
Type VARCHAR2(20),
Street VARCHAR2(20),
ZipCode VARCHAR2(10),
State VARCHAR2(10),
PRIMARY KEY(Kitchen_id)
);

create table Orders(Order_id VARCHAR2(9),
DESCRIPTION VARCHAR2(30),
Ordered_Date DATE,
Delivery_Date DATE,
Delivery_Time VARCHAR2(10),
Street VARCHAR2(20),
City VARCHAR2(10),
ZipCode  VARCHAR2(10),
State VARCHAR2(10),
Delivery_Person_Ssn VARCHAR2(9),
Customer_Ssn VARCHAR2(9),
Manager_Ssn VARCHAR2(9),
PRIMARY KEY(Order_id),
CONSTRAINT FK_ORD_DP_SSN FOREIGN KEY (Delivery_Person_Ssn) references Delivery_Person(Ssn),
CONSTRAINT FK_ORD_CUST_SSN FOREIGN KEY (Customer_Ssn) references Customer(Ssn),
CONSTRAINT FK_ORD_MGR_SSN FOREIGN KEY (Manager_Ssn) references Manager(Ssn)
);

create table Receipt(Receipt_No VARCHAR2(9),
PAYMENT_METHOD VARCHAR2(20),
PAYMENT_DATE DATE,
AMOUNT FLOAT,
Order_id VARCHAR2(9),
PRIMARY KEY(Receipt_No),
CONSTRAINT FK_Order FOREIGN KEY (Order_id) references ORDERS(Order_id)
);

create table FeedBack(Customer_Ssn VARCHAR2(9),
Order_id VARCHAR2(9),
Rating NUMBER(1),
Comments VARCHAR2(100),
PRIMARY KEY(Order_id,Customer_Ssn),
CONSTRAINT FK_FDBK_ORD_ID FOREIGN KEY (Order_id) references ORDERS(Order_id),
CONSTRAINT FK_FDBK_SSN FOREIGN KEY (Customer_Ssn) references Customer(Ssn)
);

commit;

create table Order_Items(Order_id VARCHAR2(9),
Item_id VARCHAR2(9),
Quantity NUMBER,
PRIMARY KEY(Order_id,Item_id),
CONSTRAINT FK_OI_ORD_ID FOREIGN KEY (Order_id) references ORDERS(Order_id),
CONSTRAINT FK_OI_ITM_ID FOREIGN KEY (Item_id) references Item(Item_id)
);

create table Prepared_In(Item_id VARCHAR2(9),
Kitchen_id VARCHAR2(9),
PRIMARY KEY(Item_id,Kitchen_id),
CONSTRAINT FK_PREP_IN_KTCH_ID FOREIGN KEY (Kitchen_id) references Kitchen(Kitchen_id),
CONSTRAINT FK_PREP_IN_ITM_ID FOREIGN KEY (Item_id) references Item(Item_id)
);

create table abc (colum TIMESTAMP);
insert into abc values(CURRENT_TIMESTAMP);
select to_char(colum, 'HH:MI')
FROM abc;

