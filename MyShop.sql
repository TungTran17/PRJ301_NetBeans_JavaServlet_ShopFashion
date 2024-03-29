USE [master]
GO
/****** Object:  Database [MyShop]    Script Date: 3/23/2023 4:33:20 PM ******/
CREATE DATABASE [MyShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MyShop', FILENAME = N'D:\DELL\MSSQL15.TUNG\MSSQL\DATA\MyShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MyShop_log', FILENAME = N'D:\DELL\MSSQL15.TUNG\MSSQL\DATA\MyShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MyShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MyShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MyShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MyShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MyShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MyShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MyShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MyShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MyShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MyShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MyShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MyShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MyShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MyShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MyShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MyShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MyShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MyShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MyShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MyShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MyShop] SET  MULTI_USER 
GO
ALTER DATABASE [MyShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MyShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MyShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MyShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MyShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MyShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MyShop] SET QUERY_STORE = OFF
GO
USE [MyShop]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/23/2023 4:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[A_id] [int] IDENTITY(1,1) NOT NULL,
	[account] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[A_name] [nvarchar](50) NOT NULL,
	[A_dob] [date] NOT NULL,
	[A_phone] [varchar](10) NOT NULL,
	[A_email] [nvarchar](50) NULL,
	[A_address] [nvarchar](50) NOT NULL,
	[is_admin] [nvarchar](50) NOT NULL,
	[is_seller] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[A_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/23/2023 4:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Cate_id] [int] NOT NULL,
	[Cate_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Cate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 3/23/2023 4:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[C_id] [int] NOT NULL,
	[C_account] [nvarchar](50) NOT NULL,
	[C_password] [nvarchar](50) NOT NULL,
	[C_name] [nvarchar](50) NOT NULL,
	[C_phone] [varchar](50) NOT NULL,
	[C_address] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[C_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/23/2023 4:33:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[P_code] [varchar](20) NOT NULL,
	[P_name] [nvarchar](500) NOT NULL,
	[P_color] [nchar](10) NULL,
	[Cate_id] [int] NOT NULL,
	[P_price] [int] NOT NULL,
	[P_size] [varchar](50) NOT NULL,
	[P_image] [nvarchar](500) NULL,
	[P_discount] [int] NULL,
	[P_description] [nvarchar](4000) NULL,
	[P_dateadd] [date] NOT NULL,
	[Seller_id] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[P_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (1, N'admin', N'admin', N'Trần Văn Tùng (Admin)', CAST(N'2002-11-11' AS Date), N'090000000', N'thaingunhubo@gmail.com', N'Hà Nội', N'1', N'1')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (2, N'admin123', N'12', N'tungggg', CAST(N'2023-03-01' AS Date), N'0337472684', N'tungtvhe163636@fpt.edu.vn', N'asas', N'0', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (5, N'rhgfhf', N'sdafaa', N'dsfd', CAST(N'2023-01-01' AS Date), N'4334543254', N'sdfgdfg', N'sdfdsf', N'0', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (6, N't?ty', N'trytr', N'etret', CAST(N'2022-11-11' AS Date), N'32423', N'sdfds', N'gfdhgf', N'0', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (7, N'user', N'123', N'tung', CAST(N'2023-03-09' AS Date), N'0337472684', N'trantungmr11@gmail.com', N'asdsa', N'0', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (8, N'user1', N'password1', N'John Smith', CAST(N'1990-01-01' AS Date), N'12367890', N'johnsmith@example.com', N'123 Main St.', N'1', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (9, N'user10', N'pasword10', N'Tunggggggg', CAST(N'2000-12-12' AS Date), N'32435467', N'shuahdisuahgdis', N'saddfghthy', N'0', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (10, N'user2', N'password2', N'Tung', CAST(N'1995-05-17' AS Date), N'0337472684', N'tung@gmail.com', N'Thạch Hòa-Thạch Thất-Hà Nội', N'1', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (11, N'user3', N'password3', N'Bob Johnson', CAST(N'1985-06-30' AS Date), N'312443254', N'bobjohnson@example.com', N'789 Maple Ave.', N'0', N'1')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (12, N'user4', N'password4', N'Mary Adams', CAST(N'1992-12-25' AS Date), N'564765567', N'maryadams@example.com', N'1010 Oak St.', N'0', N'1')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (13, N'user5', N'password5', N'Tom Wilson', CAST(N'1988-11-07' AS Date), N'32144765', N'tomwilson@example.com', N'1313 Mockingbird Ln.', N'0', N'1')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (14, N'thaingu', N'12', N'ThaiGiam', CAST(N'2023-02-28' AS Date), N'0337472684', N'tungt', N'dsada', N'0', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (15, N'admin113', N'123', N'TungSwap', CAST(N'2023-03-02' AS Date), N'029273', N'gfdghhj', N'dfsafdadfdda', N'0', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (1014, N'alo', N'1', N'hi', CAST(N'2023-02-28' AS Date), N'0337472684', N'trantu', N'dsada', N'0', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (1015, N'ali', N'1', N'mra', CAST(N'2023-02-26' AS Date), N'0337472684', N'nguyenhuycr710@gmail.com', N'dsada', N'0', N'0')
INSERT [dbo].[Account] ([A_id], [account], [password], [A_name], [A_dob], [A_phone], [A_email], [A_address], [is_admin], [is_seller]) VALUES (1016, N'tunggg', N'1', N'1sad', CAST(N'2023-03-02' AS Date), N'0337472684', N'tungtvhe163636@fpt.edu.vn', N'dsada', N'0', N'1')
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
INSERT [dbo].[Category] ([Cate_id], [Cate_name]) VALUES (1, N'Áo')
INSERT [dbo].[Category] ([Cate_id], [Cate_name]) VALUES (2, N'Quần')
INSERT [dbo].[Category] ([Cate_id], [Cate_name]) VALUES (3, N'Váy')
INSERT [dbo].[Category] ([Cate_id], [Cate_name]) VALUES (4, N'Giày')
GO
INSERT [dbo].[Customers] ([C_id], [C_account], [C_password], [C_name], [C_phone], [C_address]) VALUES (1, N'thaibeo', N'123', N'thai', N'65487568', N'Ha Noi')
INSERT [dbo].[Customers] ([C_id], [C_account], [C_password], [C_name], [C_phone], [C_address]) VALUES (2, N'taibalo', N'123', N'tai', N'65478687', N'Ha Noi')
INSERT [dbo].[Customers] ([C_id], [C_account], [C_password], [C_name], [C_phone], [C_address]) VALUES (3, N'tungdeptry', N'123', N'tung', N'5678768', N'Thanh Hoa')
GO
INSERT [dbo].[Products] ([P_code], [P_name], [P_color], [Cate_id], [P_price], [P_size], [P_image], [P_discount], [P_description], [P_dateadd], [Seller_id]) VALUES (N'P023', N'Áo đá bóng', N'Đỏ        ', 1, 200000, N'XL', N'image11.jpg', 10, N'Áo đá bóng chinhs hãng, chất lượng cao, giá cả hợp lý, phù hợp vơis mùa hè."', CAST(N'2023-01-29' AS Date), 11)
INSERT [dbo].[Products] ([P_code], [P_name], [P_color], [Cate_id], [P_price], [P_size], [P_image], [P_discount], [P_description], [P_dateadd], [Seller_id]) VALUES (N'P027', N'Áo Blazer nữ', N'Hồng      ', 1, 500000, N'M', N'image12.jpg', 10, N'Áo công sở, phù hợp cho đi làm và đi chơi."""', CAST(N'2023-03-18' AS Date), 11)
INSERT [dbo].[Products] ([P_code], [P_name], [P_color], [Cate_id], [P_price], [P_size], [P_image], [P_discount], [P_description], [P_dateadd], [Seller_id]) VALUES (N'P030', N'Giày đá bóng Nike', N'XanhTrang ', 4, 1200000, N'L', N'image16.jpg', 20, N'fdsagfsdhgsd', CAST(N'2023-03-12' AS Date), 11)
INSERT [dbo].[Products] ([P_code], [P_name], [P_color], [Cate_id], [P_price], [P_size], [P_image], [P_discount], [P_description], [P_dateadd], [Seller_id]) VALUES (N'P031', N'Áo Blazer nam', N'Xám       ', 1, 900000, N'XL', N'image14.jpg', 20, N'fddfghgfjgkjhgjhgffsdgdgf', CAST(N'2023-03-06' AS Date), 11)
GO
USE [master]
GO
ALTER DATABASE [MyShop] SET  READ_WRITE 
GO
