create database LibraryManagementSystem;
use LibraryManagementSystem;

create table Books(
Book_ID INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
Book_Title VARCHAR(50),
Book_Author VARCHAR(100),
Book_Category VARCHAR(100),
Issue_Date varchar(100)
);
CREATE PROCEDURE include
@Book_Title VARCHAR(50),
@Book_Author VARCHAR(100),
@Book_Category VARCHAR(100),
@Issue_Date varchar(100)
as
Insert into Books(Book_Title, Book_Author, Book_Category, Issue_Date) values(@Book_Title, @Book_Author, @Book_Category, @Issue_Date)
go
EXEC include @Book_Title = 'Big Little Lies', @Book_Author='Liane Moriarty', @Book_Category = 'Thriller', @Issue_Date='23-05-2017'
EXEC include @Book_Title = 'The Great Gatsby',    @Book_Author='F. Scott Fitzgerald',@Book_Category = 'Classic Fiction', @Issue_Date='23-05-2020'
EXEC include @Book_Title = 'The Silent Patient',     @Book_Author='Alex Michaelides', @Book_Category = 'Thriller', @Issue_Date='23-05-2022'
EXEC include @Book_Title = 'Catch-22', @Book_Author='Joseph Heller',  @Book_Category = 'Comedy', @Issue_Date='23-05-2024'
select * from Books;

CREATE PROCEDURE select_all
as
select * from Books;
go
EXEC select_all;

CREATE PROCEDURE edit
@Book_Id int,
@Book_Title VARCHAR(50),
@Book_Author VARCHAR(100)
as
update Books set Book_Title= @Book_Title, Book_Author = @Book_Author
where Book_Id = @Book_Id
go
EXEC edit @Book_Title = 'Brave New World', @Book_Author = 'Aldous Huxley', @Book_Id = '2'
select * from Books;

create procedure Search
@Book_Title VARCHAR(50)
as
select * FROM Books WHERE  Book_Title = @Book_Title
go
Exec Search @Book_Title ='Big Little Lies'

CREATE PROCEDURE Deleted
@Book_Id int
as
DELETE FROM Books  WHERE  Book_ID = @Book_Id
go
EXEC Deleted @Book_Id = 4;
select * from Books;



