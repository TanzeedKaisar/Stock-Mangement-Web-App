USE [master]
GO
/****** Object:  Database [StockManagmentSystemDB]    Script Date: 5/5/2018 12:27:06 PM ******/
CREATE DATABASE [StockManagmentSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagmentSystemDB', FILENAME = N'D:\Abhi\Programming\Visual Studio\BITM\Project\StockManagmentSystemWebApp\Database\StockManagmentSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagmentSystemDB_log', FILENAME = N'D:\Abhi\Programming\Visual Studio\BITM\Project\StockManagmentSystemWebApp\Database\StockManagmentSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagmentSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagmentSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagmentSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagmentSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagmentSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagmentSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagmentSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagmentSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagmentSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagmentSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagmentSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagmentSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagmentSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagmentSystemDB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 5/5/2018 12:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 5/5/2018 12:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 5/5/2018 12:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[CompanyId] [int] NULL,
	[Name] [varchar](50) NULL,
	[Quantity] [int] NULL,
	[ReorderLevel] [int] NULL,
 CONSTRAINT [PK_Item_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockOut]    Script Date: 5/5/2018 12:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOut](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Method] [varchar](50) NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_StockOut] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[SellsItem]    Script Date: 5/5/2018 12:27:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[SellsItem]
AS
SELECT Item.Name ItemName, Com.Name CompanyName, SO.Quantity SellQuantity, SO.Date SellDate
FROM Company Com
INNER JOIN Item 
ON Item.CompanyId = Com.Id
INNER JOIN StockOut SO
ON SO.ItemId = Item.Id
WHERE Method = 'SELL'

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Biscuit')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Juice')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3, N'Mobile')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (4, N'Cosmetics')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1002, N'Dry Cake')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2010, N'Pen')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2011, N'Bela Biscuit')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3003, N'BackPack')
INSERT [dbo].[Category] ([Id], [Name]) VALUES (3004, N'Travel Gear')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Id], [Name]) VALUES (1, N'Pran')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (2, N'Kwality')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (3, N'Uniliver')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (4, N'Apple')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (5, N'Samsung')
INSERT [dbo].[Company] ([Id], [Name]) VALUES (2003, N'AmericanTourist')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Item] ON 

INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [Quantity], [ReorderLevel]) VALUES (1, 1, 1, N'Nuty', 60, 10)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [Quantity], [ReorderLevel]) VALUES (2, 1, 2, N'MilkMerry', 0, 12)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [Quantity], [ReorderLevel]) VALUES (4, 2, 1, N'Mango Juice', 238, 10)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [Quantity], [ReorderLevel]) VALUES (5, 1, 3, N'Milk Merry', 0, 12)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [Quantity], [ReorderLevel]) VALUES (6, 1, 3, N'Nuty', 10, 12)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [Quantity], [ReorderLevel]) VALUES (1002, 1002, 3, N'Sweet Cake', 130, 20)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [Quantity], [ReorderLevel]) VALUES (1003, 3, 4, N'iPhone 6s', 0, 10)
INSERT [dbo].[Item] ([Id], [CategoryId], [CompanyId], [Name], [Quantity], [ReorderLevel]) VALUES (2003, 3003, 2003, N'Anti Theft BackPack', 0, 10)
SET IDENTITY_INSERT [dbo].[Item] OFF
SET IDENTITY_INSERT [dbo].[StockOut] ON 

INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Method], [Date]) VALUES (1, 1002, 20, N'SELL', CAST(0x2E3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Method], [Date]) VALUES (2, 4, 54, N'SELL', CAST(0x2E3E0B00 AS Date))
INSERT [dbo].[StockOut] ([Id], [ItemId], [Quantity], [Method], [Date]) VALUES (3, 1002, 10, N'LOST', CAST(0x2E3E0B00 AS Date))
SET IDENTITY_INSERT [dbo].[StockOut] OFF
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Company] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Company] ([Id])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Company]
GO
ALTER TABLE [dbo].[StockOut]  WITH CHECK ADD  CONSTRAINT [FK_StockOut_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([Id])
GO
ALTER TABLE [dbo].[StockOut] CHECK CONSTRAINT [FK_StockOut_Item]
GO
USE [master]
GO
ALTER DATABASE [StockManagmentSystemDB] SET  READ_WRITE 
GO
