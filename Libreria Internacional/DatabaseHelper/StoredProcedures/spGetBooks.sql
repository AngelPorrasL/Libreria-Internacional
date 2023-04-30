USE [Libreria]
GO
/****** Object:  StoredProcedure [dbo].[spGetBooks]    Script Date: 26/4/2023 15:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetBooks] 
	
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
END
