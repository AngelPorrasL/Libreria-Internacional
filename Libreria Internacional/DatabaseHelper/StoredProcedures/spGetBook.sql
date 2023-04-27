USE [Libreria]
GO
/****** Object:  StoredProcedure [dbo].[spGetBook]    Script Date: 26/4/2023 15:24:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetBook] 
	 @id INT
AS
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
	WHERE id = @id
	
END
