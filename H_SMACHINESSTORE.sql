USE [master]
GO
/****** Object:  Database [h_s]    Script Date: 2/14/2025 10:58:53 AM ******/
CREATE DATABASE [h_s]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'h_s', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\h_s.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'h_s_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\h_s_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [h_s] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [h_s].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [h_s] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [h_s] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [h_s] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [h_s] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [h_s] SET ARITHABORT OFF 
GO
ALTER DATABASE [h_s] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [h_s] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [h_s] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [h_s] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [h_s] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [h_s] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [h_s] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [h_s] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [h_s] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [h_s] SET  ENABLE_BROKER 
GO
ALTER DATABASE [h_s] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [h_s] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [h_s] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [h_s] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [h_s] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [h_s] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [h_s] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [h_s] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [h_s] SET  MULTI_USER 
GO
ALTER DATABASE [h_s] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [h_s] SET DB_CHAINING OFF 
GO
ALTER DATABASE [h_s] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [h_s] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [h_s] SET DELAYED_DURABILITY = DISABLED 
GO
USE [h_s]
GO
/****** Object:  Table [dbo].[bill]    Script Date: 2/14/2025 10:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[mobile] [numeric](18, 0) NULL,
	[pname] [varchar](50) NULL,
	[qnty] [int] NULL,
	[email] [varchar](50) NULL,
	[state] [varchar](50) NULL,
	[address] [varchar](100) NULL,
	[city] [nvarchar](50) NULL,
	[date] [date] NULL,
	[total] [varchar](50) NULL,
 CONSTRAINT [PK_bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cart]    Script Date: 2/14/2025 10:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cart](
	[cid] [int] IDENTITY(1,1) NOT NULL,
	[pname] [varchar](50) NULL,
	[qnty] [int] NULL,
	[image] [varchar](50) NULL,
	[price] [int] NULL,
	[id] [int] NULL,
	[uid] [int] NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_cart] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[category]    Script Date: 2/14/2025 10:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](50) NULL,
	[image] [varchar](50) NULL,
 CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[contact]    Script Date: 2/14/2025 10:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[contact](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[subject] [varchar](50) NULL,
	[message] [varchar](50) NULL,
 CONSTRAINT [PK_contact] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[product]    Script Date: 2/14/2025 10:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pname] [varchar](50) NULL,
	[price] [int] NULL,
	[image] [varchar](50) NULL,
	[catgry] [varchar](50) NULL,
	[qnty] [int] NULL,
	[dcn] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[register]    Script Date: 2/14/2025 10:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[register](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [varchar](50) NULL,
	[lname] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[mobile] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[address] [varchar](50) NULL,
	[role] [varchar](50) NULL,
 CONSTRAINT [PK_register_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[service]    Script Date: 2/14/2025 10:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[image] [varchar](50) NULL,
	[details] [varchar](max) NULL,
 CONSTRAINT [PK_service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[team]    Script Date: 2/14/2025 10:58:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[team](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[image] [varchar](50) NULL,
	[wrk] [varchar](50) NULL,
	[exp] [int] NULL,
 CONSTRAINT [PK_team] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[bill] ON 

INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (1, N'Drashti', N'Patel', CAST(786102168 AS Numeric(18, 0)), NULL, NULL, N'drashtipadaliya@gmail.com', N'Italy', N'RilanceNo', N'', CAST(N'2024-12-26' AS Date), N'112100')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (2, N'Drashti', N'Patel', CAST(786102168 AS Numeric(18, 0)), NULL, NULL, N'drashtipadaliya@gmail.com', N'Philippines', N'RilanceNo', N'', CAST(N'2024-12-26' AS Date), N'168150')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (3, N'Drashti', N'patel', CAST(5674564563 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'Philippines', N'Rilance
No', N'', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (4, N'Drashti', N'patel', CAST(5674564563 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'Philippines', N'Rilance
No', N'', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (5, N'Drashti', N'patel', CAST(5674564563 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'YourState', N'Rilance
No', N'', CAST(N'2024-12-26' AS Date), N'112100')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (6, N'Drashti', N'patel', CAST(5674564563 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'YourState', N'Rilance
No', N'', CAST(N'2024-12-26' AS Date), N'112100')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (7, N'Drashti', N'patel', CAST(5674564563 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'YourState', N'Rilance
No', N'', CAST(N'2024-12-26' AS Date), N'112100')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (8, N'Drashti', N'patel', CAST(5674564563 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'Philippines', N'Rilance
No', N'rjk', CAST(N'2024-12-26' AS Date), N'112100')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (9, N'Drashti', N'patel', CAST(5674564563 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'Select', N'Rilance
No', N'', CAST(N'2024-12-26' AS Date), N'112100')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (10, N'Drashti', N'patel', CAST(5674564563 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'Italy', N'Rilance
No', N'rjk', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (11, N'Drashti', N'patel', CAST(5674564563 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'Philippines', N'Rilance
No', N'rjk', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (12, N'drashti', N'padaliya', CAST(4566785675 AS Numeric(18, 0)), NULL, NULL, N'drashtipadaliya@gmail.com', N'Italy', N'rajkot', N'rjk', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (13, N'drashti', N'padaliya', CAST(4566785675 AS Numeric(18, 0)), NULL, NULL, N'drashtipadaliya@gmail.com', N'Italy', N'rajkot', N'rjk', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (14, N'drashti', N'padaliya', CAST(4566785675 AS Numeric(18, 0)), NULL, NULL, N'drashtipadaliya@gmail.com', N'Philippines', N'rajkot', N'rjk', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (15, N'drashti', N'padaliya', CAST(4566785675 AS Numeric(18, 0)), NULL, NULL, N'drashtipadaliya@gmail.com', N'Italy', N'rajkot', N'rjk', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (16, N'drashti', N'padaliya', CAST(4566785675 AS Numeric(18, 0)), NULL, NULL, N'drashtipadaliya@gmail.com', N'Philippines', N'rajkot', N'rjk', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (17, N'drashti', N'padaliya', CAST(4566785675 AS Numeric(18, 0)), NULL, NULL, N'drashtipadaliya@gmail.com', N'Select', N'rajkot', N'', CAST(N'2024-12-26' AS Date), N'56050')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (18, N'Drashti', N'Padaliya', CAST(7861021684 AS Numeric(18, 0)), NULL, NULL, N'drashtipadlaiya@gmail.com', N'Philippines', N'Rilance
No', N'Rajkot', CAST(N'2024-12-27' AS Date), N'34566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (19, N'Drashti', N'Padaliya', CAST(7861021684 AS Numeric(18, 0)), NULL, NULL, N'drashtipadlaiya@gmail.com', N'South Korea', N'Rilance
No', N'Rajkot', CAST(N'2024-12-27' AS Date), N'34566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (20, N'Drashti', N'Padaliya', CAST(7861021684 AS Numeric(18, 0)), NULL, NULL, N'drashtipadlaiya@gmail.com', N'Japan', N'Rilance
No', N'Junagadh', CAST(N'2024-12-27' AS Date), N'34566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (21, N'Drashti', N'Padaliya', CAST(7861021684 AS Numeric(18, 0)), NULL, NULL, N'drashtipadlaiya@gmail.com', N'Philippines', N'Rilance
No', N'rajkot', CAST(N'2024-12-31' AS Date), N'34566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (22, N'Drashti', N'Padaliya', CAST(7861021684 AS Numeric(18, 0)), NULL, NULL, N'drashtipadlaiya@gmail.com', N'Hongkong', N'Rilance
No', N'rajkot', CAST(N'2024-12-31' AS Date), N'34566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (23, N'Drashti', N'Padaliya', CAST(7861021684 AS Numeric(18, 0)), NULL, NULL, N'drashtipadlaiya@gmail.com', N'Philippines', N'Rilance
No', N'rajkot', CAST(N'2024-12-31' AS Date), N'34566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (24, N'Drashti', N'Padaliya', CAST(7861021684 AS Numeric(18, 0)), NULL, NULL, N'drashtipadlaiya@gmail.com', N'France', N'Rilance
No', N'rajkot', CAST(N'2024-12-31' AS Date), N'34566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (25, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'Italy', N'rajkot,gujrat', N'rajkot', CAST(N'2025-01-06' AS Date), N'34566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (26, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'Select', N'rajkot,gujrat', N'rajkot', CAST(N'2025-01-06' AS Date), N'69132')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (27, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'Italy', N'rajkot,gujrat', N'rajkot', CAST(N'2025-01-06' AS Date), N'34566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (28, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), NULL, NULL, N'drashti@gmail.com', N'South Korea', N'rajkot,gujrat', N'rajkot', CAST(N'2025-01-08' AS Date), N'34766')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (29, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'1774848')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (30, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'1774848')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (31, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'oppo reno 13 f', 2, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'1774848')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (32, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'1774848')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (33, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'1774848')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (34, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'1774848')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (35, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'591616')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (36, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'591616')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (37, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'626182')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (38, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'626182')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (39, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'626182')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (40, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'695314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (41, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'695314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (42, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'695314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (43, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 2, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'695314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (44, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'695314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (45, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'695314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (46, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'695314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (47, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 2, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'695314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (48, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'767314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (49, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'767314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (50, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'767314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (51, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 2, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'767314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (52, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'767314')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (53, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'Italy', N'rajkot,gujrat', N'gondal', CAST(N'2025-01-12' AS Date), N'34766')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (54, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'Italy', N'rajkot,gujrat', N'gondal', CAST(N'2025-01-12' AS Date), N'106566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (55, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'Italy', N'rajkot,gujrat', N'gondal', CAST(N'2025-01-12' AS Date), N'106566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (56, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'South Korea', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'117780')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (57, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'redmi ui c1', 1, N'drashti@gmail.com', N'South Korea', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'117780')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (58, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'117780')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (59, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'redmi ui c1', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'117780')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (60, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'gondal', CAST(N'2025-01-12' AS Date), N'106566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (61, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'redmi ui c1', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'gondal', CAST(N'2025-01-12' AS Date), N'106566')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (62, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'117780')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (63, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'redmi ui c1', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Rajkot', CAST(N'2025-01-12' AS Date), N'117780')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (64, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'Japan', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'72300')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (65, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'oppo reno 13', 1, N'drashti@gmail.com', N'Philippines', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'128000')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (66, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'oppo reno 13', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'128000')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (67, N'drashti', N'patel', CAST(4564564564 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'India', N'rajkot,gujrat', N'Junagadh', CAST(N'2025-01-12' AS Date), N'128000')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (68, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'iphone', 1, N'moni@gmail.com', N'India', N'badalpur', N'junagath', CAST(N'2025-01-13' AS Date), N'34766')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (69, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'iphone', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'80746')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (70, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'redmi ui c1', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'80746')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (71, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'iphone', 1, N'moni@gmail.com', N'Select', N'badalpur', N'junagath', CAST(N'2025-01-13' AS Date), N'80746')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (72, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'redmi ui c1', 1, N'moni@gmail.com', N'Select', N'badalpur', N'junagath', CAST(N'2025-01-13' AS Date), N'80746')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (73, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'iphone', 1, N'moni@gmail.com', N'Select', N'badalpur', N'junagath', CAST(N'2025-01-13' AS Date), N'80746')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (74, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'redmi ui c1', 1, N'moni@gmail.com', N'Select', N'badalpur', N'junagath', CAST(N'2025-01-13' AS Date), N'80746')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (75, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'iphone', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (76, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'redmi ui c1', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (77, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (78, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'iphone', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (79, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'redmi ui c1', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (80, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (81, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'iphone', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (82, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'redmi ui c1', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (83, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (84, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'iphone', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (85, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'redmi ui c1', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (86, N'mona', N'mathukiya', CAST(4567892341 AS Numeric(18, 0)), N'oppo reno 13 f', 1, N'moni@gmail.com', N'Select', N'badalpur', N'', CAST(N'2025-01-13' AS Date), N'637796')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (87, N'Drashti', N'Padaliya', CAST(4545454545 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'India', N'Rilance
No', N'jnd', CAST(N'2025-01-20' AS Date), N'72300')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (88, N'Drashti', N'Padaliya', CAST(4545454545 AS Numeric(18, 0)), N'lenovo', 1, N'drashti@gmail.com', N'India', N'Rilance
No', N'Junagadh', CAST(N'2025-01-20' AS Date), N'207199')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (89, N'Drashti', N'Padaliya', CAST(4545454545 AS Numeric(18, 0)), N'iphone', 1, N'drashti@gmail.com', N'India', N'Rilance
No', N'Junagadh', CAST(N'2025-01-20' AS Date), N'207199')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (90, N'drashti', N'padaliya', CAST(4564564564 AS Numeric(18, 0)), N'LG 5g tv', 7, N'drashti12@gmail.com', N'Hongkong', N'rajkot', N'INDIA', CAST(N'2025-02-04' AS Date), N'908600')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (91, N'drashti', N'padaliya', CAST(4564564564 AS Numeric(18, 0)), N'hp t5.6', 1, N'drashti12@gmail.com', N'Hongkong', N'rajkot', N'INDIA', CAST(N'2025-02-04' AS Date), N'908600')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (92, N'Drashti', N'Padaliya', CAST(4545454545 AS Numeric(18, 0)), N'Xiaomi Redmi Pad Pro 5G:', 1, N'drashti@gmail.com', N'Philippines', N'Rilance
No', N'INDIA', CAST(N'2025-02-10' AS Date), N'34200')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (93, N'Drashti', N'Padaliya', CAST(4545454545 AS Numeric(18, 0)), N'flixfov kv6', 1, N'drashti@gmail.com', N'Philippines', N'Rilance
No', N'INDIA', CAST(N'2025-02-14' AS Date), N'1230')
INSERT [dbo].[bill] ([id], [fname], [lname], [mobile], [pname], [qnty], [email], [state], [address], [city], [date], [total]) VALUES (94, N'Drashti', N'Padaliya', CAST(4545454545 AS Numeric(18, 0)), N'Apple iPad Pro 12.9 ', 1, N'drashti@gmail.com', N'Japan', N'Rilance
No', N'INDIA', CAST(N'2025-02-14' AS Date), N'154300')
SET IDENTITY_INSERT [dbo].[bill] OFF
SET IDENTITY_INSERT [dbo].[cart] ON 

INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (35, N'iphone', 2, N'14.jpeg', 34566, NULL, 4, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (36, N'oppo reno 13 f', 1, N'img.jpg', 557050, NULL, 4, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (37, N'oppo reno 13', 1, N'download.jpg', 56000, NULL, 4, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (38, N'oppo reno 13', 1, N'download.jpg', 56000, NULL, 4, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (39, N'lenovo', 1, N'1q.jpg', 72000, 9, 2, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (40, N'iphone', 2, N'14.jpeg', 34566, 1, 2, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (41, N'lenovo', 1, N'1q.jpg', 72000, 9, 2, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (42, N'lenovo', 1, N'1q.jpg', 72000, 9, 2, N'no')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (43, N'lenovo', 1, N'1q.jpg', 72000, 9, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (49, N'oppo reno 13 f', 1, N'img.jpg', 557050, 4, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (52, N'iphone', 3, N'14.jpeg', 34566, 1, 4, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (53, N'iphone', 2, N'14.jpeg', 34566, 1, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (54, N'oppo reno 13', 1, N'download.jpg', 56000, 2, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (55, N'redmi ui c1', 1, N'13.jpeg', 45780, 8, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (56, N'oppo reno 13', 1, N'download.jpg', 56000, 2, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (58, N'redmi ui c1', 1, N'13.jpeg', 45780, 8, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (59, N'iphone', 1, N'14.jpeg', 134599, 1, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (60, N'oppo reno 13', 2, N'download.jpg', 56000, 2, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (63, N'oppo reno 13 f', 1, N'img.jpg', 557050, 4, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (64, N'lenovo', 1, N'1q.jpg', 72000, 9, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (65, N'iphone', 1, N'14.jpeg', 134599, 1, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (66, N'lenovo', 1, N'1q.jpg', 72000, 9, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (67, N'iphone', 1, N'14.jpeg', 134599, 1, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (68, N'LG 5g tv', 7, N'ed.jpg', 123300, 90, 7, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (69, N'hp t5.6', 1, N'12.jpg', 45000, 75, 7, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (70, N'Xiaomi Redmi Pad Pro 5G:', 1, N'7878.jpeg', 34000, 27, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (71, N'flixfov kv6', 1, N'9.jpg', 1230, 89, 5, N'yes')
INSERT [dbo].[cart] ([cid], [pname], [qnty], [image], [price], [id], [uid], [status]) VALUES (72, N'Apple iPad Pro 12.9 ', 1, N't11.jpg', 154000, 29, 5, N'yes')
SET IDENTITY_INSERT [dbo].[cart] OFF
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [category], [image]) VALUES (2, N'mobile', N'2.jpeg')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (3, N'tablet', N'78.jpeg')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (4, N'laptop', N'ythg.jpeg')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (5, N'earphone', N'df.png')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (9, N'pendrive', N'efg.jpeg')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (10, N'glass', N'g1.jpeg')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (11, N'speaker', N'a1.jpeg')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (12, N'computer', N'1rtve4.jpg')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (13, N'mouse', N'1wj.jpg')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (14, N'keyboard', N'11.jpg')
INSERT [dbo].[category] ([id], [category], [image]) VALUES (15, N'TV', N'tn.jpeg')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (1, N'iphone', 134599, N'3.jpeg', N'mobile', 34, N' mobile is best version for 5G')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (2, N'oppo reno 13', 56000, N'download.jpg', N'mobile', 20, N'The vanilla varinat of the Reno 13, 8GB RAM and 128GB')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (4, N'oppo reno 13 f', 557050, N'img.jpg', N'mobile', 14, N'The vanilla varinat of the Reno 13 f, 8GB RAM and 128GB')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (7, N'oppo reno 13 pro', 98450, N'1ben.jpeg', N'mobile', 20, N'The vanilla varinat of the Reno 13 pro, 16GB RAM and 256GB')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (8, N'redmi ui c1', 45780, N'13.jpeg', N'mobile', 18, N'this is redmi ui c1')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (9, N'lenovo', 72000, N'1q.jpg', N'laptop', 37, N'laptop is best version for 4G')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (10, N'Realme C65', 10350, N'12.jpeg', N'mobile', 30, N'Realme is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (11, N'Realme 12X', 11699, N'15.jpeg', N'mobile', 35, N'Realme is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (12, N'Realme GT7 Pro 5G', 35789, N'17.jpeg', N'mobile', 35, N'Realme is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (13, N'Oppo Find X8 Pro', 43799, N'56.jpeg', N'mobile', 20, N'Oppo is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (14, N'iPhone 16', 111199, N'i12.jfif', N'mobile', 10, N'IPHONE is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (15, N'iPhone 16 pro', 191199, N'i13.jpg', N'mobile', 10, N'IPHONE is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (16, N'iPhone 15', 90999, N'ipdff.jpg', N'mobile', 20, N'IPHONE is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (17, N'iPhone 17', 222222, N'dfdf3243.jpg', N'mobile', 7, N'IPHONE 17 is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (18, N'MSI Prestige 13 AI Plus Evo A2VMG-022IN', 134990, N'i7.jpg', N'laptop', 15, N'MSI (APPLE) is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (19, N'HP Victus 16-R0327TX Gaming Laptop', 72999, N'y6.jpg', N'laptop', 20, N'HP(GAMMING) is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (20, N'Dell i5 New Latitude 14 3410', 60550, N'lptop234.jpg', N'laptop', 30, N'DELL is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (21, N'HP 15s (Ryzen 5000)', 55555, N'lptop.jpg', N'laptop', 15, N'HP is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (22, N'Dell 15 Thin & Light ', 52000, N'2q.jpg', N'laptop', 10, N'Dell is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (23, N'iMac 1s', 134500, N'p90.jpg', N'laptop', 5, N'APPLE is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (24, N'imac 6d', 111499, N'i2.jpg', N'laptop', 20, N'APPLE is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (25, N'lenovo gaming lp', 234569, N'wrfc.jpg', N'laptop', 10, N'Lenovo is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (26, N'HP gaming lp', 341199, N'imagestyty.jpeg', N'laptop', 10, N'HP(GAMMING) is offering stylish designs and powerful performance at competitive prices. ')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (27, N'Xiaomi Redmi Pad Pro 5G:', 34000, N'7878.jpeg', N'tablet', 14, N'tablet is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (28, N'Samsung Galaxy Tab A9 Plus 5G', 35789, N't4.jpg', N'tablet', 15, N'tablet is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (29, N'Apple iPad Pro 12.9 ', 154000, N't11.jpg', N'tablet', 9, N'tablet is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (30, N'OnePlus Pad', 34560, N't8.jpg', N'tablet', 20, N'tablet is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (31, N'VIVO Tab S9 FE', 28900, N'89.jpeg', N'tablet', 10, N'tablet is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (32, N'Xiaomi Pad 6', 34777, N't6.jpg', N'tablet', 15, N'tablet is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (33, N'u&i earphone', 899, N'download (5).jpeg', N'earphone', 12, N'U&I is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (34, N'u&i earphone', 999, N'1212.jpeg', N'earphone', 10, N'U&I is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (35, N'realme earphone', 2599, N'gm.jpeg', N'earphone', 16, N'Realme is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (36, N'U&ME earphone', 3477, N'564.jpeg', N'earphone', 16, N'U&ME is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (37, N'realme i3 earphone', 2000, N'1212.jpeg', N'earphone', 30, N'Realme is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (38, N'star earphone', 3400, N'23.jpeg', N'earphone', 34, N'Star is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (39, N'sundisk 16gb', 400, N'p2.jpeg', N'pendrive', 50, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (40, N'sundisk 32gb', 799, N'p2.jpeg', N'pendrive', 40, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (41, N'sundisk 64gb', 1111, N'p2.jpeg', N'pendrive', 30, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (42, N'sundisk 128gb', 1599, N'p5.jpeg', N'pendrive', 35, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (43, N'kingston 128gb', 1699, N'p6.jpeg', N'pendrive', 34, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (44, N'hp 32gb', 799, N'p7.jpeg', N'pendrive', 16, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (45, N'gvm 32gb', 678, N'r6.jpeg', N'pendrive', 123, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (46, N'chip 1tb', 3000, N'098y.jpeg', N'pendrive', 10, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (47, N'cuvering 1tb', 4500, N'efg.jpeg', N'pendrive', 20, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (48, N'sp 64gb', 789, N'oi.jpeg', N'pendrive', 34, N'p')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (49, N'poco 2tb', 5599, N'p907.jpeg', N'pendrive', 45, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (50, N'sp 500gb', 4200, N'p4.jpeg', N'pendrive', 15, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (51, N'ot101 1tb', 3499, N'p9.jpeg', N'pendrive', 34, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (52, N'gvm 64gb', 1300, N'p90.jpeg', N'pendrive', 37, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (53, N'hiniq 64gb', 999, N'pi.jpeg', N'pendrive', 23, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (54, N'verlix 64gb', 1499, N'p0.jpeg', N'pendrive', 36, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (55, N'tb 1tb', 5600, N'p3.jpeg', N'pendrive', 45, N'Pendrive is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (56, N'google g1', 234569, N'g4.jpg', N'glass', 4, N'Google glass is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (57, N'google g2', 244569, N'g2.jpeg', N'glass', 15, N'Google glass is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (58, N'google g3', 154569, N'g3.jpg', N'glass', 16, N'Google glass is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (59, N'google g4', 524569, N'g4.jpg', N'glass', 16, N'Google glass is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (60, N'google g5', 434569, N'g5.jpeg', N'glass', 30, N'Google glass is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (61, N'alexa i1', 3400, N'4edc.jpg', N'speaker', 20, N'ALEXA speaker is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (62, N'alexa i2', 4500, N'14.jpg', N'speaker', 10, N'ALEXA speaker is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (63, N'alexa i3', 5350, N'df.jpg', N'speaker', 15, N'ALEXA speaker is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (64, N'alexa i4', 3350, N'uiioi.jpg', N'speaker', 10, N'ALEXA speaker is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (65, N'alexa r4', 5600, N'3.jpg', N'speaker', 20, N'ALEXA speaker is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (66, N'alexa t5', 4500, N'15.jpg', N'speaker', 43, N'ALEXA speaker is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (67, N'alexa sp4', 1200, N'13.jpg', N'speaker', 45, N'Alexa Speaker is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (68, N'alexa s43', 1600, N'1.jpg', N'speaker', 60, N'ALEXA speaker is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (69, N'lenovo pc', 45000, N'19.jpg', N'computer', 30, N'computer is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (70, N'dell pc', 35789, N'qazw.png', N'keyboard', 30, N'dell is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (71, N'Apple Pro 12.9 ', 234000, N'1rtve4.jpg', N'computer', 10, N'APPLE is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (72, N'Apple i4.4', 103400, N'17.jpg', N'computer', 78, N'APPLE is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (73, N'dell y5.6', 35789, N'12.jpg', N'computer', 34, N'DELL is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (74, N'dell 4.5', 34599, N'16.jpg', N'computer', 16, N'DELL is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (75, N'hp t5.6', 45000, N'12.jpg', N'computer', 44, N'HP is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (76, N'hp u6m8', 84569, N'6dfpqx.jpg', N'computer', 56, N'HP is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (77, N'hp mc5', 780, N'7.jpg', N'mouse', 70, N'HP is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (78, N'lenovo mc4', 1230, N'8.jpg', N'mouse', 45, N'Lenovo is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (79, N'logtech mc7', 1350, N'mouse.jpg', N'mouse', 34, N'logtech is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (80, N'fistrax mc9', 5600, N'6.jpg', N'mouse', 15, N'fastrax is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (81, N'spiner mci2', 3400, N'18.jpg', N'mouse', 45, N'spider is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (82, N'hp black ', 1200, N'poiu.jpg', N'keyboard', 40, N'HP is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (83, N'hp lighting', 1300, N'rtrtrt7.jpg', N'keyboard', 45, N'HP is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (84, N'dell black', 1000, N'ytqefdf.jpg', N'keyboard', 120, N'DELL is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (85, N'dell lighting', 1250, N'frnkq.jpg', N'keyboard', 45, N'DELL is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (86, N'lenovo black', 1090, N'qazw.png', N'keyboard', 16, N'Lenovo is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (87, N'lenovo lighting ', 3400, N'10.jpg', N'keyboard', 40, N'lenovo is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (88, N'doleser kb', 3999, N'11.jpg', N'keyboard', 60, N'doleser is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (89, N'flixfov kv6', 1230, N'keboar.jpg', N'keyboard', 44, N'flixfov is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (90, N'LG 5g tv', 123300, N'ed.jpg', N'TV', 13, N'LG is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (91, N'LG 5g tv6', 234569, N'g.jpeg', N'TV', 45, N'LG is offering stylish designs and powerful performance at competitive prices.')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (92, N'HP 5G tv', 130459, N'tn.jpeg', N'TV', 20, N'HP is offering stylish designs and powerful performance at competitive prices. ')
INSERT [dbo].[product] ([id], [pname], [price], [image], [catgry], [qnty], [dcn]) VALUES (93, N'dell 5G tv', 140350, N'rf.jpeg', N'TV', 12, N'Dell is offering stylish designs and powerful performance at competitive prices.')
SET IDENTITY_INSERT [dbo].[product] OFF
SET IDENTITY_INSERT [dbo].[register] ON 

INSERT [dbo].[register] ([id], [fname], [lname], [email], [mobile], [password], [address], [role]) VALUES (1, N'Drashti', N'Padaliya', N'drashtipadlaiya@gmail.com', N'7861021684', N'232323', N'Rilance
No', N'user')
INSERT [dbo].[register] ([id], [fname], [lname], [email], [mobile], [password], [address], [role]) VALUES (3, N'ted', N'vision', N'tedvision17@gmail.com', N'9898910950', N'@ted17', N'amd,gujrat', N'admin')
INSERT [dbo].[register] ([id], [fname], [lname], [email], [mobile], [password], [address], [role]) VALUES (4, N'mona', N'mathukiya', N'moni@gmail.com', N'4567892341', N'moni@111', N'badalpur', N'user')
INSERT [dbo].[register] ([id], [fname], [lname], [email], [mobile], [password], [address], [role]) VALUES (5, N'Drashti', N'Padaliya', N'drashti@gmail.com', N'4545454545', N'vst', N'Rilance
No', N'user')
INSERT [dbo].[register] ([id], [fname], [lname], [email], [mobile], [password], [address], [role]) VALUES (7, N'drashti', N'padaliya', N'drashti12@gmail.com', N'4564564564', N'345', N'rajkot', N'user')
SET IDENTITY_INSERT [dbo].[register] OFF
SET IDENTITY_INSERT [dbo].[service] ON 

INSERT [dbo].[service] ([id], [name], [image], [details]) VALUES (1, N'free sipping ', N'free.jpg', N'Free siping is a valuable service offered by many tire retailers, enhancing the performance of tires without additional costs to the consumer.')
SET IDENTITY_INSERT [dbo].[service] OFF
SET IDENTITY_INSERT [dbo].[team] ON 

INSERT [dbo].[team] ([id], [name], [image], [wrk], [exp]) VALUES (1, N'drashti padaliya', N'person_2.jpg', N'BCA', 6)
SET IDENTITY_INSERT [dbo].[team] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_Email]    Script Date: 2/14/2025 10:58:54 AM ******/
ALTER TABLE [dbo].[register] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [h_s] SET  READ_WRITE 
GO
