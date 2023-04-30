USE [Libreria]
GO
/****** Object:  StoredProcedure [dbo].[spDeleteBookCart]    Script Date: 26/4/2023 15:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spDeleteBookCart]
	@email VARCHAR(50),
	@buybookId INT
AS
BEGIN	
	DELETE FROM BuyBooks WHERE buybookId = @buybookId AND email = @email
END
