create database library
use library;
CREATE TABLE Customer (
    Customer_ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100)
);
INSERT INTO Customer (Customer_Name, Email) VALUES ('Amna', 'amna80@gmail.com');
INSERT INTO Customer (Customer_Name, Email) VALUES ('Maryam', 'maryam94@gmail.com');
INSERT INTO Customer (Customer_Name, Email) VALUES ('Laiba', 'laiba15@gmail.com');
INSERT INTO Customer (Customer_Name, Email) VALUES ('Nimra', 'nimra24@gmail.com');
INSERT INTO Customer (Customer_Name, Email) VALUES ('Shifa', 'shifa24@gmail.com');
SELECT * FROM Customer;

CREATE TABLE Books (
    Book_ID INT IDENTITY(1001,1) PRIMARY KEY NOT NULL,
    Book_Title VARCHAR(100),
    Book_Author VARCHAR(100)
);
INSERT INTO Books VALUES (' The Catcher in the Rye ', 'J.D. Salinger');
INSERT INTO Books VALUES ('Harry Potter and the Sorcerer',  'J.K. Rowling');
INSERT INTO Books VALUES ('The Shining',  'Stephen King');
INSERT INTO Books VALUES ('The Hobbit',  'J.R.R. Tolkien');
INSERT INTO Books VALUES ('Pride and Prejudice', 'Jane Austen');
SELECT * FROM Books;


CREATE TABLE Book_Issue (
    Issue_ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
    Customer_ID int foreign key references Customer(Customer_ID),
    Book_ID int foreign key references Books (Book_ID),
    Issue_Date DATE
);
INSERT INTO Book_Issue VALUES ('2', '1001', '2024-01-12');
INSERT INTO Book_Issue VALUES ('3', '1003', '2024-02-18');
INSERT INTO Book_Issue VALUES ('4', '1001', '2024-05-12');
INSERT INTO Book_Issue VALUES ('3', '1002', '2024-10-12');
INSERT INTO Book_Issue VALUES ('1', '1003', '2024-03-09');
INSERT INTO Book_Issue VALUES ('2', '1005', '2024-08-12');

SELECT * FROM Book_Issue;


SELECT Customer.Customer_Name, Customer.Email, Books.Book_Title, Book_Issue.Issue_Date
FROM Customer
INNER JOIN Book_Issue ON Customer.Customer_ID = Book_Issue.Customer_ID
INNER JOIN Books ON Book_Issue.Book_ID = Books.Book_ID;

SELECT Customer.Customer_Name, Customer.Email, Books.Book_Title, Book_Issue.Issue_Date FROM Customer LEFT JOIN Book_Issue ON Customer.Customer_ID = Book_Issue.Customer_ID
LEFT JOIN Books ON Book_Issue.Book_ID = Books.Book_ID;

SELECT Customer.Customer_Name, Customer.Email, Books.Book_Title, Book_Issue.Issue_Date FROM Customer RIGHT JOIN Book_Issue ON Customer.Customer_ID = Book_Issue.Customer_ID
RIGHT JOIN Books ON Book_Issue.Book_ID = Books.Book_ID;

SELECT Customer.Customer_Name, Customer.Email, Books.Book_Title, Book_Issue.Issue_Date FROM Customer FULL JOIN Book_Issue ON Customer.Customer_ID = Book_Issue.Customer_ID
FULL JOIN Books ON Book_Issue.Book_ID = Books.Book_ID;