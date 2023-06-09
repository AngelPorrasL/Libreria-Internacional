USE [Libreria]
GO
/****** Object:  StoredProcedure [dbo].[spSearch]    Script Date: 26/4/2023 15:30:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spSearch]
    @isbn INT = NULL,
    @title VARCHAR(50) = NULL
AS
BEGIN
    IF (@isbn IS NOT NULL)
    BEGIN
        SELECT 
            id,
            isbn,
            title,
            autor,
            publication,
            photo,
            price
        FROM Books
        WHERE isbn = @isbn
    END
    ELSE IF (@title IS NOT NULL)
    BEGIN
        SELECT 
            id,
            isbn,
            title,
            autor,
            publication,
            photo,
            price
        FROM Books
        WHERE title LIKE '%' + @title + '%'
    END
END
