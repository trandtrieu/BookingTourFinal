USE [master]
GO
/****** Object:  Database [bookingProject]    Script Date: 7/16/2023 10:20:15 AM ******/
CREATE DATABASE [bookingProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookingProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bookingProject.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bookingProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\bookingProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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
/****** Object:  Schema [trandtrieu]    Script Date: 7/16/2023 10:20:15 AM ******/
CREATE SCHEMA [trandtrieu]
GO
/****** Object:  Table [dbo].[account]    Script Date: 7/16/2023 10:20:15 AM ******/
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
/****** Object:  Table [dbo].[blog]    Script Date: 7/16/2023 10:20:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[blog](
	[blog_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[author_id] [int] NULL,
	[updated_date] [date] NULL,
	[content] [nvarchar](max) NULL,
	[thumbnail] [nvarchar](max) NULL,
	[brief_infor] [nvarchar](max) NULL,
	[categoryBlog_id] [int] NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[bookTour]    Script Date: 7/16/2023 10:20:15 AM ******/
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
/****** Object:  Table [dbo].[category_blog]    Script Date: 7/16/2023 10:20:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category_blog](
	[categoryBlog_id] [int] IDENTITY(1,1) NOT NULL,
	[categoryBlog_name] [nvarchar](max) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_category_blog] PRIMARY KEY CLUSTERED 
(
	[categoryBlog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[content]    Script Date: 7/16/2023 10:20:15 AM ******/
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
/****** Object:  Table [dbo].[feedbackTour]    Script Date: 7/16/2023 10:20:15 AM ******/
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
/****** Object:  Table [dbo].[orderRequest]    Script Date: 7/16/2023 10:20:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderRequest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[groupName] [nvarchar](max) NULL,
	[cusName] [nvarchar](max) NULL,
	[phone] [nvarchar](11) NULL,
	[email] [nvarchar](max) NULL,
	[tourName] [nvarchar](max) NULL,
	[priceEstimated] [float] NULL,
	[dateStart] [date] NULL,
	[dateEnd] [date] NULL,
	[quantityAd] [int] NULL,
	[quantityChildren] [int] NULL,
	[note] [nvarchar](max) NULL,
	[u_id] [int] NOT NULL,
 CONSTRAINT [PK_orderRequest] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[place]    Script Date: 7/16/2023 10:20:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[place](
	[placeId] [int] IDENTITY(1,1) NOT NULL,
	[placeName] [nvarchar](50) NOT NULL,
	[placeContent] [nvarchar](max) NULL,
	[placeImage] [nvarchar](50) NULL,
	[regionId] [int] NOT NULL,
 CONSTRAINT [PK_place] PRIMARY KEY CLUSTERED 
(
	[placeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[region]    Script Date: 7/16/2023 10:20:15 AM ******/
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
/****** Object:  Table [dbo].[role]    Script Date: 7/16/2023 10:20:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[role] [int] NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_role] PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[schedule]    Script Date: 7/16/2023 10:20:15 AM ******/
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
/****** Object:  Table [dbo].[tour]    Script Date: 7/16/2023 10:20:15 AM ******/
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
/****** Object:  Table [dbo].[tourGuider]    Script Date: 7/16/2023 10:20:15 AM ******/
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
	[u_id] [int] NULL,
 CONSTRAINT [PK_tourGuider] PRIMARY KEY CLUSTERED 
(
	[guideId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[view]    Script Date: 7/16/2023 10:20:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[view](
	[viewed] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (1, N'abc', N'12345678', N'abc@gmail.com', 123456789, 0, N'trieu1.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (4, N'trandtrieu', N'12345678', N'tr@gmail.com', 1232323, 0, N'team-1.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (5, N'de', N'12345678', N'trieutdde160252@fpt.edu.vn', 867167237, 0, N'hainam.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (6, N'admin', N'12345678', N'trandtrieu@gmail.com', 789458707, 1, N'binh.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (7, N'trieuguide', N'12345678', N'trieudz02@gmail.com', 789458707, 2, N'trieu1.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (8, N'namguide', N'12345678', N'nam@gmail.com', 789458707, 2, N'hainam.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (9, N'thuguide', N'12345678', N'', NULL, 2, N'thu.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (10, N'binhguide', N'12345678', NULL, NULL, 2, N'binh.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (11, N'danguide', N'12345678', NULL, NULL, 2, N'dan.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (12, N'linhguide', N'12345678', NULL, NULL, 2, N'linh.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (13, N'binhguide', N'12345678', NULL, NULL, 2, N'binh.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (14, N'owner', N'12345678', N'owner@gmail.com', 789458707, 3, N'trieu1.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (15, N'tr 12', N'12345678', N'trandtrieu@gmail.com', 789458707, 0, NULL)
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (16, N'dinhguide', N'12345678', N'trandtrieu@gmail.com', 789458707, 2, N'team-2.jpg')
INSERT [dbo].[account] ([u_id], [username], [password], [email], [phone], [role], [avatar]) VALUES (20, N'1 2', N'12345678', N'asd@gmail.com', 789458707, 0, NULL)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[blog] ON 

INSERT [dbo].[blog] ([blog_id], [title], [author_id], [updated_date], [content], [thumbnail], [brief_infor], [categoryBlog_id], [status]) VALUES (1, N'Chiêm bái Phật Bà ', 1, CAST(N'2022-11-11' AS Date), N'<div class="bg-white mb-3" style="padding: 30px;">
                            <div class="d-flex mb-3">
                                <a class="text-primary text-uppercase text-decoration-none" href="">Admin</a>
                                <span class="text-primary px-2">|</span>
                                <a class="text-primary text-uppercase text-decoration-none" href="">Tours & Travel</a>
                            </div>
                            <h2 class="mb-3">CHIÊM BÁI PHẬT BÀ TÂY BỔ ĐÀ SƠN - TƯỢNG PHẬT BÀ BẰNG ĐỒNG CAO NHẤT CHÂU Á
                                TỌA LẠC TRÊN ĐỈNH NÚI</h2>
                            <p>Ngự tọa trên đỉnh núi Bà Đen cao gần 1000m, tượng Phật Bà Tây Bổ Đà Sơn cao 72m, được đúc
                                từ 170 tấn đồng đỏ được xác
                                lập kỷ lục là “Tượng Phật Bà bằng đồng cao nhất Châu Á tọa lạc trên đỉnh núi”.</p>
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn, tọa lạc trên đỉnh núi Bà Đen Tây Ninh - là địa điểm du lịch
                                tâm linh nổi tiếng bậc nhất
                                vùng Đông Nam Bộ, nơi đây được mây trắng bao phủ quanh năm.</p>
                            <h4 class="mb-3">Tượng Phật trên đỉnh núi Bà Đen là Phật gì? Nguồn gốc tên gọi Tây Bổ Đà Sơn
                            </h4>
                            <img class="img-fluid w-50 float-left mr-4 mb-2" src="img/blog-2.jpg">
                            <p>Tượng Phật trên đỉnh núi Bà Đen Tây Ninh có tên gọi là Phật Bà Tây Bổ Đà Sơn. Hình tượng
                                nguyên mẫu của tượng Phật Bà
                                Tây Bổ Đà Sơn được mô phỏng từ 1 trong số hơn 40 tượng Phật cổ tại khu di tích quốc gia
                                Bổ Ðà Sơn thuộc tỉnh Bắc Giang. Vì vậy tượng Phật này được Giáo hội Phật giáo Việt Nam
                                gọi là tượng Phật Bà Bổ Ðà Sơn. Từ khi được tạo tác cho đến khi
                                hoàn thành, pho tượng bằng đồng đỏ khổng lồ tọa lạc trên đỉnh núi Bà Ðen Tây Ninh đã
                                được chính thức định danh là Phật
                                Bà Tây Bổ Ðà Sơn.

                                Tượng Phật Bà Tây Bổ Đà Sơn được khánh thành vào dịp đầu xuân Tân Sửu 2021, đây không
                                chỉ là “Tượng Phật Bà bằng đồng
                                cao nhất châu Á tọa lạc trên đỉnh núi” mà còn chất chứa trong mình rất nhiều ý nghĩa văn
                                hóa, kiến trúc vô cùng hấp dẫn
                                và độc đáo.</p>
                            <h5 class="mb-3">Tượng Phật Bà Tây Bổ Đà Sơn ở đâu?</h5>
                            <img class="img-fluid w-50 float-right ml-4 mb-2" src="img/blog-3.jpg">
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn tọa lạc trên đỉnh Núi Bà Đen tại Tây Ninh cao 986m. Tây Ninh
                                không những được xem là “nóc
                                nhà Đông Nam Bộ” mà còn là địa điểm du lịch hành hương tâm linh nổi tiếng, gắn liền với
                                truyền thuyết Bà Đen, thu hút
                                hàng triệu du khách tới tham quan mỗi năm..</p>
                        </div>', N'phatba.png', N'day la bried', 4, 1)
INSERT [dbo].[blog] ([blog_id], [title], [author_id], [updated_date], [content], [thumbnail], [brief_infor], [categoryBlog_id], [status]) VALUES (2, N'Khám giá Động Phong Nha', 1, CAST(N'2022-11-11' AS Date), N'<div class="bg-white mb-3" style="padding: 30px;">
                            <div class="d-flex mb-3">
                                <a class="text-primary text-uppercase text-decoration-none" href="">Admin</a>
                                <span class="text-primary px-2">|</span>
                                <a class="text-primary text-uppercase text-decoration-none" href="">Tours & Travel</a>
                            </div>
                            <h2 class="mb-3">CHIÊM BÁI PHẬT BÀ TÂY BỔ ĐÀ SƠN - TƯỢNG PHẬT BÀ BẰNG ĐỒNG CAO NHẤT CHÂU Á
                                TỌA LẠC TRÊN ĐỈNH NÚI</h2>
                            <p>Ngự tọa trên đỉnh núi Bà Đen cao gần 1000m, tượng Phật Bà Tây Bổ Đà Sơn cao 72m, được đúc
                                từ 170 tấn đồng đỏ được xác
                                lập kỷ lục là “Tượng Phật Bà bằng đồng cao nhất Châu Á tọa lạc trên đỉnh núi”.</p>
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn, tọa lạc trên đỉnh núi Bà Đen Tây Ninh - là địa điểm du lịch
                                tâm linh nổi tiếng bậc nhất
                                vùng Đông Nam Bộ, nơi đây được mây trắng bao phủ quanh năm.</p>
                            <h4 class="mb-3">Tượng Phật trên đỉnh núi Bà Đen là Phật gì? Nguồn gốc tên gọi Tây Bổ Đà Sơn
                            </h4>
                            <img class="img-fluid w-50 float-left mr-4 mb-2" src="img/blog-2.jpg">
                            <p>Tượng Phật trên đỉnh núi Bà Đen Tây Ninh có tên gọi là Phật Bà Tây Bổ Đà Sơn. Hình tượng
                                nguyên mẫu của tượng Phật Bà
                                Tây Bổ Đà Sơn được mô phỏng từ 1 trong số hơn 40 tượng Phật cổ tại khu di tích quốc gia
                                Bổ Ðà Sơn thuộc tỉnh Bắc Giang. Vì vậy tượng Phật này được Giáo hội Phật giáo Việt Nam
                                gọi là tượng Phật Bà Bổ Ðà Sơn. Từ khi được tạo tác cho đến khi
                                hoàn thành, pho tượng bằng đồng đỏ khổng lồ tọa lạc trên đỉnh núi Bà Ðen Tây Ninh đã
                                được chính thức định danh là Phật
                                Bà Tây Bổ Ðà Sơn.

                                Tượng Phật Bà Tây Bổ Đà Sơn được khánh thành vào dịp đầu xuân Tân Sửu 2021, đây không
                                chỉ là “Tượng Phật Bà bằng đồng
                                cao nhất châu Á tọa lạc trên đỉnh núi” mà còn chất chứa trong mình rất nhiều ý nghĩa văn
                                hóa, kiến trúc vô cùng hấp dẫn
                                và độc đáo.</p>
                            <h5 class="mb-3">Tượng Phật Bà Tây Bổ Đà Sơn ở đâu?</h5>
                            <img class="img-fluid w-50 float-right ml-4 mb-2" src="img/blog-3.jpg">
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn tọa lạc trên đỉnh Núi Bà Đen tại Tây Ninh cao 986m. Tây Ninh
                                không những được xem là “nóc
                                nhà Đông Nam Bộ” mà còn là địa điểm du lịch hành hương tâm linh nổi tiếng, gắn liền với
                                truyền thuyết Bà Đen, thu hút
                                hàng triệu du khách tới tham quan mỗi năm..</p>
                        </div>', N'dong-phong-nha-o-quang-binh-2.jpg', N'day la bried', 4, 1)
INSERT [dbo].[blog] ([blog_id], [title], [author_id], [updated_date], [content], [thumbnail], [brief_infor], [categoryBlog_id], [status]) VALUES (3, N'Gợi Ý Các Tour Du Lịch Trong Nước Tiết Kiệm & Uy Tín', 1, CAST(N'2022-11-11' AS Date), N'<div class="bg-white mb-3" style="padding: 30px;">
                            <div class="d-flex mb-3">
                                <a class="text-primary text-uppercase text-decoration-none" href="">Admin</a>
                                <span class="text-primary px-2">|</span>
                                <a class="text-primary text-uppercase text-decoration-none" href="">Tours & Travel</a>
                            </div>
                            <h2 class="mb-3">CHIÊM BÁI PHẬT BÀ TÂY BỔ ĐÀ SƠN - TƯỢNG PHẬT BÀ BẰNG ĐỒNG CAO NHẤT CHÂU Á
                                TỌA LẠC TRÊN ĐỈNH NÚI</h2>
                            <p>Ngự tọa trên đỉnh núi Bà Đen cao gần 1000m, tượng Phật Bà Tây Bổ Đà Sơn cao 72m, được đúc
                                từ 170 tấn đồng đỏ được xác
                                lập kỷ lục là “Tượng Phật Bà bằng đồng cao nhất Châu Á tọa lạc trên đỉnh núi”.</p>
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn, tọa lạc trên đỉnh núi Bà Đen Tây Ninh - là địa điểm du lịch
                                tâm linh nổi tiếng bậc nhất
                                vùng Đông Nam Bộ, nơi đây được mây trắng bao phủ quanh năm.</p>
                            <h4 class="mb-3">Tượng Phật trên đỉnh núi Bà Đen là Phật gì? Nguồn gốc tên gọi Tây Bổ Đà Sơn
                            </h4>
                            <img class="img-fluid w-50 float-left mr-4 mb-2" src="img/blog-2.jpg">
                            <p>Tượng Phật trên đỉnh núi Bà Đen Tây Ninh có tên gọi là Phật Bà Tây Bổ Đà Sơn. Hình tượng
                                nguyên mẫu của tượng Phật Bà
                                Tây Bổ Đà Sơn được mô phỏng từ 1 trong số hơn 40 tượng Phật cổ tại khu di tích quốc gia
                                Bổ Ðà Sơn thuộc tỉnh Bắc Giang. Vì vậy tượng Phật này được Giáo hội Phật giáo Việt Nam
                                gọi là tượng Phật Bà Bổ Ðà Sơn. Từ khi được tạo tác cho đến khi
                                hoàn thành, pho tượng bằng đồng đỏ khổng lồ tọa lạc trên đỉnh núi Bà Ðen Tây Ninh đã
                                được chính thức định danh là Phật
                                Bà Tây Bổ Ðà Sơn.

                                Tượng Phật Bà Tây Bổ Đà Sơn được khánh thành vào dịp đầu xuân Tân Sửu 2021, đây không
                                chỉ là “Tượng Phật Bà bằng đồng
                                cao nhất châu Á tọa lạc trên đỉnh núi” mà còn chất chứa trong mình rất nhiều ý nghĩa văn
                                hóa, kiến trúc vô cùng hấp dẫn
                                và độc đáo.</p>
                            <h5 class="mb-3">Tượng Phật Bà Tây Bổ Đà Sơn ở đâu?</h5>
                            <img class="img-fluid w-50 float-right ml-4 mb-2" src="img/blog-3.jpg">
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn tọa lạc trên đỉnh Núi Bà Đen tại Tây Ninh cao 986m. Tây Ninh
                                không những được xem là “nóc
                                nhà Đông Nam Bộ” mà còn là địa điểm du lịch hành hương tâm linh nổi tiếng, gắn liền với
                                truyền thuyết Bà Đen, thu hút
                                hàng triệu du khách tới tham quan mỗi năm..</p>
                        </div>', N'the-nao-la-du-lich-gia-re.jpg', N'day la bried', 4, 1)
INSERT [dbo].[blog] ([blog_id], [title], [author_id], [updated_date], [content], [thumbnail], [brief_infor], [categoryBlog_id], [status]) VALUES (4, N'Phố cổ Hội An có gì HOT???', 1, CAST(N'2022-11-11' AS Date), N'<div class="bg-white mb-3" style="padding: 30px;">
                            <div class="d-flex mb-3">
                                <a class="text-primary text-uppercase text-decoration-none" href="">Admin</a>
                                <span class="text-primary px-2">|</span>
                                <a class="text-primary text-uppercase text-decoration-none" href="">Tours & Travel</a>
                            </div>
                            <h2 class="mb-3">CHIÊM BÁI PHẬT BÀ TÂY BỔ ĐÀ SƠN - TƯỢNG PHẬT BÀ BẰNG ĐỒNG CAO NHẤT CHÂU Á
                                TỌA LẠC TRÊN ĐỈNH NÚI</h2>
                            <p>Ngự tọa trên đỉnh núi Bà Đen cao gần 1000m, tượng Phật Bà Tây Bổ Đà Sơn cao 72m, được đúc
                                từ 170 tấn đồng đỏ được xác
                                lập kỷ lục là “Tượng Phật Bà bằng đồng cao nhất Châu Á tọa lạc trên đỉnh núi”.</p>
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn, tọa lạc trên đỉnh núi Bà Đen Tây Ninh - là địa điểm du lịch
                                tâm linh nổi tiếng bậc nhất
                                vùng Đông Nam Bộ, nơi đây được mây trắng bao phủ quanh năm.</p>
                            <h4 class="mb-3">Tượng Phật trên đỉnh núi Bà Đen là Phật gì? Nguồn gốc tên gọi Tây Bổ Đà Sơn
                            </h4>
                            <img class="img-fluid w-50 float-left mr-4 mb-2" src="img/blog-2.jpg">
                            <p>Tượng Phật trên đỉnh núi Bà Đen Tây Ninh có tên gọi là Phật Bà Tây Bổ Đà Sơn. Hình tượng
                                nguyên mẫu của tượng Phật Bà
                                Tây Bổ Đà Sơn được mô phỏng từ 1 trong số hơn 40 tượng Phật cổ tại khu di tích quốc gia
                                Bổ Ðà Sơn thuộc tỉnh Bắc Giang. Vì vậy tượng Phật này được Giáo hội Phật giáo Việt Nam
                                gọi là tượng Phật Bà Bổ Ðà Sơn. Từ khi được tạo tác cho đến khi
                                hoàn thành, pho tượng bằng đồng đỏ khổng lồ tọa lạc trên đỉnh núi Bà Ðen Tây Ninh đã
                                được chính thức định danh là Phật
                                Bà Tây Bổ Ðà Sơn.

                                Tượng Phật Bà Tây Bổ Đà Sơn được khánh thành vào dịp đầu xuân Tân Sửu 2021, đây không
                                chỉ là “Tượng Phật Bà bằng đồng
                                cao nhất châu Á tọa lạc trên đỉnh núi” mà còn chất chứa trong mình rất nhiều ý nghĩa văn
                                hóa, kiến trúc vô cùng hấp dẫn
                                và độc đáo.</p>
                            <h5 class="mb-3">Tượng Phật Bà Tây Bổ Đà Sơn ở đâu?</h5>
                            <img class="img-fluid w-50 float-right ml-4 mb-2" src="img/blog-3.jpg">
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn tọa lạc trên đỉnh Núi Bà Đen tại Tây Ninh cao 986m. Tây Ninh
                                không những được xem là “nóc
                                nhà Đông Nam Bộ” mà còn là địa điểm du lịch hành hương tâm linh nổi tiếng, gắn liền với
                                truyền thuyết Bà Đen, thu hút
                                hàng triệu du khách tới tham quan mỗi năm..</p>
                        </div>', N'travel_hoi_an-1624775443712.jpg', N'day la bried', 4, 1)
INSERT [dbo].[blog] ([blog_id], [title], [author_id], [updated_date], [content], [thumbnail], [brief_infor], [categoryBlog_id], [status]) VALUES (5, N'Mùa Hè Của Bạn Mang Màu Sắc Gì?', 1, CAST(N'2023-06-22' AS Date), N'<div class="bg-white mb-3" style="padding: 30px;">
                            <div class="d-flex mb-3">
                                <a class="text-primary text-uppercase text-decoration-none" href="">Admin</a>
                                <span class="text-primary px-2">|</span>
                                <a class="text-primary text-uppercase text-decoration-none" href="">Tours & Travel</a>
                            </div>
                            <h2 class="mb-3">CHIÊM BÁI PHẬT BÀ TÂY BỔ ĐÀ SƠN - TƯỢNG PHẬT BÀ BẰNG ĐỒNG CAO NHẤT CHÂU Á
                                TỌA LẠC TRÊN ĐỈNH NÚI</h2>
                            <p>Ngự tọa trên đỉnh núi Bà Đen cao gần 1000m, tượng Phật Bà Tây Bổ Đà Sơn cao 72m, được đúc
                                từ 170 tấn đồng đỏ được xác
                                lập kỷ lục là “Tượng Phật Bà bằng đồng cao nhất Châu Á tọa lạc trên đỉnh núi”.</p>
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn, tọa lạc trên đỉnh núi Bà Đen Tây Ninh - là địa điểm du lịch
                                tâm linh nổi tiếng bậc nhất
                                vùng Đông Nam Bộ, nơi đây được mây trắng bao phủ quanh năm.</p>
                            <h4 class="mb-3">Tượng Phật trên đỉnh núi Bà Đen là Phật gì? Nguồn gốc tên gọi Tây Bổ Đà Sơn
                            </h4>
                            <img class="img-fluid w-50 float-left mr-4 mb-2" src="img/blog-2.jpg">
                            <p>Tượng Phật trên đỉnh núi Bà Đen Tây Ninh có tên gọi là Phật Bà Tây Bổ Đà Sơn. Hình tượng
                                nguyên mẫu của tượng Phật Bà
                                Tây Bổ Đà Sơn được mô phỏng từ 1 trong số hơn 40 tượng Phật cổ tại khu di tích quốc gia
                                Bổ Ðà Sơn thuộc tỉnh Bắc Giang. Vì vậy tượng Phật này được Giáo hội Phật giáo Việt Nam
                                gọi là tượng Phật Bà Bổ Ðà Sơn. Từ khi được tạo tác cho đến khi
                                hoàn thành, pho tượng bằng đồng đỏ khổng lồ tọa lạc trên đỉnh núi Bà Ðen Tây Ninh đã
                                được chính thức định danh là Phật
                                Bà Tây Bổ Ðà Sơn.

                                Tượng Phật Bà Tây Bổ Đà Sơn được khánh thành vào dịp đầu xuân Tân Sửu 2021, đây không
                                chỉ là “Tượng Phật Bà bằng đồng
                                cao nhất châu Á tọa lạc trên đỉnh núi” mà còn chất chứa trong mình rất nhiều ý nghĩa văn
                                hóa, kiến trúc vô cùng hấp dẫn
                                và độc đáo.</p>
                            <h5 class="mb-3">Tượng Phật Bà Tây Bổ Đà Sơn ở đâu?</h5>
                            <img class="img-fluid w-50 float-right ml-4 mb-2" src="img/blog-3.jpg">
                            <p>Tượng Phật Bà Tây Bổ Đà Sơn tọa lạc trên đỉnh Núi Bà Đen tại Tây Ninh cao 986m. Tây Ninh
                                không những được xem là “nóc
                                nhà Đông Nam Bộ” mà còn là địa điểm du lịch hành hương tâm linh nổi tiếng, gắn liền với
                                truyền thuyết Bà Đen, thu hút
                                hàng triệu du khách tới tham quan mỗi năm..</p>
                        </div>', N'img_20200602102244.jpg', N'Mùa hè đặc sắc', 4, 1)
SET IDENTITY_INSERT [dbo].[blog] OFF
GO
SET IDENTITY_INSERT [dbo].[bookTour] ON 

INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (223, 5, 4, N'2023-04-26', N'trieu tran', N'Tỉnh Bắc Ninh, Huyện Yên Phong, Xã Văn Môn', N'0789458707', N'trandtrieu@gmail.com', 12, 0, N'2324', 18000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (224, 2, 4, N'2023-06-26', N'tran dinh trieu', N'Tỉnh Cao Bằng, Huyện Bảo Lâm, Thị trấn Pác Miầu', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'213', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (228, 2, 4, N'2023-06-26', N'12 trie', N'Thành phố Hải Phòng, Huyện Cát Hải, Xã Việt Hải', N'0867167237', N't@gmail.com', 1, 0, N'qưe', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (229, 2, 4, N'2023-06-26', N'12 trie', N'Thành phố Hải Phòng, Huyện Cát Hải, Xã Việt Hải', N'0867167237', N't@gmail.com', 1, 0, N'qưe', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (230, 2, 4, N'2023-05-26', N'12 trie', N'Thành phố Hải Phòng, Huyện Cát Hải, Xã Việt Hải', N'0867167237', N't@gmail.com', 1, 0, N'qưe', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (231, 2, 4, N'2023-06-26', N'trieu tran', N'Tỉnh Hưng Yên, Huyện Phù Cừ, Xã Tống Trân', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'123', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (232, 2, 4, N'2023-06-26', N'tran dinh trieu', N'Tỉnh Cao Bằng, Huyện Thạch An, Xã Lê Lợi', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'ư123123', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (233, 2, 4, N'2023-06-26', N'tran dinh trieu', N'Tỉnh Cao Bằng, Huyện Thạch An, Xã Lê Lai', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'123', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (234, 2, 4, N'2023-06-26', N'tran dinh trieu', N'Tỉnh Cao Bằng, Huyện Thạch An, Xã Lê Lai', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'123', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (235, 2, 4, N'2023-06-26', N'tran dinh trieu', N'Tỉnh Cao Bằng, Huyện Hoà An, Xã Đức Long', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'qqq', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (236, 2, 4, N'2023-02-27', N'trieu tran', N'Tỉnh Quảng Nam, Huyện Duy Xuyên, Xã Duy Hải', N'0789458707', N'trandtrieu@gmail.com', 10, 0, N'324234', 8000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (238, 11, 6, N'2023-06-28', N'nguoi quang nam', N'Thành phố Hà Nội, Quận Ba Đình, Phường Phúc Xá', N'1232323   ', N'tr@gmail.com', 1, 0, N'drf', 5000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (239, 9, 4, N'2023-06-28', N'mai van A', N'Tỉnh Quảng Nam, Thành phố Tam Kỳ, Phường Tân Thạnh', N'0789458707', N'trandtrieu@gmail.com', 11, 5, N'toi di 16 nguoi', 37800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (241, 3, 6, N'2023-07-08', N'trieu tran', N'Tỉnh Bắc Ninh, Thành phố Bắc Ninh, Phường Khắc Niệm', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'qweqwe', 2500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (242, 11, 6, N'2023-07-08', N'trieu tran', N'Tỉnh Hải Dương, Huyện Thanh Miện, Xã Thanh Giang', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'qưeqwe', 5000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (243, 1, 1, N'2023-07-09', N'tran minh ngoc', N'Thành phố Hà Nội, Huyện Ba Vì, Xã Sơn Đà', N'12312312  ', N'ngoc@gmail.com', 1, 0, N'11', 2000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1243, 3, 6, N'2023-07-09', N'trieu tran', N'Thành phố Hà Nội, Quận Ba Đình, Phường Phúc Xá', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'zxczxc', 2500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1244, 3, 6, N'2023-07-09', N'trieu tran', N'Tỉnh Hà Giang, , ', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'ewrwer', 2500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1245, 2, 4, N'2023-07-09', N'trieu tran', N'Tỉnh Hải Dương, Thành phố Hải Dương, Xã Quyết Thắng', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'ádsad', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1246, 7, 4, N'2023-07-09', N'trieu tran', N'Thành phố Hà Nội, Quận Hoàn Kiếm, Phường Đồng Xuân', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'12313', 1950000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1247, 2, 1, N'2023-07-10', N'trieu tran', N'Tỉnh Bắc Ninh, Thành phố Bắc Ninh, Phường Khắc Niệm', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'qưe', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1248, 3, 1, N'2023-07-10', N'trieu tran', N'Tỉnh Hà Giang, Huyện Đồng Văn, Xã Lũng Cú', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'qưee', 2500000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1249, 7, 1, N'2023-07-10', N'tran minh ngoc', N'Thành phố Hà Nội, Quận Ba Đình, Phường Trúc Bạch', N'12312312  ', N'ngoc@gmail.com', 1, 0, N'a', 1950000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1250, 2, 4, N'2023-07-10', N'trieu tran', N'Tỉnh Bắc Giang, Thành phố Bắc Giang, Xã Tân Tiến', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'abc', 800000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1251, 2, 4, N'2023-07-10', N'trieu tran', N'Tỉnh Hải Dương, Thành phố Hải Dương, Phường Thạch Khôi', N'0789458707', N'trandtrieu@gmail.com', 5, 0, N'OK', 4000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1252, 7, 4, N'2023-07-10', N'trieu tran', N'Tỉnh Bắc Ninh, Thành phố Bắc Ninh, Phường Nam Sơn', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'QƯEQWE', 1950000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1253, 8, 7, N'2023-07-10', N'trieu tran', N'Tỉnh Hải Dương, Huyện Gia Lộc, Xã Đoàn Thượng', N'0789458707', N'trandtrieu@gmail.com', 25, 5, N'qe', 41250000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1254, 3, 1, N'2023-07-13', N'trieu tran', N'Thành phố Hà Nội, Quận Tây Hồ, Phường Nhật Tân', N'0789458707', N'trandtrieu@gmail.com', 11, 1, N'ádwq', 28750000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1255, 11, 4, N'2023-07-13', N'trieu tran', N', , ', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'ádasd', 5000000)
INSERT [dbo].[bookTour] ([o_id], [t_id], [u_id], [book_date], [book_cusName], [book_address], [book_phone], [book_email], [book_quantityAd], [book_quantityChild], [note], [total_amount]) VALUES (1256, 11, 4, N'2023-07-13', N'trieu tran', N', , ', N'0789458707', N'trandtrieu@gmail.com', 1, 0, N'ádasd', 5000000)
SET IDENTITY_INSERT [dbo].[bookTour] OFF
GO
SET IDENTITY_INSERT [dbo].[category_blog] ON 

INSERT [dbo].[category_blog] ([categoryBlog_id], [categoryBlog_name], [status]) VALUES (4, N'Thiên nhiên', 1)
INSERT [dbo].[category_blog] ([categoryBlog_id], [categoryBlog_name], [status]) VALUES (6, N'trang trọng', 1)
INSERT [dbo].[category_blog] ([categoryBlog_id], [categoryBlog_name], [status]) VALUES (8, N'cổ điển', 1)
SET IDENTITY_INSERT [dbo].[category_blog] OFF
GO
SET IDENTITY_INSERT [dbo].[feedbackTour] ON 

INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (19, N'abc', 5, N'tuyet voi', 2, 1, NULL, N'trieu1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (22, N'abc', 5, N'rat ok', 2, 1, NULL, N'trieu1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (23, N'abc', 5, N'ádasd', 2, 1, CAST(N'2023-06-15' AS Date), N'trieu1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (28, N'admin', 4, N'hay nhi', 5, 5, CAST(N'2023-11-11' AS Date), N'hhh.jpg', 12)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (33, N'admin', 1, N'11111', 1, 3, CAST(N'2023-06-16' AS Date), N'trung.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (34, N'admin', 5, N'123213', 1, 3, CAST(N'2023-06-16' AS Date), N'trung.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (35, N'admin', 3, N'eeee', 1, 3, CAST(N'2022-11-11' AS Date), N'trung.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (36, N'admin', 5, N'tttttt', 1, 3, CAST(N'2023-06-16' AS Date), N'trung.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (37, N'admin', 5, N'12c 3', 3, 3, CAST(N'2023-06-17' AS Date), N'trung.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (38, N'abc', 5, N'hay', 5, 1, CAST(N'2023-06-19' AS Date), N'trieu1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (39, N'abc', 5, N'hay', 3, 1, CAST(N'2023-06-19' AS Date), N'trieu1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (42, N'abc', 1, N'aaaa', 2, 1, CAST(N'2023-06-19' AS Date), N'trieu1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (44, N'trandtrieu', 4, N'hay', 3, 4, CAST(N'2023-06-21' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (45, N'trandtrieu', 5, N'ádasd', 2, 4, CAST(N'2023-06-21' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (46, N'trandtrieu', 5, N'qqqq', 2, 4, CAST(N'2023-06-21' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (47, N'trandtrieu', 5, N'ok', 2, 4, CAST(N'2023-06-21' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (48, N'trandtrieu', 1, N'ádsd
ádasd', 2, 4, CAST(N'2023-06-21' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (49, N'trandtrieu', 5, N'ok', 7, 4, CAST(N'2023-06-21' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (50, N'trandtrieu', 1, N'aa', 7, 4, CAST(N'2023-06-21' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (51, N'trandtrieu', 5, N'tour khá chất lượng', 4, 4, CAST(N'2023-06-21' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (52, N'trandtrieu', 5, N'tour nay kha la chất lượng nên cho 5 sao', 1, 4, CAST(N'2023-06-22' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (54, N'de', 5, N'tàm tạm', 1, 5, CAST(N'2023-06-22' AS Date), NULL, NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (55, N'trandtrieu', 5, N'ok', 8, 4, CAST(N'2023-06-22' AS Date), N'team-1.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (56, N'admin', 5, N'khá là ok', 11, 6, CAST(N'2023-07-09' AS Date), N'binh.jpg', NULL)
INSERT [dbo].[feedbackTour] ([feedback_id], [username], [rated_star], [feedback], [tourId], [u_id], [date], [avatar], [parent_feedback_id]) VALUES (57, N'admin', 2, N'on ap', 9, 6, CAST(N'2023-07-10' AS Date), N'binh.jpg', NULL)
SET IDENTITY_INSERT [dbo].[feedbackTour] OFF
GO
SET IDENTITY_INSERT [dbo].[orderRequest] ON 

INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (130, N'nguoi quang nam', N'nguoi quang nam', N'1232323', N'tr@gmail.com', N'Tour Đà Nẵng- Hội An', 123, CAST(N'2023-07-14' AS Date), CAST(N'2023-07-14' AS Date), 12, 12, N'123123', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (131, N'trieu tran', N'trieu tran', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 11, CAST(N'2023-07-14' AS Date), CAST(N'2023-07-15' AS Date), 12, 12, N'qưeqwe', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (133, N'trieu tran', N'trieu tran', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 0, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 0, 0, N'', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (134, N'tran dinh trieu', N'tran dinh trieu', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 2000000, CAST(N'2023-07-06' AS Date), CAST(N'2023-07-07' AS Date), 123, 123, N'123123', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (135, N'trieu tran', N'trieu tran', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 11, CAST(N'2023-07-16' AS Date), CAST(N'2023-07-15' AS Date), 12, 12, N'123123', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (136, N'trieu tran', N'trieu tran', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 11, CAST(N'2023-07-15' AS Date), CAST(N'2023-07-07' AS Date), 2, 2, N'324234', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (137, N'trieu tran', N'trieu tran', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 12, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 1, 1, N'123123', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (138, N'trieu tran', N'trieu tran', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 0, CAST(N'1900-01-01' AS Date), CAST(N'1900-01-01' AS Date), 0, 0, N'', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (139, N'trieu tran', N'trieu tran', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 0, CAST(N'2023-07-21' AS Date), CAST(N'2023-07-13' AS Date), 0, 0, N'', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (140, N'trieu tran', N'trieu tran', N'789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 5, CAST(N'2023-07-23' AS Date), CAST(N'2023-07-14' AS Date), 5, 5, N'', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (141, N'trieu tran', N'trieu tran', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 11, CAST(N'2023-07-13' AS Date), CAST(N'2023-07-14' AS Date), 123, 123, N'123123', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (142, N'fPT', N'trieu tran', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 2000000, CAST(N'2023-07-15' AS Date), CAST(N'2023-07-16' AS Date), 22, 40, N'123123', 4)
INSERT [dbo].[orderRequest] ([id], [groupName], [cusName], [phone], [email], [tourName], [priceEstimated], [dateStart], [dateEnd], [quantityAd], [quantityChildren], [note], [u_id]) VALUES (143, N'FPT University Se17a07', N'Tran Dinh Trieu', N'0789458707', N'trandtrieu@gmail.com', N'Tour Đà Nẵng- Hội An', 2000000, CAST(N'2023-07-22' AS Date), CAST(N'2023-07-23' AS Date), 40, 0, N'', 4)
SET IDENTITY_INSERT [dbo].[orderRequest] OFF
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
INSERT [dbo].[role] ([role], [roleName]) VALUES (0, N'Khách hàng')
INSERT [dbo].[role] ([role], [roleName]) VALUES (1, N'Quản trị viên')
INSERT [dbo].[role] ([role], [roleName]) VALUES (2, N'Hướng dẫn viên du lịch')
INSERT [dbo].[role] ([role], [roleName]) VALUES (3, N'Chủ đầu tư')
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

INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (1, N'Tour Đà Nẵng- Hội An', 2000000, CAST(N'2023-07-14' AS Date), CAST(N'2023-08-05' AS Date), N'Du lịch Đà Nẵng Hội An sẽ là chuyến đi đầy trải nghiệm nếu bạn lên lịch trình chi tiết để khám phá trọn vẹn những vùng đất này. Tại đây, du khách có thể thỏa sức tham quan nhiều danh lam thắng cảnh tuyệt đẹp, nhiều điểm check in nổi tiếng, kèm theo đó là nền văn hóa ẩm thực phong phú, những lễ hội đặc sắc sẽ khiến bạn không nỡ bỏ qua. ', N'danang-hoian.jpg', 1, 1, 2, 1, 2, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (2, N'Tour Châu Đốc- lễ Bà Chúa', 800000, CAST(N'2023-07-23' AS Date), CAST(N'2023-07-30' AS Date), N'Tour Chùa Bà Châu Đốc – Du lịch Hành hương đầu xuân 2023. Đến với mảnh đất An Giang, Quý du khách sẽ được nghe và tìm hiểu về Miếu Bà Chúa Xứ, Núi Cấm, Chùa Kim Tiên lộng lẫy, Chùa Lầu độc đáo với cầu treo thốt nốt,… Ngoài việc được thả tâm hồn với vẻ đẹp của phong cảnh miền tây An giang, Quý khách còn thấy được sự trìu mến hiếu khách của con người miền tây sông nước. Bên cạnh đó là có dịp để cầu an, cầu phước cho gia đình và người thân có được nhiều sức khỏe và  bình an đầu xuân năm mới.', N'chaudoc-bachua.jpg', 0, 20, 12, 1, 3, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (3, N'Tour Bà Nà Hills', 2500000, CAST(N'2023-07-17' AS Date), CAST(N'2023-07-20' AS Date), N'Điểm tham quan nổi bật: Cầu Vàng, chùa Linh Ứng, khu vui chơi giải trí Fantasy Park, khu làng Pháp, cáp treo Bà Nà, vườn hoa Le Jardin D’Amour, hầm rượu Debay, đỉnh núi Chúa', N'bana.jpg', 0, 1, 2, 3, 2, 1)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (4, N'Tour Cù Lao Chàm', 2000000, CAST(N'2023-07-13' AS Date), CAST(N'2023-07-25' AS Date), N'Điểm tham quan nổi bật: Khu bảo tồn biển, khu dân cư Bãi Làng, chùa Hải Tạng, chợ Tân Hiệp, bãi Hương/ bãi Chồng', N'culaocham.jpg', 1, 2, 8, 1, 2, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (5, N'Tour Linh Ứng Sơn Trà - Ngũ Hành Sơn - Hội An', 1500000, CAST(N'2023-07-11' AS Date), CAST(N'2023-07-16' AS Date), N'Điểm tham quan nổi bật: Bán đảo Sơn Trà, Linh Ứng Tự, bãi biển Mỹ Khê, Ngũ Hành Sơn, Làng đá mỹ nghệ Non Nước, phố cổ Hội An', N'linhung.jpg', 1, 1, 2, 1, 2, 28)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (7, N'Tour Cố đô Huế ', 1950000, CAST(N'2023-07-14' AS Date), CAST(N'2023-07-21' AS Date), N'Điểm tham quan nổi bật: Vịnh Lăng Cô, lăng vua Khải Định, chùa Thiên Mụ, Đại Nội - Kinh Thành (Ngọ Môn, Điện Thái Hoà, Tử Cấm Thành, Hồ Tĩnh Tâm, Thế Miếu, Hiển Lâm Các, Cửu Đỉnh....)', N'codohue.jpg', 1, 1, 9, 1, 2, 27)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (8, N'City tour Đà Nẵng', 1500000, CAST(N'2023-07-12' AS Date), CAST(N'2023-07-15' AS Date), N'Điểm tham quan nổi bật: Ngũ Hành Sơn, Làng đá mỹ nghệ Non Nước, bãi biển Mỹ Khê, bán đảo Sơn Trà, chùa Linh Ứng, Bảo tàng điêu khắc Chăm, chợ Hàn', N'citytour.jpg', 1, 1, 6, 1, 2, 0)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (9, N'Tour Tắm Khoáng nóng Núi Thần Tài', 2800000, CAST(N'2023-07-12' AS Date), CAST(N'2023-07-20' AS Date), N'Điểm tham quan nổi bật: Bọng Rồng, động Long Tiên, Hồ khoáng nóng tự nhiên, khu vườn hoa quả nhiệt đới', N'nuithantai.jpg', 1, 1, 6, 1, 2, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (10, N'Tour Chợ Nổi Cái Răng Và Đồng Bằng Sông Cửu Long', 4000000, CAST(N'2023-06-30' AS Date), CAST(N'2023-07-08' AS Date), N'Thoát khỏi sự nhộn nhịp của Thành phố Hồ Chí Minh để đến với Đồng bằng sông Cửu Long thanh bình trong chuyến tham quan 2 ngày mang đến sự giới thiệu tuyệt vời cho những du khách lần đầu. Hướng dẫn viên sẽ lo việc lên kế hoạch cho các hoạt động, chỗ ở và di chuyển để bạn không cần phải làm vậy, đồng thời cung cấp góc nhìn của người trong cuộc về văn hóa miền Nam Việt Nam.

Read more about Cai Rang Floating Market and Mekong Delta Luxury 2-Day Tour - https://www.viator.com/tours/Ho-Chi-Minh-City/MEKONG-DELTA-FLOATING-MARKET-2-DAYS-1-NIGHT/d352-18631P13?mcid=56757', N'chonoi.jpg', 1, 6, 6, 1, 3, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (11, N'Hà Nội City Tour - Tràng An - Bái Đính ', 5000000, CAST(N'2023-07-21' AS Date), CAST(N'2023-07-31' AS Date), N'Điểm nổi bật:
Tham quan Thủ đô Hà Nội vừa cổ kính vừa sôi động
Ghé thăm khu di tích Hồ Chí Minh: Nhà sàn - Lăng Bác - Bảo tàng
Ngắm nhìn quần thể danh thắng Tràng An - Ninh Bình tuyệt đẹp
Trải nghiệm 2N1Đ du ngoạn Vịnh Hạ Long bằng du thuyền 5 sao cao cấp', N'halongbay.jpg', 0, 4, 6, 1, 1, 28)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (28, N'nguoi quang nam', 11, CAST(N'2023-07-14' AS Date), CAST(N'2023-07-23' AS Date), N'qqqqqqq', N'carousel-1.jpg', 0, 1, NULL, 1, 2, 30)
INSERT [dbo].[tour] ([tourId], [name], [price], [dateStart], [dateEnd], [detail], [image], [status], [placeId], [guideId], [scheduleId], [regionId], [seat]) VALUES (29, N'trieu tran', 11, CAST(N'2023-07-15' AS Date), CAST(N'2023-07-29' AS Date), N'123123', N'chaudoc-bachua.jpg', 1, 1, 2, 1, 1, 30)
SET IDENTITY_INSERT [dbo].[tour] OFF
GO
SET IDENTITY_INSERT [dbo].[tourGuider] ON 

INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail], [u_id]) VALUES (2, N'Trần Đình Triều', 20, N'trieu1.jpg', N'trieutdde160152@fpt.edu.vn', N'0789458707', N'Quảng Nam', 11, N'Nam', N'Đẹp trai vuii tính', 7)
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail], [u_id]) VALUES (5, N'Nguyễn Văn Nhật Linh', 21, N'linh.jpg', N'linh@gmail.com', N'0679327323', N'Quảng Nam', 2, N'Nam', N'haha', 12)
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail], [u_id]) VALUES (6, N'Phan Đình Đàn', 20, N'dan.jpg', N'dan@gmail.com', N'0234324234', N'Hà Tĩnh', 3, N'Nam', N'haha', 11)
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail], [u_id]) VALUES (8, N'Nguyễn Văn Bình', 21, N'binh.jpg', N'binh@gmail.com', N'0283423422', N'Đà Nẵng', 22, N'Nam', N'hihi', 13)
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail], [u_id]) VALUES (9, N'Hải Nam', 22, N'hainam.jpg', N'nam@gmail.com', N'0998343333', N'Đà Nẵng', 3, N'Nam', N'hoho', 8)
INSERT [dbo].[tourGuider] ([guideId], [guideName], [guideAge], [guideImage], [guideEmail], [guidePhone], [guideAddress], [guideYearExperience], [guideSex], [guideDetail], [u_id]) VALUES (12, N'Trần Thư', 22, N'thu.jpg', N'thu@gmail.com', N'0923743222', N'Đà Nẵng', 30, N'Nữ', N'hoho', 9)
SET IDENTITY_INSERT [dbo].[tourGuider] OFF
GO
INSERT [dbo].[view] ([viewed]) VALUES (4454)
GO
ALTER TABLE [dbo].[account]  WITH CHECK ADD  CONSTRAINT [FK_account_role] FOREIGN KEY([role])
REFERENCES [dbo].[role] ([role])
GO
ALTER TABLE [dbo].[account] CHECK CONSTRAINT [FK_account_role]
GO
ALTER TABLE [dbo].[blog]  WITH CHECK ADD  CONSTRAINT [FK_blog_category_blog] FOREIGN KEY([categoryBlog_id])
REFERENCES [dbo].[category_blog] ([categoryBlog_id])
GO
ALTER TABLE [dbo].[blog] CHECK CONSTRAINT [FK_blog_category_blog]
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
