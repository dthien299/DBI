
--Y6
--6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả thuộc loại sách có mã “IT”.
SELECT BookName, BookID, Price, Author FROM Book WHERE GenreID = 'IT01'

--6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã sinh viên có ngày mượn trong tháng 01/2023
SELECT LC.LoanID, LCD.BookID, LCD.BorrowedDate, LC.StudentID FROM LoanCode LC JOIN LoanCodeDetail LCD ON  LC.LoanID = LCD.LoanID
WHERE MONTH(LCD.BorrowedDate) = 1

--6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viện theo thứ tự tăng dần của ngày mượn sách.
SELECT LC.LoanID, LC.StudentID, LCD.BorrowedDate FROM LoanCode LC 
JOIN LoanCodeDetail LCD 
ON LC.LoanID = LCD.LoanID
WHERE Returned = 1 ORDER BY BorrowedDate ASC
--SELECT *FROM LoanCodeDetail

--6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số lượng sách mỗi loại).
SELECT TB.GenreID, TB.GenreName, COUNT(B.BookID) AS Soluong FROM TypeOfBook TB 
JOIN Book B ON TB.GenreID = B.GenreID
GROUP BY TB.GenreID, TB.GenreName

--6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.
SELECT COUNT(DISTINCT StudentID) AS SoLuotMuonSach FROM LoanCode

--6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.
SELECT *FROM Book 
WHERE BookName LIKE '%SQL%'

--6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, 
--mã phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.
SELECT ST.StudentID, ST.StudentName, LC.LoanID, B.BookName, LCD.BorrowedDate, LCD.Returned, LCD.ReturnedDate
FROM StudentTag ST
JOIN LoanCode LC ON LC.StudentID = ST.StudentID
JOIN LoanCodeDetail LCD ON LCD.LoanID = LC.LoanID
JOIN Book B ON B.BookID = LCD.BookID

--6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 20 lần.
SELECT B.BookID, B.BookName, B.Publisher, B.Author, B.NumOfPage, B.NumOfCopy, B.Price, B.DateAdded, B.Position, B.GenreID FROM Book B
JOIN LoanCodeDetail LCD ON B.BookID = LCD.BookID
GROUP BY B.BookID, B.BookName, B.Publisher, B.Author, B.NumOfPage, B.NumOfCopy, B.Price, B.DateAdded, B.Position, B.GenreID
HAVING COUNT(LCD.BookID) > 1

--6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm tháng 3 năm 2023 giảm 30%.
UPDATE Book 
SET Price = Price - (Price * 0.3)
WHERE MONTH(DateAdded) < 3

--6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã sinh viên SE (ví dụ).
SELECT *FROM LoanCodeDetail

UPDATE LoanCodeDetail
SET Returned =  1, ReturnedDate = '2024-03-01'
WHERE LoanID IN (SELECT LoanID FROM LoanCode WHERE StudentID = 'SE183171');

--6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn, tên sinh viên, email, 
--danh sách các sách đã mượn, ngày mượn (với điều kiện quá hạn là ngày trả trễ hơn 6 tháng so ngày mượn hoặc từ ngày mượn
-- đến hiện tại lớn hơn 6 tháng).
SELECT LCD.LoanID, ST.StudentName, S.EMAIL, B.BookID, B.BookName, LCD.BorrowedDate
FROM StudentTag ST
JOIN Student S ON ST.StudentID = S.StudentID
JOIN LoanCode LC ON LC.StudentID = ST.StudentID
JOIN LoanCodeDetail LCD ON LC.LoanID = LCD.LoanID
JOIN Book B ON B.BookID = LCD.BookID
WHERE DATEDIFF(MONTH, BorrowedDate, ReturnedDate) > 6 OR DATEDIFF(MONTH, GETDATE(), ReturnedDate) > 6
--6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có lượt mượn lớn hơn 1
UPDATE B
SET B.NumOfCopy = B.NumOfCopy + 5 
FROM Book B
JOIN (SELECT BookID FROM LoanCodeDetail 
	GROUP BY BookID
	HAVING COUNT(BookID) > 1) AS LCD ON LCD.BookID = B.BookID

--6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước ‘1/1/2024’
DELETE FROM LoanCodeDetail 
WHERE YEAR(BorrowedDate) < 2024 AND YEAR(ReturnedDate) < 2024

