--6.14 Tạo một Trigger cập nhật số lượng sách khi có sinh viên mượn hoặc trả sách
CREATE TRIGGER UpdateBookQuantity
ON LoanCodeDetail
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    IF (EXISTS (SELECT * FROM inserted) OR EXISTS (SELECT * FROM deleted))
    BEGIN
        UPDATE B
        SET B.NumOfCopy = B.NumOfCopy - (SELECT COUNT(*) FROM inserted) + (SELECT COUNT(*) FROM deleted)
        FROM Book AS B
        WHERE EXISTS (SELECT 1 FROM inserted WHERE inserted.BookID = B.BookID)
            OR EXISTS (SELECT 1 FROM deleted WHERE deleted.BookID = B.BookID);
    END
END;
