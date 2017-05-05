USE [master]
GO
/****** Object:  Database [onlineflorist]    Script Date: 05/05/2017 17:28:06 ******/
CREATE DATABASE [onlineflorist]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'onlineflorist', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\onlineflorist.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'onlineflorist_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\onlineflorist_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [onlineflorist] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [onlineflorist].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [onlineflorist] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [onlineflorist] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [onlineflorist] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [onlineflorist] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [onlineflorist] SET ARITHABORT OFF 
GO
ALTER DATABASE [onlineflorist] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [onlineflorist] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [onlineflorist] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [onlineflorist] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [onlineflorist] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [onlineflorist] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [onlineflorist] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [onlineflorist] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [onlineflorist] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [onlineflorist] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [onlineflorist] SET  DISABLE_BROKER 
GO
ALTER DATABASE [onlineflorist] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [onlineflorist] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [onlineflorist] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [onlineflorist] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [onlineflorist] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [onlineflorist] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [onlineflorist] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [onlineflorist] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [onlineflorist] SET  MULTI_USER 
GO
ALTER DATABASE [onlineflorist] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [onlineflorist] SET DB_CHAINING OFF 
GO
ALTER DATABASE [onlineflorist] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [onlineflorist] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [onlineflorist]
GO
/****** Object:  StoredProcedure [dbo].[spAddEditAddress]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddEditAddress]
(
	@AddressID int,
	@UserID int,
	@ContactName varchar(20),
	@AddressLine1 varchar(50),
	@AddressLine2 varchar(50),
	@City varchar(50),
	@State varchar(50),
	@Country varchar(50),
	@PinCode varchar(10),
	@Note varchar(100),
	@AddEditOption int
) 
AS
BEGIN
SET NOCOUNT ON;
IF @AddEditOption = 0
	BEGIN
		INSERT INTO Address
		(
			UserID,ContactName,AddressLine1,AddressLine2,City,[State],Country,PinCode,Note
		)
		VALUES
		(
			@UserID,@ContactName,@AddressLine1 ,@AddressLine2,@City,@State,@Country,@PinCode,@Note
		)
		IF @@ERROR > 0 GOTO PROBLEM
			RETURN @@Identity
	END
ELSE IF @AddEditOption = 1
BEGIN
			UPDATE [Address] SET			
			ContactName=@ContactName,
			AddressLine1=@AddressLine1,
			AddressLine2=@AddressLine2,
			City=@City,
			[State]=@State,
			Country=@Country,
			PinCode=@PinCode,
			Note=@Note
			WHERE AddressID = @AddressID
			IF @@ERROR > 0 GOTO PROBLEM
			RETURN @AddressID
		END
PROBLEM:
	RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[spAddEditUser]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[spAddEditUser]
(	
	@UserID	int,
	@Username	nvarchar(20),
	@Password	nvarchar(200),
	@EmailID	varchar(100),
	@Phonenumber	varchar(20),
	@IsDelete	bit,
	@IsEmailVerified	bit,
		
	@AddEditOption		INT --0 Add,  1 Edit/Modify
)
AS
BEGIN
	SET NOCOUNT ON;
	IF @AddEditOption = 0
	BEGIN
		IF NOT EXISTS(SELECT Username FROM Users where username = @Username)
		BEGIN
			INSERT INTO Users
				(
					Username, [Password], EmailID, Phonenumber, IsDelete, IsEmailVerified, AuditDate

				)
			VALUES 
				(
					@Username, @Password, @EmailID, @Phonenumber, @IsDelete, @IsEmailVerified, GETDATE()
				)
				IF @@ERROR > 0 GOTO PROBLEM
				RETURN @@Identity
		END
		ELSE
		BEGIN
			RETURN @@Error
		END
	END
	ELSE IF @AddEditOption = 1
	BEGIN
		IF NOT EXISTS(SELECT UserName FROM Users WHERE UserID <> @UserID)
		BEGIN
			UPDATE Users SET			
			UserName = @UserName
			WHERE UserID = @UserID
			IF @@ERROR > 0 GOTO PROBLEM
			RETURN @UserID
		END
		ELSE
		BEGIN
			RETURN @@Error
		END
	END

PROBLEM:
	RETURN -1
END
GO
/****** Object:  StoredProcedure [dbo].[spAddPaymentDetails]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spAddPaymentDetails]
(
	@PaymentID int,
	@UserID int,
	@OrderID int,
	@CardNo numeric,
	@CVVNo int,
	@Amount int,
	@ServiceTaxAmt int,
	@TotalPayAmt int,
	@CouponCode varchar(10),
	@PaymentStatus bit,
	@PaymentMethod varchar(20)

)
AS
BEGIN
	SET NOCOUNT ON;
INSERT INTO Payment
		(
			UserID,OrderID,CardNo,CVVNo,Amount,ServiceTaxAmt,TotalPayAmt,CouponCode,PaymentStatus,PaymentMethod
		)
		VALUES
		(
			@UserID,@OrderID,@CardNo,@CVVNo,@Amount,@ServiceTaxAmt,@TotalPayAmt,@CouponCode,@PaymentStatus,@PaymentMethod
		)
		IF @@ERROR > 0 GOTO PROBLEM
			RETURN @@Identity
PROBLEM:
	RETURN -1
END

GO
/****** Object:  StoredProcedure [dbo].[spCartDetails]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCartDetails]
	
AS
BEGIN

	SET NOCOUNT ON;
	SELECT 
	P.ProductID,
	P.ProductName,
	P.ProductPrice,
	P.ProductDescription,
	P.PictureFileName
	from
	Product P	
END

GO
/****** Object:  StoredProcedure [dbo].[spCompanyInfo]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCompanyInfo]
	
AS
BEGIN
SELECT 
CompanyName,
CompanyAddress,
CompanyState,
CompanyCountry,
CompanyPincode,
CompanyPhoneNo,
CompanyEmailID,
CompanyServiceTax,
CompanyTinNo,
CompanyWebsite,
CompanyLogo

FROM
CompanyInfo
END

GO
/****** Object:  StoredProcedure [dbo].[spEditContactInfo]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spEditContactInfo]

@CompanyName varchar(50),
@CompanyAddress varchar(50),
@CompanyState varchar(50),
@CompanyCountry varchar(50),
@CompanyPincode varchar(50),
@CompanyPhoneNo int,
@CompanyEmailID varchar(50),
@CompanyServiceTax varchar(50),
@CompanyTinNo varchar(50),
@CompanyWebsite varchar(50),
@CompanyLogo varchar(50)

AS
BEGIN
	
	SET NOCOUNT ON;
	UPDATE CompanyInfo SET			
			CompanyName=@CompanyName,
			CompanyAddress=@CompanyAddress,
			CompanyState=@CompanyState,
			CompanyCountry=@CompanyCountry,
			CompanyPincode=@CompanyPincode,
			CompanyPhoneNo=@CompanyPhoneNo,
			CompanyEmailID=@CompanyEmailID,
			CompanyServiceTax=@CompanyServiceTax,
			@CompanyTinNo=@CompanyTinNo,
			@CompanyWebsite=@CompanyWebsite,
			CompanyLogo=@CompanyLogo

			WHERE CompanyID = 1
  
END

GO
/****** Object:  StoredProcedure [dbo].[spGetCategoryList]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetCategoryList]
	
AS
BEGIN
	
	SET NOCOUNT ON;

  Select CategoryID,CategoryName,PageName from Category
END

GO
/****** Object:  StoredProcedure [dbo].[spGetCompanyInfo]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCompanyInfo]	
AS
BEGIN
SELECT 
CompanyName,
CompanyAddress,
CompanyState,
CompanyCountry,
CompanyPincode,
CompanyPhoneNo,
CompanyEmailID,
CompanyServiceTax,
CompanyTinNo,
CompanyWebsite,
CompanyLogo

FROM
CompanyInfo
END

GO
/****** Object:  StoredProcedure [dbo].[spGetLoginUserDetail]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetLoginUserDetail]
(
	@UserName	VARCHAR(20),
	@Password	VARCHAR(200)
)
AS
BEGIN
	SELECT UserID,
	Username,
	[Password] as PasswordText,
	EmailID,
	Phonenumber,
	IsDelete,
	IsEmailVerified,
	AuditDate
	FROM [Users] 
	WHERE UserName = @UserName AND [Password] = @Password
	ORDER BY UserName
END
GO
/****** Object:  StoredProcedure [dbo].[spGetProductInfo]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetProductInfo] 
@ProductCategoryID	int
AS
BEGIN
If @ProductCategoryID=0
BEGIN
SELECT 
ProductID,
ProductName,
ProductPrice,
ProductDescription,
ProductCategoryID,
PictureFileName,
IsEnable
FROM
Product
END
Else
BEGIN
SELECT 
ProductID,
ProductName,
ProductPrice,
ProductDescription,
ProductCategoryID,
PictureFileName,
IsEnable
FROM
Product
where ProductCategoryID = @ProductCategoryID
END
END
GO
/****** Object:  StoredProcedure [dbo].[spGetProductInfoByProductID]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetProductInfoByProductID]
@ProductID	int
AS
BEGIN
SELECT 
ProductID,
ProductName,
ProductPrice,
ProductDescription,
ProductCategory,
PictureFileName,
IsEnable
FROM
Product
where ProductID = @ProductID
END
GO
/****** Object:  StoredProcedure [dbo].[spGetTopProductInfo]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGetTopProductInfo]
	
AS
BEGIN
	
	SET NOCOUNT ON;

    
	SELECT top(10)
		ProductID,
		ProductName,
		ProductPrice,
		ProductDescription,
		ProductCategoryID,
		PictureFileName,
		IsEnable
	FROM
		Product
END

GO
/****** Object:  StoredProcedure [dbo].[spProductInfo]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spProductInfo]
AS
BEGIN
SELECT 
ProductID,
ProductName,
ProductPrice,
ProductDescription,
ProductCategory,
PictureFileName,
IsEnable
FROM
Product
END
GO
/****** Object:  StoredProcedure [dbo].[spSaveContactedInfoOfUser]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spSaveContactedInfoOfUser]
	
(	@ContactName varchar(50),
	@ContactSubject varchar(50),
	@ContactMessage varchar(100),
	@ContactPhoneNo int,
	@ContactEmail varchar(50)
)

AS
BEGIN
	
	SET NOCOUNT ON;

    Insert into ContactUs
	(
		ContactName,
		ContactSubject,
		ContactMessage,
		ContactPhoneNo,
		ContactEmail
	)
	values
	(
		@ContactName,
		@ContactSubject,
		@ContactMessage,
		@ContactPhoneNo,
		@ContactEmail 
	)

END

GO
/****** Object:  Table [dbo].[Address]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ContactName] [varchar](20) NOT NULL,
	[AddressLine1] [varchar](50) NOT NULL,
	[AddressLine2] [varchar](50) NULL,
	[City] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[PinCode] [varchar](10) NOT NULL,
	[Note] [varchar](100) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[UserID] [int] NULL,
	[PaymentID] [int] NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](50) NOT NULL,
	[PageName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyInfo]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyInfo](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[CompanyAddress] [varchar](100) NOT NULL,
	[CompanyState] [varchar](50) NOT NULL,
	[CompanyCountry] [varchar](50) NOT NULL,
	[CompanyPincode] [varchar](50) NOT NULL,
	[CompanyPhoneNo] [int] NOT NULL,
	[CompanyEmailID] [varchar](50) NOT NULL,
	[CompanyServiceTax] [varchar](20) NOT NULL,
	[CompanyTinNo] [varchar](25) NOT NULL,
	[CompanyWebsite] [varchar](50) NOT NULL,
	[CompanyLogo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CompanyInfo1] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactUs]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ContactUs](
	[ContactUsID] [int] IDENTITY(1,1) NOT NULL,
	[ContactName] [varchar](50) NOT NULL,
	[ContactSubject] [varchar](50) NOT NULL,
	[ContactMessage] [varchar](100) NOT NULL,
	[ContactPhoneNo] [bigint] NOT NULL,
	[ContactEmail] [varchar](50) NOT NULL,
	[AuditDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ContactUs] PRIMARY KEY CLUSTERED 
(
	[ContactUsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[CardNo] [numeric](20, 0) NULL,
	[CVVNo] [int] NULL,
	[Amount] [int] NOT NULL,
	[ServiceTaxAmt] [int] NULL,
	[TotalPayAmt] [int] NOT NULL,
	[CouponCode] [varchar](10) NULL,
	[PaymentStatus] [bit] NOT NULL,
	[PaymentMethod] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](20) NOT NULL,
	[ProductPrice] [int] NOT NULL,
	[ProductDescription] [nvarchar](100) NULL,
	[ProductCategoryID] [int] NOT NULL,
	[PictureFileName] [nvarchar](50) NOT NULL,
	[IsEnable] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 05/05/2017 17:28:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] NOT NULL,
	[Username] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
	[EmailID] [varchar](100) NOT NULL,
	[Phonenumber] [varchar](20) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[IsEmailVerified] [bit] NULL,
	[AuditDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressID], [UserID], [ContactName], [AddressLine1], [AddressLine2], [City], [State], [Country], [PinCode], [Note]) VALUES (1, 1, N'rebecca', N'jonas hall', N'christ university', N'bangalore', N'karnataka', N'india', N'5600123', N'dairy circle')
INSERT [dbo].[Address] ([AddressID], [UserID], [ContactName], [AddressLine1], [AddressLine2], [City], [State], [Country], [PinCode], [Note]) VALUES (2, 2, N'rajesh', N'89 james colony', N'mylapore', N'chennai', N'tamilnadu', N'India', N'600004', N'please send the product at 3 o''clock')
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Cart] ON 

INSERT [dbo].[Cart] ([CartID], [ProductID], [UserID], [PaymentID]) VALUES (1, 2, 1, NULL)
INSERT [dbo].[Cart] ([CartID], [ProductID], [UserID], [PaymentID]) VALUES (2, 5, 1, NULL)
INSERT [dbo].[Cart] ([CartID], [ProductID], [UserID], [PaymentID]) VALUES (3, 3, 3, NULL)
SET IDENTITY_INSERT [dbo].[Cart] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [PageName]) VALUES (2, N'Birthday', N'Birthday.aspx')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [PageName]) VALUES (3, N'Anniversary', N'Anniversary.aspx')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [PageName]) VALUES (4, N'Wedding', N'Wedding.aspx')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [PageName]) VALUES (5, N'Getwell Flowers', N'GetwellFlowers.aspx')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [PageName]) VALUES (6, N'Romance', N'Romance.aspx')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [PageName]) VALUES (7, N'Sympathy', N'Sympathy.aspx')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [PageName]) VALUES (9, N'Fruit Basket', N'FruitBasket.aspx')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [PageName]) VALUES (10, N'NewBorn', N'NewBorn.aspx')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[CompanyInfo] ON 

INSERT [dbo].[CompanyInfo] ([CompanyID], [CompanyName], [CompanyAddress], [CompanyState], [CompanyCountry], [CompanyPincode], [CompanyPhoneNo], [CompanyEmailID], [CompanyServiceTax], [CompanyTinNo], [CompanyWebsite], [CompanyLogo]) VALUES (1, N'Blooms and Blossoms', N'Anna Nagar Chennai', N'Tamil Nadu', N'India', N'1541057', 123456789, N'blooms@gmail.com', N'50', N'12345', N'bloomsandblossoms.com', N'~/productImages/lily.png')
SET IDENTITY_INSERT [dbo].[CompanyInfo] OFF
SET IDENTITY_INSERT [dbo].[ContactUs] ON 

INSERT [dbo].[ContactUs] ([ContactUsID], [ContactName], [ContactSubject], [ContactMessage], [ContactPhoneNo], [ContactEmail], [AuditDate]) VALUES (1, N'rebecca', N'rebeccajo97@gmail.com', N'not delivered', 12345, N'order', CAST(0x0000A76901030CAF AS DateTime))
INSERT [dbo].[ContactUs] ([ContactUsID], [ContactName], [ContactSubject], [ContactMessage], [ContactPhoneNo], [ContactEmail], [AuditDate]) VALUES (2, N'rebecca', N'rebeccajo97@gmail.com', N'not delivered', 12345, N'order', CAST(0x0000A7690103203C AS DateTime))
INSERT [dbo].[ContactUs] ([ContactUsID], [ContactName], [ContactSubject], [ContactMessage], [ContactPhoneNo], [ContactEmail], [AuditDate]) VALUES (3, N'susan', N'delivery', N'received some other product', 5678, N'susan@gmail.com', CAST(0x0000A769010487EC AS DateTime))
INSERT [dbo].[ContactUs] ([ContactUsID], [ContactName], [ContactSubject], [ContactMessage], [ContactPhoneNo], [ContactEmail], [AuditDate]) VALUES (4, N'samdoss', N'time', N'not delivered on time', 88554, N'samdoss@live.com', CAST(0x0000A76901053074 AS DateTime))
SET IDENTITY_INSERT [dbo].[ContactUs] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (1, N'Birthday Rose', 599, N'Bouquet and Teddy', 2, N'~/productImages/BD1.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (2, N'Birthday Mix Rose', 625, N'Bouquet', 2, N'~/productImages/BD2.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (3, N'Birthday Bouquet', 675, N'Bouquet', 2, N'~/productImages/BD3.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (4, N'Birthday Basket', 775, N'Basket', 2, N'~/productImages/BD4.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (5, N'Birthday Basket Rose', 1090, N'Basket', 2, N'~/productImages/BD5.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (10, N'Pink Bouquet', 350, N'Bouquet', 3, N'~/productImages/A1.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (11, N'Anniversary Basket', 925, N'Basket', 3, N'~/productImages/A2.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (12, N'Mixed Bouquet', 850, N'Bouquet', 3, N'~/productImages/A3.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (13, N'Special Bouquet', 600, N'Bouquet', 3, N'~/productImages/A4.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (14, N'Rose Bouquet', 625, N'Bouquet', 3, N'~/productImages/A5.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (19, N'Special Bouquet', 599, N'Bouquet', 4, N'~/productImages/W1.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (20, N'Mix Roses', 890, N'Bouquet', 4, N'~/productImages/W2.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (21, N'Rose Basket', 775, N'Basket', 4, N'~/productImages/W3.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (22, N'Heart Bouquet', 1500, N'Bouquet', 4, N'~/productImages/W4.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (23, N'Special Roses', 875, N'Bouquet', 4, N'~/productImages/W5.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (24, N'Mixed Flowers', 890, N'Bouquet', 5, N'~/productImages/G1.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (25, N'Fruits and Roses', 1112, N'Bouquet', 5, N'~/productImages/G2.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (26, N'Rose', 1050, N'Basket', 5, N'~/productImages/G3.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (27, N'Mixed Flower & Fruit', 849, N'Bouquet', 5, N'~/productImages/G4.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (28, N'Special Roses', 825, N'Bouquet', 5, N'~/productImages/G5.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (29, N'Special Roses', 1200, N'Bouquet', 6, N'~/productImages/R1.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (30, N'Pink and Purple', 1500, N'Basket', 6, N'~/productImages/R2.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (31, N'Rose Heart', 1500, N'Basket', 6, N'~/productImages/R3.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (32, N'Roses & Lily', 1225, N'Basket', 6, N'~/productImages/R4.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (33, N'Roses', 600, N'Bouquet', 6, N'~/productImages/R5.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (34, N'Special', 2199, N'Wreath', 7, N'~/productImages/S1.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (35, N'Two Coloured', 799, N'Wreath', 7, N'~/productImages/S2.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (36, N'Mixed', 899, N'Wreath', 7, N'~/productImages/S3.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (37, N'White', 700, N'Wreath', 7, N'~/productImages/S4.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (38, N'Yellow', 1599, N'Wreath', 7, N'~/productImages/S5.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (39, N'Special Basket', 2000, N'Basket', 9, N'~/productImages/F1.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (40, N'Seasonal Basket', 1000, N'Basket', 9, N'~/productImages/F2.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (41, N'Regular Basket', 1500, N'Basket', 9, N'~/productImages/F3.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (42, N'Small Basket', 800, N'Basket', 9, N'~/productImages/F4.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (43, N'Decorated Basket', 1500, N'Basket', 9, N'~/productImages/F5.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (44, N'Mixed Bouquet', 630, N'Bouquet', 10, N'~/productImages/N1.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (45, N'Rose,Teddy,Chocolate', 1099, N'Bouquet', 10, N'~/productImages/N2.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (46, N'Teddy & Pink Flowers', 1005, N'Basket', 10, N'~/productImages/N3.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (47, N'Baloons', 525, N'Basket', 10, N'~/productImages/N4.png', 1)
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductPrice], [ProductDescription], [ProductCategoryID], [PictureFileName], [IsEnable]) VALUES (48, N'White & Yellow', 825, N'Basket', 10, N'~/productImages/N5.png', 1)
SET IDENTITY_INSERT [dbo].[Product] OFF
INSERT [dbo].[Users] ([UserID], [Username], [Password], [EmailID], [Phonenumber], [IsDelete], [IsEmailVerified], [AuditDate]) VALUES (1, N'samdoss', N'arthur', N'samdoss@live.com', N'9239280893', 0, 0, CAST(0x0000A7610121CA1C AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [Password], [EmailID], [Phonenumber], [IsDelete], [IsEmailVerified], [AuditDate]) VALUES (2, N'dfsf', N'sdfdsf', N'sdfssd', N'sdf', 0, 0, CAST(0x0000A76101257B57 AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [Password], [EmailID], [Phonenumber], [IsDelete], [IsEmailVerified], [AuditDate]) VALUES (3, N'susan', N'1234567', N'susan123@gmail.com', N'9987516204', 0, 0, CAST(0x0000A76300BC2E1F AS DateTime))
ALTER TABLE [dbo].[ContactUs] ADD  CONSTRAINT [DF_ContactUs_AuditDate]  DEFAULT (getdate()) FOR [AuditDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_AuditDate]  DEFAULT (getdate()) FOR [AuditDate]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Product] FOREIGN KEY([CartID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Product]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Users] FOREIGN KEY([CartID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Users]
GO
USE [master]
GO
ALTER DATABASE [onlineflorist] SET  READ_WRITE 
GO
