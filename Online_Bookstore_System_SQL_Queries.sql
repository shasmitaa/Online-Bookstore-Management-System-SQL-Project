
CREATE DATABASE Assignment;

CREATE TABLE Member (
MemberID nvarchar(50) PRIMARY KEY,
Name nvarchar(50),
Gender nvarchar(50),
ContactNo nvarchar(50),
Address nvarchar(50)
);

INSERT INTO Member
VALUES ('M01', 'Miza', 'Female', '012-4563289', 'Kuala Lumpur'),
       ('M02', 'Reenna', 'Female', '013-5468971', 'Subang Jaya'),
	   ('M03', 'Harry', 'Male', '016-4955663', 'Cheras'),
	   ('M04', 'Aishwarya', 'Female', '012-3264443', 'Damansara'),
	   ('M05', 'Zhi Qi', 'Female', '012-7789654', 'Kajang'),
	   ('M06', 'Liza', 'Female', '016-6784321', 'Sungai Long'),
	   ('M07', 'Giselle', 'Female', '012-5436782', 'Damansara');


CREATE TABLE Cart (
CartID nvarchar(50) PRIMARY KEY,
OrderDate date,
OrderTotal decimal(10,2),
DeliveryStatus nvarchar(50),
MemberID nvarchar(50) FOREIGN KEY REFERENCES Member(MemberID)
);

INSERT INTO Cart
VALUES ('C01', '1 Jul 2022', '112.00', 'Delivered', 'M01'),
       ('C02', '15 May 2022', '52.00', 'Delivered', 'M03'),
	   ('C03', '5 Aug 2022', '186.30', 'Shipped', 'M03'),
	   ('C04', '9 Aug 2022', '131.80', 'Shipped', 'M04'),
	   ('C05', '20 Apr 2022', '112.00', 'Delivered', 'M04'),
	   ('C06', '31 Jul 2022', '55.00', 'Delivered', 'M05'),
	   ('C07', '24 Mar 2022', '126.80', 'Delivered', 'M05'),
	   ('C08', '9 Jul 2022', '124.00', 'Delivered', 'M05'),
	   ('C09', '5 Jun 2022', '175.80', 'Delivered', 'M06'),
	   ('C10', '10 May 2022', '55.00', 'Delivered', 'M01'),
	   ('C11', '13 Jun 2022', '55.00', 'Delivered', 'M02');


CREATE TABLE Publisher (
PublisherID nvarchar(50) PRIMARY KEY,
Name nvarchar(50),
Address nvarchar(50)
);

INSERT INTO Publisher
VALUES ('P01', 'Pearson', 'Bangsar'),
       ('P02', 'Oxford', 'Petaling Jaya'),
	   ('P03', 'MPH Group', 'Bukit Jalil');


CREATE TABLE Category (
CategoryID nvarchar(50) PRIMARY KEY,
Category nvarchar(50)
);

INSERT INTO Category 
VALUES ('C01', 'Computer Science'),
       ('C02', 'Mathematics'),
	   ('C03', 'Social Sciences');


CREATE TABLE Book (
BookID nvarchar(50) PRIMARY KEY, 
Title nvarchar(50),
UnitPrice decimal(10,2),
PublisherID nvarchar(50) FOREIGN KEY REFERENCES Publisher(PublisherID),
CategoryID nvarchar(50) FOREIGN KEY REFERENCES Category(CategoryID)
);

INSERT INTO Book 
VALUES ('B01', 'Introduction to Python Programming', '52.00', 'P01', 'C01'),
       ('B02', 'Principles of Python', '60.00', 'P01', 'C01'),
	   ('B03', 'R Programming Techniques', '55.00', 'P01', 'C01'),
	   ('B04', 'Database for Data Science', '62.00', 'P02', 'C01'),
	   ('B05', 'Discrete Mathematics', '54.50', 'P02', 'C02'),
	   ('B06', 'Financial Accounting', '71.80', 'P03', 'C03');


