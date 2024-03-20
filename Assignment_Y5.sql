USE Assignment;

INSERT INTO TypeOfBook(GenreID,GenreName) VALUES 
  ('F01', 'Fiction'),
  ('IT01', 'IT Book'),
  ('E02', 'Economy Book'),
  ('E01', 'Education'),
  ('L02', 'Literature');

INSERT INTO StudentTag (StudentID, StudentName, DateOfExpire, Career) VALUES
  ('SE185443', 'Jane Smith', '2023-12-31', 'Software Engineering'),
  ('SE183170', 'John Doe', '2023-12-31', 'Computer Science'),
  ('SE183171', 'Jane Smith', '2023-12-31', 'Software Engineering'),
  ('SE183172', 'Robert Johnson', '2023-12-31', 'Marketing'),
  ('SE183173', 'Emily Turner', '2023-12-31', 'Economics'),
  ('SE183174', 'William Steele', '2023-12-31', 'Electrical Engineering'),
  ('SE183175', 'Alice Anderson', '2023-12-31', 'Mathematics'),
  ('SE183176', 'Michael Taylor', '2023-12-31', 'Chemistry'),
  ('SE183177', 'Sarah Turner', '2023-12-31', 'Business Administration');

INSERT INTO Student (StudentID, EMAIL, PHONENUMBER) VALUES
  ('SE185443', 'john.smith@fpt.edu.vn', '0123456787'),
  ('SE183170', 'john.doe@fpt.edu.vn', '0123456789'),
  ('SE183171', 'jane.smith@fpt.edu.vn', '0123456780'),
  ('SE183172', 'robert.johnson@fpt.edu.vn', '0123456781'),
  ('SE183173', 'emily.turner@fpt.edu.vn', '0123456782'),
  ('SE183174', 'william.steele@fpt.edu.vn', '0123456783'),
  ('SE183175', 'alice.anderson@fpt.edu.vn', '0123456784'),
  ('SE183176', 'michael.taylor@fpt.edu.vn', '0123456785'),
  ('SE183177', 'sarah.turner@fpt.edu.vn', '0123456786');

INSERT INTO Book (BookID, GenreID, BookName, Publisher, Author, Price, NumOfCopy, NumOfPage, Position, DateAdded) VALUES
  ('B001', 'F01', 'The Enigma', 'BlueSky Books', 'John Doe', 19.99, 50, 300, 'A-1', '2023-01-15'),
  ('B002', 'IT01', 'Code Mastery', 'Tech Insights Publishing', 'Jane Smith', 29.99, 30, 250, 'B-3', '2023-02-20'),
  ('B003', 'E02', 'Wealth Management', 'Financial Strategies Press', 'Robert Johnson', 39.99, 20, 200, 'C-2', '2023-03-10'),
  ('B004', 'E01', 'Learning Beyond Borders', 'Educational Excellence Publish', 'Emily White', 24.99, 40, 180, 'A-4', '2023-04-05'),
  ('B005', 'L02', 'Shadows of Time', 'Literary Journeys', 'William Black', 17.99, 60, 320, 'D-1', '2023-05-22'),
  ('B006', 'F01', 'Whispers in the Dark', 'Mystery Ink', 'Alice Turner', 21.99, 35, 280, 'B-2', '2023-06-12'),
  ('B007', 'IT01', 'Algorithmic Adventures', 'Tech Wonders Publishing', 'Michael Brown', 34.99, 25, 220, 'C-1', '2023-07-18'),
  ('B008', 'E02', 'Global Economic Trends', 'World Finance Insights', 'Sarah Anderson', 45.99, 15, 240, 'A-3', '2023-08-30'),
  ('B009', 'E01', 'Innovative Teaching Methods', 'Educational Visions', 'David Miller', 28.99, 45, 190, 'B-1', '2023-09-14'),
  ('B010', 'L02', 'Beyond the Horizon', 'Modern Literature Co.', 'Sophie Clark', 19.99, 55, 300, 'D-2', '2023-10-05'),
  ('B011', 'IT01', 'Introduction to SQL', 'Tech Books', 'John Smith', 29.99, 25, 220, 'C-3', '2023-11-10'),
  ('B012', 'IT01', 'Advanced SQL Techniques', 'Data Insights Publishing', 'Jane Johnson', 39.99, 20, 250, 'B-4', '2023-11-15');

INSERT INTO LoanCode (LoanID, StudentID) VALUES
  ('LC001', 'SE183170'),
  ('LC002', 'SE183171'),
  ('LC003', 'SE183172'),
  ('LC004', 'SE183173'),
  ('LC005', 'SE183174'),
  ('LC006', 'SE183175'),
  ('LC007', 'SE183176'),
  ('LC008', 'SE183177'),
  ('LC009', 'SE185443');

INSERT INTO LoanCodeDetail (LoanID, BookID, BorrowedDate, Returned, ReturnedDate) VALUES
  ('LC001', 'B001', '2023-01-20', 0),
  ('LC002', 'B003', '2023-02-05', 1, '2024-03-01'),
  ('LC003', 'B005', '2023-03-12', 0),
  ('LC004', 'B007', '2023-04-18', 1, '2024-01-15'),
  ('LC005', 'B009', '2023-01-25', 0),
  ('LC006', 'B002', '2023-06-02', 1, '2023-11-29'),
  ('LC007', 'B004', '2023-07-15', 0),
  ('LC008', 'B008', '2023-08-21', 1, '2023-12-16'),
  ('LC009', 'B007', '2023-01-30', 0);
