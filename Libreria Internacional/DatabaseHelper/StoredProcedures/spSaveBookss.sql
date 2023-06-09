USE [Libreria]
GO
/****** Object:  StoredProcedure [dbo].[spSaveBookss]    Script Date: 26/4/2023 15:24:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[spSaveBookss]
		@bookId INT,
		@email VARCHAR(50),
		@name VARCHAR(50),
		@lastname VARCHAR(50),
		@address VARCHAR(50),
		@country VARCHAR(50),
		@state VARCHAR(50),
		@zip INT,
		@ccnumber INT,
		@ccexpiration VARCHAR(50),
		@securitycode INT,
		@cost DECIMAL,
		@total DECIMAL
AS
BEGIN
	INSERT INTO [dbo].[BuyBooks]
           ([bookId]
           ,[email]
           ,[name]
           ,[lastname]
           ,[address]
		   ,[country]
           ,[state]
           ,[zip]
           ,[ccnumber]
           ,[ccexpiration]
		   ,[securitycode]
		   ,[cost]
		   ,[total])
     VALUES
           (@bookId
           ,@email
           ,@name
           ,@lastname
           ,@address
           ,@country
           ,@state
		   ,@zip
           ,@ccnumber
           ,@ccexpiration
           ,@securitycode
		   ,@cost
		   ,@total)
END