CREATE TABLE OrderLine (
OrderLineID nvarchar(50) PRIMARY KEY,
Quantity int,
LineTotal decimal(10,2),
CartID nvarchar(50)FOREIGN KEY REFERENCES Cart(CartID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book(BookID)
);

INSERT INTO OrderLine
VALUES ('C01L01', 1, '52.00', 'C01', 'B01'),
       ('C01L02', 1, '60.00', 'C01', 'B02'),
	   ('C02L01', 1, '52.00', 'C02', 'B01'),
	   ('C03L01', 1, '60.00', 'C03', 'B02'),
	   ('C03L02', 1, '54.50', 'C03', 'B05'),
	   ('C03L03', 1, '71.80', 'C03', 'B06'),
	   ('C04L01', 1, '60.00', 'C04', 'B02'),
	   ('C05L01', 1, '52.00', 'C05', 'B01'),
	   ('C05L02', 1, '60.00', 'C05', 'B02'),
	   ('C06L01', 1, '55.00', 'C06', 'B03'),
	   ('C07L01', 1, '55.00', 'C07', 'B03'),
	   ('C07L02', 1, '71.80', 'C07', 'B06'),
	   ('C08L01', 2, '124.00', 'C08', 'B04'),
	   ('C09L01', 2, '104.00', 'C09', 'B01'),
	   ('C09L02', 1, '71.80', 'C09', 'B06'),
	   ('C10L01', 1, '55.00', 'C10', 'B03'),
	   ('C11L01', 1, '55.00', 'C11', 'B03');


CREATE TABLE Review (
ReviewID nvarchar(50) PRIMARY KEY,
Rating int,
TextFeedback nvarchar(50),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book(BookID),
MemberID nvarchar(50) FOREIGN KEY REFERENCES Member(MemberID)
);

INSERT INTO Review
VALUES ('R01', 7, 'Easy to understand', 'B01', 'M01'),
       ('R02', 6, NULL, 'B01', 'M03'),
	   ('R03', 7, NULL, 'B01', 'M05'),
	   ('R04', 8, 'Great book for beginners', 'B01', 'M06'), 
	   ('R05', 7, NULL, 'B02', 'M01'),
	   ('R06', 5, NULL, 'B02', 'M03'),
	   ('R07', 8, 'Great book!', 'B02', 'M04'),
	   ('R08', 6, NULL, 'B02', 'M04'),
	   ('R09', 6, NULL, 'B03', 'M05'),
	   ('R10', 4, 'Not beginner friendly', 'B03', 'M05'),
	   ('R11', 5, NULL, 'B03', 'M01'),
	   ('R12', 8, NULL, 'B04', 'M05'),
	   ('R13', 6, NULL, 'B05', 'M03'),
	   ('R14', 8, NULL, 'B06', 'M03'),
	   ('R15', 8, NULL, 'B06', 'M04');


CREATE TABLE Manager (
ManagerID nvarchar(50) PRIMARY KEY,
Name nvarchar(50),
Email nvarchar(50)
);

INSERT INTO Manager
VALUES ('BM01', 'Aina Hazwani', 'ainahazwani@apu.edu.my');


CREATE TABLE PubOrder (
PubOrderID nvarchar(50) PRIMARY KEY,
PubOrderDate date,
ManagerID nvarchar(50) FOREIGN KEY REFERENCES Manager(ManagerID)
);

INSERT INTO PubOrder
VALUES ('PU01', '24 Oct 2021', 'BM01'),
       ('PU02', '25 Oct 2021', 'BM01'),
	   ('PU03', '8 Dec 2021', 'BM01'),
	   ('PU04', '9 Dec 2021', 'BM01');


CREATE TABLE PubOrderLine (
PubOrderLineID nvarchar(50) PRIMARY KEY,
PubOrderQuan int,
PubOrderID nvarchar(50) FOREIGN KEY REFERENCES PubOrder(PubOrderID),
BookID nvarchar(50) FOREIGN KEY REFERENCES Book(BookID)
);


INSERT INTO PubOrderLine
VALUES ('P01L01', 50, 'PU01', 'B01'),
       ('P01L02', 50, 'PU01', 'B02'),
	   ('P01L03', 50, 'PU01', 'B03'),
	   ('P02L01', 45, 'PU02', 'B04'),
	   ('P03L01', 45, 'PU03', 'B05'),
	   ('P04L01', 30, 'PU04', 'B06');


SELECT*FROM Member;
SELECT*FROM Book;
SELECT*FROM Cart;
SELECT*FROM Category;
SELECT*FROM OrderLine;
SELECT*FROM Publisher;
SELECT*FROM Review;
SELECT*FROM Manager;
SELECT*FROM PubOrder;
SELECT*FROM PubOrderLine;


SELECT Book.BookID, Book.Title, COUNT(Review.ReviewID) AS TotalNumberOfFeedback FROM Review INNER JOIN  
Book on Review.BookID = Book.BookID GROUP BY Book.BookID, Book.Title;

SELECT Member.MemberID, Member.Name, COUNT(Review.ReviewID) AS TotalNumberOfFeedback FROM Review INNER JOIN  
Member on Review.MemberID = Member.MemberID GROUP BY Member.MemberID, Member.Name;

SELECT Publisher.PublisherID, Publisher.Name, COUNT(Book.BookID) AS TotalNoOfBooksPublished FROM Book 
INNER JOIN Publisher on Book.PublisherID = Publisher.PublisherID GROUP BY Publisher.PublisherID, Publisher.Name;

SELECT Category.CategoryID, Category.Category, COUNT(Book.BookID) AS TotalNoOfBooks FROM Book 
INNER JOIN Category on Book.CategoryID = Category.CategoryID GROUP BY Category.CategoryID, Category.Category;

SELECT Book.BookID, Book.Title FROM	OrderLine INNER JOIN Book on OrderLine.BookID = Book.BookID WHERE OrderLine.Quantity > (SELECT AVG(OrderLine.Quantity) FROM OrderLine);

SELECT SUM(PubOrderQuan) AS TotalNoOfBooksOrderedByManager FROM PubOrderLine;

SELECT*FROM Member WHERE NOT EXISTS (SELECT*FROM Cart WHERE Member.MemberID = Cart.MemberID);

SELECT Gender, COUNT(MemberID) AS TotalNoOfMembers FROM Member GROUP BY Gender;

SELECT Member.MemberID, Member.Address, Member.ContactNo, Book.BookID, Book.Title, OrderLine.Quantity, Cart.OrderDate, Cart.DeliveryStatus
FROM Cart
INNER JOIN Member ON Cart.MemberID = Member.MemberID   
INNER JOIN OrderLine ON OrderLine.CartID = Cart.CartID
INNER JOIN Book ON OrderLine.BookID = Book.BookID
WHERE Cart.DeliveryStatus  != 'Delivered' 
GROUP BY Member.MemberID, Member.Address, Member.ContactNo, Book.BookID, Book.Title, OrderLine.Quantity, Cart.OrderDate, Cart.DeliveryStatus;

SELECT*FROM Member WHERE MemberID IN (SELECT MemberID FROM Cart GROUP BY MemberID HAVING COUNT(MemberID) > 2); 











