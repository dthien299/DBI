CREATE TABLE TypeOfBook (
    GenreID NVARCHAR(30) PRIMARY KEY,
    GenreName NVARCHAR(30) NOT NULL
);

CREATE TABLE Student (
    StudentID NVARCHAR(30) PRIMARY KEY,
    EMAIL NVARCHAR(30) UNIQUE,
    PHONENUMBER NVARCHAR(10) UNIQUE
);

CREATE TABLE StudentTag (
    StudentID NVARCHAR(30) PRIMARY KEY REFERENCES Student(StudentID),
    StudentName NVARCHAR(30) NOT NULL,
    DateOfExpire DATE,
    Career NVARCHAR(30) NOT NULL
);

CREATE TABLE LoanCode (
    LoanID NVARCHAR(30) PRIMARY KEY,
    StudentID NVARCHAR(30),
    CONSTRAINT B FOREIGN KEY (StudentID) REFERENCES StudentTag(StudentID)
);

CREATE TABLE Book (
    BookID NVARCHAR(30) PRIMARY KEY,
    BookName NVARCHAR(50) NOT NULL,
    Publisher NVARCHAR(30) NOT NULL,
    Author NVARCHAR(30),
    NumOfPage INT CHECK(NumOfPage > 5),
    NumOfCopy INT CHECK(NumOfCopy > 1),
    Price INT CHECK (Price > 0),
    DateAdded DATE,
    Position NVARCHAR(30) NOT NULL,
    GenreID NVARCHAR(30) NOT NULL,
    CONSTRAINT A FOREIGN KEY (GenreID) REFERENCES TypeOfBook(GenreID)
);

CREATE TABLE LoanCodeDetail (
    LoanID NVARCHAR(30) NOT NULL,
    BookID NVARCHAR(30) NOT NULL,
    PRIMARY KEY(LoanID , BookID),
    BorrowedDate DATE,
    Returned NVARCHAR(1) NOT NULL, 
    CONSTRAINT C FOREIGN KEY (LoanID) REFERENCES LoanCode(LoanID),
    CONSTRAINT D FOREIGN KEY (BookID) REFERENCES Book(BookID)
);
