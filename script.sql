USE [master]
GO
/****** Object:  Database [bookingProject]    Script Date: 6/15/2023 12:55:14 AM ******/
CREATE DATABASE [bookingProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookingProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bookingProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookingProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\bookingProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [bookingProject] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookingProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookingProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookingProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookingProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookingProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookingProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookingProject] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookingProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookingProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookingProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookingProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookingProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookingProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookingProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookingProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookingProject] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bookingProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookingProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookingProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookingProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookingProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookingProject] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookingProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookingProject] SET RECOVERY FULL 
GO
ALTER DATABASE [bookingProject] SET  MULTI_USER 
GO
ALTER DATABASE [bookingProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookingProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookingProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookingProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bookingProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bookingProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'bookingProject', N'ON'
GO
ALTER DATABASE [bookingProject] SET QUERY_STORE = OFF
GO
USE [bookingProject]
GO
/****** Object:  User [trandtrieu123]    Script Date: 6/15/2023 12:55:14 AM ******/
CREATE USER [trandtrieu123] FOR LOGIN [trandtrieu123] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [trandtrieu]    Script Date: 6/15/2023 12:55:14 AM ******/
CREATE USER [trandtrieu] FOR LOGIN [trandtrieu] WITH DEFAULT_SCHEMA=[trandtrieu]
GO
/****** Object:  Schema [trandtrieu]    Script Date: 6/15/2023 12:55:14 AM ******/
CREATE SCHEMA [trandtrieu]
GO
/****** Object:  Table [dbo].[account]    Script Date: 6/15/2023 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[u_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[password] [nvarchar](20) NULL,
	[email] [nvarchar](30) NULL,
	[phone] [int] NULL,
	[role] [int] NULL,
	[avatar] [nvarchar](max) NULL,
 CONSTRAINT [PK__account__3213E83F5820D8AE] PRIMARY KEY CLUSTERED 
(
	[u_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookTour]    Script Date: 6/15/2023 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bookTour](
	[o_id] [int] IDENTITY(1,1) NOT NULL,
	[t_id] [int] NULL,
	[u_id] [int] NULL,
	[book_date] [varchar](450) NULL,
	[book_cusName] [nvarchar](max) NULL,
	[book_address] [nvarchar](max) NULL,
	[book_phone] [char](10) NULL,
	[book_email] [nvarchar](50) NULL,
	[book_quantityAd] [int] NULL,
	[book_quantityChild] [int] NULL,
	[note] [nvarchar](max) NULL,
	[total_amount] [float] NULL,
 CONSTRAINT [PK_bookTour] PRIMARY KEY CLUSTERED 
(
	[o_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content]    Script Date: 6/15/2023 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[content](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[bannerLink] [nvarchar](150) NOT NULL,
	[introduce] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_content] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[feedbackTour]    Script Date: 6/15/2023 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[feedbackTour](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](max) NULL,
	[rated_star] [int] NULL,
	[feedback] [nvarchar](max) NULL,
	[tourId] [int] NULL,
	[u_id] [int] NULL,
	[date] [date] NULL,
	[avatar] [nvarchar](max) NULL,
	[parent_feedback_id] [int] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[place]    Script Date: 6/15/2023 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[place](
	[placeId] [int] IDENTITY(1,1) NOT NULL,
	[placeName] [nvarchar](50) NOT NULL,
	[placeContent] [nvarchar](max) NOT NULL,
	[placeImage] [nvarchar](50) NOT NULL,
	[regionId] [int] NOT NULL,
 CONSTRAINT [PK_place] PRIMARY KEY CLUSTERED 
(
	[placeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region]    Script Date: 6/15/2023 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[region](
	[regionId] [int] IDENTITY(1,1) NOT NULL,
	[regionName] [nvarchar](max) NULL,
	[regionImage] [nvarchar](max) NULL,
	[regionDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK_region] PRIMARY KEY CLUSTERED 
(
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 6/15/2023 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[schedule](
	[scheduleId] [int] IDENTITY(1,1) NOT NULL,
	[day1] [nvarchar](max) NULL,
	[day2] [nvarchar](max) NULL,
	[day3] [nvarchar](max) NULL,
	[day4] [nvarchar](max) NULL,
	[day5] [nvarchar](max) NULL,
	[day6] [nvarchar](max) NULL,
	[day7] [nvarchar](max) NULL,
 CONSTRAINT [PK_schedule] PRIMARY KEY CLUSTERED 
(
	[scheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tour]    Script Date: 6/15/2023 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tour](
	[tourId] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[price] [float] NOT NULL,
	[dateStart] [date] NULL,
	[dateEnd] [date] NULL,
	[detail] [nvarchar](max) NOT NULL,
	[image] [nvarchar](max) NOT NULL,
	[status] [bit] NOT NULL,
	[placeId] [int] NOT NULL,
	[guideId] [int] NULL,
	[scheduleId] [int] NULL,
	[regionId] [int] NULL,
	[seat] [int] NULL,
 CONSTRAINT [PK_tour] PRIMARY KEY CLUSTERED 
(
	[tourId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tourGuider]    Script Date: 6/15/2023 12:55:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tourGuider](
	[guideId] [int] IDENTITY(1,1) NOT NULL,
	[guideName] [nvarchar](50) NOT NULL,
	[guideAge] [int] NOT NULL,
	[guideImage] [nvarchar](50) NOT NULL,
	[guideEmail] [nvarchar](50) NOT NULL,
	[guidePhone] [nvarchar](15) NOT NULL,
	[guideAddress] [nvarchar](max) NULL,
	[guideYearExperience] [int] NULL,
	[guideSex] [nvarchar](10) NULL,
	[guideDetail] [nvarchar](max) NULL,
 CONSTRAINT [PK_tourGuider] PRIMARY KEY CLUSTERED 
(
	[guideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (1, N'abc', N'123', N'abc@gmail.com', 123456789, 0, N'trieu1.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (3, N'admin', N'123', N'trieutdde160252@fpt.edu.vn', 867167237, 1, N'trung.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (4, N'trandtrieu', N'1', N'tr@gmail.com', 1232323, 0, N'team-1.jpg')
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[bookTour] ON 

INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (134, 2, 3, N'2023-06-06', N'Trần CHí Phúc', N'Quang Tri', N'0867167237', N'phuctcde160360@fpt.edu.vn', 1, 1, N'retry', 0)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (161, 6, 3, N'2023-06-07', N'nguoi quang nam', N'duy xuyen', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'aaaaa', 2175000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (162, 5, 3, N'2023-06-07', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 7, 6, N'qưeqweqwe', 15000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (163, 3, 3, N'2023-06-07', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 6, 0, N'sádasdas', 15000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (164, 2, 3, N'2023-06-07', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'âsd', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (165, 2, 1, N'2023-06-08', N'Trần CHí Phúc', N'Quang Tri', N'0867167237', N'phuctcde160360@fpt.edu.vn', 1, 1, N'qqqqq', 1200000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (166, 2, 1, N'2023-06-08', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'999', 1200000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (167, 1, 1, N'2023-06-08', N'Trần Đình Triều', N'Quảng Nam', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'.', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (168, 3, 1, N'2023-06-08', N'nguoi quang nam', N'duy xuyen', N'1232323   ', N'binhnvde160601@fpt.edu.vn', 1111, 1, N'con cẹt', 2778749952)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (169, 2, 1, N'2023-06-08', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 2, 1, N'11', 2000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (170, 1, 1, N'2023-06-08', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'qqqq', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (171, 2, 1, N'2023-06-09', N'nguoi quang nam', N'duy xuyen', N'1232323   ', N'trandtrieu@gmail.com', 1, 1, N'ưeqwqe', 1200000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (172, 2, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 11, N'1', 13200000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (173, 2, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 11, N'1', 13200000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (174, 2, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 11, N'1', 13200000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (175, 1, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 11, N'1', 49500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (176, 2, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 11, N'1', 13200000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (177, 2, 1, N'2023-06-12', N'12 trie', N'111', N'0789458707', N'trandtrieu@gmail.com', 4, 4, N'333', 4800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (178, 1, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'111', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (179, 4, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 5, 7, N'111', 17000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (180, 4, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 17, 5, N'322', 39000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (181, 1, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'111', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (182, 1, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 11, N'1', 49500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (183, 1, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 11, N'1111', 49500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (184, 1, 1, N'2023-06-12', N'nguoi quang nam', N'duy xuyen', N'1232323   ', N'trandtrieu@gmail.com', 5, 1, N'111', 16500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (185, 1, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'111', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (186, 1, 1, N'2023-06-12', N'tran dinh trieu', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 11, N'11', 49500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (187, 1, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 5, N'a', 10500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (188, 1, 1, N'2023-06-12', N'12 trie', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 11, N'111', 49500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (189, 1, 1, N'2023-06-12', N'tran dinh trieu', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 1, N'111', 34500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (190, 1, 1, N'2023-06-12', N'tran dinh trieu', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 1, N'111', 34500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (191, 1, 1, N'2023-06-12', N'tran dinh trieu', N'123123', N'0789458707', N'trandtrieu@gmail.com', 11, 1, N'111', 34500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (192, 1, 1, N'2023-06-12', N'tran dinh trieu', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'111', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (193, 1, 1, N'2023-06-12', N'tran dinh trieu', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'111', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (194, 1, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'1', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (195, 1, 1, N'2023-06-12', N'tran dinh trieu', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'1', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (196, 1, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'1', 4500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (197, 2, 1, N'2023-06-12', N'trieu tran', N'123123', N'0789458707', N'trandtrieu@gmail.com', 1, 1, N'1111', 1200000)
SET IDENTITY_INSERT [dbo].[bookTour] OFF
GO
SET IDENTITY_INSERT [dbo].[feedbackTour] ON 

INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (16, N'abc', 2, N'aaaaaaaaaaaaa', 1, 1, NULL, N'trieu1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (17, N'admin', 2, N'qqqqqqqqqqqqqqq', 1, 3, NULL, N'trung.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (18, N'admin', 5, N'qqqq', 1, 3, NULL, N'trung.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (19, N'abc', 5, N'tuyet voi', 2, 1, NULL, N'trieu1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (20, N'abc', 5, N'123123', 1, 1, NULL, N'trieu1.jpg', NULL)
SET IDENTITY_INSERT [dbo].[feedbackTour] OFF
GO
SET IDENTITY_INSERT [dbo].[place] ON 

INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (1, N'Đà Nẵng', N'Du lịch Đà Nẵng – nơi được mệnh danh là “thành phố đáng đến nhất Việt Nam” – nơi đây đang dần trở thành điểm sáng của cả nước trong lĩnh vực du lịch, thu hút hàng triệu lượt du khách mỗi năm bởi vẻ trẻ trung, văn minh, và hiện đại.', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (2, N'Quảng Nam', N'Nhắc đến các địa điểm du lịch Quảng Nam, chắc hẳn ai ai cũng đều quá quen thuộc  phố cổ Hội An và thánh địa Mỹ Sơn, kinh đô cổ Trà Kiệu, các tháp chàm Khương Mỹ, Chiên Đàn, Bàng An, Phật viện Đồng Dương…ghi lại dấu ấn rực rỡ của nền văn hóa Sa Huỳnh, Champa, Đại Việt. Quảng Nam đã thu hút đông đảo khách du lịch trong và ngoài nước tới đây, bởi Quảng Nam là một mảnh đất tuy nghèo vật chất nhưng tự nhiên phú cho vùng đất này nhiều bãi tắm đẹp hấp dẫn cùng nhiều danh thắng được công nhận là di sản thế giới. ', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (3, N'Quảng Trị', N'Du lịch Quảng Trị hiện đang thu hút cả các bạn trẻ và nhiều du khách nước ngoài khi không chỉ sở hữu những trang lịch sử kháng chiến chống giặc đầy hào hùng mà còn có những thắng cảnh thiên nhiên thu hút.', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (4, N'Hà Nội', N'Hà Nội là điểm đến hấp dẫn nếu bạn muốn khám phá du lịch miền Bắc. Chuyến hành trình du lịch Hà Nội “gây thương nhớ” với du khách bởi một màu sắc rất riêng, “rất Hà Nội”. Đó là những phố cổ xưa cũ, các di tích lịch sử nhuộm màu thời gian và vô số địa điểm giải trí vui hết nấc khác.', N'trieu.jpg', 1)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (5, N'Ninh Binh', N'Nhắc đến Ninh Bình có lẽ bạn sẽ nghĩ ngay đến vùng đất cố đô Hoa Lư trong những trang sử hào hùng. Nhưng bạn biết không, ngoài bề dày lịch sử, vùng đất này còn là nơi hội tụ vô vàn thắng cảnh thiên nhiên đẹp tựa tranh thơ như Tuyệt Tình Cốc, chùa Bái Đính hay Tràng An,...', N'trieu.jpg', 1)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (6, N'Hồ Chí Minh', N'Sở hữu không gian đô thị đặc trưng, năng động và hiện đại, thành phố Hồ Chí Minh mang trong mình những giá trị văn hóa vật thể và phi vật thể đa dạng, dung hòa giữa đương đại và truyền thống, tạo nên sức hấp dẫn riêng biệt.', N'trieu.jpg', 3)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (7, N'Lâm Đồng', N'Du lịch Lâm Đồng một vùng đất được biết đến là một trong những trung tâm du lịch nghỉ dưỡng quan trong của cả nước. Lâm Đồng là một trong năm tỉnh thuộc vùng Tây Nguyên, có vị trí nằm trên cao nguyên Lâm Viên với độ cao khoảng 1.500m. Với địa hình chủ yếu là núi và cao nguyên đã khiến cho Lâm Đồng và du lịch Đà Lạt trở thành một địa điểm có nhiều cảnh quan đẹp với bầu không khí trong lành, mát mẻ được nhiều du khách trong và ngoài nước yêu thích.', N'trieu.jpg', 3)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (13, N'Đà Lạt', N'Đà Lạt được mệnh danh là thiên đường du lịch. Một xứ sở của các loài hoa thi nhau đua sắc thắm.  Ở Đà Lạt tập trung rất nhiều các loài hoa quý từ các nước khác nhập về. Tạo thêm cho Đà Lạt một vẽ đẹp huyền bí và mơ mộng tới tột cùng. Màng không có một thành phố nào tại nước Việt Nam ta sánh kịp với Đà Lạt.', N'trieu.jpg', 3)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (18, N'sapa', N'đajlw', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (19, N'Huế', N'Huế ơi là huế', N'trieu.jpg', 2)
INSERT [dbo].[place] ([placeId], [placeName], [placeContent], [placeImage], [regionId]) VALUES (20, N'An giang', N'Hello', N'trieu.jpg', 3)
SET IDENTITY_INSERT [dbo].[place] OFF
GO
SET IDENTITY_INSERT [dbo].[region] ON 

INSERT [dbo].[region] ([regionId], [regionName], [regionImage], [regionDetail]) VALUES (1, N'Miền Bắc', N'bac.jpg', N'Du lịch Miền Bắc Việt Nam  được xem là cái nôi của nền văn hóa, lịch sử lâu đời của Việt Nam. Không những vậy, miền Bắc còn là nơi cất chứa vô cùng nhiều những vẻ đẹp của mẹ thiên nhiên. Đi du lịch miền Bắc Việt NAM, bạn sẽ được chiêm ngưỡng những công trình kiến trúc hoành tráng cùng cảnh quan thiên nhiên tuyệt đẹp')
INSERT [dbo].[region] ([regionId], [regionName], [regionImage], [regionDetail]) VALUES (2, N'Miền Trung', N'trung.jpg', N'Hội tụ đủ cái đẹp của nắng gió, biển xanh, mây trắng và cảnh quan hùng vĩ, du lịch miền Trung hấp dẫn đông đảo du khách bởi chính sự giao thoa tổng hòa này.')
INSERT [dbo].[region] ([regionId], [regionName], [regionImage], [regionDetail]) VALUES (3, N'Miền Nam', N'nam.jpg', N'Du lịch miền Nam khám phá trọn vẹn vẻ đẹp về thiên nhiên, con người và nét văn hóa của vùng đất nơi đây luôn là điều thu hút tín đồ yêu thích xê dịch. Những kinh nghiệm du lịch chi tiết cùng trải nghiệm thực tế về những địa điểm du lịch ở miền Nam giúp bạn có thêm thông tin cho chuyến du lịch miền Nam trọn vẹn nhất. ')
SET IDENTITY_INSERT [dbo].[region] OFF
GO
SET IDENTITY_INSERT [dbo].[schedule] ON 

INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (1, N'Ngày 01: Đà Nẵng - Ngũ Hành Sơn - Hội An (Ăn trưa/tối )
09h00: Xe đón quý khách tại Sân bay Quốc Tế Đà Nẵng, đưa quý khách đến Ngũ Hành Sơn
09h45: Quý khách bắt đầu ghé thăm danh thắng Ngũ Hành Sơn, khám phá 5 ngọn Kim Sơn, Mộc Sơn, Thủy Sơn, Hỏa Sơn, Thổ Sơn những vẻ kỳ bí dị thường. Tại đây quý khách được tận mắt nhìn thấy sự điêu luyện của con người tại làng đá mỹ nghệ Non Nước và có thể mua về làm quà tặng. Tiếp tục tham quan tháp Xá Lợi, Chùa Linh Ứng, động Tàn Chơn. Được ngắm nhìn thành phố Đà Nẵng từ trên cao và cảm nhận từng làn gió biển mát lạnh nơi này.', N'Ngày 02: Đà Năng - Bà Nà Hills (Ăn sáng/trưa/tối)
Sáng: Dùng điểm tâm sáng tại khách sạn
8h30: Đón khách tại khách sạn, khởi hành tham quan khu du lịch Bà Nà - Núi Chúa', N'Ngày 03 : Đà Nẵng - Núi Thần Tài (Ăn sáng/trưa/tối)
Sáng: Điểm tâm sáng tại khách sạn
07h45 – 08h15: Xe và hướng dẫn viên của Đà Nẵng Open Tour đón khách tại điểm hẹn khởi hành đến Khu du lịch tắm khoáng Núi Thần Tài.', N'Ngày 04: Đà Nẵng - Bán đảo Sơn Trà - Chợ Cồn - Cầu Tình Yêu (Ăn sáng/trưa/tối)
Sáng: Điểm tâm sáng tại khách sạn
8h00: Xe và HDV của Đà Nẵng Open Tour đón khách tại khách sạn và khởi hành đi bán đảo Sơn Trà, tham quan Chùa Linh Ứng, là một trong 3 chùa Linh Ứng lớn nhất, đẹp nhất, mới nhất và to nhất của Đà Nẵng. Điểm nhấn quan trọng của chùa chính là tượng Quan Thế Âm 67 mét được xem là bức tượng cao nhất Việt Nam. Bạn sẽ cảm nhận được sự bình an khi tự do tham quan khám phá ngôi chùa này', N'đi học', N'Ngày 05: Đà Nẵng - Biển Mỹ Khê - Sân Bay (Ăn sáng)
Buổi sáng: Quý khách dùng điểm tâm sáng tại khách sạn
Tự do tham quan tắm biển Mỹ Khê xinh đẹp, tự túc mua sắm đồ lưu niệm tại các cửa hàng gần biển
Làn thủ tục check out khách sạn
Xe tiễn đoàn ra sân bay, chào tạm biệt và hẹn gặp lại quý khách trong chương trình lần sau', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (2, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (3, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (4, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (5, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (6, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (7, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (8, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (9, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (10, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (11, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
INSERT [dbo].[schedule] ([scheduleId], [day1], [day2], [day3], [day4], [day5], [day6], [day7]) VALUES (12, N'đi ăn', N'đi ngủ', N'đi uống', N'đi chơi', N'đi học', N'đi haha', N'đi kkk')
SET IDENTITY_INSERT [dbo].[schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[tour] ON 

INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (1, N'Tour Đà Nẵng- Hội An', 3000000, CAST(N'2023-06-11' AS Date), CAST(N'2023-06-18' AS Date), N'Du lịch Đà Nẵng Hội An sẽ là chuyến đi đầy trải nghiệm nếu bạn lên lịch trình chi tiết để khám phá trọn vẹn những vùng đất này. Tại đây, du khách có thể thỏa sức tham quan nhiều danh lam thắng cảnh tuyệt đẹp, nhiều điểm check in nổi tiếng, kèm theo đó là nền văn hóa ẩm thực phong phú, những lễ hội đặc sắc sẽ khiến bạn không nỡ bỏ qua. ', N'danang-hoian.jpg', 0, 1, 2, 1, 2, 0)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (2, N'Tour Châu Đốc- lễ Bà Chúa', 800000, CAST(N'2023-06-30' AS Date), CAST(N'2023-07-02' AS Date), N'Tour Chùa Bà Châu Đốc – Du lịch Hành hương đầu xuân 2023. Đến với mảnh đất An Giang, Quý du khách sẽ được nghe và tìm hiểu về Miếu Bà Chúa Xứ, Núi Cấm, Chùa Kim Tiên lộng lẫy, Chùa Lầu độc đáo với cầu treo thốt nốt,… Ngoài việc được thả tâm hồn với vẻ đẹp của phong cảnh miền tây An giang, Quý khách còn thấy được sự trìu mến hiếu khách của con người miền tây sông nước. Bên cạnh đó là có dịp để cầu an, cầu phước cho gia đình và người thân có được nhiều sức khỏe và  bình an đầu xuân năm mới.', N'chaudoc-bachua.jpg', 0, 20, 12, 2, 3, 23)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (3, N'Tour Bà Nà Hills', 2500000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Cầu Vàng, chùa Linh Ứng, khu vui chơi giải trí Fantasy Park, khu làng Pháp, cáp treo Bà Nà, vườn hoa Le Jardin D’Amour, hầm rượu Debay, đỉnh núi Chúa', N'bana.jpg', 0, 1, 2, 3, 2, 5)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (4, N'Tour Cù Lao Chàm', 2000000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Khu bảo tồn biển, khu dân cư Bãi Làng, chùa Hải Tạng, chợ Tân Hiệp, bãi Hương/ bãi Chồng', N'culaocham.jpg', 0, 2, 8, 4, 2, 8)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (5, N'Tour Linh Ứng Sơn Trà - Ngũ Hành Sơn - Hội An', 1500000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Bán đảo Sơn Trà, Linh Ứng Tự, bãi biển Mỹ Khê, Ngũ Hành Sơn, Làng đá mỹ nghệ Non Nước, phố cổ Hội An', N'linhung.jpg', 0, 1, 2, 5, 2, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (6, N'Tour Rừng dừa Bảy Mẫu - Phố cổ Hội An', 1450000, CAST(N'2023-06-09' AS Date), CAST(N'2023-06-23' AS Date), N'Điểm tham quan nổi bật: Rừng dừa Bảy Mẫu Cẩm Thanh, Phố cổ Hội An (chùa Cầu Nhật Bản, Bảo tàng văn hóa Sa Huỳnh, nhà Cổ, chợ đêm Nguyễn Hoàng...)', N'rungdua7mau.jpg', 0, 2, 5, 6, 2, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (7, N'Tour Cố đô Huế ', 1950000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Vịnh Lăng Cô, lăng vua Khải Định, chùa Thiên Mụ, Đại Nội - Kinh Thành (Ngọ Môn, Điện Thái Hoà, Tử Cấm Thành, Hồ Tĩnh Tâm, Thế Miếu, Hiển Lâm Các, Cửu Đỉnh....)', N'codohue.jpg', 0, 1, 9, 7, 2, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (8, N'City tour Đà Nẵng', 1500000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Ngũ Hành Sơn, Làng đá mỹ nghệ Non Nước, bãi biển Mỹ Khê, bán đảo Sơn Trà, chùa Linh Ứng, Bảo tàng điêu khắc Chăm, chợ Hàn', N'citytour.jpg', 0, 1, 6, 8, 2, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (9, N'Tour Tắm Khoáng nóng Núi Thần Tài', 2800000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Điểm tham quan nổi bật: Bọng Rồng, động Long Tiên, Hồ khoáng nóng tự nhiên, khu vườn hoa quả nhiệt đới', N'nuithantai.jpg', 0, 1, 6, 9, 2, 20)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (10, N'Tour Chợ Nổi Cái Răng Và Đồng Bằng Sông Cửu Long', 4000000, CAST(N'2023-05-30' AS Date), CAST(N'2023-06-02' AS Date), N'Thoát khỏi sự nhộn nhịp của Thành phố Hồ Chí Minh để đến với Đồng bằng sông Cửu Long thanh bình trong chuyến tham quan 2 ngày mang đến sự giới thiệu tuyệt vời cho những du khách lần đầu. Hướng dẫn viên sẽ lo việc lên kế hoạch cho các hoạt động, chỗ ở và di chuyển để bạn không cần phải làm vậy, đồng thời cung cấp góc nhìn của người trong cuộc về văn hóa miền Nam Việt Nam.

Read more about Cai Rang Floating Market and Mekong Delta Luxury 2-Day Tour - https://www.viator.com/tours/Ho-Chi-Minh-City/MEKONG-DELTA-FLOATING-MARKET-2-DAYS-1-NIGHT/d352-18631P13?mcid=56757', N'chonoi.jpg', 0, 6, 6, 10, 3, 15)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (11, N'Hà Nội City Tour - Tràng An - Bái Đính - Du thuyền 5 sao Hạ Long cao cấp', 5000000, CAST(N'2023-06-12' AS Date), CAST(N'2023-06-18' AS Date), N'Điểm nổi bật:
Tham quan Thủ đô Hà Nội vừa cổ kính vừa sôi động
Ghé thăm khu di tích Hồ Chí Minh: Nhà sàn - Lăng Bác - Bảo tàng
Ngắm nhìn quần thể danh thắng Tràng An - Ninh Bình tuyệt đẹp
Trải nghiệm 2N1Đ du ngoạn Vịnh Hạ Long bằng du thuyền 5 sao cao cấp', N'halongbay.jpg', 0, 4, 6, 11, 1, 20)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (12, N'tour nha lam', 44444, CAST(N'2023-06-11' AS Date), CAST(N'2023-06-12' AS Date), N'ádasdasdasd', N'ádasdasd', 0, 2, 9, 1, 2, 30)
SET IDENTITY_INSERT [dbo].[tour] OFF
GO
SET IDENTITY_INSERT [dbo].[tourGuider] ON 

INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail]) VALUES (2, N'Trần Đình Triều', 20, N'trieu1.jpg', N'trieutdde160152@fpt.edu.vn', N'0789458707', N'Quảng Nam', 11, N'Nam', N'Đẹp trai vuii tính')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail]) VALUES (5, N'Nguyễn Văn Nhật Linh', 21, N'team-1.jpg', N'linh@gmail.com', N'0679327323', N'Quảng Nam', 2, N'Nam', N'haha')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail]) VALUES (6, N'Phan Đình Đàn', 20, N'team-1.jpg', N'dan@gmail.com', N'0234324234', N'Hà Tĩnh', 3, N'Nam', N'haha')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail]) VALUES (8, N'Nguyễn Văn Bình', 21, N'team-2.jpg', N'binh@gmail.com', N'0283423422', N'Đà Nẵng', 22, N'Nam', N'hihi')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail]) VALUES (9, N'Hải Nam', 22, N'team-3.jpg', N'nam@gmail.com', N'0998343333', N'Đà Nẵng', 3, N'Nam', N'hoho')
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail]) VALUES (12, N'Trần Thư', 22, N'team-4.jpg', N'thu@gmail.com', N'0923743222', N'Đà Nẵng', 30, N'Nữ', N'hoho')
SET IDENTITY_INSERT [dbo].[tourGuider] OFF
GO
ALTER TABLE [dbo].[bookTour]  WITH CHECK ADD  CONSTRAINT [FK_bookTour_account] FOREIGN KEY([u_id])
REFERENCES [dbo].[account] ([u_id])
GO
ALTER TABLE [dbo].[bookTour] CHECK CONSTRAINT [FK_bookTour_account]
GO
ALTER TABLE [dbo].[place]  WITH CHECK ADD  CONSTRAINT [FK_place_region] FOREIGN KEY([regionId])
REFERENCES [dbo].[region] ([regionId])
GO
ALTER TABLE [dbo].[place] CHECK CONSTRAINT [FK_place_region]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_place] FOREIGN KEY([placeId])
REFERENCES [dbo].[place] ([placeId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_place]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_region] FOREIGN KEY([regionId])
REFERENCES [dbo].[region] ([regionId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_region]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_schedule] FOREIGN KEY([scheduleId])
REFERENCES [dbo].[schedule] ([scheduleId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_schedule]
GO
ALTER TABLE [dbo].[tour]  WITH CHECK ADD  CONSTRAINT [FK_tour_tourGuider] FOREIGN KEY([guideId])
REFERENCES [dbo].[tourGuider] ([guideId])
GO
ALTER TABLE [dbo].[tour] CHECK CONSTRAINT [FK_tour_tourGuider]
GO
USE [master]
GO
ALTER DATABASE [bookingProject] SET  READ_WRITE 
GO
