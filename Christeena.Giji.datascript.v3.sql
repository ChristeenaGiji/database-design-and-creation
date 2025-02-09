USE [master]
GO
/****** Object:  Database [SunnyHolidays]    Script Date: 7/1/2024 1:19:16 AM ******/
CREATE DATABASE [SunnyHolidays]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SunnyHolidays', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SunnyHolidays.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SunnyHolidays_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\SunnyHolidays_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SunnyHolidays] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SunnyHolidays].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SunnyHolidays] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SunnyHolidays] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SunnyHolidays] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SunnyHolidays] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SunnyHolidays] SET ARITHABORT OFF 
GO
ALTER DATABASE [SunnyHolidays] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SunnyHolidays] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SunnyHolidays] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SunnyHolidays] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SunnyHolidays] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SunnyHolidays] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SunnyHolidays] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SunnyHolidays] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SunnyHolidays] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SunnyHolidays] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SunnyHolidays] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SunnyHolidays] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SunnyHolidays] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SunnyHolidays] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SunnyHolidays] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SunnyHolidays] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SunnyHolidays] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SunnyHolidays] SET RECOVERY FULL 
GO
ALTER DATABASE [SunnyHolidays] SET  MULTI_USER 
GO
ALTER DATABASE [SunnyHolidays] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SunnyHolidays] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SunnyHolidays] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SunnyHolidays] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SunnyHolidays] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SunnyHolidays] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SunnyHolidays', N'ON'
GO
ALTER DATABASE [SunnyHolidays] SET QUERY_STORE = ON
GO
ALTER DATABASE [SunnyHolidays] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SunnyHolidays]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 7/1/2024 1:19:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admin](
	[StaffID] [bigint] IDENTITY(100,1) NOT NULL,
	[UserName] [varchar](200) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[FirstName] [varchar](200) NOT NULL,
	[LastName] [varchar](200) NOT NULL,
	[Address] [varchar](200) NULL,
	[Mobile] [varchar](8) NULL,
PRIMARY KEY CLUSTERED 
(
	[StaffID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cabin]    Script Date: 7/1/2024 1:19:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cabin](
	[cabinId] [bigint] IDENTITY(100,1) NOT NULL,
	[cabinName] [varchar](150) NOT NULL,
	[cabinDescription] [varchar](255) NOT NULL,
	[pricePerNight] [decimal](10, 2) NOT NULL,
	[pricePerweek] [decimal](10, 2) NOT NULL,
	[photoFileNmae] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cabinId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CabinInclusion]    Script Date: 7/1/2024 1:19:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CabinInclusion](
	[cabinIncId] [bigint] IDENTITY(1,1) NOT NULL,
	[cabinId] [bigint] NOT NULL,
	[IncId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cabinIncId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inclusion]    Script Date: 7/1/2024 1:19:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inclusion](
	[IncId] [bigint] IDENTITY(1,1) NOT NULL,
	[incName] [varchar](55) NOT NULL,
	[incDetails] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IncId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 7/1/2024 1:19:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[LogId] [bigint] IDENTITY(100,10) NOT NULL,
	[StaffId] [bigint] NOT NULL,
	[LoginDateTime] [varchar](200) NULL,
	[LogoutDateTime] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 7/1/2024 1:19:16 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[PromoID] [bigint] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](255) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DiscountAmount] [decimal](10, 2) NULL,
	[cabinId] [bigint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PromoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([StaffID], [UserName], [Password], [FirstName], [LastName], [Address], [Mobile]) VALUES (100, N'chris', N'12345', N'Christeena', N'Giji', N'Sydney', N'')
INSERT [dbo].[Admin] ([StaffID], [UserName], [Password], [FirstName], [LastName], [Address], [Mobile]) VALUES (101, N'Anitta', N'12245', N'Anitta', N'Giji', N'Melbourne', N'')
SET IDENTITY_INSERT [dbo].[Admin] OFF
GO
SET IDENTITY_INSERT [dbo].[Cabin] ON 

INSERT [dbo].[Cabin] ([cabinId], [cabinName], [cabinDescription], [pricePerNight], [pricePerweek], [photoFileNmae]) VALUES (107, N'Standard cabin sleeps 4 ', N'A 2 bedroom cabin with double in main and either double or 2 singles in the second bedroom ', CAST(100.00 AS Decimal(10, 2)), CAST(500.00 AS Decimal(10, 2)), N'stCabin.jpg ')
INSERT [dbo].[Cabin] ([cabinId], [cabinName], [cabinDescription], [pricePerNight], [pricePerweek], [photoFileNmae]) VALUES (108, N'Standard open plan cabin sleeps 4 ', N'An open plan cabin with double bed and set of bunks', CAST(120.00 AS Decimal(10, 2)), CAST(600.00 AS Decimal(10, 2)), N'stOpenCabin.jpg ')
INSERT [dbo].[Cabin] ([cabinId], [cabinName], [cabinDescription], [pricePerNight], [pricePerweek], [photoFileNmae]) VALUES (109, N'Deluxe cabin sleeps 4 ', N'A 2 bedroom cabin with queen bed and 2 singles in the second bedroom ', CAST(140.00 AS Decimal(10, 2)), CAST(700.00 AS Decimal(10, 2)), N'deluxCabin.jpg')
INSERT [dbo].[Cabin] ([cabinId], [cabinName], [cabinDescription], [pricePerNight], [pricePerweek], [photoFileNmae]) VALUES (110, N'Villa sleeps 4', N'A 2 bedroom cabin with queen bed plus another bedroom with 2 single beds', CAST(150.00 AS Decimal(10, 2)), CAST(750.00 AS Decimal(10, 2)), N'villa.jpg')
INSERT [dbo].[Cabin] ([cabinId], [cabinName], [cabinDescription], [pricePerNight], [pricePerweek], [photoFileNmae]) VALUES (111, N'Spa villa sleeps 4', N'A 2 bedroom cabin with queen bed plus another bedroom with 2 single beds and spa bath', CAST(200.00 AS Decimal(10, 2)), CAST(1000.00 AS Decimal(10, 2)), N'spaVilla.jpg')
INSERT [dbo].[Cabin] ([cabinId], [cabinName], [cabinDescription], [pricePerNight], [pricePerweek], [photoFileNmae]) VALUES (112, N'Grass powered site', N'Powered sites on grass ', CAST(40.00 AS Decimal(10, 2)), CAST(200.00 AS Decimal(10, 2)), N'grassPower.jpg')
INSERT [dbo].[Cabin] ([cabinId], [cabinName], [cabinDescription], [pricePerNight], [pricePerweek], [photoFileNmae]) VALUES (113, N'Slab powered', N'Powered sites on grass ', CAST(50.00 AS Decimal(10, 2)), CAST(250.00 AS Decimal(10, 2)), N'slabPower.jpg')
SET IDENTITY_INSERT [dbo].[Cabin] OFF
GO
SET IDENTITY_INSERT [dbo].[CabinInclusion] ON 

INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (3, 107, 1)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (4, 108, 2)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (5, 109, 3)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (6, 109, 4)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (7, 110, 4)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (8, 111, 4)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (9, 108, 5)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (10, 107, 6)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (11, 108, 6)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (12, 109, 7)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (13, 110, 7)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (14, 111, 7)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (15, 107, 8)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (16, 108, 8)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (17, 109, 8)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (18, 110, 8)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (19, 111, 8)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (20, 110, 9)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (21, 111, 9)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (22, 109, 11)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (23, 110, 11)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (24, 111, 11)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (25, 108, 12)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (26, 109, 12)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (27, 110, 12)
INSERT [dbo].[CabinInclusion] ([cabinIncId], [cabinId], [IncId]) VALUES (28, 111, 12)
SET IDENTITY_INSERT [dbo].[CabinInclusion] OFF
GO
SET IDENTITY_INSERT [dbo].[Inclusion] ON 

INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (1, N'1 bathroom', N'')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (2, N'1+ bathroom', N'1 bathroom and separate toilet')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (3, N'2 bathroom', N'')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (4, N'Air conditioner', N'Reverse cycle ')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (5, N'Ceiling fans ', N'')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (6, N'Bunk bed', N'')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (7, N'2 single beds ', N'')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (8, N'Double bed ', N'')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (9, N'Dishwasher', N'')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (11, N'DVD Player', N'')
INSERT [dbo].[Inclusion] ([IncId], [incName], [incDetails]) VALUES (12, N'Hair dryer ', N'')
SET IDENTITY_INSERT [dbo].[Inclusion] OFF
GO
ALTER TABLE [dbo].[CabinInclusion]  WITH CHECK ADD  CONSTRAINT [FK_CabinInclusion_Cabin] FOREIGN KEY([cabinId])
REFERENCES [dbo].[Cabin] ([cabinId])
GO
ALTER TABLE [dbo].[CabinInclusion] CHECK CONSTRAINT [FK_CabinInclusion_Cabin]
GO
ALTER TABLE [dbo].[CabinInclusion]  WITH CHECK ADD  CONSTRAINT [FK_CabinInclusion_Cabin2] FOREIGN KEY([IncId])
REFERENCES [dbo].[Inclusion] ([IncId])
GO
ALTER TABLE [dbo].[CabinInclusion] CHECK CONSTRAINT [FK_CabinInclusion_Cabin2]
GO
ALTER TABLE [dbo].[Log]  WITH CHECK ADD  CONSTRAINT [FK_Log_Admin] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Admin] ([StaffID])
GO
ALTER TABLE [dbo].[Log] CHECK CONSTRAINT [FK_Log_Admin]
GO
ALTER TABLE [dbo].[Promotion]  WITH CHECK ADD  CONSTRAINT [FK_Promotion_Cabin] FOREIGN KEY([cabinId])
REFERENCES [dbo].[Cabin] ([cabinId])
GO
ALTER TABLE [dbo].[Promotion] CHECK CONSTRAINT [FK_Promotion_Cabin]
GO
ALTER TABLE [dbo].[Cabin]  WITH CHECK ADD  CONSTRAINT [christy] CHECK  (([pricepernight]>(0)))
GO
ALTER TABLE [dbo].[Cabin] CHECK CONSTRAINT [christy]
GO
ALTER TABLE [dbo].[Cabin]  WITH CHECK ADD  CONSTRAINT [mikha] CHECK  (([pricepernight]>(0)))
GO
ALTER TABLE [dbo].[Cabin] CHECK CONSTRAINT [mikha]
GO
ALTER TABLE [dbo].[Cabin]  WITH CHECK ADD  CONSTRAINT [mikha1] CHECK  (([priceperweek]<=(5)*[pricepernight]))
GO
ALTER TABLE [dbo].[Cabin] CHECK CONSTRAINT [mikha1]
GO
USE [master]
GO
ALTER DATABASE [SunnyHolidays] SET  READ_WRITE 
GO
