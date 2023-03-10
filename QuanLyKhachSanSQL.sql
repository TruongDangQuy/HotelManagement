USE [master]
GO
/****** Object:  Database [HotelManagement]    Script Date: 2/7/2023 9:56:17 AM ******/
CREATE DATABASE [HotelManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HotelManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\HotelManagement.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'HotelManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\HotelManagement_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [HotelManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HotelManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HotelManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HotelManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HotelManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HotelManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HotelManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [HotelManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [HotelManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HotelManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HotelManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HotelManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HotelManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HotelManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HotelManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HotelManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HotelManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [HotelManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HotelManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HotelManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HotelManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HotelManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HotelManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HotelManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HotelManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HotelManagement] SET  MULTI_USER 
GO
ALTER DATABASE [HotelManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HotelManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HotelManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HotelManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [HotelManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [HotelManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [HotelManagement] SET QUERY_STORE = OFF
GO
USE [HotelManagement]
GO
/****** Object:  Table [dbo].[access]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[access](
	[idjob] [int] NULL,
	[Idstafftype] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILL]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDReceiveRoom] [int] NOT NULL,
	[StaffSetUp] [nvarchar](100) NOT NULL,
	[DateOfCreate] [smalldatetime] NULL,
	[RoomPrice] [int] NOT NULL,
	[ServicePrice] [int] NOT NULL,
	[Surcharge] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[Discount] [int] NOT NULL,
	[IDStatusBill] [int] NOT NULL,
	[Paid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BILLDETAILS]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BILLDETAILS](
	[IDBill] [int] NOT NULL,
	[IDService] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[TotalPrice] [int] NOT NULL,
 CONSTRAINT [PK_BillInfo] PRIMARY KEY CLUSTERED 
(
	[IDService] ASC,
	[IDBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BOOKROOM]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BOOKROOM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDCustomer] [int] NOT NULL,
	[IDRoomType] [int] NOT NULL,
	[DateBookRoom] [smalldatetime] NOT NULL,
	[DateCheckIn] [date] NOT NULL,
	[DateCheckOut] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConvertString]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConvertString](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[string] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDCard] [nvarchar](100) NOT NULL,
	[IDCustomerType] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[Sex] [nvarchar](100) NOT NULL,
	[Nationality] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMERTYPE]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMERTYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[NameForm] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PARAMETER]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARAMETER](
	[Name] [nvarchar](200) NOT NULL,
	[Value] [float] NOT NULL,
	[Describe] [nvarchar](200) NULL,
	[datemodify] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECEIVEROOM]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECEIVEROOM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDBookRoom] [int] NOT NULL,
	[IDRoom] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECEIVEROOMDETAILS]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECEIVEROOMDETAILS](
	[IDReceiveRoom] [int] NOT NULL,
	[IDCustomerOther] [int] NOT NULL,
 CONSTRAINT [PK_ReceiveRoomDetails] PRIMARY KEY CLUSTERED 
(
	[IDReceiveRoom] ASC,
	[IDCustomerOther] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REPORTS]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REPORTS](
	[IDReport] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NULL,
	[rate] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[value] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROOM]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROOM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[IDRoomType] [int] NOT NULL,
	[IDStatusRoom] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ROOMTYPE]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ROOMTYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Price] [int] NOT NULL,
	[LimitPerson] [int] NOT NULL,
	[Bed] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERVICE]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVICE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[IDServiceType] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Picture] [image] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SERVICETYPE]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SERVICETYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STAFF]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STAFF](
	[UserName] [nvarchar](100) NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[PassWord] [nvarchar](100) NOT NULL,
	[IDStaffType] [int] NOT NULL,
	[IDCard] [nvarchar](100) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[Sex] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PhoneNumber] [int] NOT NULL,
	[StartDay] [date] NOT NULL,
	[Picture] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STAFFTYPE]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STAFFTYPE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATUSBILL]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUSBILL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STATUSROOM]    Script Date: 2/7/2023 9:56:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUSROOM](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (10, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (2, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (9, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (7, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (5, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (6, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (3, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (8, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (4, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (1, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (1, 2)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (2, 2)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (3, 2)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (51, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (10, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (52, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (53, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (54, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (55, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (56, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (57, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (58, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (59, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (60, 1)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (51, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (52, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (53, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (54, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (55, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (56, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (57, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (58, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (59, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (60, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (1, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (2, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (3, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (4, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (5, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (6, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (7, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (8, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (9, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (10, 3)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (1, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (2, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (3, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (4, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (5, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (6, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (7, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (8, 4)
INSERT [dbo].[access] ([idjob], [Idstafftype]) VALUES (9, 4)
GO
SET IDENTITY_INSERT [dbo].[BILL] ON 

INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (42, 36, N'quy', CAST(N'2022-12-07T11:33:00' AS SmallDateTime), 600000, 54000, 0, 654000, 15, 2, 1000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (43, 35, N'quy', CAST(N'2022-12-07T11:35:00' AS SmallDateTime), 600000, 150000, 0, 750000, 10, 2, 1000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (44, 37, N'quy', CAST(N'2022-12-08T14:06:00' AS SmallDateTime), 400000, 6012000, 0, 6412000, 5, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (45, 38, N'quy', CAST(N'2022-12-08T14:06:00' AS SmallDateTime), 200000, 0, 0, 200000, 5, 2, 1000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (46, 39, N'quy', CAST(N'2022-12-07T13:45:00' AS SmallDateTime), 3500000, 4780000, 0, 8280000, 30, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (47, 40, N'quy', CAST(N'2022-12-08T14:05:00' AS SmallDateTime), 1000000, 2500000, 0, 3500000, 10, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (48, 37, N'quy', CAST(N'2022-12-08T14:06:00' AS SmallDateTime), 400000, 0, 0, 400000, 5, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (49, 41, N'quy', CAST(N'2022-12-08T16:10:00' AS SmallDateTime), 700000, 180000, 0, 880000, 5, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (50, 38, N'quy', CAST(N'2023-02-06T17:14:00' AS SmallDateTime), 200000, 300000, 0, 500000, 0, 2, 600000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (51, 41, N'quy', CAST(N'2022-12-08T16:10:00' AS SmallDateTime), 700000, 10000000, 0, 10700000, 0, 2, 12000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (52, 42, N'quy', CAST(N'2022-12-13T00:16:00' AS SmallDateTime), 300000, 224000, 0, 524000, 15, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (53, 42, N'quy', CAST(N'2022-12-13T00:17:00' AS SmallDateTime), 300000, 0, 0, 0, 0, 1, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (54, 43, N'quy', CAST(N'2022-12-29T21:01:00' AS SmallDateTime), 200000, 244000, 0, 444000, 10, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (55, 45, N'quy', CAST(N'2023-01-04T11:05:00' AS SmallDateTime), 100000, 1950000, 0, 2050000, 0, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (56, 44, N'quy', CAST(N'2023-01-04T11:05:00' AS SmallDateTime), 600000, 1450000, -600000, 1450000, 0, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (57, 45, N'quy', CAST(N'2023-01-04T13:28:00' AS SmallDateTime), 100000, 24000, 0, 124000, 0, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (58, 46, N'quy', CAST(N'2023-01-04T11:06:00' AS SmallDateTime), 300000, 0, 0, 0, 0, 1, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (59, 45, N'quy', CAST(N'2023-01-04T22:03:00' AS SmallDateTime), 100000, 590000, 0, 690000, 10, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (61, 49, N'quy', CAST(N'2023-01-09T10:50:00' AS SmallDateTime), 300000, 250000, 0, 550000, 0, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (62, 50, N'quy', CAST(N'2023-01-09T15:45:00' AS SmallDateTime), 500000, 250000, -500000, 250000, 0, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (63, 51, N'quy', CAST(N'2023-01-09T13:32:00' AS SmallDateTime), 200000, 0, 0, 0, 0, 1, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (64, 50, N'quy', CAST(N'2023-01-10T13:50:00' AS SmallDateTime), 500000, 14000, -500000, 14000, 0, 2, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (66, 50, N'quy', CAST(N'2023-01-10T13:53:00' AS SmallDateTime), 500000, 0, -500000, 0, 0, 1, 10000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (67, 54, N'quy', CAST(N'2023-01-12T00:15:00' AS SmallDateTime), 100000, 4150000, 0, 4250000, 20, 2, 6000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (68, 55, N'quy', CAST(N'2023-01-12T00:13:00' AS SmallDateTime), 1000000, 500000, -1000000, 500000, 0, 2, 3000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (69, 54, N'quy', CAST(N'2023-01-12T00:16:00' AS SmallDateTime), 100000, 0, 0, 100000, 0, 2, 150000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (70, 53, N'quy', CAST(N'2023-01-12T11:18:00' AS SmallDateTime), 1500000, 0, 0, 1500000, 0, 2, 2000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (71, 56, N'quy', CAST(N'2023-02-06T16:25:00' AS SmallDateTime), 200000, 178000, 0, 378000, 6, 2, 200000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (72, 57, N'quy', CAST(N'2023-01-12T16:41:00' AS SmallDateTime), 500000, 28000, 0, 528000, 20, 2, 1000000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (73, 58, N'quy', CAST(N'2023-01-22T19:41:00' AS SmallDateTime), 900000, 0, 900000, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (74, 60, N'quy', CAST(N'2023-01-26T16:09:00' AS SmallDateTime), 200000, 250000, 40000, 490000, 0, 2, 500000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (75, 61, N'quy', CAST(N'2023-01-27T20:37:00' AS SmallDateTime), 200000, 0, 0, 200000, 16, 2, 400000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (76, 60, N'quy', CAST(N'2023-01-26T16:10:00' AS SmallDateTime), 200000, 0, 40000, 240000, 0, 2, 200000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (77, 63, N'quy', CAST(N'2023-01-27T20:36:00' AS SmallDateTime), 300000, 350000, 90000, 740000, 16, 2, 800000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (78, 64, N'quy', CAST(N'2023-01-27T11:31:00' AS SmallDateTime), 1500000, 0, -900000, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (79, 63, N'quy', CAST(N'2023-01-27T20:37:00' AS SmallDateTime), 300000, 0, 90000, 390000, 16, 2, 400000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (80, 68, N'quy', CAST(N'2023-02-01T10:47:00' AS SmallDateTime), 500000, 314000, 0, 814000, 20, 2, 900000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (81, 69, N'quy', CAST(N'2023-02-06T16:33:00' AS SmallDateTime), 100000, 750000, 0, 850000, 10, 2, 900000)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (82, 65, N'quy', CAST(N'2023-02-06T16:19:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (83, 69, N'quy', CAST(N'2023-02-06T16:19:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (84, 65, N'quy', CAST(N'2023-02-06T16:19:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (85, 65, N'quy', CAST(N'2023-02-06T16:25:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (86, 65, N'quy', CAST(N'2023-02-06T16:25:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (87, 69, N'quy', CAST(N'2023-02-06T16:26:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (88, 69, N'quy', CAST(N'2023-02-06T16:27:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (89, 69, N'quy', CAST(N'2023-02-06T16:28:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (90, 69, N'quy', CAST(N'2023-02-06T16:30:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (91, 69, N'quy', CAST(N'2023-02-06T16:31:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (92, 69, N'quy', CAST(N'2023-02-06T16:32:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (93, 70, N'quy', CAST(N'2023-02-06T16:34:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (94, 70, N'quy', CAST(N'2023-02-06T16:34:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (95, 70, N'quy', CAST(N'2023-02-06T16:56:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (96, 70, N'quy', CAST(N'2023-02-06T17:02:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (97, 71, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 500000, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (98, 70, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (99, 71, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (100, 71, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (101, 70, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (102, 71, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (103, 70, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (104, 71, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (105, 70, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (106, 71, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (107, 71, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (108, 70, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (109, 71, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (110, 71, N'quy', CAST(N'2023-02-06T17:04:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (111, 72, N'quy', CAST(N'2023-02-06T17:05:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (112, 70, N'quy', CAST(N'2023-02-06T17:05:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (113, 71, N'quy', CAST(N'2023-02-06T17:05:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (114, 72, N'quy', CAST(N'2023-02-06T17:06:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (115, 71, N'quy', CAST(N'2023-02-06T17:06:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (116, 73, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 2500000, 0, 2500000, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (117, 71, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (118, 73, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (119, 71, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (120, 72, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (121, 70, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (122, 73, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (123, 71, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (124, 73, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (125, 71, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (126, 73, N'quy', CAST(N'2023-02-06T17:08:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (127, 73, N'quy', CAST(N'2023-02-06T17:10:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (128, 73, N'quy', CAST(N'2023-02-06T17:14:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (129, 71, N'quy', CAST(N'2023-02-06T17:14:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (130, 73, N'quy', CAST(N'2023-02-06T17:14:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (131, 70, N'quy', CAST(N'2023-02-06T17:14:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (132, 72, N'quy', CAST(N'2023-02-06T17:14:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (133, 73, N'quy', CAST(N'2023-02-06T17:14:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (134, 73, N'quy', CAST(N'2023-02-06T17:14:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (135, 71, N'quy', CAST(N'2023-02-06T17:15:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (136, 73, N'quy', CAST(N'2023-02-06T17:15:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (137, 71, N'quy', CAST(N'2023-02-06T17:15:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (138, 72, N'quy', CAST(N'2023-02-06T17:37:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
INSERT [dbo].[BILL] ([ID], [IDReceiveRoom], [StaffSetUp], [DateOfCreate], [RoomPrice], [ServicePrice], [Surcharge], [TotalPrice], [Discount], [IDStatusBill], [Paid]) VALUES (139, 71, N'quy', CAST(N'2023-02-06T17:37:00' AS SmallDateTime), 0, 0, 0, 0, 0, 1, NULL)
SET IDENTITY_INSERT [dbo].[BILL] OFF
GO
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (64, 20, 1, 14000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (71, 20, 2, 28000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (72, 20, 2, 28000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (80, 20, 1, 14000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (97, 20, 1, 14000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (50, 22, 1, 50000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (67, 22, 10, 500000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (71, 22, 3, 150000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (73, 22, 1, 50000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (77, 22, 2, 100000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (80, 22, 1, 50000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (50, 27, 1, 250000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (61, 27, 1, 250000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (62, 27, 1, 250000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (66, 27, 2, 500000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (67, 27, 2, 500000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (68, 27, 2, 500000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (74, 27, 1, 250000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (77, 27, 1, 250000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (80, 27, 1, 250000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (81, 27, 3, 750000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (97, 27, 1, 250000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (66, 31, 2, 80000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (67, 32, 10, 450000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (67, 36, 10, 1200000)
INSERT [dbo].[BILLDETAILS] ([IDBill], [IDService], [Count], [TotalPrice]) VALUES (67, 37, 10, 1500000)
GO
SET IDENTITY_INSERT [dbo].[BOOKROOM] ON 

INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (35, 29, 2, CAST(N'2022-12-07T11:19:00' AS SmallDateTime), CAST(N'2022-12-07' AS Date), CAST(N'2022-12-09' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (36, 30, 2, CAST(N'2022-12-07T11:20:00' AS SmallDateTime), CAST(N'2022-12-07' AS Date), CAST(N'2022-12-10' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (37, 31, 3, CAST(N'2022-12-07T11:21:00' AS SmallDateTime), CAST(N'2022-12-07' AS Date), CAST(N'2022-12-11' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (38, 34, 1, CAST(N'2022-12-07T11:28:00' AS SmallDateTime), CAST(N'2022-12-07' AS Date), CAST(N'2022-12-08' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (39, 35, 4, CAST(N'2022-12-07T13:40:00' AS SmallDateTime), CAST(N'2022-12-07' AS Date), CAST(N'2022-12-14' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (40, 37, 4, CAST(N'2022-12-08T10:59:00' AS SmallDateTime), CAST(N'2022-12-08' AS Date), CAST(N'2022-12-10' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (41, 39, 2, CAST(N'2022-12-08T14:36:00' AS SmallDateTime), CAST(N'2022-12-08' AS Date), CAST(N'2022-12-15' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (42, 40, 2, CAST(N'2022-12-13T00:14:00' AS SmallDateTime), CAST(N'2022-12-13' AS Date), CAST(N'2022-12-16' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (43, 42, 2, CAST(N'2022-12-29T20:58:00' AS SmallDateTime), CAST(N'2022-12-29' AS Date), CAST(N'2022-12-31' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (44, 44, 2, CAST(N'2023-01-03T22:16:00' AS SmallDateTime), CAST(N'2023-01-03' AS Date), CAST(N'2023-01-06' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (45, 45, 1, CAST(N'2023-01-03T22:18:00' AS SmallDateTime), CAST(N'2023-01-03' AS Date), CAST(N'2023-01-04' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (46, 45, 3, CAST(N'2023-01-04T11:06:00' AS SmallDateTime), CAST(N'2023-01-04' AS Date), CAST(N'2023-01-05' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (47, 46, 4, CAST(N'2023-01-04T22:45:00' AS SmallDateTime), CAST(N'2023-01-04' AS Date), CAST(N'2023-01-06' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (49, 45, 3, CAST(N'2023-01-09T10:44:00' AS SmallDateTime), CAST(N'2023-01-09' AS Date), CAST(N'2023-01-10' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (50, 48, 1, CAST(N'2023-01-09T13:30:00' AS SmallDateTime), CAST(N'2023-01-09' AS Date), CAST(N'2023-01-10' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (51, 49, 1, CAST(N'2023-01-09T13:32:00' AS SmallDateTime), CAST(N'2023-01-09' AS Date), CAST(N'2023-01-10' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (53, 51, 4, CAST(N'2023-01-11T13:36:00' AS SmallDateTime), CAST(N'2023-01-11' AS Date), CAST(N'2023-01-14' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (54, 52, 2, CAST(N'2023-01-11T13:37:00' AS SmallDateTime), CAST(N'2023-01-11' AS Date), CAST(N'2023-01-12' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (55, 53, 1, CAST(N'2023-01-11T13:40:00' AS SmallDateTime), CAST(N'2023-01-11' AS Date), CAST(N'2023-01-13' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (56, 54, 1, CAST(N'2023-01-12T11:20:00' AS SmallDateTime), CAST(N'2023-01-12' AS Date), CAST(N'2023-01-14' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (57, 55, 1, CAST(N'2023-01-12T16:32:00' AS SmallDateTime), CAST(N'2023-01-12' AS Date), CAST(N'2023-01-13' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (58, 57, 3, CAST(N'2023-01-21T10:00:00' AS SmallDateTime), CAST(N'2023-01-21' AS Date), CAST(N'2023-01-24' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (60, 55, 1, CAST(N'2023-01-22T19:40:00' AS SmallDateTime), CAST(N'2023-01-22' AS Date), CAST(N'2023-01-23' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (61, 58, 1, CAST(N'2023-01-25T16:41:00' AS SmallDateTime), CAST(N'2023-01-25' AS Date), CAST(N'2023-01-27' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (62, 61, 2, CAST(N'2023-01-26T16:08:00' AS SmallDateTime), CAST(N'2023-01-26' AS Date), CAST(N'2023-01-28' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (63, 62, 2, CAST(N'2023-01-26T16:11:00' AS SmallDateTime), CAST(N'2023-01-26' AS Date), CAST(N'2023-01-27' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (64, 63, 2, CAST(N'2023-01-27T11:26:00' AS SmallDateTime), CAST(N'2023-01-27' AS Date), CAST(N'2023-01-30' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (65, 66, 1, CAST(N'2023-01-27T11:29:00' AS SmallDateTime), CAST(N'2023-01-27' AS Date), CAST(N'2023-01-30' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (66, 67, 2, CAST(N'2023-02-01T10:33:00' AS SmallDateTime), CAST(N'2023-02-01' AS Date), CAST(N'2023-02-08' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (67, 69, 2, CAST(N'2023-02-01T10:40:00' AS SmallDateTime), CAST(N'2023-02-01' AS Date), CAST(N'2023-02-04' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (68, 70, 1, CAST(N'2023-02-01T10:42:00' AS SmallDateTime), CAST(N'2023-02-01' AS Date), CAST(N'2023-02-04' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (69, 69, 4, CAST(N'2023-02-01T10:44:00' AS SmallDateTime), CAST(N'2023-02-01' AS Date), CAST(N'2023-02-02' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (70, 71, 2, CAST(N'2023-02-06T16:01:00' AS SmallDateTime), CAST(N'2023-02-06' AS Date), CAST(N'2023-02-07' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (71, 72, 1, CAST(N'2023-02-06T16:34:00' AS SmallDateTime), CAST(N'2023-02-06' AS Date), CAST(N'2023-02-07' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (72, 73, 4, CAST(N'2023-02-06T17:03:00' AS SmallDateTime), CAST(N'2023-02-06' AS Date), CAST(N'2023-02-07' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (73, 74, 3, CAST(N'2023-02-06T17:05:00' AS SmallDateTime), CAST(N'2023-02-06' AS Date), CAST(N'2023-02-09' AS Date))
INSERT [dbo].[BOOKROOM] ([ID], [IDCustomer], [IDRoomType], [DateBookRoom], [DateCheckIn], [DateCheckOut]) VALUES (74, 75, 1, CAST(N'2023-02-06T17:08:00' AS SmallDateTime), CAST(N'2023-02-06' AS Date), CAST(N'2023-02-11' AS Date))
SET IDENTITY_INSERT [dbo].[BOOKROOM] OFF
GO
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (29, N'788654', 2, N'Trần Văn Hoà', CAST(N'1998-04-06' AS Date), N'Lạng Sơn', 98911526, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (30, N'7998653', 1, N'Nguyễn Ngọc Linh', CAST(N'1998-04-06' AS Date), N'Bình Thạnh', 397881562, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (31, N'7998163', 3, N'Phan Thị Bảo Trân', CAST(N'1998-04-06' AS Date), N'Biên Hoà', 991653114, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (32, N'998713', 2, N'Nguyễn Mai Hương', CAST(N'1998-04-06' AS Date), N'Bình Tân', 991562337, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (33, N'99156245', 1, N'Trương Đăng Quý', CAST(N'1998-04-06' AS Date), N'Biên Hoà', 388159145, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (34, N'9987613', 2, N'Trần Đức Tiến', CAST(N'1998-04-06' AS Date), N'Bình Tân', 99871562, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (35, N'7971144451', 1, N'Bùi Thuỵ Diễm Quỳnh', CAST(N'2001-08-20' AS Date), N'Biên Hoà', 797115262, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (36, N'7984415', 1, N'Trương Đăng Quý', CAST(N'2001-03-08' AS Date), N'Biên Hoà', 388159145, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (37, N'7864132', 1, N'Nguyễn Hải Ly', CAST(N'1998-04-06' AS Date), N'Hà Nội', 999888111, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (38, N'111888999', 2, N'Trần Minh Hải', CAST(N'1998-04-06' AS Date), N'Hà Nội', 99888145, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (39, N'78856661', 2, N'Trần Văn Đại', CAST(N'1998-04-16' AS Date), N'An Giang', 999888123, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (40, N'777888999', 2, N'Trần Hải Duyên', CAST(N'1998-04-10' AS Date), N'Tân An', 99988111, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (41, N'888999', 2, N'Nguyễn Văn Khánh', CAST(N'1998-04-06' AS Date), N'Bình Hưng', 999123456, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (42, N'900078123', 2, N'Trần Nhân Tông', CAST(N'1998-04-06' AS Date), N'Văn Lang', 999111888, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (43, N'98888', 2, N'Nguyễn Văn Trà', CAST(N'1998-04-06' AS Date), N'Bắc Ninh', 999888156, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (44, N'8997613', 1, N'Nguyen Ngoc Gia Han', CAST(N'1998-04-06' AS Date), N'NewYork', 998116552, N'Nữ', N'Hoa Kỳ')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (45, N'123', 1, N'A', CAST(N'1998-04-06' AS Date), N'123', 123, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (46, N'777888123', 2, N'NguyenVanHa', CAST(N'1998-04-06' AS Date), N'Nam Ninh', 998156377, N'Nữ', N'Trung Quốc')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (48, N'3321456', 1, N'Peter', CAST(N'1998-04-06' AS Date), N'abc', 986674, N'Nam', N'Trung Quốc')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (49, N'34567', 2, N'Dũng Trí', CAST(N'1998-04-06' AS Date), N'qwe', 4557890, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (51, N'68970', 1, N'Hiếu Ngân', CAST(N'1998-04-06' AS Date), N'Biên Hoà', 398116732, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (52, N'12779', 1, N'Gia Hân', CAST(N'1998-04-06' AS Date), N'Bắc Kạn', 56789, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (53, N'3456789', 3, N'Vân Nguyễn', CAST(N'1998-04-06' AS Date), N'Nam Ninh', 998123, N'Nữ', N'Trung Quốc')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (54, N'777888300', 2, N'BaoBao', CAST(N'1998-04-06' AS Date), N'BinhThanh', 998167452, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (55, N'7789123', 2, N'Quy3', CAST(N'1998-04-06' AS Date), N'TanBinh', 988156789, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (56, N'788999123', 2, N'Ngan', CAST(N'1998-04-08' AS Date), N'BinhThanh', 99815672, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (57, N'77891230', 1, N'Alesix Mac Allister', CAST(N'1998-04-06' AS Date), N'Brunes Aires', 99111237, N'Nam', N'Tây Ban Nha')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (58, N'67511245', 2, N'Nguyễn Hữu Thọ', CAST(N'1998-04-06' AS Date), N'Tân Bình', 998115677, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (59, N'7781652', 3, N'Văn Triều', CAST(N'1998-04-06' AS Date), N'Bình Thạnh', 9917852, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (60, N'778129992', 2, N'Lý Thái Tông', CAST(N'1998-04-06' AS Date), N'Bình Thạnh', 991827651, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (61, N'32145', 1, N'Nguyen Van Tai', CAST(N'2014-07-01' AS Date), N'Tan Thuan Tay', 99916728, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (62, N'88791923', 1, N'Van Anh Hai', CAST(N'2014-01-06' AS Date), N'Van Ha Nam', 99167821, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (63, N'77815263', 2, N'Nguyễn Văn Bảo', CAST(N'1998-04-06' AS Date), N'Bình Phước', 991726832, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (64, N'78816723', 1, N'Nguyễn Ngọc Gia Hân', CAST(N'1998-04-06' AS Date), N'Bình Phước', 991826737, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (65, N'788192032', 2, N'Tô Ngọc Như', CAST(N'1998-04-06' AS Date), N'Bình Phước', 99917283, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (66, N'78615278', 1, N'Alex Anord', CAST(N'1998-04-06' AS Date), N'San, Fransico', 77812345, N'Nam', N'Hoa Kỳ')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (67, N'77819292', 1, N'Nguyễn Ngọc Khánh Ly', CAST(N'2001-01-06' AS Date), N'Biên Hoà', 99172821, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (68, N'77981526', 2, N'Trần Văn An', CAST(N'1998-04-06' AS Date), N'Biên Hoà', 77917283, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (69, N'77819231', 1, N'Ngọc Vy', CAST(N'2001-01-06' AS Date), N'TPHCM', 99118272, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (70, N'7781923', 1, N'Ngọc ÂN', CAST(N'1998-04-06' AS Date), N'Biên Hoà', 99182671, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (71, N'791652602', 1, N'Nguyễn Quốc Anh', CAST(N'1998-04-06' AS Date), N'Tân Phú', 98817263, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (72, N'77981672', 1, N'Nguyễn Nhật Nam', CAST(N'1998-04-06' AS Date), N'Bình Đa', 991827561, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (73, N'778910202', 1, N'Trần Trung Kiên', CAST(N'1998-04-06' AS Date), N'Bình Đa', 9981723, N'Nam', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (74, N'77899012', 2, N'Nguyễn Hoài Anh', CAST(N'1998-04-06' AS Date), N'Vĩnh Long', 33981762, N'Nữ', N'Việt Nam')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (75, N'8897123', 1, N'Rose Layle', CAST(N'1996-01-06' AS Date), N'London', 99816272, N'Nữ', N'Anh')
INSERT [dbo].[CUSTOMER] ([ID], [IDCard], [IDCustomerType], [Name], [DateOfBirth], [Address], [PhoneNumber], [Sex], [Nationality]) VALUES (76, N'88897162', 2, N'Trần Phi Sơn', CAST(N'1998-04-06' AS Date), N'BÌnh Chánh', 998117652, N'Nam', N'Việt Nam')
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
GO
SET IDENTITY_INSERT [dbo].[CUSTOMERTYPE] ON 

INSERT [dbo].[CUSTOMERTYPE] ([ID], [Name]) VALUES (1, N'Vip')
INSERT [dbo].[CUSTOMERTYPE] ([ID], [Name]) VALUES (2, N'Normal')
INSERT [dbo].[CUSTOMERTYPE] ([ID], [Name]) VALUES (3, N'Potential')
SET IDENTITY_INSERT [dbo].[CUSTOMERTYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[Job] ON 

INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (1, N'Đặt Phòng', N'fBookRoom')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (2, N'Nhận Phòng', N'fReceiveRoom')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (3, N'Sử dụng dịch vụ và Thanh toán', N'fUseService')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (4, N'Thống kê và doanh thu', N'fReport')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (5, N'Quản lí phòng', N'fRoom')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (6, N'Quản lí nhân viên', N'fStaff')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (7, N'Quản lí khách hàng', N'fCustomer')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (8, N'Quản lí hoá đơn', N'fBill')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (9, N'Quản lí dịch vụ', N'fService')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (10, N'Quy định', N'fParameter')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (51, N'Đặt Phòng', N'fBookRoom')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (52, N'Nhận Phòng', N'fReceiveRoom')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (53, N'Sử dụng dịch vụ và Thanh toán', N'fUseService')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (54, N'Thống kê và doanh thu', N'fReport')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (55, N'Quản lí phòng', N'fRoom')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (56, N'Quản lí nhân viên', N'fStaff')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (57, N'Quản lí khách hàng', N'fCustomer')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (58, N'Quản lí hoá đơn', N'fBill')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (59, N'Quản lí dịch vụ', N'fService')
INSERT [dbo].[Job] ([id], [Name], [NameForm]) VALUES (60, N'Quy định', N'fParameter')
SET IDENTITY_INSERT [dbo].[Job] OFF
GO
INSERT [dbo].[PARAMETER] ([Name], [Value], [Describe], [datemodify]) VALUES (N'Đang cập nhật', 0.1, N'Đang phát triển thêm các chính sách phụ thu', CAST(N'2022-12-13T13:50:00' AS SmallDateTime))
INSERT [dbo].[PARAMETER] ([Name], [Value], [Describe], [datemodify]) VALUES (N'Trẻ em', 0.2, N'Trẻ em trên 6 tuổi và dưới 12 tuổi', CAST(N'2022-12-13T00:11:00' AS SmallDateTime))
INSERT [dbo].[PARAMETER] ([Name], [Value], [Describe], [datemodify]) VALUES (N'Thêm giường', 0.3, N'Khi có nhiều hơn số người quy định của phòng đó', CAST(N'2022-12-13T00:11:00' AS SmallDateTime))
INSERT [dbo].[PARAMETER] ([Name], [Value], [Describe], [datemodify]) VALUES (N'Khách nước ngoài', 1, N'Khi có khách là người ngoại quốc, không phải Việt Nam', CAST(N'2022-12-13T00:12:00' AS SmallDateTime))
GO
SET IDENTITY_INSERT [dbo].[RECEIVEROOM] ON 

INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (35, 35, 8)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (36, 36, 9)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (37, 37, 4)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (38, 38, 3)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (39, 39, 10)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (40, 40, 12)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (41, 41, 4)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (42, 42, 4)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (43, 43, 15)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (44, 44, 7)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (45, 45, 6)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (46, 46, 8)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (47, 47, 10)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (49, 49, 5)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (50, 50, 12)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (51, 51, 2)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (53, 53, 11)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (54, 54, 6)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (55, 55, 13)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (56, 56, 14)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (57, 57, 11)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (58, 58, 5)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (59, 60, 2)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (60, 61, 18)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (61, 62, 6)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (62, 63, 6)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (63, 64, 18)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (64, 65, 11)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (65, 66, 14)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (66, 67, 4)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (67, 68, 2)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (68, 69, 10)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (69, 70, 6)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (70, 71, 3)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (71, 72, 13)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (72, 73, 5)
INSERT [dbo].[RECEIVEROOM] ([ID], [IDBookRoom], [IDRoom]) VALUES (73, 74, 10)
SET IDENTITY_INSERT [dbo].[RECEIVEROOM] OFF
GO
INSERT [dbo].[RECEIVEROOMDETAILS] ([IDReceiveRoom], [IDCustomerOther]) VALUES (43, 43)
INSERT [dbo].[RECEIVEROOMDETAILS] ([IDReceiveRoom], [IDCustomerOther]) VALUES (57, 56)
INSERT [dbo].[RECEIVEROOMDETAILS] ([IDReceiveRoom], [IDCustomerOther]) VALUES (60, 59)
INSERT [dbo].[RECEIVEROOMDETAILS] ([IDReceiveRoom], [IDCustomerOther]) VALUES (60, 60)
INSERT [dbo].[RECEIVEROOMDETAILS] ([IDReceiveRoom], [IDCustomerOther]) VALUES (63, 64)
INSERT [dbo].[RECEIVEROOMDETAILS] ([IDReceiveRoom], [IDCustomerOther]) VALUES (63, 65)
INSERT [dbo].[RECEIVEROOMDETAILS] ([IDReceiveRoom], [IDCustomerOther]) VALUES (64, 65)
INSERT [dbo].[RECEIVEROOMDETAILS] ([IDReceiveRoom], [IDCustomerOther]) VALUES (65, 68)
GO
SET IDENTITY_INSERT [dbo].[REPORTS] ON 

INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (26, 1, 3, 12, 2022, 1508000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (27, 3, 3, 12, 2022, 1500000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (28, 4, 41, 12, 2022, 20060000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (29, 2, 52, 12, 2022, 25772000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (30, 1, 15, 1, 2023, 2900000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (31, 2, 61, 1, 2023, 11324000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (32, 3, 5, 1, 2023, 1100000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (33, 4, 16, 1, 2023, 3042000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (34, 4, 38, 2, 2023, 1628000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (35, 2, 37, 2, 2023, 1606000)
INSERT [dbo].[REPORTS] ([IDReport], [ID], [rate], [Month], [Year], [value]) VALUES (36, 1, 23, 2, 2023, 1000000)
SET IDENTITY_INSERT [dbo].[REPORTS] OFF
GO
SET IDENTITY_INSERT [dbo].[ROOM] ON 

INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (2, N'102', 1, 2)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (3, N'103', 1, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (4, N'104', 2, 2)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (5, N'105', 3, 2)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (6, N'106', 2, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (7, N'107', 1, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (8, N'108', 3, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (9, N'109', 1, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (10, N'110', 4, 2)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (11, N'111', 4, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (12, N'112', 4, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (13, N'113', 4, 2)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (14, N'114', 2, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (15, N'115', 2, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (16, N'116', 3, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (17, N'117', 3, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (18, N'119', 2, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (19, N'118', 2, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (20, N'120', 2, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (21, N'121', 2, 1)
INSERT [dbo].[ROOM] ([ID], [Name], [IDRoomType], [IDStatusRoom]) VALUES (22, N'122', 4, 1)
SET IDENTITY_INSERT [dbo].[ROOM] OFF
GO
SET IDENTITY_INSERT [dbo].[ROOMTYPE] ON 

INSERT [dbo].[ROOMTYPE] ([ID], [Name], [Price], [LimitPerson], [Bed]) VALUES (1, N'Phòng đôi', 200000, 4, 2)
INSERT [dbo].[ROOMTYPE] ([ID], [Name], [Price], [LimitPerson], [Bed]) VALUES (2, N'Phòng đơn', 100000, 2, 1)
INSERT [dbo].[ROOMTYPE] ([ID], [Name], [Price], [LimitPerson], [Bed]) VALUES (3, N'Phòng gia đình', 300000, 5, 3)
INSERT [dbo].[ROOMTYPE] ([ID], [Name], [Price], [LimitPerson], [Bed]) VALUES (4, N'Phòng VIP', 500000, 2, 1)
SET IDENTITY_INSERT [dbo].[ROOMTYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[SERVICE] ON 


SET IDENTITY_INSERT [dbo].[SERVICE] OFF
GO
SET IDENTITY_INSERT [dbo].[SERVICETYPE] ON 

INSERT [dbo].[SERVICETYPE] ([ID], [Name]) VALUES (1, N'Giải trí')
INSERT [dbo].[SERVICETYPE] ([ID], [Name]) VALUES (2, N'Đồ uống')
INSERT [dbo].[SERVICETYPE] ([ID], [Name]) VALUES (3, N'Đồ ăn')
INSERT [dbo].[SERVICETYPE] ([ID], [Name]) VALUES (4, N'Tráng miệng')
INSERT [dbo].[SERVICETYPE] ([ID], [Name]) VALUES (5, N'Quần áo')
INSERT [dbo].[SERVICETYPE] ([ID], [Name]) VALUES (6, N'Vệ sinh')
INSERT [dbo].[SERVICETYPE] ([ID], [Name]) VALUES (7, N'Đồ dùng cá nhân')
SET IDENTITY_INSERT [dbo].[SERVICETYPE] OFF
GO
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'abc', N'abc', N'123456', 2, N'777888', CAST(N'1990-01-01' AS Date), N'Nữ', N'Hoà Bình', 123456, CAST(N'2018-05-16' AS Date), N'book5.png')
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'dangquy', N'Truong Dang Quy 1', N'123', 1, N'27602633', CAST(N'1990-01-01' AS Date), N'Nam', N'Binh Thanh', 388159145, CAST(N'2018-05-16' AS Date), N'book-10.png')
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'Dung', N'Tiến Dũng', N'123456', 2, N'7009', CAST(N'1990-01-01' AS Date), N'Nam', N'Tân Bình', 99888123, CAST(N'2018-05-16' AS Date), N'book-10.png')
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'Hai', N'Trần Hải', N'123456', 2, N'90008111', CAST(N'1990-01-01' AS Date), N'Nam', N'Nghệ An', 93327182, CAST(N'2018-05-16' AS Date), N'D:\ASP NET WEB\QLCayCanh\web\image\dress_shirt_PNG8117.png')
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'HaiDuyen', N'Hải Duyên', N'123456', 2, N'12345', CAST(N'1990-01-01' AS Date), N'Nữ', N'Hà Nội', 12345, CAST(N'2018-05-16' AS Date), N'book-10.png')
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'NganNo', N'Ngân Nơ', N'123456', 2, N'123', CAST(N'1990-01-01' AS Date), N'Nữ', N'123', 123, CAST(N'2018-05-16' AS Date), N'book-10.png')
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'Nhan', N'Nhân', N'123456', 2, N'777000', CAST(N'1990-01-01' AS Date), N'Nữ', N'123', 12345, CAST(N'2018-05-16' AS Date), N'book-10.png')
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'NTu', N'Tư', N'123456', 2, N'911', CAST(N'1990-01-01' AS Date), N'Nam', N'N123', 998777123, CAST(N'2018-05-16' AS Date), N'D:\ASP NET WEB\KhoaHTTTVT\web\images\banner-img-bg.png')
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'quy', N'Truong Dang Quy', N'0388159145', 1, N'276026337', CAST(N'2001-01-01' AS Date), N'Nam', N'Bình Th?nh', 388159145, CAST(N'2018-05-16' AS Date), N'D:\ASP NET WEB\QLCayCanh\web\image\27427-1-black-shoe-transparent-background.png')
INSERT [dbo].[STAFF] ([UserName], [DisplayName], [PassWord], [IDStaffType], [IDCard], [DateOfBirth], [Sex], [Address], [PhoneNumber], [StartDay], [Picture]) VALUES (N'VanAnh', N'Nguyễn Vân Anh 1', N'123456', 2, N'778918283', CAST(N'1990-01-01' AS Date), N'Nữ', N'TPHCM', 998167222, CAST(N'2018-05-16' AS Date), N'D:\ASP NET WEB\QLCayCanh\web\image\facial-tissues-blue-box-box-of-tissue-11562975805e3xonrjbnq.png')
GO
SET IDENTITY_INSERT [dbo].[STAFFTYPE] ON 

INSERT [dbo].[STAFFTYPE] ([ID], [Name]) VALUES (1, N'admin')
INSERT [dbo].[STAFFTYPE] ([ID], [Name]) VALUES (2, N'staff')
INSERT [dbo].[STAFFTYPE] ([ID], [Name]) VALUES (3, N'user')
INSERT [dbo].[STAFFTYPE] ([ID], [Name]) VALUES (4, N'director')
SET IDENTITY_INSERT [dbo].[STAFFTYPE] OFF
GO
SET IDENTITY_INSERT [dbo].[STATUSBILL] ON 

INSERT [dbo].[STATUSBILL] ([ID], [Name]) VALUES (1, N'Chưa thanh toán')
INSERT [dbo].[STATUSBILL] ([ID], [Name]) VALUES (2, N'Đã thanh toán')
SET IDENTITY_INSERT [dbo].[STATUSBILL] OFF
GO
SET IDENTITY_INSERT [dbo].[STATUSROOM] ON 

INSERT [dbo].[STATUSROOM] ([ID], [Name]) VALUES (1, N'Còn phòng')
INSERT [dbo].[STATUSROOM] ([ID], [Name]) VALUES (2, N'Đã đặt')
INSERT [dbo].[STATUSROOM] ([ID], [Name]) VALUES (3, N'Đang sửa chữa')
SET IDENTITY_INSERT [dbo].[STATUSROOM] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CUSTOMER__43A2A4E364BD62CB]    Script Date: 2/7/2023 9:56:23 AM ******/
ALTER TABLE [dbo].[CUSTOMER] ADD UNIQUE NONCLUSTERED 
(
	[IDCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__STAFF__43A2A4E35E89FFAF]    Script Date: 2/7/2023 9:56:23 AM ******/
ALTER TABLE [dbo].[STAFF] ADD UNIQUE NONCLUSTERED 
(
	[IDCard] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BILL] ADD  DEFAULT (getdate()) FOR [DateOfCreate]
GO
ALTER TABLE [dbo].[BILL] ADD  DEFAULT ((0)) FOR [RoomPrice]
GO
ALTER TABLE [dbo].[BILL] ADD  DEFAULT ((0)) FOR [ServicePrice]
GO
ALTER TABLE [dbo].[BILL] ADD  DEFAULT ((0)) FOR [Surcharge]
GO
ALTER TABLE [dbo].[BILL] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[BILL] ADD  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[BILL] ADD  DEFAULT ((1)) FOR [IDStatusBill]
GO
ALTER TABLE [dbo].[BILLDETAILS] ADD  DEFAULT ((0)) FOR [TotalPrice]
GO
ALTER TABLE [dbo].[CUSTOMER] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[CUSTOMERTYPE] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[PARAMETER] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[PARAMETER] ADD  CONSTRAINT [DF_PARAMETER_datemodify]  DEFAULT (getdate()) FOR [datemodify]
GO
ALTER TABLE [dbo].[ROOM] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[ROOMTYPE] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[SERVICE] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[SERVICETYPE] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[STAFF] ADD  DEFAULT (N'No Name') FOR [DisplayName]
GO
ALTER TABLE [dbo].[STAFFTYPE] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[STATUSBILL] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[STATUSROOM] ADD  DEFAULT (N'No Name') FOR [Name]
GO
ALTER TABLE [dbo].[access]  WITH CHECK ADD FOREIGN KEY([Idstafftype])
REFERENCES [dbo].[STAFFTYPE] ([ID])
GO
ALTER TABLE [dbo].[access]  WITH CHECK ADD FOREIGN KEY([idjob])
REFERENCES [dbo].[Job] ([id])
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD FOREIGN KEY([IDReceiveRoom])
REFERENCES [dbo].[RECEIVEROOM] ([ID])
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD FOREIGN KEY([IDStatusBill])
REFERENCES [dbo].[STATUSBILL] ([ID])
GO
ALTER TABLE [dbo].[BILL]  WITH CHECK ADD FOREIGN KEY([StaffSetUp])
REFERENCES [dbo].[STAFF] ([UserName])
GO
ALTER TABLE [dbo].[BILLDETAILS]  WITH CHECK ADD FOREIGN KEY([IDBill])
REFERENCES [dbo].[BILL] ([ID])
GO
ALTER TABLE [dbo].[BILLDETAILS]  WITH CHECK ADD FOREIGN KEY([IDService])
REFERENCES [dbo].[SERVICE] ([ID])
GO
ALTER TABLE [dbo].[BOOKROOM]  WITH CHECK ADD FOREIGN KEY([IDCustomer])
REFERENCES [dbo].[CUSTOMER] ([ID])
GO
ALTER TABLE [dbo].[BOOKROOM]  WITH CHECK ADD FOREIGN KEY([IDRoomType])
REFERENCES [dbo].[ROOMTYPE] ([ID])
GO
ALTER TABLE [dbo].[CUSTOMER]  WITH CHECK ADD FOREIGN KEY([IDCustomerType])
REFERENCES [dbo].[CUSTOMERTYPE] ([ID])
GO
ALTER TABLE [dbo].[RECEIVEROOM]  WITH CHECK ADD FOREIGN KEY([IDBookRoom])
REFERENCES [dbo].[BOOKROOM] ([ID])
GO
ALTER TABLE [dbo].[RECEIVEROOM]  WITH CHECK ADD FOREIGN KEY([IDRoom])
REFERENCES [dbo].[ROOM] ([ID])
GO
ALTER TABLE [dbo].[RECEIVEROOMDETAILS]  WITH CHECK ADD FOREIGN KEY([IDCustomerOther])
REFERENCES [dbo].[CUSTOMER] ([ID])
GO
ALTER TABLE [dbo].[RECEIVEROOMDETAILS]  WITH CHECK ADD FOREIGN KEY([IDReceiveRoom])
REFERENCES [dbo].[RECEIVEROOM] ([ID])
GO
ALTER TABLE [dbo].[REPORTS]  WITH CHECK ADD FOREIGN KEY([ID])
REFERENCES [dbo].[ROOMTYPE] ([ID])
GO
ALTER TABLE [dbo].[ROOM]  WITH CHECK ADD FOREIGN KEY([IDRoomType])
REFERENCES [dbo].[ROOMTYPE] ([ID])
GO
ALTER TABLE [dbo].[ROOM]  WITH CHECK ADD FOREIGN KEY([IDStatusRoom])
REFERENCES [dbo].[STATUSROOM] ([ID])
GO
ALTER TABLE [dbo].[SERVICE]  WITH CHECK ADD FOREIGN KEY([IDServiceType])
REFERENCES [dbo].[SERVICETYPE] ([ID])
GO
ALTER TABLE [dbo].[STAFF]  WITH CHECK ADD FOREIGN KEY([IDStaffType])
REFERENCES [dbo].[STAFFTYPE] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[GetIDReceiveRoomCurrent]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetIDReceiveRoomCurrent]
as
begin
	select MAX(id)
	from ReceiveRoom
end
GO
/****** Object:  StoredProcedure [dbo].[InsertReceiveRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------------------
---------------------------------ReceiveRoom------------------------------------------
create proc [dbo].[InsertReceiveRoom]
@idBookRoom int,@idRoom int
as
begin
	insert into ReceiveRoom(IDBookRoom,IDRoom)
	values(@idBookRoom,@idRoom)
	update Room
	set IDStatusRoom=2
	where ID=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[InsertReceiveRoomDetails]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertReceiveRoomDetails]
@idReceiveRoom int,@idCustomer int
as
begin
	insert into ReceiveRoomDetails(IDReceiveRoom,IDCustomerOther)
	values(@idReceiveRoom,@idCustomer)
end
GO
/****** Object:  StoredProcedure [dbo].[ShowBookRoomInfo]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[ShowBookRoomInfo]
@idBookRoom int
as
begin
	select B.Name[FullName],B.IDCard[IDCard],C.Name[RoomTypeName],A.DateCheckIn[DateCheckIn],A.DateCheckOut[DateCheckOut],C.LimitPerson[LimitPerson],C.Price[Price]
	from BookRoom A,Customer B,RoomType C
	where A.ID=@idBookRoom and A.IDCustomer=B.ID and A.IDRoomType=C.ID
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ChekcAccess]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_ChekcAccess] 
@username NVARCHAR(100), @formname NVARCHAR(100)
AS
BEGIN
	SELECT UserName FROM dbo.Staff INNER JOIN dbo.StaffType ON StaffType.ID = Staff.IDStaffType 
	INNER JOIN access ON access.Idstafftype = stafftype.ID INNER JOIN job ON job.id = access.idjob
	WHERE UserName = @username AND @formname LIKE NameForm
END
GO
/****** Object:  StoredProcedure [dbo].[USP_ChekcAccess1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_ChekcAccess1]
@username NVARCHAR(100), @formname NVARCHAR(100)
AS
BEGIN
	SELECT UserName FROM dbo.Staff INNER JOIN dbo.StaffType ON StaffType.ID = Staff.IDStaffType 
	INNER JOIN access ON access.Idstafftype = stafftype.ID INNER JOIN job ON job.id = access.idjob
	WHERE UserName = @username AND @formname LIKE NameForm
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteAccess]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_DeleteAccess]
@idJob INT, @idStaffType int
AS
BEGIN
	DELETE access WHERE @idJob = idjob AND @idStaffType = idStaffType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteBookRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_DeleteBookRoom]
@id int
as
begin
	delete from BookRoom
	where ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteReceiveRoomDetails]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_DeleteReceiveRoomDetails]
@idReceiveRoom int,@idCustomer int
as
begin
	delete from ReceiveRoomDetails
	where IDCustomerOther=@idCustomer and IDReceiveRoom=@idReceiveRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_DeleteStaffType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_DeleteStaffType]
@id int
AS
begin
	DECLARE @count int = 0
	SELECT @count = COUNT(*) FROM staff WHERE @id = staff.IDStaffType
	IF(@count = 0)
	begin
		delete access where idstafftype = @id
		DELETE staffType WHERE @id = id
	end
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetCustomerTypeNameByIdCard]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetCustomerTypeNameByIdCard]
@idCard nvarchar(100)
as
begin
	select B.Name
	from Customer A, CustomerType B
	where A.IDCustomerType=B.ID and A.IDCard=@idCard
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIdBillFromIdRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetIdBillFromIdRoom]
@idRoom int
as
begin
	select B.*
	from ReceiveRoom A,Bill B
	where A.ID=B.IDReceiveRoom and B.IDStatusBill=1 and A.IDRoom=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIdBillMax]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------
--------------------Bill------------------------
create proc [dbo].[USP_GetIdBillMax]
as
select MAX(id)
from Bill
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIDCustomerFromBookRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetIDCustomerFromBookRoom]
@idReceiveRoom int
as
begin
	select B.IDCustomer
	from ReceiveRoom A,BookRoom B
	where A.ID=@idReceiveRoom and A.IDBookRoom=B.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIdReceiRoomFromIdRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetIdReceiRoomFromIdRoom]--IdRoom đưa vào có trạng thái "Có người"
@idRoom int
as
begin
select *
from ReceiveRoom
where IDRoom=@idRoom
order by ID desc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetIDRoomFromReceiveRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetIDRoomFromReceiveRoom]
@idReceiveRoom int
as
begin
	select IDRoom
	from ReceiveRoom
	where ID=@idReceiveRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetNameStaffTypeByUserName]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetNameStaffTypeByUserName]
@username nvarchar(100)
as
begin
	select B.*
	from Staff A, StaffType B
	where a.IDStaffType=B.ID and A.UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetNameStaffTypeByUserName1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetNameStaffTypeByUserName1]
@username nvarchar(100)
as
begin
	select B.*
	from Staff A, StaffType B
	where a.IDStaffType=B.ID and A.UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetPeoples]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[USP_GetPeoples]
@idBill int
as
begin
	select COUNT(B.IDReceiveRoom)
	from ReceiveRoom A,ReceiveRoomDetails B,Bill C
	where A.ID=C.IDReceiveRoom and A.ID=B.IDReceiveRoom and C.ID=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetRoomTypeByIdBookRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetRoomTypeByIdBookRoom]
@idBookRoom int
as
begin
	select B.*
	from BookRoom A, RoomType B
	where A.ID=@idBookRoom and A.IDRoomType=B.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_GetRoomTypeByIdRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetRoomTypeByIdRoom]
@idRoom int
as
begin
	select B.*
	from Room A,RoomType B
	where A.IDRoomType=B.ID and A.ID=@idRoom
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GetStaffSetUp]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_GetStaffSetUp]
@idBill int
as
begin
	select B.*
	from Bill A, Staff B
	where A.ID=@idBill and A.StaffSetUp=B.UserName
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertAccess]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertAccess]
@idJob INT, @idStaffType int
AS
BEGIN
	INSERT INTO access(idjob, idstafftype) VALUES(@idJob, @idStaffType)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBill]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertBill]
@idReceiveRoom int,@staffSetUp nvarchar(100)
as
begin
	insert into Bill(IDReceiveRoom,StaffSetUp)
	values(@idReceiveRoom,@staffSetUp)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBillDetails]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertBillDetails]
@idBill int,@idService int,@count int
as
begin
		declare @totalPrice int,@price int
		select @price=Price
		from Service
		where ID=@idService
		set @totalPrice=@price*@count
		insert into BillDetails(IDBill,IDService,Count,TotalPrice)
		values(@idBill,@idService,@count,@totalPrice)
end

GO
/****** Object:  StoredProcedure [dbo].[USP_InsertBookRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------------
-------------------BookRoom----------------------------
create proc [dbo].[USP_InsertBookRoom]
@idCustomer int,@idRoomType int,@datecheckin date,@datecheckout date,@datebookroom smalldatetime
as
begin
	insert into BookRoom (IDCustomer,IDRoomType,DateCheckIn,DateCheckOut,DateBookRoom)
	values(@idCustomer,@idRoomType,@datecheckin,@datecheckout,@datebookroom)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertCustomer]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertCustomer]
@customerName NVARCHAR(100), @idCustomerType int, @idCard NVARCHAR(100),
@address NVARCHAR(200), @dateOfBirth date, @phoneNumber int,
@sex NVARCHAR(100), @nationality NVARCHAR(100)
AS
BEGIN
DECLARE @count INT =0
SELECT @count = COUNT(*) FROM customer WHERE IDCard = @idCard
IF(@count=0)
INSERT INTO dbo.Customer(IDCard,IDCustomerType, Name, DateOfBirth, Address, PhoneNumber, Sex, Nationality)
	VALUES(@idCard, @idCustomerType, @customerName, @dateOfBirth, @address, @phoneNumber, @sex, @nationality)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertCustomer_]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_InsertCustomer_]
@idCard nvarchar(100),@name nvarchar(100),@idCustomerType int, @dateOfBirth Date,@address nvarchar(200),@phoneNumber int,@sex nvarchar(100),@nationality nvarchar(100)
as
begin
	insert into Customer(IDCard,Name,IDCustomerType,DateOfBirth,Address,PhoneNumber,Sex,Nationality)
	values(@idCard,@name,@idCustomerType,@dateOfBirth,@address,@phoneNumber,@sex,@nationality)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertReport]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_InsertReport]
@idBill int
AS
BEGIN
	DECLARE @month INT = 0
	DECLARE @year INT = 0
	DECLARE @id INT = 0
	DECLARE @price INT = 0
	SELECT @id = dbo.ROOM.IDRoomType, @month = MONTH(bill.DateOfCreate), @year = YEAR(bill.DateOfCreate), @price = bill.TotalPrice
	FROM bill INNER JOIN dbo.RECEIVEROOM ON RECEIVEROOM.ID = bill.IDReceiveRoom 
		INNER JOIN dbo.ROOM ON ROOM.ID = RECEIVEROOM.IDRoom
	WHERE bill.ID = @idBill

	DECLARE @count INT = 0	
	SELECT @count = COUNT(*) FROM REPORTS WHERE month = @month AND year = @year and ID = @id
	IF(@count=0) -- khong ton tai roomtype
    BEGIN
		
		INSERT INTO REPORTS(ID, Month, Year,value) values(@id,@month,@year,@price)
	END
    UPDATE dbo.REPORTS SET value = value + @price WHERE Year = @year AND Month = @month AND ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertReport1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_InsertReport1]
@idBill int
AS
BEGIN
	DECLARE @month INT = 0
	DECLARE @year INT = 0
	DECLARE @id INT = 0
	DECLARE @price INT = 0
	SELECT @id = dbo.ROOM.IDRoomType, @month = MONTH(bill.DateOfCreate), @year = YEAR(bill.DateOfCreate), @price = bill.TotalPrice
	FROM bill INNER JOIN dbo.RECEIVEROOM ON RECEIVEROOM.ID = bill.IDReceiveRoom 
		INNER JOIN dbo.ROOM ON ROOM.ID = RECEIVEROOM.IDRoom
	WHERE bill.ID = @idBill

	DECLARE @count INT = 0	
	SELECT @count = COUNT(*) FROM REPORT WHERE month = @month AND year = @year and  ID = @id
	IF(@count=0) -- khong ton tai roomtype
    BEGIN
		
		INSERT INTO REPORT(ID, Month, Year) SELECT roomtype.ID, @month, @year FROM roomtype 
	END
    UPDATE dbo.REPORT SET value = value + @price WHERE Year = @year AND Month = @month AND ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertRoom]
@nameRoom NVARCHAR(100), @idRoomType INT, @idStatusRoom INT
AS
INSERT INTO dbo.Room(Name, IDRoomType, IDStatusRoom)
VALUES(@nameRoom, @idRoomType, @idStatusRoom)
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertService]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertService]
@name NVARCHAR(200), @idServiceType INT, @price int, @quantity int, @picture image
AS
BEGIN
	INSERT INTO dbo.Service(Name,IDServiceType,Price,Quantity,Picture)
	VALUES(@name, @idServiceType, @price, @quantity, @picture)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertServiceType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertServiceType]
@name NVARCHAR(100)
AS
BEGIN
	INSERT INTO dbo.ServiceType(name)
	VALUES(@name)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertStaff]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertStaff]
@user NVARCHAR(100), @name NVARCHAR(100), @pass NVARCHAR(100),
@idStaffType INT,@idCard NVARCHAR(100), @dateOfBirth DATE, @sex NVARCHAR(100),
@address NVARCHAR(200), @phoneNumber INT, @startDay date, @picture nvarchar(max)
AS
BEGIN
	DECLARE @count INT =0
	SELECT @count = COUNT(*) FROM dbo.Staff WHERE UserName = @user OR IDCard = @idCard
	IF(@count >0) RETURN
	INSERT INTO dbo.Staff(UserName, DisplayName, PassWord, IDStaffType, IDCard, DateOfBirth, Sex, Address, PhoneNumber, StartDay,Picture)
	VALUES (@user, @name, @pass, @idStaffType,@idCard, @dateOfBirth, @sex, @address, @phoneNumber, @startDay,@picture)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_InsertStaffType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_InsertStaffType] 
@name NVARCHAR(100)
AS
BEGIN
    INSERT INTO staffType(Name) VALUES(@name)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_IsExistBillDetailsOfRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[USP_IsExistBillDetailsOfRoom]--Kq > 0 :TH3, ngược lại TH2. Tuy nhiên, trước khi kt đk này phải chắc chắn tồn tại Bill
@idRoom int,@idservice int
as
begin
	select *
	from Bill A,BillDetails B,ReceiveRoom C
	where A.IDStatusBill=1 and A.ID=B.IDBill and C.ID=A.IDReceiveRoom and C.IDRoom=@idRoom and B.IDService=@idservice
end
GO
/****** Object:  StoredProcedure [dbo].[USP_IsExistBillOfRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--TH1:

create proc [dbo].[USP_IsExistBillOfRoom]--Trả về count > 0: tức là đã tồn tại Bill
@idRoom int
as
begin
	select *
	from Bill A,ReceiveRoom B
	where A.IDStatusBill=1 and A.IDReceiveRoom=B.ID and B.IDRoom=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_IsIDBookRoomExists]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_IsIDBookRoomExists]
@idBookRoom int,@dateNow date
as
begin
	select *
	from BookRoom 
	where ID=@idBookRoom and DateCheckIn>=@dateNow and ID not in
	(
		select IDBookRoom
		from ReceiveRoom
	)
end
GO
/****** Object:  StoredProcedure [dbo].[USP_IsIdCardExists]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------
---------customer ----------------
create proc [dbo].[USP_IsIdCardExists]
@idCard nvarchar(100)
as
begin
select *
from Customer
where IDCard=@idCard
end
GO
/****** Object:  StoredProcedure [dbo].[USP_IsIdCardExistsAcc]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_IsIdCardExistsAcc]
@idCard nvarchar(100)
as
begin
	select *
	from Staff
	where IDCard=@idCard
end
GO
/****** Object:  StoredProcedure [dbo].[USP_IsIdCardExistsAcc1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_IsIdCardExistsAcc1]
@idCard nvarchar(100)
as
begin
	select *
	from Staff
	where IDCard=@idCard
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadBookRoomsByDate]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadBookRoomsByDate]
@date Date
as
begin
	select A.ID[Mã đặt phòng], b.Name[Họ và tên],b.IDCard[CMND],C.Name[Loại phòng],A.DateCheckIn[Ngày nhận],A.DateCheckOut[Ngày trả]
	from BookRoom A,Customer B, RoomType C
	where a.IDRoomType=c.ID and A.IDCustomer=B.ID and A.DateBookRoom>=@date
	order by A.DateBookRoom desc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadEmptyRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


---------------------------------------------------

----------Room-----------------
create proc [dbo].[USP_LoadEmptyRoom]
@idRoomType int
as
begin
	select *
	from Room
	where IDStatusRoom=1 and IDRoomType=@idRoomType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullAccessNow]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullAccessNow]
@idStaffType INT
AS
BEGIN
	SELECT Job.Name, job.ID FROM job INNER JOIN access ON job.Id = Access.IDJob
	WHERE @idStaffType = dbo.Access.IDStaffType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullAccessNow1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullAccessNow1]
@idStaffType INT
AS
BEGIN
	SELECT Job.Name, job.ID FROM job INNER JOIN access ON job.Id = Access.IDJob
	WHERE @idStaffType = dbo.Access.IDStaffType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullAccessRest1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_LoadFullAccessRest1]
@idStaffType INT
AS
BEGIN
	SELECT j.Name, j.Id FROM job j
	WHERE NOT EXISTS 
	(
		SELECT * FROM job INNER JOIN access ON job.Id = access.IdJob
		WHERE j.Id = job.Id AND access.idStaffType = @idStaffType
	)
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFUllBill]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_LoadFUllBill]
AS
BEGIN
	SELECT bill.id, room.Name AS [roomName],CUSTOMER.Name as[customername], StaffSetUp, DateOfCreate, STATUSBILL.Name, TotalPrice, (cast(Discount as nvarchar(4)) + '%') [Discount], cast(TotalPrice*( (100-Discount)/100.0) as int) [FinalPrice]
    FROM dbo.BILL INNER JOIN dbo.RECEIVEROOM ON RECEIVEROOM.ID = BILL.IDReceiveRoom
					INNER JOIN dbo.STATUSBILL ON STATUSBILL.id = bill.IDStatusBill
					INNER JOIN dbo.ROOM ON ROOM.ID = RECEIVEROOM.IDRoom
					inner join bookroom on bookroom.id = RECEIVEROOM.IDBookRoom
					inner join Customer on Customer.ID = BookRoom.IDCustomer
	ORDER BY DateOfCreate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullCustomer]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullCustomer]
AS
SELECT CUSTOMER.ID, Customer.Name, IDCard, CustomerType.Name as [NameCustomerType], Sex, DateOfBirth, PhoneNumber, Address, Nationality, IDCustomerType 
FROM dbo.Customer INNER JOIN dbo.CustomerType ON CustomerType.ID = Customer.IDCustomerType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullCustomerType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------
--Customer Type
--------------------------------------------------------------

CREATE PROC [dbo].[USP_LoadFullCustomerType]
AS
SELECT * FROM dbo.CustomerType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullParameter]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullParameter]
AS
SELECT * FROM dbo.PARAMETER
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullParameter1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullParameter1]
AS
SELECT * FROM dbo.PARAMETER
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullReport]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullReport]
@month INT, @year int
AS
BEGIN
	SELECT name, value, rate FROM dbo.REPORTS INNER JOIN dbo.ROOMTYPE ON ROOMTYPE.ID = REPORTS.ID
	WHERE Month = @month AND Year = @year
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullReport1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullReport1]
@month INT, @year int
AS
BEGIN
	SELECT name, value, rate FROM dbo.REPORT INNER JOIN dbo.ROOMTYPE ON ROOMTYPE.ID = REPORT.ID
	WHERE Month = @month AND Year = @year
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullReport2]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadFullReport2]
@month int,@year int
as
   begin
      select t.Name,p.value,p.rate from ROOMTYPE t inner join REPORTS p on t.ID=p.ID where p.Month=@month and p.Year=@year
   end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullReport3]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullReport3]
@month INT, @year int
AS
BEGIN
	SELECT name, value, rate,sum(value)[all] FROM dbo.REPORTS INNER JOIN dbo.ROOMTYPE ON ROOMTYPE.ID = REPORTS.ID
	WHERE Month = @month AND Year = @year group by name,value,rate
	--SELECT sum(value)[all] FROM dbo.REPORTS INNER JOIN dbo.ROOMTYPE ON ROOMTYPE.ID = REPORTS.ID
	--WHERE Month = @month AND Year = @year
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullRoom]
AS
SELECT Room.ID, Room.Name,RoomType.Name AS [nameRoomType], Price, LimitPerson, Bed,
StatusRoom.Name AS [nameStatusRoom], IDRoomType, IDStatusRoom
FROM dbo.Room INNER JOIN dbo.RoomType 
ON roomtype.id = room.IDRoomType
INNER JOIN dbo.StatusRoom ON statusroom.id = room.IDStatusRoom
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullRoomType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullRoomType]
AS
SELECT * FROM dbo.RoomType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullService]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullService]
AS
SELECT Service.ID, Service.Name, Price,Service.Quantity,Service.Picture, ServiceType.Name AS [nameServiceType], IDServiceType
FROM dbo.Service INNER JOIN dbo.ServiceType ON ServiceType.ID = Service.IDServiceType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullServiceType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullServiceType]
AS
SELECT * FROM ServiceType
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullStaff]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullStaff]
AS
BEGIN
	SELECT UserName, DisplayName, Name, IDCard,
			DateOfBirth, Sex, PhoneNumber, StartDay, Address, IDStaffType
    FROM dbo.Staff INNER JOIN dbo.StaffType ON StaffType.ID = Staff.IDStaffType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullStaff1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullStaff1]
AS
BEGIN
	SELECT UserName, DisplayName, Name, IDCard,
			DateOfBirth, Sex, PhoneNumber, StartDay, Address, IDStaffType,Picture
    FROM dbo.Staff INNER JOIN dbo.StaffType ON StaffType.ID = Staff.IDStaffType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullStaffType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
------------------------------------------------------------
--Staff type
--------------------------------------------------------------

CREATE PROC [dbo].[USP_LoadFullStaffType]
AS
begin
SELECT * FROM dbo.StaffType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullStaffType1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_LoadFullStaffType1]
AS
begin
SELECT * FROM dbo.StaffType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadFullStatusRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--------------------------------------------------------------

--Status Room
--------------------------------------------------------------
CREATE PROC [dbo].[USP_LoadFullStatusRoom]
AS
SELECT * FROM dbo.StatusRoom
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadListFullRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadListFullRoom]
@getToday Date
as
begin
	select distinct A.*
	from Room A,ReceiveRoom B, BookRoom C
	where A.IDStatusRoom=2 and A.ID=B.IDRoom and B.IDBookRoom=C.ID and C.DateCheckOut>=@getToday
	order by A.ID asc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadReceiveRoomsByDate]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadReceiveRoomsByDate]
@date Date
as
begin
	select A.ID[Mã nhận phòng], b.Name[Họ và tên],b.IDCard[CMND],C.Name[Tên phòng],D.DateCheckIn[Ngày nhận],D.DateCheckOut[Ngày trả]
	from ReceiveRoom A,Customer B, Room C,BookRoom D
	where A.IDBookRoom=D.ID and D.IDCustomer=B.ID and A.IDRoom=C.ID and D.DateCheckIn>=@date
	order by A.ID desc
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadServiceByServiceType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------------------------
---------------Service------------------------------
create proc [dbo].[USP_LoadServiceByServiceType]
@idServiceType int
as
begin
	select *
	from Service
	where IDServiceType=@idServiceType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadStaffInforByUserName]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadStaffInforByUserName]
@username nvarchar(100)
as
begin
	select *
	from Staff
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_LoadStaffInforByUserName1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_LoadStaffInforByUserName1]
@username nvarchar(100)
as
begin
	select *
	from Staff
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_Login]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_Login]
@userName nvarchar(100),@passWord nvarchar(100)
as
Select * from Staff where UserName=@userName and PassWord=@passWord
GO
/****** Object:  StoredProcedure [dbo].[USP_RoomTypeInfo]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_RoomTypeInfo]
@id int
as
begin
select * 
from RoomType
where ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchBill]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_SearchBill]
@string NVARCHAR(100), @mode int
AS
BEGIN
	SELECT @string = '%' + (@string) + '%'
	DECLARE @table TABLE(id int)
	IF(@mode = 0)
		INSERT INTO @table SELECT bill.id FROM bill WHERE CAST(id AS NVARCHAR(100)) LIKE @string
	ELSE IF(@mode = 1)
		INSERT INTO @table SELECT bill.id  FROM bill INNER JOIN dbo.ReceiveRoom ON ReceiveRoom.ID = Bill.IDReceiveRoom
		INNER JOIN dbo.BookRoom ON BookRoom.ID = ReceiveRoom.IDBookRoom INNER JOIN dbo.Customer ON Customer.ID = BookRoom.IDCustomer 
		WHERE (Customer.Name) LIKE @string
	ELSE IF(@mode = 2)
		INSERT INTO @table SELECT bill.id  FROM bill INNER JOIN dbo.ReceiveRoom ON ReceiveRoom.ID = Bill.IDReceiveRoom
		INNER JOIN dbo.BookRoom ON BookRoom.ID = ReceiveRoom.IDBookRoom INNER JOIN dbo.Customer ON Customer.ID = BookRoom.IDCustomer
		WHERE (Customer.IDCard) LIKE @string
	ELSE IF(@mode = 3)
		INSERT INTO @table SELECT bill.id  FROM bill INNER JOIN dbo.ReceiveRoom ON ReceiveRoom.ID = Bill.IDReceiveRoom
		INNER JOIN dbo.BookRoom ON BookRoom.ID = ReceiveRoom.IDBookRoom INNER JOIN dbo.Customer ON Customer.ID = BookRoom.IDCustomer
		WHERE CAST(dbo.Customer.PhoneNumber AS NVARCHAR(100)) LIKE @string

	SELECT bill.id, room.Name AS [roomName], Customer.Name as [customerName], bill.StaffSetUp, bill.DateOfCreate, STATUSBILL.Name, bill.TotalPrice, (cast(bill.Discount as nvarchar(4)) + '%') [Discount], cast(bill.TotalPrice*( (100-bill.Discount)/100.0) as int) [FinalPrice]
    FROM dbo.BILL INNER JOIN dbo.RECEIVEROOM ON RECEIVEROOM.ID = BILL.IDReceiveRoom 
	INNER JOIN dbo.STATUSBILL ON STATUSBILL.id = bill.IDStatusBill 
	INNER JOIN dbo.ROOM ON ROOM.ID = RECEIVEROOM.IDRoom
	INNER JOIN @table ON bill.id = [@table].id
	inner join bookroom on bookroom.id = RECEIVEROOM.IDBookRoom
	inner join Customer on Customer.ID = BookRoom.IDCustomer
	ORDER BY DateOfCreate DESC
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchCustomer]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROC [dbo].[USP_SearchCustomer]
	@string NVARCHAR(100), @mode INT
	AS
	BEGIN
		SELECT @string = '%' + (@string) + '%'
		DECLARE @table TABLE(id INT)

		IF(@mode = 0)
			INSERT INTO @table SELECT id FROM [dbo].customer WHERE CAST(id AS NVARCHAR(100)) LIKE @string;
		ELSE IF(@mode = 1)
			INSERT INTO @table SELECT id FROM [dbo].customer WHERE (name) LIKE @string;
		ELSE IF(@mode = 2)
			INSERT INTO @table SELECT id FROM [dbo].customer WHERE (IDCard) LIKE @string;
		ELSE IF(@mode = 3)
			INSERT INTO @table SELECT id FROM [dbo].customer WHERE CAST(PhoneNumber AS NVARCHAR(100)) LIKE @string;

	    SELECT CUSTOMER.ID, Customer.Name, IDCard, CustomerType.Name as [NameCustomerType], Sex, DateOfBirth, PhoneNumber, Address, Nationality, IDCustomerType
		FROM Customer INNER JOIN @table ON [@table].id = CUSTOMER.ID INNER JOIN dbo.CustomerType ON CustomerType.ID = Customer.IDCustomerType
	END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchParameter]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_SearchParameter]
@string NVARCHAR(200)
AS
BEGIN
	SELECT @string = '%' + (@string) + '%'
	SELECT * FROM dbo.PARAMETER
	WHERE (name) like @string
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_SearchRoom]
@string NVARCHAR(100), @int INT
AS
BEGIN
	SELECT @string = '%' + (@string) + '%'
	SELECT Room.ID, Room.Name,RoomType.Name AS [nameRoomType], Price, LimitPerson,
	StatusRoom.Name AS [nameStatusRoom], IDRoomType, IDStatusRoom
	FROM dbo.Room INNER JOIN dbo.RoomType ON roomtype.id = room.IDRoomType INNER JOIN dbo.StatusRoom ON statusroom.id = room.IDStatusRoom
	WHERE dbo.Room.name LIKE @string OR dbo.Room.id = @int
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchRoomType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_SearchRoomType]
@string NVARCHAR(100), @int INT
AS
BEGIN
	SELECT @string = '%' + (@string) + '%'
	SELECT * FROM dbo.ROOMTYPE
	WHERE name LIKE @string OR id = @int
end
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchService]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_SearchService]
@string NVARCHAR(100), @int int
AS
BEGIN
		DECLARE @table TABLE
		(
			id INT
		)
		SELECT @string = '%' + (@string) + '%'
		INSERT INTO @table
			SELECT id FROM dbo.SERVICE WHERE (name) like @string OR id = @int
		SELECT Service.ID, Service.Name, Price,Service.Quantity,Service.Picture, ServiceType.Name AS [nameServiceType], IDServiceType
		FROM @table INNER JOIN dbo.SERVICE ON SERVICE.ID = [@table].id INNER JOIN dbo.ServiceType ON ServiceType.ID = Service.IDServiceType
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchServiceType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_SearchServiceType]
@string NVARCHAR(100), @int INT
AS
BEGIN
	DECLARE @table table( id int)
	SELECT @string ='%' + (@string) + '%'
	INSERT INTO @table SELECT id FROM ServiceType WHERE (name) LIKE @string OR id = @int
	SELECT dbo.SERVICETYPE.ID, Name FROM @table INNER JOIN servicetype ON  SERVICETYPE.ID = [@table].id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchStaff]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_SearchStaff]
@string NVARCHAR(100), @int int
AS
BEGIN
	SELECT @string = '%' + (@string) + '%'
	DECLARE @table TABLE( username NVARCHAR(100))
	IF(@int < 1)
	begin
		INSERT INTO @table SELECT username FROM staff 
		WHERE username LIKE @string OR (DisplayName) LIKE @string
		OR  idcard LIKE @string
	END
	ELSE
    BEGIN
		INSERT INTO @table SELECT username FROM staff 
		WHERE username LIKE @string OR (DisplayName) LIKE @string
		OR  idcard LIKE @string OR cast(PhoneNumber AS NVARCHAR(100)) LIKE @string
	END
	SELECT Staff.UserName, Staff.DisplayName, StaffType.Name, Staff.IDCard, Staff.DateOfBirth, Staff.Sex, Staff.PhoneNumber, Staff.StartDay, Staff.Address, Staff.Picture, Staff.IDStaffType
    FROM dbo.Staff INNER JOIN  @table ON [@table].username = STAFF.UserName INNER JOIN dbo.StaffType ON StaffType.ID = Staff.IDStaffType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_SearchStaff1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_SearchStaff1]
@string NVARCHAR(100), @int int
AS
BEGIN
	--SELECT @string = '%' + [dbo].[ConvertString](@string) + '%'
	select @string ='%'+ Convert(varchar(100), + '%')
	DECLARE @table TABLE( username NVARCHAR(100))
	IF(@int < 1)
	begin
		INSERT INTO @table SELECT username FROM staff 
		WHERE username LIKE @string OR DisplayName LIKE @string
		OR  idcard LIKE @string
	END
	ELSE
    BEGIN
		INSERT INTO @table SELECT username FROM staff 
		WHERE username LIKE @string OR DisplayName LIKE @string
		OR  idcard LIKE @string OR cast(PhoneNumber AS NVARCHAR(100)) LIKE @string
	END
	SELECT Staff.UserName, DisplayName, Name, IDCard, DateOfBirth, Sex, PhoneNumber, StartDay, Address, IDStaffType
    FROM dbo.Staff INNER JOIN  @table ON [@table].username = STAFF.UserName INNER JOIN dbo.StaffType ON StaffType.ID = Staff.IDStaffType
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBill]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_ShowBill]
@idRoom int
as
begin
	select D.Name [Tên dịch vụ],D.Price[Đơn giá],B.Count[Số lượng],B.TotalPrice[Thành tiền],D.Quantity[Số lượng tồn]
	from Bill A, BillDetails B, ReceiveRoom C, Service D
	where A.IDStatusBill=1 and A.ID=b.IDBill and A.IDReceiveRoom=C.ID and C.IDRoom=@idRoom and B.IDService=D.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBill1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ShowBill1]
@idRoom int
as
begin
	select D.Name [Tên dịch vụ],D.Price[Đơn giá],D.Picture[Hình ảnh],B.Count[Số lượng],B.TotalPrice[Thành tiền]
	from Bill A, BillDetails B, ReceiveRoom C, Service D
	where A.IDStatusBill=1 and A.ID=b.IDBill and A.IDReceiveRoom=C.ID and C.IDRoom=@idRoom and B.IDService=D.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBillInfo]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ShowBillInfo]
@idBill int
as
begin
select D.Name[HoTen],D.IDCard[CMND],D.PhoneNumber[SDT],E.Name[LoaiKH],D.Address[DiaChi],D.Nationality[QuocTich],F.Name[TenPhong],G.Name[LoaiPhong],G.Price[DonGia],C.DateCheckIn[NgayDen],C.DateCheckOut[NgayDi],A.RoomPrice[TienPhong],A.ServicePrice[TienDichVu],A.Surcharge[PhuThu],A.TotalPrice[ThanhTien],A.Discount[GiamGia]
from Bill A, ReceiveRoom B,BookRoom C, Customer D,CustomerType E,Room F,RoomType G
where A.IDReceiveRoom=B.ID and B.IDBookRoom=C.ID and C.IDCustomer=D.ID and D.IDCustomerType=E.ID and B.IDRoom=F.ID and F.IDRoomType=G.ID and A.ID=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBillInfo1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ShowBillInfo1]
@idBill int
as
begin
select D.Name[HoTen],D.IDCard[CMND],D.PhoneNumber[SDT],E.Name[LoaiKH],D.Address[DiaChi],D.Nationality[QuocTich],F.Name[TenPhong],G.Name[LoaiPhong],G.Price[DonGia],C.DateCheckIn[NgayDen],C.DateCheckOut[NgayDi],A.RoomPrice[TienPhong],A.ServicePrice[TienDichVu],A.Surcharge[PhuThu],A.TotalPrice[ThanhTien],A.Discount[GiamGia],A.Paid[TienKhachDua]
from Bill A, ReceiveRoom B,BookRoom C, Customer D,CustomerType E,Room F,RoomType G
where A.IDReceiveRoom=B.ID and B.IDBookRoom=C.ID and C.IDCustomer=D.ID and D.IDCustomerType=E.ID and B.IDRoom=F.ID and F.IDRoomType=G.ID and A.ID=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBillPreView]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[USP_ShowBillPreView]
@idBill int
as
begin
	select D.Name [Tên dịch vụ],D.Price[Đơn giá],B.Count[Số lượng],B.TotalPrice[Thành tiền]
	from Bill A, BillDetails B, Service D
	where A.IDStatusBill=2 and A.ID=b.IDBill and A.ID=@idBill and B.IDService=D.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBillPreView1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ShowBillPreView1]
@idBill int
as
begin
	select D.Name [Tên dịch vụ],D.Price[Đơn giá],D.Picture[Hình ảnh],B.Count[Số lượng],B.TotalPrice[Thành tiền]
	from Bill A, BillDetails B, Service D
	where A.IDStatusBill=2 and A.ID=b.IDBill and A.ID=@idBill and B.IDService=D.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowBillRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[USP_ShowBillRoom]--Muốn proc thực thi được thì phải thực thi USP_UpdateBill trước(nếu có thể)
@getToday Date,@idRoom int
as
begin

	select A.Name [Tên phòng],D.Price[Đơn giá] ,C.DateCheckIn [Ngày nhận],C.DateCheckOut[Ngày trả] ,E.RoomPrice[Tiền phòng],E.Surcharge[Phụ thu]
	from Room A,ReceiveRoom B, BookRoom C,RoomType D,Bill E
	where E.IDReceiveRoom=B.ID and IDStatusRoom=2 and A.ID=B.IDRoom and B.IDBookRoom=C.ID and A.IDRoomType=D.ID and C.DateCheckOut>=@getToday and B.IDRoom=@idRoom and E.IDStatusBill=1
end

GO
/****** Object:  StoredProcedure [dbo].[USP_ShowCustomerFromReceiveRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ShowCustomerFromReceiveRoom]
@idReceiveRoom int
as
begin
	select C.Name[Tên khách hàng],C.IDCard[CMND],C.Address[Địa chỉ],C.PhoneNumber[Số điện thoại],C.Nationality[Quốc tịch]
	from ReceiveRoom A, BookRoom B, Customer C
	where A.ID=@idReceiveRoom and A.IDBookRoom=B.ID and B.IDCustomer=C.ID
	union
	select C.Name[Tên khách hàng],C.IDCard[CMND],C.Address[Địa chỉ],C.PhoneNumber[Số điện thoại],C.Nationality[Quốc tịch]
	from ReceiveRoom A,ReceiveRoomDetails B,Customer C
	where A.ID=@idReceiveRoom and A.ID=B.IDReceiveRoom and B.IDCustomerOther=C.ID
end
GO
/****** Object:  StoredProcedure [dbo].[USP_ShowReceiveRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_ShowReceiveRoom]
@idReceiveRoom int
as
begin
	select A.ID[Mã nhận phòng], C.Name[Tên phòng],B.DateCheckIn[Ngày nhận],B.DateCheckOut[Ngày trả]
	from ReceiveRoom A,BookRoom B,Room C
	where A.IDBookRoom=B.ID and A.IDRoom=C.ID and A.ID=@idReceiveRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBill_Other]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateBill_Other]
@idBill int,@discount int
as
begin
	declare @totalPrice int=0,@idRoom int
	select @totalPrice=RoomPrice+ServicePrice+ Surcharge
	from Bill
	where ID=@idBill

	update Bill
	set DateOfCreate=GETDATE(), TotalPrice=@totalPrice,Discount=@discount,IDStatusBill=2
	where ID=@idBill

	select @idRoom=B.IDRoom
	from Bill A, ReceiveRoom B
	where A.IDReceiveRoom=B.ID

	update Room
	set IDStatusRoom=1
	where ID=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBill_Other1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateBill_Other1]
@idBill int,@discount int
as
begin
	declare @totalPrice int=0,@idRoom int
	select @totalPrice = RoomPrice + ServicePrice+ Surcharge
	from Bill
	where ID=@idBill

	update Bill
	set DateOfCreate=GETDATE(), TotalPrice=@totalPrice, Discount=@discount, IDStatusBill=2
	where ID=@idBill

	select @idRoom=B.IDRoom
	from Bill A, ReceiveRoom B
	where A.IDReceiveRoom=B.ID

	update Room
	set IDStatusRoom=1
	where ID=@idRoom
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBill_RoomPrice]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[USP_UpdateBill_RoomPrice]
@idBill int
as
begin
	declare @idReceiveRoom int,@roomPrice int =0,@price int,@days int,@countCustomer int,@limitPerson int,@check1 int,@check2 int,@surcharge int =0,@age int

	select @days=DATEDIFF(day,C.DateCheckIn,C.DateCheckOut),@price=D.Price,@limitPerson=D.LimitPerson,@idReceiveRoom=A.IDReceiveRoom
	from Bill A,ReceiveRoom B,BookRoom C,RoomType D,Room E
	where A.ID=@idBill and A.IDReceiveRoom=B.ID and B.IDRoom=E.ID and E.IDRoomType=D.ID and C.ID=B.IDBookRoom

	select @countCustomer=COUNT(B.IDReceiveRoom)
	from ReceiveRoom A,ReceiveRoomDetails B
	where A.ID=@idReceiveRoom and A.ID=B.IDReceiveRoom

	set @roomPrice=@price*@days;

	declare @QD2 float = 0 -- tre em
	select @QD2= value from PARAMETER where Name = N'Trẻ em' 

	declare @QD3 float = 0 -- phu thu them
	select @QD3 = value from Parameter where Name = N'Thêm giường'

	declare @QD4 float = 0 -- khach nuoc ngoai
	select @QD4 = value from Parameter where Name = N'Khách nước ngoài'

	if((@countCustomer+1-@limitPerson)>=0)
	set @surcharge=@roomPrice*@QD3*(@countCustomer+1-@limitPerson)

	select @check1=COUNT(*)
	from ReceiveRoom A,BookRoom B,Customer D
	where A.IDBookRoom=B.ID and B.IDCustomer=D.ID and D.Nationality!=N'Việt Nam' and A.ID=@idReceiveRoom
	select @check2=COUNT(*)
	from ReceiveRoom A,ReceiveRoomDetails C,Customer D
	where A.ID=C.IDReceiveRoom and D.ID=C.IDCustomerOther and D.Nationality!=N'Việt Nam' and A.ID=@idReceiveRoom

	if((@check1+@check2)>0) 
	set @surcharge=@surcharge + @roomPrice*(@QD4)
	select @age = datediff(YEAR, C.DateOfBirth, getdate()) from CUSTOMER C,ReceiveRoom A,ReceiveRoomDetails CC
	where A.ID=@idReceiveRoom and A.ID = CC.IDReceiveRoom
	if(@age >= 6 and @age <= 12)
	set @surcharge = @roomPrice * @QD2
	update Bill
	set RoomPrice=@roomPrice, Surcharge=@surcharge
	where id=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBill_ServicePrice]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateBill_ServicePrice]
@idBill int
as
begin
	declare @totalServicePrice int=0
	select @totalServicePrice=SUM(TotalPrice)
	from BillDetails
	where IDBill=@idBill
	if(@totalServicePrice is null)
	set @totalServicePrice=0
	update Bill 
	set ServicePrice=@totalServicePrice
	where ID=@idBill
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBillDetails]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Update count cho Phòng đã có BillDetails và có Service
create proc [dbo].[USP_UpdateBillDetails]
@idBill int,@idService int,@_count int
as
begin
	declare @totalPrice int,@price int,@count int

	select @price=Price
	from Service
	where ID=@idService

	select @count=Count
	from Bill A,BillDetails B
	where A.ID=B.IDBill and A.ID=@idBill and A.IDStatusBill=1 and B.IDService=@idService

	set @count=@count+@_count
	if(@count>0)
	begin
		set @totalPrice=@count*@price
		update BillDetails
		set Count=@count,TotalPrice=@totalPrice
		where IDBill=@idBill and IDService=@idService
	end
	else
	begin
		delete from BillDetails
		where IDBill=@idBill and IDService=@idService
	end
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateBookRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[USP_UpdateBookRoom]
@id int,@idRoomType int,@dateCheckIn date,@datecheckOut date
as
begin
	update BookRoom
	set IDRoomType=@idRoomType,DateCheckIn=@dateCheckIn,DateCheckOut=@datecheckOut
	where ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateCustomer]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateCustomer]
@id INT, @customerName NVARCHAR(100), @idCustomerType int, @idCardNow NVARCHAR(100), @address NVARCHAR(200),
@dateOfBirth date, @phoneNumber int, @sex NVARCHAR(100), @nationality NVARCHAR(100), @idCardPre NVARCHAR(100)
AS
BEGIN
	IF(@idCardPre != @idCardNow)
	begin
		DECLARE @count INT=0
		SELECT @count=COUNT(*)
		FROM dbo.Customer
		WHERE IDCard = @idCardNow
		IF(@count=0)
		BEGIN
			UPDATE dbo.Customer 
			SET 
			Name =@customerName, IDCustomerType = @idCustomerType, IDCard =@idCardNow,
			Address = @address, DateOfBirth =@dateOfBirth, PhoneNumber =@phoneNumber,
			Nationality = @nationality, Sex = @sex
			WHERE ID = @id
		END
	END
	ELSE
	BEGIN
		UPDATE dbo.Customer 
			SET 
			Name =@customerName, IDCustomerType = @idCustomerType,Address = @address,
			DateOfBirth =@dateOfBirth, PhoneNumber =@phoneNumber,
			Nationality = @nationality, Sex = @sex
			WHERE ID = @id
	end
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateCustomer_]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateCustomer_]
@id int,@name nvarchar(50),@idCard nvarchar(50),@idCustomerType int,@phoneNumber int, @dateOfBirth date,@address nvarchar(100),@sex nvarchar(20),@nationality nvarchar(100)
as
begin
	update Customer
	set Name=@name,IDCard=@idCard,IDCustomerType=@idCustomerType,PhoneNumber=@phoneNumber,DateOfBirth=@dateOfBirth,Address=@address,Sex=@sex,Nationality=@nationality
	where ID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateDisplayName]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateDisplayName]
@username nvarchar(100),@displayname nvarchar(100)
as
begin
	update Staff
	set DisplayName=@displayname
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateDisplayName1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateDisplayName1]
@username nvarchar(100),@displayname nvarchar(100)
as
begin
	update Staff
	set DisplayName=@displayname
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateInfo]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateInfo]
@username nvarchar(100),@address nvarchar(100),@phonenumber int,@idcard nvarchar(100)
as
begin
	update Staff
	set Address=@address,PhoneNumber=@phonenumber,IDCard=@idcard
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateInfo1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateInfo1]
@username nvarchar(100),@address nvarchar(100),@phonenumber int,@idcard nvarchar(100),@dateofbirth datetime
as
begin
	update Staff
	set Address=@address,PhoneNumber=@phonenumber,IDCard=@idcard,DateOfBirth=@dateofbirth
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateParameter]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateParameter]
@name NVARCHAR(200), @value float, @describe NVARCHAR(200)
AS
BEGIN
UPDATE dbo.PARAMETER
	SET
	Value = @value,
	Describe = @describe,
	datemodify = GETDATE()
	WHERE name = @name
	SELECT @name = @name
	IF(@name = 'QD2.1')
		UPDATE dbo.ROOMTYPE SET LimitPerson = @value WHERE ID = 1
	ELSE IF(@name = 'QD2.2')
		UPDATE dbo.ROOMTYPE SET LimitPerson = @value WHERE ID = 2
	ELSE IF(@name = 'QD2.3')
		UPDATE dbo.ROOMTYPE SET LimitPerson = @value WHERE ID = 3
	ELSE IF(@name = 'QD2.4')
		UPDATE dbo.ROOMTYPE SET LimitPerson = @value WHERE ID = 4
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdatePassword]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdatePassword]
@username nvarchar(100),@password nvarchar(100)
as
begin
	update Staff
	set PassWord=@password
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdatePassword1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdatePassword1]
@username nvarchar(100),@password nvarchar(100)
as
begin
	update Staff
	set PassWord=@password
	where UserName=@username
end
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateReceiveRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateReceiveRoom]
@id int,@idRoom int
as
begin
	update ReceiveRoom
	set IDRoom=@idRoom
	where ID=@id

	update Room
	set IDStatusRoom=2
	where ID=@idRoom
end	

GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateRoom]
@id INT, @nameRoom NVARCHAR(100), @idRoomType INT, @idStatusRoom INT
AS
UPDATE dbo.Room
SET
	Name = @nameRoom, IDRoomType = @idRoomType, IDStatusRoom = @idStatusRoom
WHERE ID = @id
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateRoomType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateRoomType]
@id INT, @name NVARCHAR(100), @price int, @limitPerson int
AS
	UPDATE RoomType
	SET
    name = @name, Price = @price, LimitPerson = @limitPerson
	WHERE id =@id
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateService]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateService]
@id int, @name nvarchar(200), @idServiceType int, @price int,@quantity int,@picture image
as
begin
	update SERVICE
	set
	SERVICE.Name = @name,
	SERVICE.IDServiceType = @idservicetype,
	SERVICE.Price = @price,
	SERVICE.Quantity = @quantity,
	SERVICE.Picture = @picture
	where SERVICE.ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateServiceType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateServiceType]
@id INT, @name NVARCHAR(100)
AS
BEGIN
	UPDATE dbo.ServiceType
	SET
    name = @name
	WHERE id =@id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateStaff]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateStaff]
@user NVARCHAR(100), @name NVARCHAR(100),@idStaffType INT,
@idCard NVARCHAR(100), @dateOfBirth DATE, @sex NVARCHAR(100),
@address NVARCHAR(200), @phoneNumber INT, @startDay DATE, @picture nvarchar(max)
AS
BEGIN
	DECLARE @count INT = 0
	SELECT @count=COUNT(*) FROM staff
	WHERE IDCard = @idCard AND UserName != @user
	IF(@count = 0)
	UPDATE dbo.STAFF
	SET
    displayname = @name, idstafftype = @idstafftype,
	idcard= @idCard, DateOfBirth = @dateOfBirth, sex = @sex,
	Address = @address, PhoneNumber = @phoneNumber, StartDay = @startDay, Picture=@picture
	WHERE UserName = @user
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateStaff1]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateStaff1]
@displayName NVARCHAR(100),@idStaffType INT,
@idCard NVARCHAR(100), @dateOfBirth DATE, @sex NVARCHAR(100),
@address NVARCHAR(200), @phoneNumber INT, @startDay DATE, @picture nvarchar(max),@userName NVARCHAR(100)
AS
BEGIN	
	UPDATE dbo.STAFF 
	SET
    DisplayName= @displayName, IDStaffType = @idStaffType,
	IDCard= @idCard, DateOfBirth = @dateOfBirth, Sex = @sex,
	Address = @address, PhoneNumber = @phoneNumber, StartDay = @startDay, Picture = @picture
	WHERE UserName = @userName
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateStaffType]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_UpdateStaffType] 
@id int, @name NVARCHAR(100)
AS
BEGIN
	UPDATE dbo.StaffType
	SET
    Name = @name
	WHERE ID = @id
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UpdateStatusRoom]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[USP_UpdateStatusRoom]
@idRoom int
as
begin
	update Room
	set IDStatusRoom=1
	where ID=@idRoom
end
GO
/****** Object:  Trigger [dbo].[trg_CapNhatDatHang]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* cập nhật hàng trong kho sau khi cập nhật đặt hàng */
CREATE TRIGGER [dbo].[trg_CapNhatDatHang] on [dbo].[BILLDETAILS] after update AS
BEGIN
   UPDATE SERVICE SET SERVICE.Quantity = SERVICE.Quantity -
	   (SELECT Count FROM inserted WHERE IDService = SERVICE.ID) +
	   (SELECT Count FROM deleted WHERE IDService = SERVICE.ID)
   FROM SERVICE 
   JOIN deleted ON SERVICE.ID = deleted.IDService
end
GO
ALTER TABLE [dbo].[BILLDETAILS] ENABLE TRIGGER [trg_CapNhatDatHang]
GO
/****** Object:  Trigger [dbo].[trg_DatHang]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* cập nhật hàng trong kho sau khi đặt hàng hoặc cập nhật */
CREATE TRIGGER [dbo].[trg_DatHang] ON [dbo].[BILLDETAILS] AFTER INSERT AS 
BEGIN
	UPDATE SERVICE
	SET SERVICE.Quantity = SERVICE.Quantity - (
		SELECT Count
		FROM inserted
		WHERE IDService = SERVICE.ID
	)
	FROM SERVICE
	JOIN inserted ON SERVICE.ID = inserted.IDService
END
GO
ALTER TABLE [dbo].[BILLDETAILS] ENABLE TRIGGER [trg_DatHang]
GO
/****** Object:  Trigger [dbo].[trg_HuyDatHang]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* cập nhật hàng trong kho sau khi hủy đặt hàng */
create TRIGGER [dbo].[trg_HuyDatHang] ON [dbo].[BILLDETAILS] FOR DELETE AS 
BEGIN
	UPDATE SERVICE
	SET SERVICE.Quantity = SERVICE.Quantity + (SELECT Count FROM deleted WHERE IDService = SERVICE.ID)
	FROM SERVICE 
	JOIN deleted ON SERVICE.ID = deleted.IDService
END
GO
ALTER TABLE [dbo].[BILLDETAILS] ENABLE TRIGGER [trg_HuyDatHang]
GO
/****** Object:  Trigger [dbo].[UTG_UpdateRateReport]    Script Date: 2/7/2023 9:56:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[UTG_UpdateRateReport]
ON [dbo].[REPORTS] FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @month INT = 0
	DECLARE @year INT = 0
	DECLARE @sum INT = 0
	SELECT @month = MONTH, @year = YEAR FROM Inserted
	SELECT @sum = SUM(value)
	FROM dbo.REPORTS
	WHERE Month = @month AND Year = @year
	IF(@sum > 0)
	UPDATE dbo.REPORTS
	SET
		rate = ROUND((value * 100.0 / @sum), 2)
	WHERE Month = @month AND Year = @year
END
GO
ALTER TABLE [dbo].[REPORTS] ENABLE TRIGGER [UTG_UpdateRateReport]
GO
USE [master]
GO
ALTER DATABASE [HotelManagement] SET  READ_WRITE 
GO
