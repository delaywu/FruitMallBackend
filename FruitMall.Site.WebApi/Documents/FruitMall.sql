USE [master]
GO
/****** Object:  Database [FruitMall]    Script Date: 11/16/2020 5:31:29 PM ******/
CREATE DATABASE [FruitMall]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FruitMall', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FruitMall.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FruitMall_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FruitMall_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FruitMall] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FruitMall].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FruitMall] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FruitMall] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FruitMall] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FruitMall] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FruitMall] SET ARITHABORT OFF 
GO
ALTER DATABASE [FruitMall] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FruitMall] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FruitMall] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FruitMall] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FruitMall] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FruitMall] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FruitMall] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FruitMall] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FruitMall] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FruitMall] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FruitMall] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FruitMall] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FruitMall] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FruitMall] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FruitMall] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FruitMall] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FruitMall] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FruitMall] SET RECOVERY FULL 
GO
ALTER DATABASE [FruitMall] SET  MULTI_USER 
GO
ALTER DATABASE [FruitMall] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FruitMall] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FruitMall] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FruitMall] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FruitMall] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FruitMall]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [uniqueidentifier] NOT NULL,
	[OrderId] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[Comment] [varchar](1000) NOT NULL,
	[CommentDate] [datetime] NOT NULL,
	[Score] [int] NOT NULL,
	[UserLocation] [varchar](500) NULL,
	[ImageUrl1] [varchar](500) NULL,
	[ImageUrl2] [varchar](500) NULL,
	[ImageUrl3] [varchar](500) NULL,
	[ImageUrl4] [varchar](500) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Franchise]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Franchise](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
 CONSTRAINT [PK_Franchise] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FranchiseCate]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FranchiseCate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FranchiseId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_FranchiseCate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FranchiseCateProduct]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FranchiseCateProduct](
	[Id] [uniqueidentifier] NOT NULL,
	[FranchiseCateId] [int] NOT NULL,
	[FranchiseProductId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FranchiseCateProduct_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FranchiseProduct]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FranchiseProduct](
	[Id] [uniqueidentifier] NOT NULL,
	[FranchiseId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImageURL] [nvarchar](300) NULL,
	[Name] [nvarchar](300) NOT NULL,
	[SubTitle] [nvarchar](300) NOT NULL,
	[SkuID] [nvarchar](300) NOT NULL,
	[Unit] [nvarchar](50) NOT NULL,
	[Spec] [nvarchar](50) NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[VipPrice] [int] NULL,
	[StockNum] [int] NOT NULL,
	[Weight] [int] NOT NULL,
	[StoreWay] [nvarchar](50) NULL,
	[ProductionPlace] [nvarchar](50) NULL,
 CONSTRAINT [PK_FranchiseCateProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Level]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Level](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Level] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Option]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Option](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Cate] [int] NOT NULL,
 CONSTRAINT [PK_Option] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OptionItem]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OptionItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OptionId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Remark] [varchar](50) NULL,
 CONSTRAINT [PK_OptionItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [int] NOT NULL,
	[FranchiseCateProducts] [varchar](1000) NOT NULL,
	[DeliveryFee] [int] NULL,
	[Discount] [int] NULL,
	[RedEnvelopes] [int] NULL,
	[TotalPrice] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[Remark] [varchar](500) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GoodsName] [varchar](300) NOT NULL,
	[SubTitle] [nvarchar](300) NULL,
	[SkuID] [varchar](50) NOT NULL,
	[Level] [varchar](50) NULL,
	[Unit] [nvarchar](500) NOT NULL,
	[Spec] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[VipPrice] [int] NULL,
	[Weight] [int] NOT NULL,
	[StockNum] [int] NOT NULL,
	[HeadPic] [nvarchar](500) NOT NULL,
	[goodsID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductInfo]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImgURL] [varchar](500) NOT NULL,
	[HeadPic] [bit] NOT NULL,
 CONSTRAINT [PK_ProductInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recharge]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recharge](
	[Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Amount] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[FinishedTime] [datetime] NOT NULL,
	[Success] [bit] NOT NULL,
 CONSTRAINT [PK_Recharge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RedEnvelopes]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedEnvelopes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[SubTitle] [nchar](10) NOT NULL,
	[Minimum] [int] NOT NULL,
	[TermTimeSpan] [int] NOT NULL,
	[Offline] [bit] NOT NULL,
 CONSTRAINT [PK_RedEnvelopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OpenId] [varchar](500) NULL,
	[Mobile] [varchar](50) NULL,
	[Recommender] [int] NULL,
	[Integral] [int] NOT NULL,
	[Balance] [int] NOT NULL,
	[Level] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLocation]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Longitude] [float] NULL,
	[Latitude] [float] NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_UserLocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRedEnvelopes]    Script Date: 11/16/2020 5:31:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRedEnvelopes](
	[Id] [int] NOT NULL,
	[UserId] [int] NULL,
	[RedEnvelopesId] [int] NULL,
	[ObtainTime] [datetime] NULL,
 CONSTRAINT [PK_UserRedEnvelopes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Franchise] ON 

INSERT [dbo].[Franchise] ([Id], [Name], [Longitude], [Latitude]) VALUES (1, N'合肥瑶海区百果王总店', 21, 21)
SET IDENTITY_INSERT [dbo].[Franchise] OFF
SET IDENTITY_INSERT [dbo].[FranchiseCate] ON 

INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (1, 1, N'车厘子')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (2, 1, N'猕猴桃系列')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (3, 1, N'酸奶坚果')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (4, 1, N'瓜果葡提')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (5, 1, N'招牌水果')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (6, 1, N'鲜果现切')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (7, 1, N'桃李杏仁')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (8, 1, N'下午茶套餐')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (9, 1, N'苹果梨蕉')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (10, 1, N'热带水果/其他')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (11, 1, N'新品尝鲜')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (12, 1, N'果篮礼盒')
INSERT [dbo].[FranchiseCate] ([Id], [FranchiseId], [Name]) VALUES (13, 1, N'橘橙柑柚')
SET IDENTITY_INSERT [dbo].[FranchiseCate] OFF
INSERT [dbo].[FranchiseCateProduct] ([Id], [FranchiseCateId], [FranchiseProductId]) VALUES (N'1984bf6e-22d2-4f1d-8a04-006de7897235', 1, N'1984bf6e-22d2-4f1d-8a04-006de7897235')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'1984bf6e-22d2-4f1d-8a04-006de7897235', 1, 75645, NULL, N'?1???????-????', N'', N'1106217209', N'?', N'1?/???200g', N'??', 1, 1810, 1720, 11, 200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'56da0682-6c70-44fb-95f9-017c165abab1', 1, 37708, NULL, N'?1-2?????????+????+????', N'?????,?????', N'1108227205', N'?', N'1?/????500g', N'B?', 1, 2890, 2746, 1211, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a39d5def-b67e-4040-9a77-021c3b19a04a', 1, 76858, NULL, N'?????????500g+??1?', N'', N'6613307224', N'?', N'1?', N'', 1, 2090, 1986, 16, 700, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'646e9504-ab2a-41dd-a1b5-033496b50223', 1, 50106, NULL, N'??-???????(??)?', N'????,????5?????', N'1240647201', N'?', N'1?/?2.6kg', N'??', 1, 50960, NULL, 2, 2600, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'5b924f61-b8ff-4b69-a980-05584a9d4e9b', 1, 22136, NULL, N'A?-?????(?)', N'????????,????', N'1181727201', N'?', N'1?/?500g', N'A?', 1, 1350, 1283, 229, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'd6d9ec37-7b1c-42cc-a730-0566898b108e', 1, 11484, NULL, N'??-???(??)', N'????,????', N'1012817221', N'?', N'1?/?2400g', N'??', 1, 7440, 7068, 12, 2400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'cc584ca3-c61d-4cc6-aac8-08cc609b25f6', 1, 82216, NULL, N'???7.9??A?-????(?)', N'', N'1085327208', N'?', N'1???/1.5kg', N'A?', 1, 4050, 3200, 999, 1500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'594686e5-234f-4206-86ad-0d0a5cfa3540', 1, 42120, NULL, N'A?-????????', N'?????,?????', N'1163017202', N'?', N'1?/250g', N'A?', 1, 1175, 1116, 31, 250, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'b31c4136-463a-4542-86fb-0d1aa6754c85', 1, 80046, NULL, N'A?-????(?)', N'', N'1176757201', N'?', N'1?/500g', N'A?', 1, 299, NULL, 287, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a1e810de-7fe1-47ce-b31d-0e62d3173537', 1, 21759, NULL, N'A?-?????(?)', N'????,????', N'1270227201', N'?', N'1?/?480g', N'A?', 1, 1370, 1302, 14, 480, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f5d477e7-11c8-45ea-a881-0e9c8218e99f', 1, 12575, NULL, N'??????', N'???????,???????', N'1801237796', N'?', N'??????????????????', N'', 1, 35900, 34105, 1454, 7700, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'0d3db34a-4dce-4da0-ae9b-0ffe044328cc', 1, 44920, NULL, N'??????', N'????,????,????', N'3013497201', N'?', N'1?/600g', N'', 1, 2600, 2470, 9, 600, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'48d3bbc4-5f84-46ca-987b-11cadd1a82e5', 1, 20186, NULL, N'A?-????(?)', N'????,????', N'1085327201', N'?', N'1???/1.6kg,????????', N'A?', 1, 4320, 4104, 129, 1600, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'5331582e-d736-4457-9ac0-1320ce14d7aa', 1, 2208, NULL, N'B?-???', N'????,????', N'1043817201', N'?', N'1?/500g', N'B?', 1, 970, 922, 18, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'5f68483a-a310-40e3-89b2-13b8d319635c', 1, 9694, NULL, N'A?-?????? (?)', N'????????,?????', N'1066327201', N'?', N'1?/500g', N'A?', 1, 4350, 4133, 22, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'e9daa2a8-6f59-45db-afd3-144f3e6a1eb9', 1, 68297, NULL, N'90???(??)', N'9?????0????????', N'6613307201', N'?', N'1?/200g', N'', 1, 590, 561, 16, 200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'37cd5096-5e6d-483b-b9e7-1d1b811c33c8', 1, 29011, NULL, N'?6??A?-????????(?)36#', N'????,???????', N'1122937203', N'?', N'6?/?500g', N'A?', 6, 4140, 3933, 9, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'0d36edeb-dee6-4522-9c0c-1dce4d1c8596', 1, 23771, NULL, N'A?-????', N'????,????', N'1078017202', N'?', N'1?/650g(?4?)', N'A?', 1, 520, NULL, 65, 650, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'32069f8b-8afc-4ec3-9b8b-1e9f20823c61', 1, 39968, NULL, N'????', N'???????,?????', N'3013197201', N'?', N'1?/?280g', N'', 1, 4900, 4655, 13, 280, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'34410162-eaab-4a65-8f98-212e087ea4eb', 1, 79215, NULL, N'?3?????A?-????(?)', N'', N'1085337206', N'?', N'1?/???800g', N'A?', 1, 4160, 3952, 1000, 800, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'd7cb94f7-31f2-4abc-9b31-21323c5e3f30', 1, 42293, NULL, N'???7.6??A?-?????(?)', N'????????,????', N'1181727203', N'?', N'1?/4.8kg', N'A?', 1, 9900, 9405, 40, 4800, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'760ea184-f210-4c3d-a996-217ab21692c7', 1, 69329, NULL, N'???????1?200g+??1?', N'', N'6613307204', N'?', N'1?/300g', N'', 1, 1490, 1416, 1454, 100, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'4c376647-024c-4584-8774-242af76e5eaf', 1, 2513, NULL, N'B?-?????(?)', N'????,????,????', N'1057957201', N'?', N'1?/?750g,??????', N'B?', 1, 670, 637, 61, 750, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'e9904c33-8e3d-4f0a-8f0d-24b93705517a', 1, 55038, NULL, N'?1-2?????????+?????', N'??????????', N'1190917203', N'?', N'1?/????400g', N'A?', 1, 1390, 1321, 1817, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'7a211e77-ecbf-48b4-8cfb-24ca20f6f375', 1, 71105, NULL, N'?1-2??????????+?????+????  ???', N'', N'1059027210', N'?', N'1?/???500g', N'B?', 1, 2890, 2746, 1000, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'e8ee11c9-2944-4e1c-ac4a-258c21a48d5e', 1, 69347, NULL, N'???????1?200g+??????200g??', N'', N'6613307210', N'?', N'1?/400g', N'', 1, 1990, 1891, 1454, 200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a62648db-b380-491c-8ae3-25ab333455e6', 1, 78091, NULL, N'???300g?A?-300g?????????(?)', N'', N'1142727200', N'?', N'1?/300g', N'A?', 1, 3350, 3183, 1, 300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'836c86e7-2321-446d-9b74-261915ec0925', 1, 742, NULL, N'B?-???(?)', N'???,??????????', N'1058027201', N'?', N'4?', N'B?', 4, 600, 570, 9, 300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'73281434-f175-4cfb-8077-27a0db65a8e7', 1, 3226, NULL, N'??-???(??)', N'????,????', N'1012817201', N'?', N'1?/500g', N'??', 1, 1550, 1473, 57, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'c6e125e9-ac65-4da9-bcd8-28a84eac14d4', 1, 2201, NULL, N'A?-?????(?)', N'??????,???????', N'1002677201', N'?', N'2?/400g', N'A?', 2, 1740, 1653, 8, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'c476232a-042c-4dab-952a-29711ef7614d', 1, 1012, NULL, N'B?-???', N'????,???????', N'1137327201', N'?', N'1?/650g', N'B?', 1, 890, 846, 12, 650, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'81907abf-8f06-457e-b4f7-2c29f8ade583', 1, 2330, NULL, N'B?-??(?)', N'????,?????????', N'1044527201', N'?', N'1?/?1.4kg,??????', N'B?', 1, 800, 760, 16, 1400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f4f7ed0b-45d4-4b7a-92bf-30356f8e398a', 1, 13402, NULL, N'A?-?????(?)', N'??????,???????', N'1091727201', N'?', N'1?/?680g', N'A?', 1, 1060, 1007, 1, 680, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'c0dfce3d-0edd-40c1-a295-30e7bb30864f', 1, 47009, NULL, N'??????', N'??????,?????Q?', N'3011297201', N'?', N'1?/?225g', N'', 1, 3300, 3135, 5, 225, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'4a115385-d088-4601-811b-317fe10f6cb2', 1, 79210, NULL, N'?1-2?????A?-????(?)', N'', N'1085327203', N'?', N'1?/???350g', N'A?', 1, 1990, 1891, 295, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f58d81dc-0e30-4afd-838a-3305aa30d1c1', 1, 926, NULL, N'B?-??????(?)', N'?????,?????', N'1108227201', N'?', N'1?/?500g', N'B?', 1, 1170, 1112, 22, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'90643944-adee-4922-b0d3-3739298d4ab5', 1, 14173, NULL, N'A?-????????(?)22#', N'????,???????', N'1122917203', N'?', N'1?/140g', N'A?', 1, 1370, 1302, 143, 140, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'62b2ae02-f6ba-4747-8d5c-3b83c29135e7', 1, 7522, NULL, N'????A?-????????(?)27#', N'????,???????', N'1122927296', N'?', N'1?/27?', N'A?', 27, 26460, 25137, 1, 2700, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'9a63237f-30be-4205-aa7e-3bedfe57deeb', 1, 73293, NULL, N'A?-?????????', N'', N'1100187201', N'?', N'1?/300g', N'A?', 1, 4880, 4636, 2, 300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'c2a8ce83-e851-4731-a87d-3f3d29d716b2', 1, 10835, NULL, N'????(?)', N'???????,?????', N'3002097201', N'?', N'1?/?500g', N'', 1, 2350, 2233, 22, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'39bcb3d5-df45-46cd-9f7a-4279a823ffae', 1, 73553, NULL, N'??????', N'', N'5693697201', N'?', N'?????,???,????,????', N'', 1, 11900, 11305, 35, 3300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'cde494b8-4658-4ccb-a33e-42d617097870', 1, 46119, NULL, N'???3???A?-????', N'????,???????', N'1000767202', N'?', N'3??', N'A?', 3, 14640, 13908, 3, 1200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'eb456897-0ca9-49a0-8c58-4a7ba1189c96', 1, 593, NULL, N'B?-????(?)', N'?????,???????', N'1005227201', N'?', N'1?/?1kg', N'B?', 1, 1180, NULL, 24, 1000, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'd45e48b1-c2e1-4c38-94c4-4becdd35ebc4', 1, 75448, NULL, N'??????', N'', N'3016397201', N'?', N'1?/120g', N'', 1, 870, 827, 8, 120, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a493f8af-c4ba-4077-9927-4c6f42bba94e', 1, 67692, NULL, N'??????B?-????(?)', N'', N'1116227204', N'?', N'1?/?800g', N'B?', 1, 890, 846, 20, 800, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'8095fbd9-1dd9-47aa-9ae9-51594d4a78c2', 1, 64818, NULL, N'A?-????(?)', N'', N'1005107202', N'?', N'1?/?1.5kg', N'A?', 1, 4410, NULL, 14, 1500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'e6f9090f-9e2a-46da-b7da-5264bd21bd7a', 1, 81950, NULL, N'B?-????(?)', N'', N'1051837201', N'?', N'1?/1.2kg', N'B?', 1, 1390, 1321, 17, 1200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'ddb57b77-cb46-4a44-9c61-52839a3550b4', 1, 74965, NULL, N'???????????', N'??6?+????1?+???????+??????400g', N'6613307213', N'?', N'1?', N'', 1, 4590, 4361, 1454, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f27f6bfc-f22e-48c5-ae01-553c3f1f85c7', 1, 82208, NULL, N'A?-???', N'', N'1043807201', N'?', N'2?/1kg', N'A?', 1, 1940, 1843, 11, 1000, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'7f44f9bb-4ab0-40ef-a522-559b3273fb87', 1, 5296, NULL, N'A?-????(??)', N'??????????????', N'1131557201', N'?', N'1?/?220g', N'A?', 1, 970, 922, 5, 220, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'189eb48a-47a3-4351-96c3-573726c52c9f', 1, 69746, NULL, N'?1-2?????????+????', N'', N'1128327205', N'?', N'1?/???400g', N'A?', 1, 1290, 1226, 25, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'ab041ced-43aa-4417-89d0-5847f16534d9', 1, 21335, NULL, N'B?-????', N'??????????', N'1140027201', N'?', N'1?/?500g', N'B?', 1, 1150, 1093, 13, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'58046f89-c645-4567-8678-598bdee85b5d', 1, 31307, NULL, N'?1-2??????????+????', N'', N'1997917201', N'?', N'1?/???400g', N'', 1, 2290, 2176, 1817, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'eb0652d3-bf5d-4599-8cf2-59c5ac101904', 1, 55034, NULL, N'?1-2??????????+????', N'', N'1997857201', N'?', N'1?/???400g', N'', 1, 2090, 1986, 1817, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'13170307-31a7-496e-98a1-5c59f909654d', 1, 63717, NULL, N'?1-2???????????+????', N'', N'1998557201', N'?', N'1?/???400g', N'', 1, 4190, 3981, 1817, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'252545c5-43f6-4711-ace3-5d9d556bb429', 1, 63295, NULL, N'?1-2?????A?-?????(?)', N'', N'1091727202', N'?', N'1?/???350g', N'A?', 1, 1190, 1131, 1, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f173c68e-8c2e-4211-a86e-5f9b2c32e683', 1, 4990, NULL, N'?1-2?????????+?????+??????', N'?????,?????', N'1059617296', N'?', N'1?/???450g', N'A?', 1, 2890, 2746, 5, 450, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'61c4eb02-124a-4baa-b74e-60cb89a6300a', 1, 35603, NULL, N'A?-??????(?)', N'????????,?????', N'1066327202', N'?', N'1?/250g', N'A?', 1, 2180, 2071, 45, 250, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'e7cd75ca-b56a-4d8a-902a-627a39c29df4', 1, 75719, NULL, N'?19.8?/1kg?????', N'', N'3005897202', N'?', N'1?/1kg', N'', 1, 1980, 1881, 18, 1000, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'0b22aa62-5209-4c00-988c-654325af830b', 1, 747, NULL, N'A?-????', N'??????????', N'1190917201', N'?', N'1?/500g', N'A?', 1, 970, 922, 8, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a172a582-c440-48c5-a3da-65c37e5ac731', 1, 33882, NULL, N'????????+??????', N'', N'1998737201', N'?', N'1?/???400g', N'', 1, 1890, 1796, 1817, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'2fa64d32-6cce-439f-b3f9-66a32ad1132f', 1, 55914, NULL, N'?1-2??????????+????+????', N'?????,?????', N'1108227200', N'?', N'1?/???500g', N'B?', 1, 3290, 3126, 1211, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'2df67817-facb-46b4-a9e8-66d3fb5dd49c', 1, 1018, NULL, N'A?-?????(?)', N'?????,???????', N'1072427201', N'?', N'1?/?700g', N'A?', 1, 2200, 2090, 9, 700, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'3bf77184-dbee-4a1f-a71f-67d00d5b3f88', 1, 39853, NULL, N'A?-????(?)', N'?????,?????', N'1059617202', N'?', N'1?/500g', N'A?', 1, 1170, 1112, 15, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'79c009ea-5ec2-4852-90d8-680814d46ccb', 1, 81919, NULL, N'A?-260g???????(??)', N'', N'1137027201', N'?', N'1?/260g', N'', 1, 4900, 4655, 19, 260, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'b19a5b9c-b6bc-4469-a4c1-6a1c1b7283bf', 1, 43402, NULL, N'??????', N'?????,?????', N'3014197201', N'?', N'1?/?218g', N'', 1, 2600, 2470, 10, 218, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'72a7640e-df33-4815-a79b-6bdcb356faf1', 1, 74063, NULL, N'?1-2?????A?-??????', N'', N'1101057202', N'?', N'1?/???500g', N'A?', 1, 1990, 1891, 18, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'c1d8b1fa-2d56-4fae-ba98-6c0cb1343691', 1, 81793, NULL, N'A?-?????(6??)', N'', N'1099587201', N'?', N'1?/6?', N'A?', 1, 2350, 2233, 2, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'32df7d3b-0164-42ef-b139-6ddd1e139d40', 1, 63300, NULL, N'?1-2?????A?-????????(?)22#', N'?4?????', N'1122917206', N'?', N'1?/???350g', N'A?', 1, 5540, 5263, 35, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a3188f12-316a-4db2-b31f-70c3c4e5e563', 1, 19286, NULL, N'?1-2???????????+?????+????', N'????????C?', N'1128327209', N'?', N'1?/???450g', N'A?', 1, 2890, 2746, 22, 450, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'807d3125-222d-4f4c-bfbd-70ca9d17ed83', 1, 79214, NULL, N'?3?????A?-????(?)', N'', N'1085327205', N'?', N'1?/???800g', N'A?', 1, 4420, 4199, 129, 800, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'be35fd3b-1918-42fc-8004-71408a49e272', 1, 49683, NULL, N'A?-???(?)', N'VC??????????', N'1226127201', N'?', N'2?/650g', N'A?', 1, 750, 713, 6, 650, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a33c6ced-2d58-4e7a-831a-7796c1fdeffb', 1, 46279, NULL, N'????', N'???????“??????”', N'3011797201', N'?', N'1?/400g', N'', 1, 2280, 2166, 6, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'325efa45-7a24-4dfc-9a04-7beca2bf2fb6', 1, 65502, NULL, N'A?-??????(?)', N'', N'1103617201', N'?', N'1?/?550g', N'A?', 1, 1040, 988, 17, 550, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'66c86071-c97d-4a19-b5e5-7c5aeb94a310', 1, 55929, NULL, N'?????????1?+?????', N'????????,?????', N'3013597207', N'?', N'1?/???200g', N'', 1, 2290, 2176, 13, 200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'618adae8-eed3-4674-9669-7cb49bd0dccb', 1, 2242, NULL, N'A?-???(?)-????', N'??????,???????', N'1100377201', N'?', N'2?', N'A?', 2, 460, 437, 15, 90, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'5dca5670-b341-4467-95da-7dd9b288183a', 1, 11151, NULL, N'?1-2?????????+???', N'????????C?', N'1128327208', N'?', N'1?/???400g', N'A?', 1, 1290, 1226, 6, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'52e71f7b-b6e9-4e93-a7d6-7ec92f03fa50', 1, 4601, NULL, N'A?-?????(?)', N'????,????', N'1101057201', N'?', N'1?/?1kg', N'A?', 1, 1370, 1302, 18, 1000, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'bfdb6bf3-0399-44a0-af65-7ef95c4ce1ff', 1, 73890, NULL, N'???7.2??90???(??)200g', N'', N'6613307232', N'?', N'2?', N'', 3, 990, NULL, 8, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'239117d5-e2f5-41ee-bda6-7fa9d0c30dc9', 1, 78298, NULL, N'?1-2?????????+?????+????', N'', N'1059617209', N'?', N'1?/???450g', N'A?', 1, 1590, 1511, 3231, 450, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'1d22d7df-646f-480b-b054-81c1814fcec4', 1, 69339, NULL, N'???????1?200g+???1?', N'', N'6613307207', N'?', N'1?/300g', N'', 1, 1390, 1321, 1454, 120, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'8b97fb4f-55a4-4971-9e1b-82a0898d2819', 1, 619, NULL, N'B?-????', N'????????,?????', N'1087527201', N'?', N'1?/?1.9kg', N'B?', 1, 2960, 2812, 76, 1900, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'db467c76-2164-4b19-aacb-83777235c9f9', 1, 63649, NULL, N'?1-2?????????+????', N'', N'1127017209', N'?', N'1?/????400g', N'??', 1, 4090, 3886, 1817, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'1c3459ae-cd2d-450f-95de-83c8074e9e44', 1, 10830, NULL, N'A?-?????(?)', N'?????,???????', N'1072427202', N'?', N'1?/?900g', N'A?', 1, 2830, 2689, 7, 900, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'45b9d4ef-11d7-458c-8be6-83d940b7a354', 1, 6698, NULL, N'A?-???????(?)', N'????,????', N'1006147201', N'?', N'1?/260g', N'A?', 1, 1570, 1492, 7, 260, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'9ff76d9a-b176-4583-b5f3-84851f5e575b', 1, 62403, NULL, N'?1-2?????A?-??????(?)', N'', N'1066327203', N'?', N'1?/???300g', N'A?', 1, 3050, 2898, 32, 300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'65b7c4a2-0e29-4099-b629-84c84a53c193', 1, 57298, NULL, N'?99?/3??????', N'????,?????????', N'3010897203', N'?', N'3?/??280g', N'', 3, 9900, NULL, 4, 840, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'ce427077-1333-47a4-ac7a-8634b72005c8', 1, 1830, NULL, N'B?-????(?)', N'????,????', N'1003117201', N'?', N'1?/?450g', N'B?', 2, 870, 827, 7, 450, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'1c98776b-9298-45ed-a125-8672273a1146', 1, 9035, NULL, N'?1-2????????+??????', N'????,?????????', N'1109027202', N'?', N'1?/???400g', N'B?', 1, 2690, 2556, 51, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'899ef0f7-9c3a-470e-9287-88d89fdb9361', 1, 31296, NULL, N'?1-2???????????+????', N'', N'1997837201', N'?', N'1?/???400g', N'', 1, 2090, 1986, 1817, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'cdcd5c9d-594a-4c35-8592-89986dfd5c98', 1, 2216, NULL, N'A?-??(?)', N'????,?????????', N'1010117201', N'?', N'1?/?920g', N'A?', 1, 900, 855, 7, 920, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'84d94049-648b-498a-b541-8a26ad7e115c', 1, 69340, NULL, N'???????1?200g+????350g??', N'', N'6613307208', N'?', N'1?/550g', N'', 1, 3490, 3316, 1454, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'ae6da95a-bece-4eb8-90d9-8a71064a754d', 1, 36946, NULL, N'??-250g????????', N'????,????,????', N'1127247201', N'?', N'1?/250g', N'??', 1, 2650, 2518, 4, 250, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'e1628bc8-5e58-412c-996d-8d47cf2b145c', 1, 43300, NULL, N'?????', N'?????,????????', N'3262497201', N'?', N'1?/?120g', N'', 1, 970, 922, 6, 120, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'008754e8-b84e-4991-9813-8de1412601e8', 1, 10369, NULL, N'??????', N'???????,???????', N'1998387603', N'?', N'??????????????????????', N'A?', 1, 17900, 17005, 1454, 3300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'3fcd286f-9438-4f5e-a5be-902da42164f4', 1, 4285, NULL, N'A?-????(5??)', N'????,???????', N'1000767201', N'?', N'1??', N'A?', 1, 4880, 4636, 11, 450, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'409ce3bd-81ad-4e0b-aaf4-9048cf4dfc42', 1, 23321, NULL, N'B?-??(?)', N'????,????', N'1102627201', N'?', N'2?/?350g', N'B?', 1, 540, 513, 7, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'837eb8ce-4fa0-4bf7-a673-913fcb8985e8', 1, 10561, NULL, N'A?-????(?)', N'?????????', N'1051017201', N'?', N'1?/?1.4kg,??????', N'A?', 1, 1960, 1862, 67, 1400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'25e5c73e-64cb-4a1f-bd10-93d92810c384', 1, 22760, NULL, N'?J????B?-??????(J)', N'??????,??????', N'1107127205', N'?', N'1?/1.5kg', N'B?', 1, 42200, NULL, 5, 1500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'9dde3b16-30eb-48ce-b685-94a785cc7346', 1, 80775, NULL, N'????A?-??????(?)', N'', N'1103617202', N'?', N'1?/???350g', N'A?', 1, 1320, 1254, 13, 350, N'', N'')
GO
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'94a605eb-d2b0-4428-9b5c-94a87815d712', 1, 46470, NULL, N'??????', N'????,???????', N'3013897201', N'?', N'1?/300g', N'', 1, 16500, 15675, 10, 300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'd9a346d2-60d9-4a8c-a9b0-96c1a12805d3', 1, 2621, NULL, N'?1-2?????B?-??????', N'?????,?????', N'1108227202', N'?', N'1?/???350g', N'B?', 1, 1740, 1653, 16, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'6b45af36-edd1-4f1d-9619-9a2f6d982f2a', 1, 17304, NULL, N'A?-?????(?)', N'?????,???????', N'1072437201', N'?', N'1?/550g', N'A?', 1, 1490, 1416, 4, 550, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'dd25fba2-ddc5-449f-9b12-9c32f07049b2', 1, 743, NULL, N'B?-????', N'????,????', N'1108417201', N'?', N'1?/?500g', N'B?', 1, 790, 751, 17, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'3154ee79-9aae-43b3-9fd0-9c54a0466db9', 1, 64019, NULL, N'??????', N'', N'5995994001', N'?', N'??:?????????????,???', N'', 1, 27900, 26505, 999, 6800, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'75455459-2974-4e78-8c1f-9d074e2ee5e9', 1, 29640, NULL, N'?12??A?-????????(?)36#', N'????,???????', N'1122937204', N'?', N'1?/12?', N'A?', 1, 8280, 7866, 4, 960, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'dc63899f-60ab-450f-82e0-a0bbddad4256', 1, 55033, NULL, N'?1-2??????????+????', N'', N'1997847201', N'?', N'1?/???400g', N'', 1, 2190, 2081, 1817, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'70be2885-9427-4ba7-b5ee-a1ac6c03119f', 1, 70621, NULL, N'??????????', N'', N'1998387204', N'?', N'1????????,??,???,??,???', N'A?', 1, 15900, 15105, 1454, 1400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'09fdb547-461f-446e-bfa8-a34b84f85ad8', 1, 603, NULL, N'A?-????(?)', N'?????,?????', N'1059617201', N'?', N'1?/250g', N'A?', 1, 590, 561, 31, 250, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f85eb7cd-29e9-4817-8e91-a355939171ea', 1, 81904, NULL, N'?10???A?-????????(?)36#', N'', N'1122937205', N'?', N'1?/10??850g', N'A?', 1, 6900, 6555, 9, 850, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f94980eb-03cc-4e01-99f4-a380b0ae6c57', 1, 31335, NULL, N'?3?????B?-????', N'????????,?????', N'1087527203', N'?', N'1?/????800g', N'B?', 1, 2590, 2461, 91, 800, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'bdb70c6d-e511-4544-a8f0-a3ebb8fbdb17', 1, 602, NULL, N'B?-??????(?)', N'????,????????', N'1047227201', N'?', N'2?/550g', N'B?', 2, 2170, 2062, 19, 550, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'6593862e-e409-43bd-9c8d-a473ab1565d3', 1, 3543, NULL, N'??-????(?)', N'????,?????????', N'1106217201', N'?', N'1?/???110g', N'??', 2, 570, 542, 16, 110, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'082266ab-bdba-4c26-b7c3-a7f2d447136e', 1, 66809, NULL, N'?1-2?????????+????+?????', N'', N'1108227214', N'?', N'1?/???500g', N'B?', 1, 2690, 2556, 9, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'599d16ab-7abc-4edb-938c-a843fa0fe8eb', 1, 17946, NULL, N'???7.2??B?-125g??????(?)', N'?????,????????', N'1140807201', N'?', N'1?/?125g', N'B?', 1, 990, NULL, 37, 125, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'baf0706c-2c7a-4e19-98d9-a85682047b64', 1, 73013, NULL, N'A?-????????(?)', N'', N'1146627201', N'?', N'1?/?300g', N'A?', 1, 1670, 1587, 2, 300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'48ff12ea-b5fd-4266-a283-a9d9def79c3b', 1, 3204, NULL, N'????', N'????,????????', N'3005897201', N'?', N'1?/?500g', N'', 1, 990, NULL, 75, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a44ba552-79c4-440d-a0ca-a9ec2cb2541f', 1, 37718, NULL, N'?1-2????????+????', N'', N'1109027209', N'?', N'1?/???400g', N'B?', 1, 1290, 1226, 3635, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'348504f3-fcc8-4efe-b375-aae18fbf1463', 1, 3988, NULL, N'A?-????????(?)36#', N'????,???????', N'1122937201', N'?', N'2?/?170g', N'A?', 1, 1380, 1311, 28, 170, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'b2e6bc83-134d-4841-963d-abc8b29040cd', 1, 50979, NULL, N'?15?/2???????', N'?????,????????', N'3262497202', N'?', N'2?', N'', 2, 1500, NULL, 6, 240, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'1ae7878b-1c85-4553-808d-ac8ae3f3dac6', 1, 41187, NULL, N'A?-????????', N'?????,?????', N'1163017201', N'?', N'1?/?500g', N'A?', 1, 2350, 2233, 22, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'2bafddab-fde8-415e-9888-add995c4c04d', 1, 12262, NULL, N'?4??A?-????????(?)22#', N'????,???????', N'1122917202', N'?', N'4?/???140g', N'A?', 4, 5480, 5206, 23, 560, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f01f5a88-58f9-4035-baad-ae97e34fc094', 1, 47266, NULL, N'????B?-???????(?)', N'????????,?????', N'1021487201', N'?', N'1?/??2.8kg', N'B?', 1, 3950, 3753, 51, 2800, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'5d594b79-f53d-42cb-b6d8-afd5f687308d', 1, 11569, NULL, N'B?-??????(J)', N'??????,??????', N'1107127202', N'?', N'1?/?250g', N'B?', 1, 6900, NULL, 30, 250, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'5d0a8c4e-7e9f-4638-8c1c-afeab0019376', 1, 614, NULL, N'B?-?????(?)', N'', N'1109027201', N'?', N'1?/500g', N'B?', 1, 1370, 1302, 40, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'4248021e-f51f-409f-b427-b024d817e7fb', 1, 12322, NULL, N'B?-125g??????(?)', N'?????,????????', N'1140817201', N'?', N'1?/?125g', N'B?', 1, 1270, 1207, 4, 125, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'3fcd281c-b2b9-4b8d-a8e0-b0acc3da9124', 1, 23069, NULL, N'????', N'????,?????????', N'3010897201', N'?', N'1?/?280g', N'', 1, 3900, 3705, 13, 280, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'89ce3e17-ae2d-46a7-ba8f-b778ce1408b5', 1, 63298, NULL, N'?1-2?????A?-????????(?)22#', N'?2?????', N'1122917205', N'?', N'1?/???200g', N'A?', 1, 2780, 2641, 71, 200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'c38a65b8-a50f-4c14-9d73-b9313e777dcc', 1, 589, NULL, N'??-?????(?)', N'????,????', N'1000417201', N'?', N'2?/?650g', N'??', 2, 2540, 2413, 73, 650, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f0c39214-7038-47c8-86d3-b97b73c5bf58', 1, 75717, NULL, N'?15?/2????????', N'', N'3016397202', N'?', N'2?', N'', 2, 1500, NULL, 4, 240, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'64e84518-81f9-42e1-a6cb-bc27f79d4c67', 1, 80475, NULL, N'A?-????(?)', N'', N'1036957201', N'?', N'1?/600g', N'A?', 1, 1640, 1558, 7, 600, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'315fe189-878c-43c8-b5bb-bd1181a23877', 1, 69330, NULL, N'???????1?200g+????1?25g', N'', N'6613307205', N'?', N'1?/225g', N'', 1, 1490, 1416, 1454, 25, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'82933551-27ce-4332-969c-bd7d630ef2ef', 1, 8704, NULL, N'?1-2?????B?-????', N'????????,?????', N'1087527205', N'?', N'1?/????350g', N'B?', 1, 1190, 1131, 208, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'87a3a06f-0ce1-43d2-a297-bdf8c7bb447f', 1, 76852, NULL, N'????????100g+??1?', N'', N'6613307222', N'?', N'1?', N'', 1, 1990, 1891, 16, 300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'ae97bd14-5249-47f2-9083-bf8b9db3f20e', 1, 79204, NULL, N'A?-????(?)', N'', N'1085327202', N'?', N'????/900g', N'A?', 1, 2430, 2309, 375, 900, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'448f7d05-b858-4c33-b764-c0f8d58a9574', 1, 6573, NULL, N'A?-??????', N'????,????', N'1002157201', N'?', N'2?/250g', N'A?', 1, 1340, 1273, 3, 250, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'46fcad4c-723a-413c-be52-c117140900e6', 1, 44633, NULL, N'???', N'????????,?????', N'3261897201', N'?', N'1?/100g', N'', 1, 980, 931, 3, 100, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'795abecd-8b12-4f60-a72d-c443f7a0d218', 1, 79825, NULL, N'??????-?????', N'', N'1012817206', N'?', N'1?/???350g', N'??', 1, 2270, 2157, 41, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'abb7b0cb-b413-4d92-98b3-c4e9035aa8fa', 1, 74964, NULL, N'???????????', N'??5?+????1?+???????+??????400g', N'3013597209', N'?', N'1?', N'', 1, 4190, 3981, 1454, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f9a36ce2-54d6-4c7b-aa22-c5d52b6cf8c5', 1, 6697, NULL, N'A?-??????(?)', N'????,????', N'1003657201', N'?', N'1?/150g', N'A?', 1, 770, 732, 4, 150, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'09289022-5cbd-4056-b900-c5d771a20816', 1, 77942, NULL, N'???NFC??????????(180ML)', N'', N'2200297201', N'?', N'1?', N'', 1, 970, 922, 9, 180, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'b0e3fa77-cc6a-4e3a-a482-c765e728d6d4', 1, 20676, NULL, N'A?-?????(?)', N'????,????????', N'1047637202', N'?', N'2?/450g', N'A?', 2, 1040, 988, 36, 450, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'fc582702-1492-4e3a-959e-c84c705e99f6', 1, 29012, NULL, N'????A?-????????(?)36#', N'????,???????', N'1122937202', N'?', N'1?/36?', N'A?', 1, 24840, 23598, 1, 3100, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'8e247186-8f15-4859-a1d5-c87a4f1c2436', 1, 63631, NULL, N'?1-2?????????+????+????', N'', N'1103627205', N'?', N'1?/???500g', N'A?', 1, 2490, 2366, 1210, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'bc58e665-98bd-4f7e-abc6-c8bf787d5f75', 1, 6802, NULL, N'???7.6??A?-????????(?)22#', N'????,???????', N'1122917296', N'?', N'1?/22?', N'A?', 22, 22900, NULL, 6, 2200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a24ee1dd-a632-4b6d-93e8-c8ef79c044f7', 1, 73276, NULL, N'???NFC????????(180ML)', N'', N'2200797201', N'?', N'1?', N'', 1, 990, 941, 8, 180, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'b3d89008-a158-4d19-a858-cd2a70929a0e', 1, 32110, NULL, N'??-?????(?)', N'????,????', N'1000417209', N'?', N'1?/?1.2kg', N'??', 1, 4680, 4446, 18, 1200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'6e40ee74-f45b-4f5a-a7cb-d0022e56d099', 1, 56460, NULL, N'?12?????A?-????????(?)', N'????,???????', N'1122917204', N'?', N'1?/12?', N'A?', 12, 17400, 16530, 11, 1200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'7c3601b8-311b-4aec-b4cd-d2f6ea553a36', 1, 47706, NULL, N'????A?-????????2.6kg?(??)', N'?????,????????', N'1009377201', N'?', N'1?/???2.6kg', N'A?', 1, 5900, 5605, 3, 2600, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'4c07cc91-3866-4c3d-ac3d-d41ad5a08023', 1, 61338, NULL, N'?4??A?-????????(?)27#', N'????,???????', N'1122927204', N'?', N'4?/????100g', N'A?', 4, 3920, 3724, 9, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'4edb4db9-7f3f-4916-8ad1-d42ca9fd9ac4', 1, 3521, NULL, N'B?-???(?)', N'??????,???????', N'1052227201', N'?', N'1?/?550g', N'B?', 1, 980, 931, 14, 550, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'db933670-dfdc-41f7-97c6-d4352974924c', 1, 68838, NULL, N'?1-2?????A?-?????(?)', N'', N'1072427203', N'?', N'1?/???350g', N'A?', 1, 2300, 2185, 9, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'7d2d76f5-e80f-4ae7-853c-d446a8abc122', 1, 67696, NULL, N'?1-2?????????+??????', N'????????C?', N'1128327207', N'?', N'1?/???400g', N'A?', 1, 2590, 2461, 3635, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'2d16038f-7ecd-4fd8-b8be-d4b9d95f3930', 1, 6746, NULL, N'??-?????(?)', N'?????,?????', N'1134127201', N'?', N'1?', N'??', 1, 1070, 1017, 12, 150, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'b67c4178-c58f-451b-8e9c-d622f435c143', 1, 762, NULL, N'A?-????(?)', N'????????C?', N'1128327201', N'?', N'1?/?500g', N'A?', 1, 1170, 1112, 20, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'47515c94-dc60-4fb0-a763-d68a853a6d71', 1, 3129, NULL, N'B?-????(?)', N'??????,???????', N'1050527201', N'?', N'1?/500g', N'B?', 1, 1170, 1112, 14, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'0b7739d7-b86f-4e4f-b6a8-d72b6560c0ee', 1, 79987, NULL, N'A?-????(?)', N'', N'1173427201', N'?', N'1?/500g', N'', 1, 1650, 1568, 155, 500, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'54ef8c31-5d1e-4cff-849a-d89fb0a9a3ff', 1, 29588, NULL, N'A?-?????', N'?????,?????', N'1281017201', N'?', N'1?/650g', N'A?', 1, 2150, 2043, 4, 650, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'3fb3c694-540b-4c46-8f4c-de723252bec9', 1, 2233, NULL, N'A?-????(?)', N'???,??????????', N'1043127201', N'?', N'2?', N'A?', 2, 540, 513, 6, 160, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'61fd9167-f230-495f-8195-e075c80c1486', 1, 69335, NULL, N'???????1?200g+??1?125g', N'', N'6613307206', N'?', N'1?/325g', N'', 1, 2390, 2271, 1454, 125, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'761618e2-b338-45e5-98a2-e366cae7ea64', 1, 17860, NULL, N'A?-???(?)', N'????,?????????', N'1044167201', N'?', N'1?/?200g', N'A?', 1, 570, 542, 20, 200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'7c5a74e9-678c-4cb1-bb1d-e55fbcf5a1f0', 1, 79188, NULL, N'A?-?????(5??)', N'', N'1000807201', N'?', N'1?/300g', N'A?', 1, 3350, 3183, 8, 300, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'383ff85a-2d5e-4e2a-a5f9-e579c0784c55', 1, 2627, NULL, N'????B?-????', N'????????,?????', N'1087527202', N'?', N'??/?1kg,????????', N'B?', 1, 1560, 1482, 145, 1000, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'f60a4ae8-ee58-4f83-8990-e5ada766579f', 1, 53459, NULL, N'???NFC??????(180ml)', N'', N'2172797201', N'?', N'1?/180ml', N'', 1, 650, 618, 3, 180, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'2c757760-c548-4195-a0a7-e7efd422241a', 1, 65411, NULL, N'?1-2???????????+????', N'', N'1998607201', N'?', N'1?/???400g', N'', 1, 3890, 3696, 1817, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'afe15406-b962-41c6-81a4-ec310d12ef3e', 1, 75646, NULL, N'?1-2???????-????', N'', N'1106217210', N'?', N'1?/???350g', N'??', 1, 2380, 2261, 8, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'75d445c9-7961-4fc8-b6ab-ee13e37e1d44', 1, 43387, NULL, N'????????', N'????????,?????', N'3013597201', N'?', N'1?/?25g', N'', 1, 580, 551, 13, 25, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'b62e9f31-4f1b-43e7-a84a-f009281e958f', 1, 69345, NULL, N'???????1?200g+??????350g??', N'', N'6613307209', N'?', N'1?/550g', N'', 1, 2490, 2366, 1454, 350, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'580f5390-bd29-42d2-b0c8-f036465ad782', 1, 74944, NULL, N'A?-????(?)??????', N'', N'1051017204', N'?', N'1?/?1.25kg', N'A?', 1, 1750, 1663, 76, 1250, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'cbe0cb32-bbb5-4209-80de-f24e95addbec', 1, 72587, NULL, N'???????1?200g+???2?', N'', N'6613307215', N'?', N'1?', N'', 1, 2690, 2556, 16, 200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'96fd1c1c-c107-452d-8dbe-f347bbf70002', 1, 55928, NULL, N'?????????1?+??????', N'????????,?????', N'3013597206', N'?', N'1?/???200g', N'', 1, 1490, 1416, 13, 200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'07964956-02d1-4dfa-b18b-f59abfd9aa90', 1, 79184, NULL, N'??-???(??)', N'', N'1012817205', N'?', N'1?/550g', N'??', 1, 1700, 1615, 52, 550, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'83c472c1-271b-49c6-939e-f6d2caf75347', 1, 76798, NULL, N'??5?1?A?-????????(?)22#', N'', N'1122917207', N'?', N'6?/???140g', N'A?', 1, 6850, NULL, 23, 840, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'99cb7c95-8c1f-4397-b1d9-f84dd7ed6976', 1, 76854, NULL, N'??????????120g+??1?', N'', N'6613307223', N'?', N'1?', N'', 1, 1990, 1891, 16, 320, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'10e74dba-efb9-4ed6-a84b-f93c344abd0c', 1, 55927, NULL, N'?????????1?+?????', N'????????,?????', N'3013597205', N'?', N'1?/???200g', N'', 1, 2290, 2176, 13, 200, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'ac574b3a-3100-44dd-ad9f-f9423ade659f', 1, 76414, NULL, N'?15?/2??????200g', N'', N'3016497202', N'?', N'2?', N'', 1, 1500, NULL, 18, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'949f99a4-0101-4b79-9915-fd2b4e8e2429', 1, 31319, NULL, N'?1-2?????????+????', N'', N'1994317201', N'?', N'1?/???400g', N'', 1, 1790, 1701, 1816, 400, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'9cc2103c-cc98-4edf-a4e6-fe1e136dc1c3', 1, 43252, NULL, N'????A?-????(???)', N'????,????????', N'1171097201', N'?', N'1?/???2.7kg', N'A?', 1, 2900, 2755, 4, 2700, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'a37d73a3-85a9-4808-8539-fe89e8d050ac', 1, 591, NULL, N'A?-????(?)', N'?????,???????', N'1005107201', N'?', N'2?/?650g', N'A?', 2, 1910, NULL, 34, 650, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'35197a8e-8cd2-4882-9373-ffa7cece1fd8', 1, 39745, NULL, N'???7.8????-????(?)', N'????,?????????', N'1106217203', N'?', N'1?/18?', N'??', 18, 7980, NULL, 2, 2000, N'', N'')
INSERT [dbo].[FranchiseProduct] ([Id], [FranchiseId], [ProductId], [ImageURL], [Name], [SubTitle], [SkuID], [Unit], [Spec], [Level], [Quantity], [Price], [VipPrice], [StockNum], [Weight], [StoreWay], [ProductionPlace]) VALUES (N'ac26dd45-2db6-475a-bbd2-ffaeb02ced2b', 1, 612, NULL, N'B?-??????(J)', N'??????,??????', N'1107127201', N'?', N'1?/?500g', N'B?', 1, 13800, NULL, 15, 500, N'', N'')
SET IDENTITY_INSERT [dbo].[Level] ON 

INSERT [dbo].[Level] ([Id], [Name]) VALUES (1, N'A?')
INSERT [dbo].[Level] ([Id], [Name]) VALUES (2, N'B?')
INSERT [dbo].[Level] ([Id], [Name]) VALUES (3, N'??')
SET IDENTITY_INSERT [dbo].[Level] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (725, N'???7.8????-????(?)', N'甜蜜飙汁，更好吃的中华猕猴桃', N'1106217203', N'??', N'个', N'1?/18?', 18, 7980, NULL, 2000, 2, N'https://resource.pagoda.com.cn/group1/M02/32/4C/CmiLkF-KeeqAOrTiAAKXliv2W3w345.jpg?width=800&height=800', 39745)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (726, N'A?-?????(?)', N'云南冰糖橙的一种，皮薄易剥', N'1181727201', N'A?', N'份', N'1?/?500g', 1, 1350, 1283, 500, 229, N'https://resource.pagoda.com.cn/group1/M05/33/CE/CmiLlF-rqQmABWEIAAbVc9x_jKU810.jpg?width=800&height=800', 22136)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (727, N'A?-?????? (?)', N'青脆饱满晶莹剔透，像个小糖丸', N'1066327201', N'A?', N'份', N'1?/500g', 1, 4350, 4133, 500, 22, N'https://resource.pagoda.com.cn/group1/M03/32/0D/CmiWa1-MOUmARie9AASss8KY71Q347.jpg?width=800&height=800', 9694)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (728, N'??-???(??)', N'脆爽口感，甜蜜飚汁', N'1012817201', N'??', N'份', N'1?/500g', 1, 1550, 1473, 500, 57, N'https://resource.pagoda.com.cn/group1/M1A/33/CE/CmiLlF-rq86ATh6PAATr65MlCRY355.jpg?width=800&height=800', 3226)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (729, N'A?-????????', N'别名淑女红，好看又好吃', N'1163017201', N'A?', N'份', N'1?/?500g', 1, 2350, 2233, 500, 22, N'https://resource.pagoda.com.cn/group1/M00/13/DC/CmiLkF25AK-AG14AAAWth4WWO00974.jpg?width=800&height=800', 41187)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (730, N'?4??A?-????????(?)22#', N'鲜甜细嫩，一天两个不过瘾', N'1122917202', N'A?', N'个', N'4?/???140g', 4, 5480, 5206, 560, 23, N'https://resource.pagoda.com.cn/group1/M05/33/E9/CmiLlF-t7HWAb16aAAac8hQOU7c035.jpg?width=800&height=800', 12262)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (731, N'A?-????(?)', N'比普通红柚甜度更高', N'1051017201', N'A?', N'个', N'1?/?1.4kg,??????', 1, 1960, 1862, 1400, 67, N'https://resource.pagoda.com.cn/group1/M0D/32/6E/CmiLkF-MOLiAef5bAAZ-PalGOhU205.jpg?width=800&height=800', 10561)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (732, N'???7.6??A?-????????(?)22#', N'鲜甜细嫩，一天两个不过瘾', N'1122917296', N'A?', N'个', N'1?/22?', 22, 22900, NULL, 2200, 6, N'https://resource.pagoda.com.cn/group1/M11/32/49/CmiWa1-Q7SaAOVChAAH4L5P_PHw237.jpg?width=800&height=800', 6802)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (733, N'??5?1?A?-????????(?)22#', N'', N'1122917207', N'A?', N'份', N'6?/???140g', 1, 6850, NULL, 840, 23, N'https://resource.pagoda.com.cn/group1/M0C/33/CC/CmiU8F-rstCAFcnYAAIffMS6k8s341.jpg?width=800&height=800', 76798)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (734, N'A?-????(?)', N'鲜甜脆爽的天然维C丸', N'1128327201', N'A?', N'份', N'1?/?500g', 1, 1170, 1112, 500, 20, N'https://resource.pagoda.com.cn/group1/M13/32/EC/CmiWa1-iv4CALg-dAAbuwJRRuD0866.jpg?width=800&height=800', 762)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (735, N'B?-??????(?)', N'火红的颜色，浓烈的甜蜜', N'1108227201', N'B?', N'个', N'1?/?500g', 1, 1170, 1112, 500, 22, N'https://resource.pagoda.com.cn/group1/M05/2E/20/CmiU8F8hlGeAHnTXAAecq9wzdTg951.jpg?width=800&height=800', 926)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (736, N'??????B?-????(?)', N'', N'1116227204', N'B?', N'个', N'1?/?800g', 1, 890, 846, 800, 20, N'https://resource.pagoda.com.cn/group1/M02/30/A9/CmiLkF9iMSuAB5JoAAYhb-oUNjw280.jpg?width=800&height=800', 67692)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (737, N'A?-????????', N'别名淑女红，好看又好吃', N'1163017202', N'A?', N'份', N'1?/250g', 1, 1175, 1116, 250, 31, N'https://resource.pagoda.com.cn/group1/M00/13/E3/CmiWa126RuOAPcOqAAWth4WWO00051.jpg?width=800&height=800', 42120)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (738, N'B?-?????(?)', N'晶莹饱满，果汁丰盈，口感香甜', N'1057957201', N'B?', N'个', N'1?/?750g,??????', 1, 670, 637, 750, 61, N'https://resource.pagoda.com.cn/group1/M0B/31/E3/CmiLlF99386AQViRAAZeWSMpAp8360.jpg?width=800&height=800', 2513)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (739, N'??-????(?)', N'甜蜜飙汁，更好吃的中华猕猴桃', N'1106217201', N'??', N'个', N'1?/???110g', 2, 570, 542, 110, 16, N'https://resource.pagoda.com.cn/group1/M00/14/0C/CmiLkF3FB92Af8qeAAe4h-XJRNU985.jpg?width=800&height=800', 3543)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (740, N'?1-2?????????+????', N'', N'1128327205', N'A?', N'份', N'1?/???400g', 1, 1290, 1226, 400, 25, N'https://resource.pagoda.com.cn/group1/M0F/33/1C/CmiLlF-XwqmABicWAAH1FNy5rMM697.jpg?width=800&height=800', 69746)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (741, N'???7.6??A?-?????(?)', N'云南冰糖橙的一种，皮薄易剥', N'1181727203', N'A?', N'份', N'1?/4.8kg', 1, 9900, 9405, 4800, 40, N'https://resource.pagoda.com.cn/group1/M1B/33/9E/CmiLkF-rqLCAFlbDAAD-XVwMu30433.jpg?width=800&height=800', 42293)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (742, N'???7.2??B?-125g??????(?)', N'营养小巨人，甜品烘焙的百搭果', N'1140807201', N'B?', N'盒', N'1?/?125g', 1, 990, NULL, 125, 37, N'https://resource.pagoda.com.cn/group1/M0D/32/B3/CmiWiF-NjTiAddPEAAcXzZ2qgik526.jpg?width=800&height=800', 17946)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (743, N'??-250g????????', N'浓香浓甜，唇齿留香，经久不散', N'1127247201', N'??', N'盒', N'1?/250g', 1, 2650, 2518, 250, 4, N'https://resource.pagoda.com.cn/group1/M00/14/96/CmiLlF3kbO-AWw0BAASBWsXOtjQ521.jpg?width=800&height=800', 36946)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (744, N'B?-??????(J)', N'不仅红得深邃，而且甜得馥郁', N'1107127201', N'B?', N'份', N'1?/?500g', 1, 13800, NULL, 500, 15, N'https://resource.pagoda.com.cn/group1/M00/15/7C/CmiLkF4KsSmAMzE1AAbGPZggPoQ458.jpg?width=800&height=800', 612)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (745, N'?1-2?????????+???', N'鲜甜脆爽的天然维C丸', N'1128327208', N'A?', N'份', N'1?/???400g', 1, 1290, 1226, 400, 6, N'https://resource.pagoda.com.cn/group1/M1C/32/8C/CmiWa1-XxGSAN8Y8AAXPJnXEJk8444.jpg?width=800&height=800', 11151)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (746, N'?1-2?????A?-??????(?)', N'', N'1066327203', N'A?', N'份', N'1?/???300g', 1, 3050, 2898, 300, 32, N'https://resource.pagoda.com.cn/group1/M00/20/A8/CmiWa17XQBeAB8dzABROHjQLlJk357.gif?width=344&height=344', 62403)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (747, N'A?-??????(?)', N'青脆饱满晶莹剔透，像个小糖丸', N'1066327202', N'A?', N'份', N'1?/250g', 1, 2180, 2071, 250, 45, N'https://resource.pagoda.com.cn/group1/M00/20/51/CmiU8F7QaYqAZRi1ABROHjQLlJk366.gif?width=344&height=344', 35603)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (748, N'A?-????????(?)22#', N'鲜甜细嫩，一天两个不过瘾', N'1122917203', N'A?', N'个', N'1?/140g', 1, 1370, 1302, 140, 143, N'https://resource.pagoda.com.cn/group1/M00/1C/9B/CmiWa16yLWqAXc1aAAac8hQOU7c524.jpg?width=800&height=800', 14173)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (749, N'A?-????', N'香味浓郁，软糯甜蜜', N'1078017202', N'A?', N'份', N'1?/650g(?4?)', 1, 520, NULL, 650, 65, N'https://resource.pagoda.com.cn/group1/M00/0D/20/CmiLlFwcu_GAGxyBAAV4lJMU9o4369.jpg?width=800&height=800', 23771)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (750, N'90???(??)', N'9种益生菌、0添加、生牛乳奶源', N'6613307201', N'', N'瓶', N'1?/200g', 1, 590, 561, 200, 16, N'https://resource.pagoda.com.cn/group1/M12/31/4F/CmiLkF9wU_SAG7mNAABdmVsEE8Y591.jpg?width=750&height=750', 68297)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (751, N'A?-?????(?)', N'一口吸掉，甜如蜜糖', N'1270227201', N'A?', N'份', N'1?/?480g', 1, 1370, 1302, 480, 14, N'https://resource.pagoda.com.cn/group1/M00/0C/51/CmiLkFvjri6AU_GxAAX0-tF5iiY862.jpg?width=800&height=800', 21759)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (752, N'??-?????(?)', N'果型端正，酸甜适中', N'1000417201', N'??', N'个', N'2?/?650g', 2, 2540, 2413, 650, 73, N'https://resource.pagoda.com.cn/group1/M00/06/A7/CmiU8Frz2-SATTRlAAYZEMUMp4A111.jpg?width=800&height=800', 589)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (753, N'?6??A?-????????(?)36#', N'鲜甜细嫩，一天两个不过瘾', N'1122937203', N'A?', N'个', N'6?/?500g', 6, 4140, 3933, 500, 9, N'https://resource.pagoda.com.cn/group1/M01/33/8B/CmiLlF-kuUSAfGHeAAT4fmaa1Gk152.jpg?width=800&height=800', 29011)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (754, N'B?-125g??????(?)', N'营养小巨人，甜品烘焙的百搭果', N'1140817201', N'B?', N'盒', N'1?/?125g', 1, 1270, 1207, 125, 4, N'https://resource.pagoda.com.cn/group1/M00/16/E8/CmiWa15JNIWAb7PUAAcXzZ2qgik279.jpg?width=800&height=800', 12322)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (755, N'A?-????', N'清香微甜的迷你小黄瓜', N'1190917201', N'A?', N'份', N'1?/500g', 1, 970, 922, 500, 8, N'https://resource.pagoda.com.cn/group1/M00/08/2D/CmiWiFsyBTKAQzT0AAYqXVa73ZI279.jpg?width=800&height=800', 747)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (756, N'B?-?????(?)', N'', N'1109027201', N'B?', N'份', N'1?/500g', 1, 1370, 1302, 500, 40, N'https://resource.pagoda.com.cn/group1/M00/06/A9/CmiLkFrz95WAPocKAAXbX-BUYg4853.jpg?width=800&height=800', 614)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (757, N'B?-????(?)', N'红脸脆苹果，皮薄肉甜汁又多', N'1005227201', N'B?', N'份', N'1?/?1kg', 1, 1180, NULL, 1000, 24, N'https://resource.pagoda.com.cn/group1/M00/06/A9/CmiWiFrz9XiAG3EwAAbVppOQ1Rc405.jpg?width=800&height=800', 593)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (758, N'????A?-????????(?)36#', N'鲜甜细嫩，一天两个不过瘾', N'1122937202', N'A?', N'箱', N'1?/36?', 1, 24840, 23598, 3100, 1, N'https://resource.pagoda.com.cn/group1/M1C/33/76/CmiLlF-iUieAYFFXAAPOtw0aeZY776.jpg?width=800&height=800', 29012)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (759, N'A?-????(?)', N'红脸脆苹果，皮薄肉甜汁又多', N'1005107201', N'A?', N'个', N'2?/?650g', 2, 1910, NULL, 650, 34, N'https://resource.pagoda.com.cn/group1/M00/06/AA/CmiLlFr0Cy6AHxEYAAY1hsXGIi4152.jpg?width=800&height=800', 591)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (760, N'A?-????(?)', N'圆润又饱满，晶莹又清甜', N'1059617201', N'A?', N'份', N'1?/250g', 1, 590, 561, 250, 31, N'https://resource.pagoda.com.cn/group1/M00/06/AB/CmiU8Fr0D0OAULbLAAfKW404eCs889.jpg?width=800&height=800', 603)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (761, N'A?-?????(?)', N'香气浓汁水多，拌点酸奶更好吃', N'1091727201', N'A?', N'个', N'1?/?680g', 1, 1060, 1007, 680, 1, N'https://resource.pagoda.com.cn/group1/M00/10/85/CmiLlFz-MySAD1OKAAUnuNAZ-DU838.jpg?width=800&height=800', 13402)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (762, N'B?-??????(J)', N'不仅红得深邃，而且甜得馥郁', N'1107127202', N'B?', N'份', N'1?/?250g', 1, 6900, NULL, 250, 30, N'https://resource.pagoda.com.cn/group1/M04/33/9E/CmiLkF-rrHGAAHQIAAbGPZggPoQ227.jpg?width=800&height=800', 11569)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (763, N'A?-?????(?)', N'晒足了太阳，因此芒果味浓烈', N'1072427202', N'A?', N'个', N'1?/?900g', 1, 2830, 2689, 900, 7, N'https://resource.pagoda.com.cn/group1/M04/2E/C2/CmiWiF80jzKALSNCAAU2JyFrmgg700.jpg?width=800&height=800', 10830)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (764, N'??-?????(?)', N'熟得刚刚好，买来就能吃', N'1134127201', N'??', N'个', N'1?', 1, 1070, 1017, 150, 12, N'https://resource.pagoda.com.cn/group1/M00/06/A7/CmiWa1rz1Z6AQY8kAAYLo51kEn4953.jpg?width=800&height=800', 6746)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (765, N'A?-??????(?)', N'脆嫩多汁，清新酸甜', N'1003657201', N'A?', N'个', N'1?/150g', 1, 770, 732, 150, 4, N'https://resource.pagoda.com.cn/group1/M00/06/AB/CmiU8Fr0ErWASyIUAAViN_yMuu8401.jpg?width=800&height=800', 6697)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (766, N'B?-????', N'瓜香扑鼻，香甜可口', N'1108417201', N'B?', N'份', N'1?/?500g', 1, 790, 751, 500, 17, N'https://resource.pagoda.com.cn/group1/M00/17/9F/CmiWiF5M91GAFx19AAb6fwz5AqY355.jpg?width=800&height=800', 743)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (767, N'?1-2?????B?-????', N'集脆爽软甜于一身，口感超丰富', N'1087527205', N'B?', N'份', N'1?/????350g', 1, 1190, 1131, 350, 208, N'https://resource.pagoda.com.cn/group1/M00/13/36/CmiU8F2Mbk-AIoWBAAYBnHsYjJI358.jpg?width=800&height=800', 8704)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (768, N'????B?-????', N'集脆爽软甜于一身，口感超丰富', N'1087527202', N'B?', N'份', N'??/?1kg,????????', 1, 1560, 1482, 1000, 145, N'https://resource.pagoda.com.cn/group1/M00/0E/FF/CmiU8Fyq67uAM5GTAAdilRbfPBI192.jpg?width=800&height=800', 2627)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (769, N'B?-????', N'集脆爽软甜于一身，口感超丰富', N'1087527201', N'B?', N'个', N'1?/?1.9kg', 1, 2960, 2812, 1900, 76, N'https://resource.pagoda.com.cn/group1/M00/06/AB/CmiU8Fr0DMKAcT5_AAdilRbfPBI889.jpg?width=800&height=800', 619)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (770, N'????(?)', N'日常用脑多的你，要多吃核桃', N'3002097201', N'', N'份', N'1?/?500g', 1, 2350, 2233, 500, 22, N'https://resource.pagoda.com.cn/group1/M00/0E/BD/CmiU8FyYmW6AawZaAALA6ymcivo727.jpg?width=800&height=800', 10835)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (771, N'A?-???????(?)', N'浓甜沁人，爽脆多汁', N'1006147201', N'A?', N'个', N'1?/260g', 1, 1570, 1492, 260, 7, N'https://resource.pagoda.com.cn/group1/M00/07/2E/CmiWiFsOFlCAaUeqAAWI4Tilz4s788.jpg?width=800&height=800', 6698)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (772, N'A?-??????', N'酸甜适口，果汁充沛', N'1002157201', N'A?', N'份', N'2?/250g', 1, 1340, 1273, 250, 3, N'https://resource.pagoda.com.cn/group1/M00/06/A9/CmiLlFrz-0mAXlhnAAXqQK9hme0663.jpg?width=800&height=800', 6573)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (773, N'A?-?????(?)', N'酸甜适口，清爽水润', N'1101057201', N'A?', N'个', N'1?/?1kg', 1, 1370, 1302, 1000, 18, N'https://resource.pagoda.com.cn/group1/M00/0C/53/CmiWa1vj6QeAIrx6AAebh58EKb8454.jpg?width=800&height=800', 4601)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (774, N'A?-????(5??)', N'小小身材，却能给你满嘴甜', N'1000767201', N'A?', N'条', N'1??', 1, 4880, 4636, 450, 11, N'https://resource.pagoda.com.cn/group1/M00/15/26/CmiLkF38JtOAazpHAAGRMKm-6HI140.jpg?width=800&height=800', 4285)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (775, N'A?-?????(?)', N'营养高风味浓，你的每日第四餐', N'1002677201', N'A?', N'个', N'2?/400g', 2, 1740, 1653, 400, 8, N'https://resource.pagoda.com.cn/group1/M00/06/AB/CmiWiFr0EjSAWn50AAXrDgra2RM933.jpg?width=800&height=800', 2201)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (776, N'B?-????(?)', N'粉面口感，辅食首选', N'1003117201', N'B?', N'个', N'1?/?450g', 2, 870, 827, 450, 7, N'https://resource.pagoda.com.cn/group1/M00/08/CD/CmiU8Fs96TiAatzYAAQC59GIvo4782.jpg?width=800&height=800', 1830)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (777, N'B?-???(?)', N'可清爽可甘厚，不同熟度味不同', N'1052227201', N'B?', N'份', N'1?/?550g', 1, 980, 931, 550, 14, N'https://resource.pagoda.com.cn/group1/M17/33/3B/CmiLkF-hCFCAKp-3AAaaoq-q7Tg265.jpg?width=800&height=800', 3521)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (778, N'B?-??????(?)', N'红润鲜嫩，有一股特殊的香味', N'1047227201', N'B?', N'个', N'2?/550g', 2, 2170, 2062, 550, 19, N'https://resource.pagoda.com.cn/group1/M00/06/AB/CmiU8Fr0E96AIqDxAAV72wxQpdA790.jpg?width=800&height=800', 602)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (779, N'A?-????????(?)36#', N'鲜甜细嫩，一天两个不过瘾', N'1122937201', N'A?', N'个', N'2?/?170g', 1, 1380, 1311, 170, 28, N'https://resource.pagoda.com.cn/group1/M02/32/FA/CmiWa1-kuSWAQvTPAAcnmLHYsSE780.jpg?width=800&height=800', 3988)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (780, N'A?-??(?)', N'个大肉多，很适合煲汤煮糖水哦', N'1010117201', N'A?', N'份', N'1?/?920g', 1, 900, 855, 920, 7, N'https://resource.pagoda.com.cn/group1/M00/10/04/CmiLlFzkrTaAc3aGAAVO4kSEWEI212.jpg?width=800&height=800', 2216)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (781, N'B?-??(?)', N'开一个吃，一屋子都充满柚子香', N'1044527201', N'B?', N'个', N'1?/?1.4kg,??????', 1, 800, 760, 1400, 16, N'https://resource.pagoda.com.cn/group1/M00/13/13/CmiWa12EOgOAWL9AAAXwGq5RHfk136.jpg?width=800&height=800', 2330)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (782, N'B?-???', N'清甜可口，籽少无渣', N'1043817201', N'B?', N'份', N'1?/500g', 1, 970, 922, 500, 18, N'https://resource.pagoda.com.cn/group1/M08/33/9D/CmiLkF-rmz6AeKG1AAVlcgtNrkE805.jpg?width=800&height=800', 2208)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (783, N'B?-???', N'口感爽甜，秋天必吃果之一', N'1137327201', N'B?', N'份', N'1?/650g', 1, 890, 846, 650, 12, N'https://resource.pagoda.com.cn/group1/M00/0D/01/CmiU8FwSNjiAC01wAAIuvLl917g439.jpg?width=800&height=800', 1012)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (784, N'A?-?????(?)', N'晒足了太阳，因此芒果味浓烈', N'1072427201', N'A?', N'个', N'1?/?700g', 1, 2200, 2090, 700, 9, N'https://resource.pagoda.com.cn/group1/M20/2E/BF/CmiLlF80j0uALtlgAAU2JyFrmgg945.jpg?width=800&height=800', 1018)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (785, N'B?-????(?)', N'不酸涩不苦麻，甜到颠覆你认知', N'1050527201', N'B?', N'份', N'1?/500g', 1, 1170, 1112, 500, 14, N'https://resource.pagoda.com.cn/group1/M06/33/82/CmiWiF-jcQeAQAHBAAOoqnDUPw4476.jpg?width=800&height=800', 3129)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (786, N'B?-???(?)', N'有了我，白开水也可以有滋有味', N'1058027201', N'B?', N'个', N'4?', 4, 600, 570, 300, 9, N'https://resource.pagoda.com.cn/group1/M00/08/2D/CmiLkFsyBKGACi36AAVzqkO_HBA299.jpg?width=800&height=800', 742)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (787, N'A?-???(?)-????', N'酸酸甜甜的我，和蜂蜜水超搭哦', N'1100377201', N'A?', N'个', N'2?', 2, 460, 437, 90, 15, N'https://resource.pagoda.com.cn/group1/M00/06/AC/CmiLlFr0HxGATVf8AAcwrAeiYr0720.jpg?width=800&height=800', 2242)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (788, N'A?-????(??)', N'比你想象中的山楂味儿更甜一些', N'1131557201', N'A?', N'盒', N'1?/?220g', 1, 970, 922, 220, 5, N'https://resource.pagoda.com.cn/group1/M00/0C/D4/CmiLlFwE_bmAIytFAAc1vuGVXNM645.jpg?width=800&height=800', 5296)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (789, N'???7.9??A?-????(?)', N'', N'1085327208', N'A?', N'份', N'1???/1.5kg', 1, 4050, 3200, 1500, 999, N'https://resource.pagoda.com.cn/group1/M02/33/DA/CmiU8F-stmmAay9lAAffhLkK2Dg080.jpg?width=800&height=800', 82216)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (790, N'A?-???', N'', N'1043807201', N'A?', N'份', N'2?/1kg', 1, 1940, 1843, 1000, 11, N'https://resource.pagoda.com.cn/group1/M10/33/D8/CmiU8F-smpeARg9nAAVlcgtNrkE555.jpg?width=800&height=800', 82208)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (791, N'B?-????(?)', N'', N'1051837201', N'B?', N'份', N'1?/1.2kg', 1, 1390, 1321, 1200, 17, N'https://resource.pagoda.com.cn/group1/M0A/33/3A/CmiWa1-rfV-APw_yAAUKri-tgKo577.jpg?width=800&height=800', 81950)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (792, N'A?-260g???????(??)', N'', N'1137027201', N'', N'份', N'1?/260g', 1, 4900, 4655, 260, 19, N'https://resource.pagoda.com.cn/group1/M14/33/EC/CmiU8F-uTFGAWieIAAOwEKw0jac012.jpg?width=800&height=800', 81919)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (793, N'?10???A?-????????(?)36#', N'', N'1122937205', N'A?', N'份', N'1?/10??850g', 1, 6900, 6555, 850, 9, N'https://resource.pagoda.com.cn/group1/M0E/33/C6/CmiLlF-rMp6AFXCWAAT4fmaa1Gk632.jpg?width=800&height=800', 81904)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (794, N'A?-?????(6??)', N'', N'1099587201', N'A?', N'份', N'1?/6?', 1, 2350, 2233, 400, 2, N'https://resource.pagoda.com.cn/group1/M00/33/B8/CmiU8F-qDfOACKTXAAWYbh_3kiY129.jpg?width=800&height=800', 81793)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (795, N'????A?-??????(?)', N'', N'1103617202', N'A?', N'份', N'1?/???350g', 1, 1320, 1254, 350, 13, N'https://resource.pagoda.com.cn/group1/M0B/33/8A/CmiU8F-k4AaAOofQAAW9c7YrRwI999.jpg?width=800&height=800', 80775)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (796, N'A?-????(?)', N'', N'1036957201', N'A?', N'份', N'1?/600g', 1, 1640, 1558, 600, 7, N'https://resource.pagoda.com.cn/group1/M20/33/87/CmiWiF-j2PCASD5ZAAZ7HEPp6cw345.jpg?width=800&height=800', 80475)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (797, N'A?-????(?)', N'', N'1176757201', N'A?', N'份', N'1?/500g', 1, 299, NULL, 500, 287, N'https://resource.pagoda.com.cn/group1/M01/33/59/CmiWa1-t9paAXQ8rAAlCVB7ydZY420.jpg?width=800&height=800', 80046)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (798, N'A?-????(?)', N'', N'1173427201', N'', N'份', N'1?/500g', 1, 1650, 1568, 500, 155, N'https://resource.pagoda.com.cn/group1/M00/32/E7/CmiWa1-iZ2SAIrcIAA3jyFi7lBY873.png?width=800&height=800', 79987)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (799, N'??????-?????', N'', N'1012817206', N'??', N'份', N'1?/???350g', 1, 2270, 2157, 350, 41, N'https://resource.pagoda.com.cn/group1/M02/33/43/CmiLkF-iDASAH3ZPAAPqhaTZ7xc410.jpg?width=800&height=800', 79825)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (800, N'?3?????A?-????(?)', N'', N'1085337206', N'A?', N'份', N'1?/???800g', 1, 4160, 3952, 800, 1000, N'https://resource.pagoda.com.cn/group1/M1D/33/5F/CmiLlF-fwkeAGHf4AACqh8_cadg14.jpeg?width=800&height=800', 79215)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (801, N'?3?????A?-????(?)', N'', N'1085327205', N'A?', N'份', N'1?/???800g', 1, 4420, 4199, 800, 129, N'https://resource.pagoda.com.cn/group1/M11/33/5C/CmiU8F-fwYKAFGcTAACqh8_cadg20.jpeg?width=800&height=800', 79214)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (802, N'?1-2?????A?-????(?)', N'', N'1085327203', N'A?', N'份', N'1?/???350g', 1, 1990, 1891, 350, 295, N'https://resource.pagoda.com.cn/group1/M12/33/5E/CmiLlF-fvhOAUdC5AACqh8_cadg66.jpeg?width=800&height=800', 79210)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (803, N'A?-????(?)', N'', N'1085327202', N'A?', N'份', N'????/900g', 1, 2430, 2309, 900, 375, N'https://resource.pagoda.com.cn/group1/M15/32/CE/CmiWa1-fvW6AFs4_AAWlDD0ST1I965.jpg?width=800&height=800', 79204)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (804, N'A?-?????(5??)', N'', N'1000807201', N'A?', N'份', N'1?/300g', 1, 3350, 3183, 300, 8, N'https://resource.pagoda.com.cn/group1/M0F/33/5E/CmiLlF-ft-2AIi2wAAGRMKm-6HI490.jpg?width=800&height=800', 79188)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (805, N'??-???(??)', N'', N'1012817205', N'??', N'份', N'1?/550g', 1, 1700, 1615, 550, 52, N'https://resource.pagoda.com.cn/group1/M11/32/CD/CmiWa1-fs2-ALf1OAATr65MlCRY712.jpg?width=800&height=800', 79184)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (806, N'?1-2?????????+?????+????', N'', N'1059617209', N'A?', N'份', N'1?/???450g', 1, 1590, 1511, 450, 3231, N'https://resource.pagoda.com.cn/group1/M18/33/1F/CmiWiF-XyX-ARy_bAAYRoV0CjqQ549.jpg?width=800&height=800', 78298)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (807, N'???300g?A?-300g?????????(?)', N'', N'1142727200', N'A?', N'份', N'1?/300g', 1, 3350, 3183, 300, 1, N'https://resource.pagoda.com.cn/group1/M17/32/DE/CmiLkF-WPACAI91kAAcXzZ2qgik545.jpg?width=800&height=800', 78091)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (808, N'???NFC??????????(180ML)', N'', N'2200297201', N'', N'份', N'1?', 1, 970, 922, 180, 9, N'https://resource.pagoda.com.cn/group1/M20/32/F0/CmiWiF-Sh52AePQNAALtBi6ZqAg205.jpg?width=800&height=800', 77942)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (809, N'?????????500g+??1?', N'', N'6613307224', N'', N'份', N'1?', 1, 2090, 1986, 700, 16, N'https://resource.pagoda.com.cn/group1/M06/32/5D/CmiU8F-H5eCAE6DlAANEU-VcAbA732.jpg?width=800&height=800', 76858)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (810, N'??????????120g+??1?', N'', N'6613307223', N'', N'份', N'1?', 1, 1990, 1891, 320, 16, N'https://resource.pagoda.com.cn/group1/M0C/32/2F/CmiLkF-H5PGAOq65AALkqGnIRzo331.jpg?width=800&height=800', 76854)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (811, N'????????100g+??1?', N'', N'6613307222', N'', N'份', N'1?', 1, 1990, 1891, 300, 16, N'https://resource.pagoda.com.cn/group1/M16/31/CE/CmiWa1-H44iAP5wfAAN85L492SU897.jpg?width=800&height=800', 76852)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (812, N'?15?/2??????200g', N'', N'3016497202', N'', N'份', N'2?', 1, 1500, NULL, 400, 18, N'https://resource.pagoda.com.cn/group1/M1A/32/2C/CmiLlF-D0vaAPNP3AAQldSFFvr8783.jpg?width=800&height=800', 76414)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (813, N'?19.8?/1kg?????', N'', N'3005897202', N'', N'份', N'1?/1kg', 1, 1980, 1881, 1000, 18, N'https://resource.pagoda.com.cn/group1/M0F/31/9C/CmiLkF964x2AY_0fAARUU4rFCpE899.jpg?width=800&height=800', 75719)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (814, N'?15?/2????????', N'', N'3016397202', N'', N'袋', N'2?', 2, 1500, NULL, 240, 4, N'https://resource.pagoda.com.cn/group1/M0B/31/9C/CmiLkF964UeAC37LAAP9wRmoV4k526.jpg?width=800&height=800', 75717)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (815, N'?1-2???????-????', N'', N'1106217210', N'??', N'份', N'1?/???350g', 1, 2380, 2261, 350, 8, N'https://resource.pagoda.com.cn/group1/M18/31/94/CmiLkF95gNKAJrR1AAXPwSgnWn885.jpeg?width=800&height=800', 75646)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (816, N'?1???????-????', N'', N'1106217209', N'??', N'份', N'1?/???200g', 1, 1810, 1720, 200, 11, N'https://resource.pagoda.com.cn/group1/M17/31/94/CmiLkF95f1qAdR_XAAXPwSgnWn847.jpeg?width=800&height=800', 75645)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (817, N'??????', N'', N'3016397201', N'', N'袋', N'1?/120g', 1, 870, 827, 120, 8, N'https://resource.pagoda.com.cn/group1/M07/31/AE/CmiWiF91vU6AVas1AAP9wRmoV4k756.jpg?width=800&height=800', 75448)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (818, N'???????????', N'酸奶6瓶+红肉蜜柚1个+双拼【金火龙果+凯特芒】果肉400g', N'6613307213', N'', N'份', N'1?', 1, 4590, 4361, 400, 1454, N'https://resource.pagoda.com.cn/group1/M14/31/87/CmiLlF9xe5aAMA2KAAREUiADxD0845.jpg?width=800&height=800', 74965)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (819, N'???????????', N'坚果5袋+红肉蜜柚1个+双拼【金火龙果+凯特芒】果肉400g', N'3013597209', N'', N'份', N'1?', 1, 4190, 3981, 400, 1454, N'https://resource.pagoda.com.cn/group1/M16/30/F7/CmiWa19xeqGAW6V9AAREUiADxD0624.jpg?width=800&height=800', 74964)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (820, N'A?-????(?)??????', N'', N'1051017204', N'A?', N'份', N'1?/?1.25kg', 1, 1750, 1663, 1250, 76, N'https://resource.pagoda.com.cn/group1/M16/33/3D/CmiWa1-rqTyAJwWtAAZ-PalGOhU793.jpg?width=800&height=800', 74944)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (821, N'?1-2?????A?-??????', N'', N'1101057202', N'A?', N'份', N'1?/???500g', 1, 1990, 1891, 500, 18, N'https://resource.pagoda.com.cn/group1/M1E/31/2B/CmiWiF9oZ1yAbuVMAAWQoVcNq1s461.jpg?width=800&height=800', 74063)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (822, N'???7.2??90???(??)200g', N'', N'6613307232', N'', N'瓶', N'2?', 3, 990, NULL, 400, 8, N'https://resource.pagoda.com.cn/group1/M0C/32/2A/CmiWiF-DDo6AOdAWAAOVypLiUXU490.png?width=750&height=750', 73890)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (823, N'??????', N'', N'5693697201', N'', N'盒', N'?????,???,????,????', 1, 11900, 11305, 3300, 35, N'https://resource.pagoda.com.cn/group1/M0A/33/75/CmiWiF-iE_aAOI1aAATln1zf8OA184.jpg?width=800&height=800', 73553)
GO
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (824, N'A?-?????????', N'', N'1100187201', N'A?', N'盒', N'1?/300g', 1, 4880, 4636, 300, 2, N'https://resource.pagoda.com.cn/group1/M13/31/66/CmiLlF9tScyAVJbTAAQnt5ClNp8076.jpg?width=800&height=800', 73293)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (825, N'???NFC????????(180ML)', N'', N'2200797201', N'', N'瓶', N'1?', 1, 990, 941, 180, 8, N'https://resource.pagoda.com.cn/group1/M10/30/37/CmiWa19hetiAO875AALc-EC1fHc371.jpg?width=800&height=800', 73276)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (826, N'A?-????????(?)', N'', N'1146627201', N'A?', N'盒', N'1?/?300g', 1, 1670, 1587, 300, 2, N'https://resource.pagoda.com.cn/group1/M19/30/7A/CmiLkF9fDsOAfDqzAAXbX-BUYg4196.jpg?width=800&height=800', 73013)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (827, N'???????1?200g+???2?', N'', N'6613307215', N'', N'份', N'1?', 1, 2690, 2556, 200, 16, N'https://resource.pagoda.com.cn/group1/M01/30/59/CmiLlF9Ye2GAb0T7AAM7I1pqA7E393.jpg?width=800&height=800', 72587)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (828, N'?1-2??????????+?????+????  ???', N'', N'1059027210', N'B?', N'份', N'1?/???500g', 1, 2890, 2746, 500, 1000, N'https://resource.pagoda.com.cn/group1/M14/2F/90/CmiWiF9HTx6AKOV8AARhh24Tyms068.jpg?width=800&height=800', 71105)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (829, N'??????????', N'', N'1998387204', N'A?', N'份', N'1????????,??,???,??,???', 1, 15900, 15105, 1400, 1454, N'https://resource.pagoda.com.cn/group1/M1B/32/BD/CmiLkF-Sdr2AUAgxAAIvPy9-ATg983.jpg?width=800&height=800', 70621)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (830, N'???????1?200g+??????200g??', N'', N'6613307210', N'', N'份', N'1?/400g', 1, 1990, 1891, 200, 1454, N'https://resource.pagoda.com.cn/group1/M17/2E/BB/CmiWiF8zwR2AIQu8AALI8yTybgI291.jpg?width=800&height=800', 69347)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (831, N'???????1?200g+??????350g??', N'', N'6613307209', N'', N'份', N'1?/550g', 1, 2490, 2366, 350, 1454, N'https://resource.pagoda.com.cn/group1/M1E/2E/B9/CmiLlF8zwF6AOZg9AAO-irhVmuQ196.jpg?width=800&height=800', 69345)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (832, N'???????1?200g+????350g??', N'', N'6613307208', N'', N'份', N'1?/550g', 1, 3490, 3316, 350, 1454, N'https://resource.pagoda.com.cn/group1/M0A/2E/89/CmiLkF8zv5KAIQS3AALMnYuiT78772.jpg?width=800&height=800', 69340)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (833, N'???????1?200g+???1?', N'', N'6613307207', N'', N'份', N'1?/300g', 1, 1390, 1321, 120, 1454, N'https://resource.pagoda.com.cn/group1/M1B/2E/B8/CmiLlF8zvweAXVx4AAM7I1pqA7E764.jpg?width=800&height=800', 69339)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (834, N'???????1?200g+??1?125g', N'', N'6613307206', N'', N'份', N'1?/325g', 1, 2390, 2271, 125, 1454, N'https://resource.pagoda.com.cn/group1/M06/2E/BB/CmiWiF8zvnGAety9AAKMKwiAN5U116.jpg?width=800&height=800', 69335)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (835, N'???????1?200g+????1?25g', N'', N'6613307205', N'', N'份', N'1?/225g', 1, 1490, 1416, 25, 1454, N'https://resource.pagoda.com.cn/group1/M1D/2E/B6/CmiU8F8zu0uAdcSBAANbQGT3rpc129.jpg?width=800&height=800', 69330)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (836, N'???????1?200g+??1?', N'', N'6613307204', N'', N'份', N'1?/300g', 1, 1490, 1416, 100, 1454, N'https://resource.pagoda.com.cn/group1/M00/2E/BA/CmiWiF8zuhqAW-GMAAOOCQMEGW0870.jpg?width=800&height=800', 69329)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (837, N'?1-2?????A?-?????(?)', N'', N'1072427203', N'A?', N'份', N'1?/???350g', 1, 2300, 2185, 350, 9, N'https://resource.pagoda.com.cn/group1/M12/2E/8D/CmiU8F8vaMCAQRG0AAXww-RrKig51.jpeg?width=800&height=800', 68838)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (838, N'?1-2?????????+??????', N'鲜甜脆爽的天然维C丸', N'1128327207', N'A?', N'份', N'1?/???400g', 1, 2590, 2461, 400, 3635, N'https://resource.pagoda.com.cn/group1/M1E/33/1E/CmiWiF-XwXGAO18cAAGnR8AwAPo429.jpg?width=800&height=800', 67696)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (839, N'?1-2?????????+????+?????', N'', N'1108227214', N'B?', N'份', N'1?/???500g', 1, 2690, 2556, 500, 9, N'https://resource.pagoda.com.cn/group1/M00/2A/D3/CmiU8F8QAeqAfjdXAAVJnFcgr6s653.jpg?width=800&height=800', 66809)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (840, N'A?-??????(?)', N'', N'1103617201', N'A?', N'个', N'1?/?550g', 1, 1040, 988, 550, 17, N'https://resource.pagoda.com.cn/group1/M00/27/95/CmiLkF7--jOAAdmHAAcqm0V3Uek207.jpg?width=800&height=800', 65502)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (841, N'?1-2???????????+????', N'', N'1998607201', N'', N'份', N'1?/???400g', 1, 3890, 3696, 400, 1817, N'https://resource.pagoda.com.cn/group1/M00/27/76/CmiLlF79jJWAACTwAAVEQ9WIqRY657.jpg?width=800&height=800', 65411)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (842, N'A?-????(?)', N'', N'1005107202', N'A?', N'份', N'1?/?1.5kg', 1, 4410, NULL, 1500, 14, N'https://resource.pagoda.com.cn/group1/M00/26/79/CmiWiF73_myAPQoBAAY1hsXGIi4313.jpg?width=800&height=800', 64818)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (843, N'??????', N'', N'5995994001', N'', N'盒', N'??:?????????????,???', 1, 27900, 26505, 6800, 999, N'https://resource.pagoda.com.cn/group1/M0A/33/71/CmiU8F-iEySACdvJAASaj5EVlRo286.jpg?width=800&height=800', 64019)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (844, N'?1-2???????????+????', N'', N'1998557201', N'', N'份', N'1?/???400g', 1, 4190, 3981, 400, 1817, N'https://resource.pagoda.com.cn/group1/M00/23/6B/CmiWa17pu4WAYd8iAAVEiBJ69yA219.jpg?width=800&height=800', 63717)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (845, N'?1-2?????????+????', N'', N'1127017209', N'??', N'份', N'1?/????400g', 1, 4090, 3886, 400, 1817, N'https://resource.pagoda.com.cn/group1/M00/23/EF/CmiLlF7pqo6ABHHHAAU_74PXkLE113.jpg?width=800&height=800', 63649)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (846, N'?1-2?????????+????+????', N'', N'1103627205', N'A?', N'份', N'1?/???500g', 1, 2490, 2366, 500, 1210, N'https://resource.pagoda.com.cn/group1/M00/23/E5/CmiLlF7pmhiAfMKNAATnD8zyons340.jpg?width=800&height=800', 63631)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (847, N'?1-2?????A?-????????(?)22#', N'由4个整果切出', N'1122917206', N'A?', N'份', N'1?/???350g', 1, 5540, 5263, 350, 35, N'https://resource.pagoda.com.cn/group1/M00/23/67/CmiLlF7m4HqAaKV6AAXiAVz6d2c538.jpg?width=800&height=800', 63300)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (848, N'?1-2?????A?-????????(?)22#', N'由2个整果切出', N'1122917205', N'A?', N'份', N'1?/???200g', 1, 2780, 2641, 200, 71, N'https://resource.pagoda.com.cn/group1/M00/22/D6/CmiWa17m4JKASLdZAAXiAVz6d2c021.jpg?width=800&height=800', 63298)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (849, N'?1-2?????A?-?????(?)', N'', N'1091727202', N'A?', N'份', N'1?/???350g', 1, 1190, 1131, 350, 1, N'https://resource.pagoda.com.cn/group1/M00/22/DF/CmiWiF7jNCKAQoNRAAXXU-mlDRo81.jpeg?width=800&height=800', 63295)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (850, N'?4??A?-????????(?)27#', N'鲜甜细嫩，一天两个不过瘾', N'1122927204', N'A?', N'个', N'4?/????100g', 4, 3920, 3724, 400, 9, N'https://resource.pagoda.com.cn/group1/M00/1F/23/CmiU8F7HPcqABEJUAAcnmLHYsSE373.jpg?width=800&height=800', 61338)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (851, N'?99?/3??????', N'越南出产，焦香中有些许咸干味', N'3010897203', N'', N'盒', N'3?/??280g', 3, 9900, NULL, 840, 4, N'https://resource.pagoda.com.cn/group1/M00/1B/60/CmiWiF6SigeAPL-AAAPw3jNH-Q0544.jpg?width=800&height=800', 57298)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (852, N'?12?????A?-????????(?)', N'鲜甜细嫩，一天两个不过瘾', N'1122917204', N'A?', N'个', N'1?/12?', 12, 17400, 16530, 1200, 11, N'https://resource.pagoda.com.cn/group1/M18/30/FC/CmiLkF9of7SAfe19AAKANg4j1go941.jpg?width=800&height=800', 56460)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (853, N'?????????1?+?????', N'果仁清脆果干酸甜，营养又美味', N'3013597207', N'', N'份', N'1?/???200g', 1, 2290, 2176, 200, 13, N'https://resource.pagoda.com.cn/group1/M03/30/F6/CmiWa19xXKWANh7HAADnLxgBPeI170.jpg?width=800&height=800', 55929)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (854, N'?????????1?+??????', N'果仁清脆果干酸甜，营养又美味', N'3013597206', N'', N'份', N'1?/???200g', 1, 1490, 1416, 200, 13, N'https://resource.pagoda.com.cn/group1/M00/1A/97/CmiU8F6B-W-AYDrdAAIsWN5kVuo396.jpg?width=800&height=800', 55928)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (855, N'?????????1?+?????', N'果仁清脆果干酸甜，营养又美味', N'3013597205', N'', N'份', N'1?/???200g', 1, 2290, 2176, 200, 13, N'https://resource.pagoda.com.cn/group1/M01/31/57/CmiLkF9xXAaAdWKWAAEW6jNFt-Q389.jpg?width=800&height=800', 55927)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (856, N'?1-2??????????+????+????', N'火红的颜色，浓烈的甜蜜', N'1108227200', N'B?', N'份', N'1?/???500g', 1, 3290, 3126, 500, 1211, N'https://resource.pagoda.com.cn/group1/M00/1A/94/CmiLlF6Bw3eAHRi_AAX0I4yD8fo689.jpg?width=800&height=800', 55914)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (857, N'?1-2?????????+?????', N'清香微甜的迷你小黄瓜', N'1190917203', N'A?', N'份', N'1?/????400g', 1, 1390, 1321, 400, 1817, N'https://resource.pagoda.com.cn/group1/M00/19/EB/CmiU8F54e5WAXX4fAAS2SQt0vGA956.jpg?width=800&height=800', 55038)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (858, N'?1-2??????????+????', N'', N'1997857201', N'', N'份', N'1?/???400g', 1, 2090, 1986, 400, 1817, N'https://resource.pagoda.com.cn/group1/M00/19/5A/CmiWa154eOmAHguoAATyCirTJg0655.jpg?width=800&height=800', 55034)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (859, N'?1-2??????????+????', N'', N'1997847201', N'', N'份', N'1?/???400g', 1, 2190, 2081, 400, 1817, N'https://resource.pagoda.com.cn/group1/M00/19/EC/CmiWiF54eAqAI3GVAAWPMpDLbas019.jpg?width=800&height=800', 55033)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (860, N'???NFC??????(180ml)', N'', N'2172797201', N'', N'瓶', N'1?/180ml', 1, 650, 618, 180, 3, N'https://resource.pagoda.com.cn/group1/M15/2F/DB/CmiLlF9PBgmAGyyqAANCruc3DO8141.jpg?width=800&height=800', 53459)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (861, N'?15?/2???????', N'不加糖制作，本身就很香酥脆甜', N'3262497202', N'', N'袋', N'2?', 2, 1500, NULL, 240, 6, N'https://resource.pagoda.com.cn/group1/M00/17/57/CmiWa15TO3uAbD_qAAQt1Ltag0s128.jpg?width=800&height=800', 50979)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (862, N'??-???????(??)?', N'液氮冷冻，需常温下5个小时解冻', N'1240647201', N'??', N'个', N'1?/?2.6kg', 1, 50960, NULL, 2600, 2, N'https://resource.pagoda.com.cn/group1/M05/33/BF/CmiLlF-qV9qASl0dAAr2_mG-zD8433.png?width=800&height=800', 50106)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (863, N'A?-???(?)', N'VC含量在水果界数一数二', N'1226127201', N'A?', N'份', N'2?/650g', 1, 750, 713, 650, 6, N'https://resource.pagoda.com.cn/group1/M00/16/F1/CmiLlF4_eoKAGfNNAATrLEcwNOk093.jpg?width=800&height=800', 49683)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (864, N'????A?-????????2.6kg?(??)', N'送蜜心苹果，寓意生活平安甜蜜', N'1009377201', N'A?', N'份', N'1?/???2.6kg', 1, 5900, 5605, 2600, 3, N'https://resource.pagoda.com.cn/group1/M00/33/CC/CmiU8F-rrLCAK5NrAAFDNET0PUs708.jpg?width=800&height=800', 47706)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (865, N'????B?-???????(?)', N'细皮嫩肉的小甜心，让人爱不离', N'1021487201', N'B?', N'份', N'1?/??2.8kg', 1, 3950, 3753, 2800, 51, N'https://resource.pagoda.com.cn/group1/M04/33/9E/CmiLkF-rrNOALYh0AAEjVnziLSY190.jpg?width=800&height=800', 47266)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (866, N'??????', N'高品质葡萄干，口感香甜肉Q弹', N'3011297201', N'', N'份', N'1?/?225g', 1, 3300, 3135, 225, 5, N'https://resource.pagoda.com.cn/group1/M00/15/8F/CmiWiF4NTJmAK2-rAAFNhDkIynI012.jpg?width=800&height=800', 47009)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (867, N'??????', N'清脆可口，粒粒香、松、酥', N'3013897201', N'', N'份', N'1?/300g', 1, 16500, 15675, 300, 10, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiWa14DAZeAfc_TAAO7SLIv9TE261.jpg?width=800&height=800', 46470)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (868, N'????', N'树上自然吊干的“天然维生素丸”', N'3011797201', N'', N'袋', N'1?/400g', 1, 2280, 2166, 400, 6, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiLlF4DJ_eANXhSAAPDjLv8j9Q831.jpg?width=800&height=800', 46279)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (869, N'???3???A?-????', N'小小身材，却能给你满嘴甜', N'1000767202', N'A?', N'条', N'3??', 3, 14640, 13908, 1200, 3, N'https://resource.pagoda.com.cn/group1/M00/30/B3/CmiLkF9jEPWAN-vWAAQ6WFW3pGk752.jpg?width=800&height=800', 46119)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (870, N'??????', N'高端品种，口感鲜甜，手剥即吃', N'3013497201', N'', N'袋', N'1?/600g', 1, 2600, 2470, 600, 9, N'https://resource.pagoda.com.cn/group1/M00/15/4C/CmiLkF4C1tyAQn8DAAE_dk-CnKk791.jpg?width=800&height=800', 44920)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (871, N'???', N'蒸出来的软糯香甜，好吃不上火', N'3261897201', N'', N'袋', N'1?/100g', 1, 980, 931, 100, 3, N'https://resource.pagoda.com.cn/group1/M00/15/4C/CmiU8F4C3KOANkE6AAM-AWHuOec465.jpg?width=800&height=800', 44633)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (872, N'??????', N'新鲜好瓜子，才敢做原味', N'3014197201', N'', N'份', N'1?/?218g', 1, 2600, 2470, 218, 10, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiLlF4DJouAYXF5AAD6-iunJsU162.jpg?width=800&height=800', 43402)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (873, N'????????', N'果仁清脆果干酸甜，营养又美味', N'3013597201', N'', N'袋', N'1?/?25g', 1, 580, 551, 25, 13, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiU8F4DJR2AHK3zAAPh9TZ8saI046.jpg?width=800&height=800', 43387)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (874, N'?????', N'不加糖制作，本身就很香酥脆甜', N'3262497201', N'', N'袋', N'1?/?120g', 1, 970, 922, 120, 6, N'https://resource.pagoda.com.cn/group1/M00/15/59/CmiU8F4Egd2ACPy8AAQt1Ltag0s407.jpg?width=800&height=800', 43300)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (875, N'????A?-????(???)', N'轻咬飚汁，清甜诱惑无力抵挡', N'1171097201', N'A?', N'份', N'1?/???2.7kg', 1, 2900, 2755, 2700, 4, N'https://resource.pagoda.com.cn/group1/M0C/33/B9/CmiLkF-t62mAJ1AoAAPlC_BKQts815.jpg?width=800&height=800', 43252)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (876, N'????', N'非循环油炸工艺，好吃更健康', N'3013197201', N'', N'份', N'1?/?280g', 1, 4900, 4655, 280, 13, N'https://resource.pagoda.com.cn/group1/M00/15/51/CmiWa14DI-2ADQlIAADeTAR9940630.jpg?width=800&height=800', 39968)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (877, N'A?-????(?)', N'圆润又饱满，晶莹又清甜', N'1059617202', N'A?', N'份', N'1?/500g', 1, 1170, 1112, 500, 15, N'https://resource.pagoda.com.cn/group1/M00/13/14/CmiWa12Egh-AAFUcAAfKW404eCs827.jpg?width=800&height=800', 39853)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (878, N'?1-2????????+????', N'', N'1109027209', N'B?', N'份', N'1?/???400g', 1, 1290, 1226, 400, 3635, N'https://resource.pagoda.com.cn/group1/M0C/33/1F/CmiWiF-XxyCAerE_AAZrpydKX5I043.jpg?width=800&height=800', 37718)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (879, N'?1-2?????????+????+????', N'火红的颜色，浓烈的甜蜜', N'1108227205', N'B?', N'份', N'1?/????500g', 1, 2890, 2746, 500, 1211, N'https://resource.pagoda.com.cn/group1/M19/2F/61/CmiU8F9DJhyACN22AAM8nMnin_M406.gif?width=800&height=800', 37708)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (880, N'????????+??????', N'', N'1998737201', N'', N'份', N'1?/???400g', 1, 1890, 1796, 400, 1817, N'https://resource.pagoda.com.cn/group1/M00/1E/C6/CmiU8F7DmUOAOm7eAARlcRQ7iF8817.jpg?width=800&height=800', 33882)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (881, N'??-?????(?)', N'果型端正，酸甜适中', N'1000417209', N'??', N'份', N'1?/?1.2kg', 1, 4680, 4446, 1200, 18, N'https://resource.pagoda.com.cn/group1/M0F/31/7E/CmiLlF9wOoOAH7spAAYZEMUMp4A378.jpg?width=800&height=800', 32110)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (882, N'?3?????B?-????', N'集脆爽软甜于一身，口感超丰富', N'1087527203', N'B?', N'份', N'1?/????800g', 1, 2590, 2461, 800, 91, N'https://resource.pagoda.com.cn/group1/M00/10/2E/CmiWa1zrjtOALKZ4AAYBnHsYjJI260.jpg?width=800&height=800', 31335)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (883, N'?1-2?????????+????', N'', N'1994317201', N'', N'份', N'1?/???400g', 1, 1790, 1701, 400, 1816, N'https://resource.pagoda.com.cn/group1/M00/10/2C/CmiLlFzrirGAesE4AAY9Ap1PzmE611.jpg?width=800&height=800', 31319)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (884, N'?1-2??????????+????', N'', N'1997917201', N'', N'份', N'1?/???400g', 1, 2290, 2176, 400, 1817, N'https://resource.pagoda.com.cn/group1/M00/1E/36/CmiWa17DmiaAaxuvAAU1GsKxiSo412.jpg?width=800&height=800', 31307)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (885, N'?1-2???????????+????', N'', N'1997837201', N'', N'份', N'1?/???400g', 1, 2090, 1986, 400, 1817, N'https://resource.pagoda.com.cn/group1/M00/10/2D/CmiWa1zrf36AO8-TAAaftsgHYns978.jpg?width=800&height=800', 31296)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (886, N'?12??A?-????????(?)36#', N'鲜甜细嫩，一天两个不过瘾', N'1122937204', N'A?', N'份', N'1?/12?', 1, 8280, 7866, 960, 4, N'https://resource.pagoda.com.cn/group1/M11/33/3D/CmiWa1-rrZ2AMNKOAAT4fmaa1Gk298.jpg?width=800&height=800', 29640)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (887, N'A?-?????', N'甜蜜又爽口，细腻口感佳', N'1281017201', N'A?', N'份', N'1?/650g', 1, 2150, 2043, 650, 4, N'https://resource.pagoda.com.cn/group1/M00/0F/9D/CmiWiFzOdlaAOLxVAAcNU5LjZzI747.jpg?width=800&height=800', 29588)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (888, N'B?-??(?)', N'肉厚籽少，脆甜水润', N'1102627201', N'B?', N'份', N'2?/?350g', 1, 540, 513, 350, 7, N'https://resource.pagoda.com.cn/group1/M00/0D/05/CmiLkFwTh9KANaPaAAYLDZhphHU375.jpg?width=800&height=800', 23321)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (889, N'????', N'越南出产，焦香中有些许咸干味', N'3010897201', N'', N'盒', N'1?/?280g', 1, 3900, 3705, 280, 13, N'https://resource.pagoda.com.cn/group1/M00/15/92/CmiLlF4NvXCAMi2ZAAPw3jNH-Q0495.jpg?width=800&height=800', 23069)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (890, N'?J????B?-??????(J)', N'不仅红得深邃，而且甜得馥郁', N'1107127205', N'B?', N'盒', N'1?/1.5kg', 1, 42200, NULL, 1500, 5, N'https://resource.pagoda.com.cn/group1/M00/24/14/CmiLlF7qzQOAcnwEAAV6Teh-j3s164.jpg?width=800&height=800', 22760)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (891, N'B?-????', N'新鲜、爽甜、会飚汁儿', N'1140027201', N'B?', N'份', N'1?/?500g', 1, 1150, 1093, 500, 13, N'https://resource.pagoda.com.cn/group1/M00/13/78/CmiLlF2eyVWAP9Z1AA1y9xxIWSg410.png?width=800&height=800', 21335)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (892, N'A?-?????(?)', N'浓甜微酸，这样的搭配刚刚好', N'1047637202', N'A?', N'个', N'2?/450g', 2, 1040, 988, 450, 36, N'https://resource.pagoda.com.cn/group1/M00/0B/CC/CmiLlFvFfDKAT91gAAb_p0dsvjE080.jpg?width=800&height=800', 20676)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (893, N'A?-????(?)', N'口感脆爽，甜蜜多汁', N'1085327201', N'A?', N'个', N'1???/1.6kg,????????', 1, 4320, 4104, 1600, 129, N'https://resource.pagoda.com.cn/group1/M00/10/91/CmiU8F0AykOAT-39AAWlDD0ST1I188.jpg?width=800&height=800', 20186)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (894, N'?1-2???????????+?????+????', N'鲜甜脆爽的天然维C丸', N'1128327209', N'A?', N'箱', N'1?/???450g', 1, 2890, 2746, 450, 22, N'https://resource.pagoda.com.cn/group1/M0B/33/1F/CmiWiF-Xy5OAeStKAAXfuEBeAh0310.jpg?width=800&height=800', 19286)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (895, N'A?-???(?)', N'微苦带酸，建议搭配蜂蜜榨汁喝', N'1044167201', N'A?', N'个', N'1?/?200g', 1, 570, 542, 200, 20, N'https://resource.pagoda.com.cn/group1/M00/09/F9/CmiLkFtrsq2AYGu2AAWbVQ7uu8Q450.jpg?width=800&height=800', 17860)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (896, N'A?-?????(?)', N'晒足了太阳，因此芒果味浓烈', N'1072437201', N'A?', N'份', N'1?/550g', 1, 1490, 1416, 550, 4, N'https://resource.pagoda.com.cn/group1/M00/09/E9/CmiWa1tpY3SARf2kAAU2JyFrmgg622.jpg?width=800&height=800', 17304)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (897, N'??????', N'果篮图片供参考，样式以实物为准', N'1801237796', N'', N'盒', N'??????????????????', 1, 35900, 34105, 7700, 1454, N'https://resource.pagoda.com.cn/group1/M1E/32/E3/CmiWa1-iE6iABCZFAAT1ptsvlxg036.jpg?width=800&height=800', 12575)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (898, N'??-???(??)', N'脆爽口感，甜蜜飚汁', N'1012817221', N'??', N'份', N'1?/?2400g', 1, 7440, 7068, 2400, 12, N'https://resource.pagoda.com.cn/group1/M00/33/CC/CmiU8F-rq7OAfJVnAATr65MlCRY114.jpg?width=800&height=800', 11484)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (899, N'??????', N'礼盒图片供参考，样式以实物为准', N'1998387603', N'A?', N'盒', N'??????????????????????', 1, 17900, 17005, 3300, 1454, N'https://resource.pagoda.com.cn/group1/M11/32/E3/CmiWa1-iFFWAG1FPAAT6DOy8nMw859.jpg?width=800&height=800', 10369)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (900, N'?1-2????????+??????', N'皮薄肉甜，不是普通的小西红柿', N'1109027202', N'B?', N'份', N'1?/???400g', 1, 2690, 2556, 400, 51, N'https://resource.pagoda.com.cn/group1/M20/33/1A/CmiU8F-XxdqAVld_AANufr49aFk049.jpg?width=800&height=800', 9035)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (901, N'????A?-????????(?)27#', N'鲜甜细嫩，一天两个不过瘾', N'1122927296', N'A?', N'个', N'1?/27?', 27, 26460, 25137, 2700, 1, N'https://resource.pagoda.com.cn/group1/M09/31/A3/CmiU8F90pKiAMVgcAAPSr4S3pMk512.jpg?width=800&height=800', 7522)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (902, N'?1-2?????????+?????+??????', N'圆润又饱满，晶莹又清甜', N'1059617296', N'A?', N'份', N'1?/???450g', 1, 2890, 2746, 450, 5, N'https://resource.pagoda.com.cn/group1/M15/33/1A/CmiU8F-XypSAA9fiAAVBULJcXuw933.jpg?width=800&height=800', 4990)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (903, N'????', N'皮薄香脆，甜中略带一些微涩', N'3005897201', N'', N'份', N'1?/?500g', 1, 990, NULL, 500, 75, N'https://resource.pagoda.com.cn/group1/M00/15/5B/CmiWa14EgoWAIbmrAARUU4rFCpE707.jpg?width=800&height=800', 3204)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (904, N'?1-2?????B?-??????', N'火红的颜色，浓烈的甜蜜', N'1108227202', N'B?', N'份', N'1?/???350g', 1, 1740, 1653, 350, 16, N'https://resource.pagoda.com.cn/group1/M00/0F/42/CmiU8Fy5lJGAHO8xAAec6lj6vz8379.jpg?width=800&height=800', 2621)
INSERT [dbo].[Product] ([Id], [GoodsName], [SubTitle], [SkuID], [Level], [Unit], [Spec], [Quantity], [Price], [VipPrice], [Weight], [StockNum], [HeadPic], [goodsID]) VALUES (905, N'A?-????(?)', N'香味浓，泡几次后依然留有清香', N'1043127201', N'A?', N'个', N'2?', 2, 540, 513, 160, 6, N'https://resource.pagoda.com.cn/group1/M00/06/AB/CmiU8Fr0E1eAZI-mAAZ4l_yhnNg563.jpg?width=800&height=800', 2233)
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductInfo] ON 

INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (790, 39745, N'https://resource.pagoda.com.cn/group1/M00/13/12/CmiWiF2ELRWAKXPlAAKXliv2W3w476.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (791, 39745, N'https://resource.pagoda.com.cn/group1/M00/13/28/CmiWa12JskCAceU0AAhNfnrfhpo126.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (792, 39745, N'https://resource.pagoda.com.cn/group1/M00/0B/CC/CmiU8FvFWlaAGYXYAAQ-zPNnQnE018.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (793, 39745, N'https://resource.pagoda.com.cn/group1/M00/0B/CC/CmiWa1vFWliAWWBcAATOt_LtdP8361.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (794, 39745, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (795, 39745, N'https://resource.pagoda.com.cn/group1/M01/31/D4/CmiWa1-ILiuACm4QAFjwlj0awXs803.jpg?width=751&height=10369', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (796, 39745, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (797, 22136, N'https://resource.pagoda.com.cn/group1/M00/13/E8/CmiLlF28B0eAG0FUAAOA_fcKaAo493.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (798, 22136, N'https://resource.pagoda.com.cn/group1/M00/13/E8/CmiU8F28B0yAOnj_AAZVe8lWiOw150.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (799, 22136, N'https://resource.pagoda.com.cn/group1/M00/13/EA/CmiWa128B1aAZLyJAANcoHwiZkY586.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (800, 22136, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (801, 22136, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (802, 9694, N'https://resource.pagoda.com.cn/group1/M00/24/E9/CmiWa17xzZCAcnGRAANTzrLmZug002.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (803, 9694, N'https://resource.pagoda.com.cn/group1/M00/25/76/CmiWiF7xzZaAYXqbAAKQ_jR9fyc727.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (804, 9694, N'https://resource.pagoda.com.cn/group1/M00/25/7C/CmiLkF7xzZyAS-tnAAbpYY8sGFw345.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (805, 9694, N'https://resource.pagoda.com.cn/group1/M00/25/72/CmiU8F7xzaSASqnlAAXS_0IJDlw644.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (806, 9694, N'https://resource.pagoda.com.cn/group1/M00/24/E9/CmiWa17xzbGADnodAAYG3qqEbVI697.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (807, 9694, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (808, 9694, N'https://resource.pagoda.com.cn/group1/M1F/30/CE/CmiWiF9hrPGAYu3IABkUU7uYS_M943.jpg?width=750&height=5048', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (809, 9694, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (810, 3226, N'https://resource.pagoda.com.cn/group1/M1F/33/CB/CmiU8F-rqimAVtNEAAaX3OYweL8296.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (811, 3226, N'https://resource.pagoda.com.cn/group1/M1C/33/CB/CmiU8F-rqjKAZ0JaAARWgwMgStc029.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (812, 3226, N'https://resource.pagoda.com.cn/group1/M0A/33/CB/CmiU8F-rqiyABPO8AAUos6G3glc052.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (813, 3226, N'https://resource.pagoda.com.cn/group1/M0C/33/3D/CmiWa1-rqjWAWVjoAATZ2d0uXEg562.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (814, 3226, N'https://resource.pagoda.com.cn/group1/M1F/33/CB/CmiU8F-rqjWAX4tKAARVPWIBZ2Q444.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (815, 3226, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (816, 3226, N'https://resource.pagoda.com.cn/group1/M1E/33/92/CmiWiF-lGJGAJJBYAAyCzN5lr18102.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (817, 3226, N'https://resource.pagoda.com.cn/group1/M15/33/92/CmiWiF-lGJOAMbCiAAsCvCnu2YA362.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (818, 3226, N'https://resource.pagoda.com.cn/group1/M0E/32/FF/CmiWa1-lGJmAO-qDAAkry_GBJzU625.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (819, 3226, N'https://resource.pagoda.com.cn/group1/M1D/33/90/CmiLlF-lGJmAdGVSAAsGas_aMHg963.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (820, 3226, N'https://resource.pagoda.com.cn/group1/M0D/33/90/CmiLlF-lGJuAK58vAAx4RRIjp_Y659.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (821, 3226, N'https://resource.pagoda.com.cn/group1/M11/33/8E/CmiU8F-lGJmAHRauAAoNzaVZeiA723.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (822, 3226, N'https://resource.pagoda.com.cn/group1/M07/33/92/CmiWiF-lGJ6AeGhYAAEMT1gKb4g255.jpg?width=750&height=242', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (823, 3226, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (824, 41187, N'https://resource.pagoda.com.cn/group1/M00/13/DB/CmiU8F25AMSAWzx2AANldPHOhVQ479.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (825, 41187, N'https://resource.pagoda.com.cn/group1/M00/13/DD/CmiWa125AMuAeheIAAW2DATL-DY761.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (826, 41187, N'https://resource.pagoda.com.cn/group1/M00/13/DC/CmiWiF25AMyAQ2h-AAOVf-hLQ4I796.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (827, 41187, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (828, 41187, N'https://resource.pagoda.com.cn/group1/M00/2A/BF/CmiLkF8RBLOAMkV2ACpf65-WX0I402.jpg?width=750&height=6800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (829, 41187, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (830, 12262, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiU8F6nit6Ab4jHAAT4fmaa1Gk541.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (831, 12262, N'https://resource.pagoda.com.cn/group1/M00/1B/06/CmiWa16Wy2-AAWHNAAOykZXRYY4326.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (832, 12262, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiWiF6Wy2-Abe1lAAWmqohYN7w796.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (833, 12262, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiLkF6Wy2yAUectAAQ47B5cMI0577.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (834, 12262, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (835, 12262, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxmiAPYOCAKzTonFVjDY790.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (836, 12262, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (837, 10561, N'https://resource.pagoda.com.cn/group1/M00/0B/5E/CmiWa1uqA4KADQ9NAAZ-b1VXroU577.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (838, 10561, N'https://resource.pagoda.com.cn/group1/M00/13/08/CmiLlF2CCL2ADu_RAAQI--RcIGw794.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (839, 10561, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (840, 10561, N'https://resource.pagoda.com.cn/group1/M15/30/03/CmiLlF9R6-qAFwmDAAiELwuAReI725.jpg?width=750&height=6396', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (841, 10561, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (842, 6802, N'https://resource.pagoda.com.cn/group1/M00/1C/C9/CmiU8F6qSTuATLUAAAPSr4S3pMk094.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (843, 6802, N'https://resource.pagoda.com.cn/group1/M00/1B/06/CmiWa16Wy2-AAWHNAAOykZXRYY4326.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (844, 6802, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiWiF6Wy2-Abe1lAAWmqohYN7w796.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (845, 6802, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiLkF6Wy2yAUectAAQ47B5cMI0577.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (846, 6802, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (847, 6802, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxmiAPYOCAKzTonFVjDY790.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (848, 6802, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (849, 76798, N'https://resource.pagoda.com.cn/group1/M00/1B/06/CmiWa16Wy2-AAWHNAAOykZXRYY4326.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (850, 76798, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiWiF6Wy2-Abe1lAAWmqohYN7w796.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (851, 76798, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiLkF6Wy2yAUectAAQ47B5cMI0577.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (852, 76798, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (853, 76798, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxmiAPYOCAKzTonFVjDY790.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (854, 76798, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (855, 762, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiLkFuQlneAKJ7OAAWAcfi1UMk026.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (856, 762, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiWiFuQlnWADQL1AANuOPpcyRY788.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (857, 762, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (858, 762, N'https://resource.pagoda.com.cn/group1/M0E/2F/2E/CmiWa19MWCmABH6PAB9Jo9zoMxA069.jpg?width=750&height=4890', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (859, 762, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (860, 926, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiLlFsRIdaAbFYGAAZK6a_0KYk876.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (861, 926, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiU8FsRIdeAQNmKAAQzvbCQvXc758.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (862, 926, N'https://resource.pagoda.com.cn/group1/M00/01/13/CmiLkFg-avSAP1t4AAIePCsBtU0293.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (863, 926, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (864, 926, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoDqAfBw3AAHLQP9_oTM302.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (865, 926, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoDuAcGcVAAKWjdjLyGI462.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (866, 926, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWa1swoD2AZcEcAAJ4KouQnkY875.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (867, 926, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoD6AEglkAAExo6oTZvE533.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (868, 926, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoECAG62kAAIGfhiYAFY702.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (869, 926, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEKAKJgfAAMNTO8wM98437.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (870, 926, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiU8FswoESAZoY3AAE4qJbrK28075.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (871, 926, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEWAV2yaAAJut27cWJY213.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (872, 926, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoEeAEPavAABxfjXxuOs711.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (873, 926, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (874, 67692, N'https://resource.pagoda.com.cn/group1/M00/0C/51/CmiWa1vjo8WAfwLKAAQGNmSurRk640.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (875, 67692, N'https://resource.pagoda.com.cn/group1/M00/0C/51/CmiWiFvjo8mANc1jAAOEMrmylgs594.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (876, 67692, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (877, 67692, N'https://resource.pagoda.com.cn/group1/M00/2C/11/CmiWa18ZN2iAVi-3ACVygs5LM-4526.jpg?width=750&height=5176', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (878, 67692, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (879, 42120, N'https://resource.pagoda.com.cn/group1/M00/13/DB/CmiU8F25AMSAWzx2AANldPHOhVQ479.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (880, 42120, N'https://resource.pagoda.com.cn/group1/M00/13/DD/CmiWa125AMuAeheIAAW2DATL-DY761.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (881, 42120, N'https://resource.pagoda.com.cn/group1/M00/13/DC/CmiWiF25AMyAQ2h-AAOVf-hLQ4I796.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (882, 42120, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (883, 42120, N'https://resource.pagoda.com.cn/group1/M00/2A/BF/CmiLkF8RBLOAMkV2ACpf65-WX0I402.jpg?width=750&height=6800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (884, 42120, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (885, 2513, N'https://resource.pagoda.com.cn/group1/M00/13/B6/CmiLkF2unCqAawJoAAOdMj6yWTg355.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (886, 2513, N'https://resource.pagoda.com.cn/group1/M00/13/B5/CmiLlF2unC-AZiEhAAPnqxsXWd8943.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (887, 2513, N'https://resource.pagoda.com.cn/group1/M00/13/B5/CmiU8F2unDSAAPQsAAgZzgTKnXQ821.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (888, 2513, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (889, 2513, N'https://resource.pagoda.com.cn/group1/M0B/32/61/CmiU8F-II_yALJFvAAfXxJCrLJc071.jpg?width=750&height=6535', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (890, 2513, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (891, 3543, N'https://resource.pagoda.com.cn/group1/M00/13/28/CmiWa12JskCAceU0AAhNfnrfhpo126.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (892, 3543, N'https://resource.pagoda.com.cn/group1/M00/0B/CC/CmiU8FvFWlaAGYXYAAQ-zPNnQnE018.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (893, 3543, N'https://resource.pagoda.com.cn/group1/M00/0B/CC/CmiWa1vFWliAWWBcAATOt_LtdP8361.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (894, 3543, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (895, 3543, N'https://resource.pagoda.com.cn/group1/M01/31/D4/CmiWa1-ILiuACm4QAFjwlj0awXs803.jpg?width=751&height=10369', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (896, 3543, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (897, 69746, N'https://resource.pagoda.com.cn/group1/M1B/32/ED/CmiLkF-XwrCAF4oNAAH1FNy5rMM755.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (898, 69746, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiLkFuQlneAKJ7OAAWAcfi1UMk026.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (899, 69746, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiWiFuQlnWADQL1AANuOPpcyRY788.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (900, 69746, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (901, 69746, N'https://resource.pagoda.com.cn/group1/M0E/2F/2E/CmiWa19MWCmABH6PAB9Jo9zoMxA069.jpg?width=750&height=4890', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (902, 69746, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (903, 42293, N'https://resource.pagoda.com.cn/group1/M00/13/F6/CmiLkF2_-CWAOMJ_AAD-XVwMu30684.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (904, 42293, N'https://resource.pagoda.com.cn/group1/M00/13/E8/CmiLlF28B0eAG0FUAAOA_fcKaAo493.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (905, 42293, N'https://resource.pagoda.com.cn/group1/M00/13/E8/CmiU8F28B0yAOnj_AAZVe8lWiOw150.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (906, 42293, N'https://resource.pagoda.com.cn/group1/M00/13/EA/CmiWa128B1aAZLyJAANcoHwiZkY586.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (907, 42293, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (908, 42293, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (909, 17946, N'https://resource.pagoda.com.cn/group1/M00/0D/80/CmiLkFw3-S2APhWDAARIPalzWEs245.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (910, 17946, N'https://resource.pagoda.com.cn/group1/M00/0D/80/CmiLlFw3-TCAAmzTAANsKHqWJoo645.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (911, 17946, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (912, 17946, N'https://resource.pagoda.com.cn/group1/M00/0B/CE/CmiWa1vFmpKALkpcAAMhho6bC14283.jpg?width=750&height=1320', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (913, 17946, N'https://resource.pagoda.com.cn/group1/M00/0B/CE/CmiWiFvFmpSAfY4fAAMXffzQU7E005.jpg?width=750&height=1163', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (914, 17946, N'https://resource.pagoda.com.cn/group1/M00/0B/CE/CmiLkFvFmpaAXQ2KAAUaIHfs-54103.jpg?width=750&height=876', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (915, 17946, N'https://resource.pagoda.com.cn/group1/M00/0B/CE/CmiLlFvFmpiAL2-OAASJREmgzvA755.jpg?width=750&height=1247', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (916, 17946, N'https://resource.pagoda.com.cn/group1/M00/0B/CE/CmiU8FvFmpqANGIpAAOcagagRSc680.jpg?width=750&height=960', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (917, 17946, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (918, 36946, N'https://resource.pagoda.com.cn/group1/M00/22/AA/CmiLlF7iDOuAIeWjAARBz9lF-eM969.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (919, 36946, N'https://resource.pagoda.com.cn/group1/M00/22/A9/CmiU8F7iDPKANuriAAL6V1m-yzo197.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (920, 36946, N'https://resource.pagoda.com.cn/group1/M00/22/1A/CmiWa17iDPyAGgn9AAN7WN4EWuU149.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (921, 36946, N'https://resource.pagoda.com.cn/group1/M00/22/AB/CmiWiF7iDPyARo88AAbBZQ5jswg874.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (922, 36946, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (923, 36946, N'https://resource.pagoda.com.cn/group1/M00/0E/DD/CmiLlFyhcmmAH1piAAda14n0kHw988.jpg?width=750&height=1624', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (924, 36946, N'https://resource.pagoda.com.cn/group1/M00/0E/DE/CmiWa1yhcmuAdVlyAAgwUHaacVg146.jpg?width=750&height=1799', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (925, 36946, N'https://resource.pagoda.com.cn/group1/M00/0E/DE/CmiWa1yhcm2ATG_SAATdLoArdII615.jpg?width=750&height=1456', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (926, 36946, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (927, 612, N'https://resource.pagoda.com.cn/group1/M00/0C/A5/CmiLlFv3fveARNYCAAVke5G-NEY815.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (928, 612, N'https://resource.pagoda.com.cn/group1/M00/0C/A5/CmiU8Fv3fvmAEXPNAAM0cCgLNGs386.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (929, 612, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (930, 612, N'https://resource.pagoda.com.cn/group1/M00/22/A3/CmiWa17lpV2ADH6eABWkOF3_p5U714.jpg?width=750&height=3500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (931, 612, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (932, 11151, N'https://resource.pagoda.com.cn/group1/M0F/33/1A/CmiU8F-XxHGATKqzAAXPJnXEJk8649.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (933, 11151, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiLkFuQlneAKJ7OAAWAcfi1UMk026.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (934, 11151, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiWiFuQlnWADQL1AANuOPpcyRY788.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (935, 11151, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (936, 11151, N'https://resource.pagoda.com.cn/group1/M0E/2F/2E/CmiWa19MWCmABH6PAB9Jo9zoMxA069.jpg?width=750&height=4890', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (937, 11151, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (938, 62403, N'https://resource.pagoda.com.cn/group1/M00/24/E9/CmiWa17xzZCAcnGRAANTzrLmZug002.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (939, 62403, N'https://resource.pagoda.com.cn/group1/M00/25/76/CmiWiF7xzZaAYXqbAAKQ_jR9fyc727.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (940, 62403, N'https://resource.pagoda.com.cn/group1/M00/25/7C/CmiLkF7xzZyAS-tnAAbpYY8sGFw345.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (941, 62403, N'https://resource.pagoda.com.cn/group1/M00/25/72/CmiU8F7xzaSASqnlAAXS_0IJDlw644.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (942, 62403, N'https://resource.pagoda.com.cn/group1/M00/24/E9/CmiWa17xzbGADnodAAYG3qqEbVI697.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (943, 62403, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (944, 62403, N'https://resource.pagoda.com.cn/group1/M1F/30/CE/CmiWiF9hrPGAYu3IABkUU7uYS_M943.jpg?width=750&height=5048', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (945, 62403, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (946, 35603, N'https://resource.pagoda.com.cn/group1/M00/24/E9/CmiWa17xzZCAcnGRAANTzrLmZug002.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (947, 35603, N'https://resource.pagoda.com.cn/group1/M00/25/76/CmiWiF7xzZaAYXqbAAKQ_jR9fyc727.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (948, 35603, N'https://resource.pagoda.com.cn/group1/M00/25/7C/CmiLkF7xzZyAS-tnAAbpYY8sGFw345.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (949, 35603, N'https://resource.pagoda.com.cn/group1/M00/25/72/CmiU8F7xzaSASqnlAAXS_0IJDlw644.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (950, 35603, N'https://resource.pagoda.com.cn/group1/M00/24/E9/CmiWa17xzbGADnodAAYG3qqEbVI697.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (951, 35603, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (952, 35603, N'https://resource.pagoda.com.cn/group1/M1F/30/CE/CmiWiF9hrPGAYu3IABkUU7uYS_M943.jpg?width=750&height=5048', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (953, 35603, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (954, 14173, N'https://resource.pagoda.com.cn/group1/M00/1B/06/CmiWa16Wy2-AAWHNAAOykZXRYY4326.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (955, 14173, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiWiF6Wy2-Abe1lAAWmqohYN7w796.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (956, 14173, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiLkF6Wy2yAUectAAQ47B5cMI0577.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (957, 14173, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (958, 14173, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxmiAPYOCAKzTonFVjDY790.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (959, 14173, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (960, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/61/CmiLlFsXmgmALn2hAARl_qQy1mQ978.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (961, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/61/CmiU8FsXmguANvORAANpSUTmOjA800.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (962, 23771, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (963, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/EB/CmiU8FsrfnCABdOiAAKXkX-YFyI012.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (964, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/EB/CmiLkFsrfnGAVUPnAAGvFyNPjOM312.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (965, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/EB/CmiU8FsrfnOALiEYAAIee64gTv0325.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (966, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/EB/CmiLkFsrfnWARPHZAAKmq-BsTJg562.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (967, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/EB/CmiU8FsrfneAX663AAHZIXQNO3g173.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (968, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/EB/CmiWa1srfniAJkTVAAIdAJ8_PPs281.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (969, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/EB/CmiU8FsrfnqAHFqjAAI1R19oHAM055.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (970, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/EB/CmiLkFsrfnyALsweAAK8fOAV0wo040.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (971, 23771, N'https://resource.pagoda.com.cn/group1/M00/07/EB/CmiU8Fsrfn6AIdQ_AAA_YoDpcw0567.jpg?width=750&height=173', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (972, 23771, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (973, 68297, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (974, 68297, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (975, 68297, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (976, 68297, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (977, 68297, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (978, 68297, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (979, 68297, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (980, 21759, N'https://resource.pagoda.com.cn/group1/M00/0C/A6/CmiU8Fv3nk2AcYupAARvighIbcg472.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (981, 21759, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (982, 21759, N'https://resource.pagoda.com.cn/group1/M0D/30/5B/CmiU8F9Ypp6AB7RvACKmgebQTyU654.jpg?width=750&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (983, 21759, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (984, 589, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLkFuiFaiAaTvZAARoExEztTE218.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (985, 589, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiWiFuiFaaAH_DfAAPjpeoQsvs301.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (986, 589, N'https://resource.pagoda.com.cn/group1/M00/22/B5/CmiU8F7i61WAXianAAgnwciRsxM457.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (987, 589, N'https://resource.pagoda.com.cn/group1/M00/22/B7/CmiWiF7i61yATqG4AAdrR3Y4KWg400.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (988, 589, N'https://resource.pagoda.com.cn/group1/M00/22/B6/CmiLlF7i61qATi3rAAY_43dTPjc718.jpg?width=800&height=800', 1)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (989, 589, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (990, 589, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLkFuiFbOAENEHAALKHYhX_YU142.jpg?width=750&height=710', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (991, 589, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLlFuiFbWAfaypAAMijwgXWwM089.jpg?width=750&height=706', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (992, 589, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiU8FuiFbeARWwqAAL0My4cY50437.jpg?width=750&height=714', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (993, 589, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiWa1uiFbiAb2JkAALOHfVbh00600.jpg?width=750&height=700', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (994, 589, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiWiFuiFbqAfl8fAAQLoRwPVUw715.jpg?width=750&height=714', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (995, 589, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLkFuiFbyATRfRAAP4J0WhBFU979.jpg?width=750&height=704', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (996, 589, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLlFuiFb2AFwR_AAMbYYuNGVY559.jpg?width=750&height=662', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (997, 589, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (998, 29011, N'https://resource.pagoda.com.cn/group1/M05/33/88/CmiU8F-kuUOAGLA2AAT4fmaa1Gk540.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (999, 29011, N'https://resource.pagoda.com.cn/group1/M00/1C/9B/CmiLkF6nii-AerAkAAQ47B5cMI0152.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1000, 29011, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiLlF6nijKALCKaAAWmqohYN7w448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1001, 29011, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiU8F6nijeAa_v1AAOykZXRYY4894.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1002, 29011, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1003, 29011, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxiqAXWKnAKzTonFVjDY382.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1004, 29011, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1005, 12322, N'https://resource.pagoda.com.cn/group1/M00/0C/B7/CmiU8Fv83EOAZxD-AARIPalzWEs122.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1006, 12322, N'https://resource.pagoda.com.cn/group1/M00/0C/B7/CmiWiFv83EeAQshoAANsKHqWJoo951.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1007, 12322, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1008, 12322, N'https://resource.pagoda.com.cn/group1/M00/0D/A2/CmiWiFxB7BaAfUtDABPCYvZDgng132.jpg?width=750&height=5566', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1009, 12322, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1010, 747, N'https://resource.pagoda.com.cn/group1/M00/08/2D/CmiU8FsyBN-AC2R7AAQnbKXZonA686.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1011, 747, N'https://resource.pagoda.com.cn/group1/M00/08/2D/CmiLkFsyBOCAfOjYAAKBi0PukS0239.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1012, 747, N'https://resource.pagoda.com.cn/group1/M00/05/67/CmiLkFqftoSAQ7zoAARSgVdnDjk360.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1013, 747, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1014, 747, N'https://resource.pagoda.com.cn/group1/M03/33/5D/CmiWa1-uQiaAOdHNABNBVUtS8nw224.jpg?width=750&height=3943', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1015, 747, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1016, 614, N'https://resource.pagoda.com.cn/group1/M00/07/61/CmiLlFsXnjKAJnLOAAOBlH0A3f0743.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1017, 614, N'https://resource.pagoda.com.cn/group1/M00/07/61/CmiU8FsXnjOAAEYcAAN8WvDE9hk671.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1018, 614, N'https://resource.pagoda.com.cn/group1/M00/00/6C/CmiLkFfGUhiAdNeuAAEeL_Uoe80317.jpg?width=750&height=421', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1019, 614, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1020, 614, N'https://resource.pagoda.com.cn/group1/M00/1D/F5/CmiLlF68szmAN7avAA9L3uzhFXI605.png?width=750&height=2236', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1021, 614, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1022, 593, N'https://resource.pagoda.com.cn/group1/M00/0C/32/CmiLlFvb-fqAHFogAASrdy4pghM886.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1023, 593, N'https://resource.pagoda.com.cn/group1/M00/0C/32/CmiLkFvb-feAKrM2AAOqkAxdCRA257.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1024, 593, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1025, 593, N'https://resource.pagoda.com.cn/group1/M00/0C/32/CmiLkFvb-gaAUT9nAANS73p4fro038.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1026, 593, N'https://resource.pagoda.com.cn/group1/M00/0C/32/CmiLlFvb-giADVoTAAKmKOULzQM995.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1027, 593, N'https://resource.pagoda.com.cn/group1/M00/0C/32/CmiU8Fvb-gqAQMrTAALBvQPwJ3I908.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1028, 593, N'https://resource.pagoda.com.cn/group1/M00/0C/32/CmiWa1vb-gyAVVn6AAKaRQh2B2c436.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1029, 593, N'https://resource.pagoda.com.cn/group1/M00/0C/32/CmiWiFvb-g-AQZeKAAOeKRHESYY024.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1030, 593, N'https://resource.pagoda.com.cn/group1/M00/0C/32/CmiLkFvb-hKAbQ9wAAP4NUljqkM381.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1031, 593, N'https://resource.pagoda.com.cn/group1/M00/0C/32/CmiLlFvb-hSAFo0ZAAKk-X4vuLw584.jpg?width=750&height=622', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1032, 593, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1033, 29012, N'https://resource.pagoda.com.cn/group1/M15/33/78/CmiWiF-iUiuAXt4IAAPOtw0aeZY725.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1034, 29012, N'https://resource.pagoda.com.cn/group1/M00/1C/9B/CmiLkF6nii-AerAkAAQ47B5cMI0152.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1035, 29012, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiLlF6nijKALCKaAAWmqohYN7w448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1036, 29012, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiU8F6nijeAa_v1AAOykZXRYY4894.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1037, 29012, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1038, 29012, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxiqAXWKnAKzTonFVjDY382.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1039, 29012, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1040, 591, N'https://resource.pagoda.com.cn/group1/M00/08/C0/CmiLlFs8eQyAVVOPAAPLaJnqtiQ070.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1041, 591, N'https://resource.pagoda.com.cn/group1/M00/0E/E1/CmiLlFyi2yKADzJ2AAOV_RSoHQI014.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1042, 591, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1043, 591, N'https://resource.pagoda.com.cn/group1/M00/07/F8/CmiWa1ssstmACdsoAAHHthnRcaY477.jpg?width=750&height=1191', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1044, 591, N'https://resource.pagoda.com.cn/group1/M00/07/F8/CmiWiFssstuAeisjAAHes7W7El4622.jpg?width=750&height=1191', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1045, 591, N'https://resource.pagoda.com.cn/group1/M00/07/F7/CmiLkFssst6ALYfjAAF2rpRvHZg375.jpg?width=750&height=1190', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1046, 591, N'https://resource.pagoda.com.cn/group1/M00/07/F8/CmiLlFsssuCANAtyAAHz7gyyFaw225.jpg?width=750&height=1191', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1047, 591, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1048, 603, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiWa1sWQoaAPpcxAAPbjqv99dU745.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1049, 603, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiWiFsWQoeAZG2uAAPfVUkxnqI440.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1050, 603, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1051, 603, N'https://resource.pagoda.com.cn/group1/M00/12/B9/CmiU8F1w1tuADJMCABC35c3cLLM442.jpg?width=750&height=3065', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1052, 603, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1053, 11569, N'https://resource.pagoda.com.cn/group1/M00/0C/A5/CmiLlFv3fveARNYCAAVke5G-NEY815.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1054, 11569, N'https://resource.pagoda.com.cn/group1/M00/0C/A5/CmiU8Fv3fvmAEXPNAAM0cCgLNGs386.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1055, 11569, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1056, 11569, N'https://resource.pagoda.com.cn/group1/M00/22/A3/CmiWa17lpV2ADH6eABWkOF3_p5U714.jpg?width=750&height=3500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1057, 11569, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1058, 10830, N'https://resource.pagoda.com.cn/group1/M00/0A/D1/CmiWiFuPQ7eAAtkzAAQKSQzEWek815.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1059, 10830, N'https://resource.pagoda.com.cn/group1/M00/11/27/CmiU8F0i2iqAeHAVAAMJSvtQAoE290.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1060, 10830, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1061, 10830, N'https://resource.pagoda.com.cn/group1/M02/31/FB/CmiLkF-DtSiAE0W9AB_vWdzJ_dY630.png?width=750&height=3691', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1062, 10830, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1063, 6746, N'https://resource.pagoda.com.cn/group1/M00/09/4B/CmiWiFtRofWAAyG5AARVSesXvsY026.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1064, 6746, N'https://resource.pagoda.com.cn/group1/M00/09/4B/CmiWa1tRofOAbUzgAANy6IFzOlc142.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1065, 6746, N'https://resource.pagoda.com.cn/group1/M00/22/B4/CmiLkF7i4lKANCmNAAcaVorhTfU646.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1066, 6746, N'https://resource.pagoda.com.cn/group1/M00/22/B2/CmiU8F7i4lqAGKgqAAdwOksuykI418.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1067, 6746, N'https://resource.pagoda.com.cn/group1/M00/22/B4/CmiWiF7i4mGAcRPYAAV9xuhOddY506.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1068, 6746, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1069, 6746, N'https://resource.pagoda.com.cn/group1/M0E/2E/20/CmiWiF8hTyqAVyDiAApNpCud_LA580.jpg?width=750&height=7406', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1070, 6746, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1071, 6697, N'https://resource.pagoda.com.cn/group1/M00/0A/B5/CmiWiFuKCOiAQeNjAAP7nUcrzmg019.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1072, 6697, N'https://resource.pagoda.com.cn/group1/M00/0A/B5/CmiWa1uKCOaAHb_nAAMWsFJdWcI345.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1073, 6697, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1074, 6697, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1075, 743, N'https://resource.pagoda.com.cn/group1/M00/01/FD/CmiLlFjHlg2AEArOAAKixmNvPQ8163.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1076, 743, N'https://resource.pagoda.com.cn/group1/M00/01/FD/CmiU8FjHlg-AG2F7AAHlZmwyyZo893.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1077, 743, N'https://resource.pagoda.com.cn/group1/M00/01/FD/CmiWa1jHlhGAGV43AAHBvlL8WH8981.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1078, 743, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1079, 743, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1080, 8704, N'https://resource.pagoda.com.cn/group1/M00/0E/2D/CmiWiFxzoVeAFRFuAAMYWUn9hmM827.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1081, 8704, N'https://resource.pagoda.com.cn/group1/M00/13/37/CmiWa12MblaAFVNBAAKj5XcM-nY190.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1082, 8704, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLkFsWRcmAWNQSAATKbG-wzi0337.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1083, 8704, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLlFsWRcqASM6WAAQzkxeSgwM401.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1084, 8704, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1085, 8704, N'https://resource.pagoda.com.cn/group1/M00/22/27/CmiWa17i8NmADBVwAAhvFtzuxD0946.jpg?width=750&height=5234', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1086, 8704, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1087, 2627, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLkFsWRcmAWNQSAATKbG-wzi0337.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1088, 2627, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLlFsWRcqASM6WAAQzkxeSgwM401.jpg?width=750&height=800', 1)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1089, 2627, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1090, 2627, N'https://resource.pagoda.com.cn/group1/M00/22/27/CmiWa17i8NmADBVwAAhvFtzuxD0946.jpg?width=750&height=5234', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1091, 2627, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1092, 619, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLkFsWRcmAWNQSAATKbG-wzi0337.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1093, 619, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLlFsWRcqASM6WAAQzkxeSgwM401.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1094, 619, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1095, 619, N'https://resource.pagoda.com.cn/group1/M00/22/27/CmiWa17i8NmADBVwAAhvFtzuxD0946.jpg?width=750&height=5234', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1096, 619, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1097, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiLkFvhL76AQS-FAAF878QAtBg947.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1098, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiLlFvhL8CAQZ6IAADuMITaVRU801.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1099, 10835, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1100, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiU8FvhL8SAUO-NAAGIEwWmw_8568.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1101, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiWa1vhL8aAXRaiAAIkBMB11zA383.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1102, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiWiFvhL8iAbUpwAAM-1Y6WZN0802.jpg?width=750&height=676', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1103, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiU8FvhL9aAX5I9AALvKMZzABw146.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1104, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiWa1vhL9qAbhYkAALoXD-G0Qc095.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1105, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiLkFvhL9yAKZGqAALT102C_BM927.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1106, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiU8FvhL9-AVV2NAAP-GW1_hsI822.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1107, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiWa1vhL-GATxnPAANxqvybMBk849.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1108, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiWiFvhL-SAWZGnAANO5J6lBBs377.jpg?width=750&height=676', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1109, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiLlFvhL-qASmzLAAJEUyEK_NA297.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1110, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiWa1vhL-2ATUi4AALFClBq8AI856.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1111, 10835, N'https://resource.pagoda.com.cn/group1/M00/0C/44/CmiWiFvhL--ARBETAALEb4QJXr4185.jpg?width=750&height=677', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1112, 10835, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1113, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/64/CmiLlFtVVy2AffU-AAQepJ5eyO8287.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1114, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/64/CmiLkFtVVyuAMeK8AAPM1sMnjkA879.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1115, 6698, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1116, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiLlFtMZSCATBzeAAFLJzma0xk285.png?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1117, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiU8FtMZSKATievAAULel0Hlos886.png?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1118, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiWa1tMZSOAczB-AAMETn32rO4879.png?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1119, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiWiFtMZSWAIHNbAAF3AoPcBgI248.png?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1120, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiLkFtMZSaAAdPSAALI7Bl-9Z4865.png?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1121, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiLlFtMZSeAdvRPAAR3O_VAKWE414.png?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1122, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiU8FtMZSmABw9tAAGNejv890A874.png?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1123, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiWa1tMZSqAQLO4AASEpWKaQss927.png?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1124, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiWiFtMZSuACpqTAADsCgq49gs328.png?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1125, 6698, N'https://resource.pagoda.com.cn/group1/M00/09/20/CmiLkFtMZS2AJsJ7AAALRY5Ei70508.jpg?width=750&height=84', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1126, 6698, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1127, 6573, N'https://resource.pagoda.com.cn/group1/M00/07/59/CmiU8FsWVNCARvc5AASWU5VIZNE291.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1128, 6573, N'https://resource.pagoda.com.cn/group1/M00/07/58/CmiWa1sWVNGAebCoAAN0l97Uu2o192.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1129, 6573, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1130, 6573, N'https://resource.pagoda.com.cn/group1/M00/07/E4/CmiLlFsrZ9mAOuTAAAM5luocy5k707.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1131, 6573, N'https://resource.pagoda.com.cn/group1/M00/07/E4/CmiU8FsrZ9qATA46AAMuPiq1hb4116.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1132, 6573, N'https://resource.pagoda.com.cn/group1/M00/07/E3/CmiLkFsrZ9yAcxOBAANSrXojrRI806.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1133, 6573, N'https://resource.pagoda.com.cn/group1/M00/07/E4/CmiWa1srZ-CAfdXyAAODrldEuLU450.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1134, 6573, N'https://resource.pagoda.com.cn/group1/M00/07/E4/CmiU8FsrZ96AJ3pkAAQOmf2VQmY913.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1135, 6573, N'https://resource.pagoda.com.cn/group1/M00/07/E4/CmiWiFsrZ-GAIdPZAABYbkRRH_c870.jpg?width=750&height=226', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1136, 6573, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1137, 4601, N'https://resource.pagoda.com.cn/group1/M00/0C/53/CmiLlFvj5kiAUjkRAAWNXlISUAY546.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1138, 4601, N'https://resource.pagoda.com.cn/group1/M00/0C/53/CmiU8Fvj5kmASIugAASEngD9nhk870.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1139, 4601, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1140, 4601, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiLkFs0ljaAe69TAADENi2kXcU602.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1141, 4601, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiU8Fs0ljmAUO7xAAEVY-lIR8c979.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1142, 4601, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiLkFs0ljuAE1XzAAFHTHe8cdk297.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1143, 4601, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiU8Fs0lj2AYMstAAEUGEqPxQE973.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1144, 4601, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiLkFs0lj-AKPghAADM5P2mKaY793.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1145, 4601, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiLlFs0lkKAa1dTAAFxay53N0Q698.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1146, 4601, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiU8Fs0lkSAL1O_AAC0g-12Fzk378.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1147, 4601, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiWa1s0lkaAJwuXAABPXMDsWuU203.jpg?width=750&height=391', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1148, 4601, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1149, 4285, N'https://resource.pagoda.com.cn/group1/M00/15/25/CmiLlF38JtaAV6m_AAHAbEiUoEQ254.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1150, 4285, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLlFsWQhaAfl1JAAQrjKMrIHc831.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1151, 4285, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiU8FsWQheAafpXAALZM-qqX78263.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1152, 4285, N'https://resource.pagoda.com.cn/group1/M00/1D/58/CmiLkF60yYOAM4fcAATEU4Uh6Kw413.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1153, 4285, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1154, 4285, N'https://resource.pagoda.com.cn/group1/M00/15/25/CmiU8F38Jt6AJIB-ACt3TRR1Ia8834.png?width=750&height=3424', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1155, 4285, N'https://resource.pagoda.com.cn/group1/M00/1D/F6/CmiWiF68tKCAaC0NADlj2G362w0899.jpg?width=750&height=8930', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1156, 4285, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1157, 2201, N'https://resource.pagoda.com.cn/group1/M00/09/7F/CmiLkFtYMvOAO1qzAATG8HktJHE872.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1158, 2201, N'https://resource.pagoda.com.cn/group1/M00/09/7F/CmiWiFtYMvGAW-QJAAOMEbPCUYY720.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1159, 2201, N'https://resource.pagoda.com.cn/group1/M00/04/72/CmiWiFo6Oh-ALMcdAAXSKhZyKbc011.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1160, 2201, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1161, 2201, N'https://resource.pagoda.com.cn/group1/M00/26/CB/CmiWiF758EqAKJj2ABgocHU1cLs853.jpg?width=750&height=4330', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1162, 2201, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1163, 1830, N'https://resource.pagoda.com.cn/group1/M00/26/9D/CmiLkF76BLGAZy3GAAMGtM8pccU089.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1164, 1830, N'https://resource.pagoda.com.cn/group1/M00/26/C9/CmiLlF76BLqAB2NKAAJI1JKvxu4441.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1165, 1830, N'https://resource.pagoda.com.cn/group1/M00/26/C7/CmiU8F76BLqAPAbBAAO00AwTvM4509.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1166, 1830, N'https://resource.pagoda.com.cn/group1/M00/26/3F/CmiWa176BMSASq9EAAQlj2ZgdYg646.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1167, 1830, N'https://resource.pagoda.com.cn/group1/M00/26/CC/CmiWiF76BMSACVevAAbsCOFLewY469.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1168, 1830, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1169, 1830, N'https://resource.pagoda.com.cn/group1/M00/14/3B/CmiWiF3OXeeARRhMABBwLtBP9D4639.jpg?width=750&height=4411', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1170, 1830, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1171, 3521, N'https://resource.pagoda.com.cn/group1/M0D/32/DA/CmiWa1-hCGGAVx-jAAaaoq-q7Tg760.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1172, 3521, N'https://resource.pagoda.com.cn/group1/M07/33/6B/CmiLlF-hCSmAWKj8AAN5LZSG6zo136.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1173, 3521, N'https://resource.pagoda.com.cn/group1/M05/32/DA/CmiWa1-hCTKAXRUbAAQ6pCrJNkA507.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1174, 3521, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1175, 3521, N'https://resource.pagoda.com.cn/group1/M05/32/B2/CmiLkF-RVy2AAOvXAAdMCGhjk5Q870.jpg?width=750&height=4870', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1176, 3521, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1177, 602, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiLkFsRJmuAeIMGAAU27QV5gvA379.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1178, 602, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiLlFsRJm2ALjWAAAQT8hWxp0U575.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1179, 602, N'https://resource.pagoda.com.cn/group1/M00/00/45/CmiWiFeu1puAYN-4AACjDFXddCg074.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1180, 602, N'https://resource.pagoda.com.cn/group1/M00/00/45/CmiLkFeu1p-AJB03AACZ4VMZois196.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1181, 602, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1182, 602, N'https://resource.pagoda.com.cn/group1/M00/07/D7/CmiLlFsqKYeADJgGAAOu7sb-vZo108.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1183, 602, N'https://resource.pagoda.com.cn/group1/M00/07/D7/CmiWa1sqKZmAQESHAAE3MkdLDso743.jpg?width=750&height=570', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1184, 602, N'https://resource.pagoda.com.cn/group1/M00/07/D7/CmiLkFsqKY6AZigiAAJmLimify8050.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1185, 602, N'https://resource.pagoda.com.cn/group1/M00/07/D7/CmiWiFsqKYyAETJtAASDWrW-urc693.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1186, 602, N'https://resource.pagoda.com.cn/group1/M00/07/D7/CmiWa1sqKYqABA2PAAQ3ejRr1fc078.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1187, 602, N'https://resource.pagoda.com.cn/group1/M00/07/D7/CmiU8FsqKYmAA2lSAANQrG8si1U512.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1188, 602, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1189, 3988, N'https://resource.pagoda.com.cn/group1/M00/1C/9B/CmiLkF6nii-AerAkAAQ47B5cMI0152.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1190, 3988, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiLlF6nijKALCKaAAWmqohYN7w448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1191, 3988, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiU8F6nijeAa_v1AAOykZXRYY4894.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1192, 3988, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1193, 3988, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxiqAXWKnAKzTonFVjDY382.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1194, 3988, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1195, 2216, N'https://resource.pagoda.com.cn/group1/M00/10/04/CmiU8FzkrTqAITkEAANEiUB36g0130.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1196, 2216, N'https://resource.pagoda.com.cn/group1/M00/10/05/CmiWiFzkrT2Acd64AAO8fD3ugHc430.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1197, 2216, N'https://resource.pagoda.com.cn/group1/M00/07/58/CmiWiFsWT6eAe0rwAAPoOzB8IRY976.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1198, 2216, N'https://resource.pagoda.com.cn/group1/M00/07/58/CmiLlFsWT6mAdxCKAARIWOSaqO4112.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1199, 2216, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1200, 2216, N'https://resource.pagoda.com.cn/group1/M00/07/E3/CmiU8FsrZ6eAR6YtAANZ2kbVX9Y719.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1201, 2216, N'https://resource.pagoda.com.cn/group1/M00/07/E3/CmiWa1srZ6mAWmcfAAFqvTya3ks230.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1202, 2216, N'https://resource.pagoda.com.cn/group1/M00/07/E3/CmiWiFsrZ6qAAoHhAANxUOeb650229.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1203, 2216, N'https://resource.pagoda.com.cn/group1/M00/07/E3/CmiLkFsrZ6uAQmeiAAR6jWYEAMs256.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1204, 2216, N'https://resource.pagoda.com.cn/group1/M00/07/E3/CmiLlFsrZ62AIdE4AALNTVu6vbE416.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1205, 2216, N'https://resource.pagoda.com.cn/group1/M00/07/E3/CmiWa1srZ6-AdogXAAAcCK-Bv6A977.jpg?width=750&height=142', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1206, 2216, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1207, 2330, N'https://resource.pagoda.com.cn/group1/M00/0C/19/CmiWa1vWyAKAV5KiAANlN6stVp8857.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1208, 2330, N'https://resource.pagoda.com.cn/group1/M00/0C/19/CmiU8FvWyACAKuaQAAODh3rNNgY964.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1209, 2330, N'https://resource.pagoda.com.cn/group1/M00/03/F0/CmiWiFnxX4mAaireAADAaD3JQsc424.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1210, 2330, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1211, 2330, N'https://resource.pagoda.com.cn/group1/M00/0A/C6/CmiWa1uND5KAKGMOAAEma5h0dD0157.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1212, 2330, N'https://resource.pagoda.com.cn/group1/M00/0A/C6/CmiWiFuND5SASIfoAAK8NZQS5b4015.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1213, 2330, N'https://resource.pagoda.com.cn/group1/M00/0A/C6/CmiLkFuND5aAe2-lAAJG0pwNrug796.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1214, 2330, N'https://resource.pagoda.com.cn/group1/M00/0A/C6/CmiLlFuND5iAETtDAAEWytTHjFA690.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1215, 2330, N'https://resource.pagoda.com.cn/group1/M00/0A/C6/CmiU8FuND5qATbixAALSAmOW5sk667.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1216, 2330, N'https://resource.pagoda.com.cn/group1/M00/0A/C6/CmiWa1uND5uAd37IAAPoIj5WIfU877.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1217, 2330, N'https://resource.pagoda.com.cn/group1/M00/0A/C6/CmiWiFuND52AByrrAAHoXaoojVg481.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1218, 2330, N'https://resource.pagoda.com.cn/group1/M00/0A/C6/CmiLkFuND5-AZZv-AAGyl6fKWKo507.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1219, 2330, N'https://resource.pagoda.com.cn/group1/M00/0A/C6/CmiLlFuND6GAAsZxAABydmtDiRg742.jpg?width=750&height=276', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1220, 2330, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1221, 2208, N'https://resource.pagoda.com.cn/group1/M1B/33/CD/CmiLlF-rng2AESvmAAVlcgtNrkE531.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1222, 2208, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1223, 2208, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1224, 1012, N'https://resource.pagoda.com.cn/group1/M00/15/28/CmiU8F38jSWAPKv3AADj_FK-AA0043.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1225, 1012, N'https://resource.pagoda.com.cn/group1/M00/15/28/CmiLlF38jR2AHNeBAACb-WJu0yA300.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1226, 1012, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1227, 1012, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1228, 1018, N'https://resource.pagoda.com.cn/group1/M00/0A/D1/CmiWiFuPQ7eAAtkzAAQKSQzEWek815.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1229, 1018, N'https://resource.pagoda.com.cn/group1/M00/11/27/CmiU8F0i2iqAeHAVAAMJSvtQAoE290.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1230, 1018, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1231, 1018, N'https://resource.pagoda.com.cn/group1/M02/31/FB/CmiLkF-DtSiAE0W9AB_vWdzJ_dY630.png?width=750&height=3691', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1232, 1018, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1233, 3129, N'https://resource.pagoda.com.cn/group1/M00/0C/C6/CmiLkFwAoeWAFCH-AADmSNJ7_vE374.jpg?width=750&height=500', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1234, 3129, N'https://resource.pagoda.com.cn/group1/M00/0C/C6/CmiLlFwAoeiASdzjAAECO-FI6OA769.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1235, 3129, N'https://resource.pagoda.com.cn/group1/M00/0C/C6/CmiU8FwAoeqAAmM7AAHwU35blw0240.jpg?width=750&height=775', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1236, 3129, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1237, 3129, N'https://resource.pagoda.com.cn/group1/M00/14/0B/CmiLkF3ExCSANXQfAAiXNR3VsXI513.jpg?width=750&height=3595', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1238, 3129, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1239, 742, N'https://resource.pagoda.com.cn/group1/M00/08/2D/CmiWa1syBEGAdkrnAANzl47NJwU783.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1240, 742, N'https://resource.pagoda.com.cn/group1/M00/08/2D/CmiWiFsyBEOADHuGAAM9y3msVf4728.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1241, 742, N'https://resource.pagoda.com.cn/group1/M00/03/E8/CmiLlFnrfRyAVZR3AAI2ygOg1tg272.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1242, 742, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1243, 742, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1244, 2242, N'https://resource.pagoda.com.cn/group1/M00/0C/A5/CmiU8Fv3lTeAPh7aAAO1Ij70azs981.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1245, 2242, N'https://resource.pagoda.com.cn/group1/M00/0C/A5/CmiWa1v3lTmADwd7AAOysB5QSw4232.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1246, 2242, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1247, 2242, N'https://resource.pagoda.com.cn/group1/M00/12/BA/CmiLkF1w1ZSAfs9AAAzRiNwUyNg648.jpg?width=750&height=3015', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1248, 2242, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1249, 5296, N'https://resource.pagoda.com.cn/group1/M00/0C/D4/CmiWiFwE_eaAeoIQAANc-gvsFSk328.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1250, 5296, N'https://resource.pagoda.com.cn/group1/M00/0C/D4/CmiLkFwE_emALKSTAAM0iAufcqk747.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1251, 5296, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1252, 5296, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1253, 82216, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiU8FtQeJWAMEFzAAKPNtmNfGM786.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1254, 82216, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiLlFtQeJSATLIvAAJjYWMwITA285.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1255, 82216, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1256, 82216, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1257, 82208, N'https://resource.pagoda.com.cn/group1/M1E/33/9E/CmiLkF-rqfCATZUIAAfZqsznWnU631.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1258, 82208, N'https://resource.pagoda.com.cn/group1/M18/33/3D/CmiWa1-rqf6ADccpAAN2jukwzz4165.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1259, 82208, N'https://resource.pagoda.com.cn/group1/M1C/33/CB/CmiU8F-rqfWABgB5AAnc4Kx9P7M428.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1260, 82208, N'https://resource.pagoda.com.cn/group1/M00/33/D0/CmiWiF-rqf6AYi73AAOEQ7jSD2g364.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1261, 82208, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1262, 82208, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1263, 81950, N'https://resource.pagoda.com.cn/group1/M00/0D/00/CmiWa1wSGryAVjZlAATSGtFdSCY243.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1264, 81950, N'https://resource.pagoda.com.cn/group1/M00/0D/00/CmiWiFwSGr2AB53mAANnRaXEkj8980.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1265, 81950, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1266, 81950, N'https://resource.pagoda.com.cn/group1/M00/07/99/CmiWiFsiRY2AeAbUAATygaOg_VA460.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1267, 81950, N'https://resource.pagoda.com.cn/group1/M00/07/99/CmiLkFsiRZCASCmhAAGoGw-11Y0456.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1268, 81950, N'https://resource.pagoda.com.cn/group1/M00/07/99/CmiLlFsiRZKADMPqAAOblBe5haU833.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1269, 81950, N'https://resource.pagoda.com.cn/group1/M00/07/99/CmiU8FsiRZSAeVR8AAPKEXXM18I594.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1270, 81950, N'https://resource.pagoda.com.cn/group1/M00/07/99/CmiWiFsiRZeARzv_AAKMggicKVQ412.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1271, 81950, N'https://resource.pagoda.com.cn/group1/M00/07/99/CmiLkFsiRZmAOND4AALXU7Kf5Mc402.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1272, 81950, N'https://resource.pagoda.com.cn/group1/M00/07/99/CmiU8FsiRZuADrs3AAPGyJ44QAI273.jpg?width=750&height=690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1273, 81950, N'https://resource.pagoda.com.cn/group1/M00/07/99/CmiWa1siRZ2AC0BdAAAwePEex2g762.jpg?width=750&height=150', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1274, 81950, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1275, 81919, N'https://resource.pagoda.com.cn/group1/M05/33/5E/CmiWa1-uTI6AAwWdAAOwEKw0jac698.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1276, 81919, N'https://resource.pagoda.com.cn/group1/M12/33/B2/CmiWiF-o1w6AIN28AAKx4XoPEqY432.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1277, 81919, N'https://resource.pagoda.com.cn/group1/M18/33/B0/CmiLlF-o1xOAcAyNAAueLp026A0065.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1278, 81904, N'https://resource.pagoda.com.cn/group1/M00/1C/9B/CmiLkF6nii-AerAkAAQ47B5cMI0152.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1279, 81904, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiLlF6nijKALCKaAAWmqohYN7w448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1280, 81904, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiU8F6nijeAa_v1AAOykZXRYY4894.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1281, 81904, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1282, 81904, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxiqAXWKnAKzTonFVjDY382.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1283, 81904, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1284, 81793, N'https://resource.pagoda.com.cn/group1/M03/33/B8/CmiU8F-qDjSAQ7mSAAL9ghameGs359.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1285, 81793, N'https://resource.pagoda.com.cn/group1/M1E/33/2A/CmiWa1-qDkGAabGEAAN7OE_xnMA907.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1286, 81793, N'https://resource.pagoda.com.cn/group1/M0A/33/8B/CmiLkF-qDjuAaPfqAAcvss_KPRg494.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1287, 81793, N'https://resource.pagoda.com.cn/group1/M05/33/8B/CmiLkF-qDj2ATO98AAYEKTCb5dk607.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1288, 81793, N'https://resource.pagoda.com.cn/group1/M0D/33/BA/CmiLlF-qDkmAGz_PAAOqt-w94Es425.jpg?width=800&height=800', 1)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1289, 81793, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1290, 81793, N'https://resource.pagoda.com.cn/group1/M0C/30/E5/CmiU8F9jPliAUReOABNQChUhoMI637.jpg?width=750&height=4015', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1291, 81793, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1292, 80775, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiWiFuwa-WAD91dAAV2FGCpsKs315.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1293, 80775, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiLlFuwa96ANGhjAARqw8-C12Q512.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1294, 80775, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1295, 80775, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiLkFuwa-iAdc5MAAG1lRbyqo0001.jpg?width=750&height=914', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1296, 80775, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiLlFuwa-qANUQFAAGroeTHm6U673.jpg?width=750&height=913', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1297, 80775, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiU8Fuwa-yAFnBSAAFk23JlFYk708.jpg?width=750&height=914', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1298, 80775, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiWiFuwa-6AJN3TAAFLcoZTjyU571.jpg?width=750&height=913', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1299, 80775, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1300, 80475, N'https://resource.pagoda.com.cn/group1/M00/14/61/CmiLlF3XTlGAa6_PAAPqET_42C8387.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1301, 80475, N'https://resource.pagoda.com.cn/group1/M00/14/62/CmiWa13XTlqAPc5dAAOcFhtaLFM590.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1302, 80475, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1303, 80475, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1304, 80046, N'https://resource.pagoda.com.cn/group1/M11/33/B9/CmiLkF-t67KALK8NAAMdPijzaQY445.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1305, 80046, N'https://resource.pagoda.com.cn/group1/M1C/33/E9/CmiLlF-t67qAYZwxAAPjfILbiA8851.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1306, 80046, N'https://resource.pagoda.com.cn/group1/M20/33/7B/CmiWiF-ieZeAUZBsAAKx4XoPEqY304.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1307, 80046, N'https://resource.pagoda.com.cn/group1/M19/32/E8/CmiWa1-ieaCAUOPoAAueLp026A0403.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1308, 79987, N'https://resource.pagoda.com.cn/group1/M18/32/CA/CmiWa1-fdQSAc6b8AAKqb7pAsw4561.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1309, 79987, N'https://resource.pagoda.com.cn/group1/M14/33/59/CmiU8F-fdRuAVe8LAAOw64O43vQ669.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1310, 79987, N'https://resource.pagoda.com.cn/group1/M0E/33/5B/CmiLlF-fdPSAAc_0AAKyNdoU_1k814.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1311, 79987, N'https://resource.pagoda.com.cn/group1/M0A/33/03/CmiLkF-aZWCAYpOZAAueLp026A0821.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1312, 79825, N'https://resource.pagoda.com.cn/group1/M1F/33/CB/CmiU8F-rqimAVtNEAAaX3OYweL8296.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1313, 79825, N'https://resource.pagoda.com.cn/group1/M1C/33/CB/CmiU8F-rqjKAZ0JaAARWgwMgStc029.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1314, 79825, N'https://resource.pagoda.com.cn/group1/M0A/33/CB/CmiU8F-rqiyABPO8AAUos6G3glc052.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1315, 79825, N'https://resource.pagoda.com.cn/group1/M0C/33/3D/CmiWa1-rqjWAWVjoAATZ2d0uXEg562.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1316, 79825, N'https://resource.pagoda.com.cn/group1/M1F/33/CB/CmiU8F-rqjWAX4tKAARVPWIBZ2Q444.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1317, 79825, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1318, 79825, N'https://resource.pagoda.com.cn/group1/M1E/33/92/CmiWiF-lGJGAJJBYAAyCzN5lr18102.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1319, 79825, N'https://resource.pagoda.com.cn/group1/M15/33/92/CmiWiF-lGJOAMbCiAAsCvCnu2YA362.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1320, 79825, N'https://resource.pagoda.com.cn/group1/M0E/32/FF/CmiWa1-lGJmAO-qDAAkry_GBJzU625.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1321, 79825, N'https://resource.pagoda.com.cn/group1/M1D/33/90/CmiLlF-lGJmAdGVSAAsGas_aMHg963.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1322, 79825, N'https://resource.pagoda.com.cn/group1/M0D/33/90/CmiLlF-lGJuAK58vAAx4RRIjp_Y659.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1323, 79825, N'https://resource.pagoda.com.cn/group1/M11/33/8E/CmiU8F-lGJmAHRauAAoNzaVZeiA723.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1324, 79825, N'https://resource.pagoda.com.cn/group1/M07/33/92/CmiWiF-lGJ6AeGhYAAEMT1gKb4g255.jpg?width=750&height=242', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1325, 79825, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1326, 79215, N'https://resource.pagoda.com.cn/group1/M00/10/E0/CmiWa10S7FKASdd-AAKPNtmNfGM580.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1327, 79215, N'https://resource.pagoda.com.cn/group1/M00/10/E0/CmiWa10S7FWAIzXzAAJjYWMwITA026.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1328, 79215, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1329, 79215, N'https://resource.pagoda.com.cn/group1/M00/1E/ED/CmiU8F7E9NuAUajmABWLbUPQS50982.jpg?width=750&height=4020', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1330, 79215, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1331, 79214, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiU8FtQeJWAMEFzAAKPNtmNfGM786.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1332, 79214, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiLlFtQeJSATLIvAAJjYWMwITA285.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1333, 79214, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1334, 79214, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1335, 79210, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiU8FtQeJWAMEFzAAKPNtmNfGM786.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1336, 79210, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiLlFtQeJSATLIvAAJjYWMwITA285.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1337, 79210, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1338, 79210, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1339, 79204, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiU8FtQeJWAMEFzAAKPNtmNfGM786.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1340, 79204, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiLlFtQeJSATLIvAAJjYWMwITA285.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1341, 79204, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1342, 79204, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1343, 79188, N'https://resource.pagoda.com.cn/group1/M00/21/F0/CmiLkF7dseSAN8jnAAHAbEiUoEQ650.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1344, 79188, N'https://resource.pagoda.com.cn/group1/M00/21/EF/CmiLlF7dseiAf_ouAAKuzpqrvSA275.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1345, 79188, N'https://resource.pagoda.com.cn/group1/M00/21/5F/CmiWa17dsfSAU2S8AALcHROSMRg801.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1346, 79188, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1347, 79188, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1348, 79184, N'https://resource.pagoda.com.cn/group1/M1F/33/CB/CmiU8F-rqimAVtNEAAaX3OYweL8296.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1349, 79184, N'https://resource.pagoda.com.cn/group1/M1C/33/CB/CmiU8F-rqjKAZ0JaAARWgwMgStc029.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1350, 79184, N'https://resource.pagoda.com.cn/group1/M0A/33/CB/CmiU8F-rqiyABPO8AAUos6G3glc052.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1351, 79184, N'https://resource.pagoda.com.cn/group1/M0C/33/3D/CmiWa1-rqjWAWVjoAATZ2d0uXEg562.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1352, 79184, N'https://resource.pagoda.com.cn/group1/M1F/33/CB/CmiU8F-rqjWAX4tKAARVPWIBZ2Q444.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1353, 79184, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1354, 79184, N'https://resource.pagoda.com.cn/group1/M1E/33/92/CmiWiF-lGJGAJJBYAAyCzN5lr18102.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1355, 79184, N'https://resource.pagoda.com.cn/group1/M15/33/92/CmiWiF-lGJOAMbCiAAsCvCnu2YA362.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1356, 79184, N'https://resource.pagoda.com.cn/group1/M0E/32/FF/CmiWa1-lGJmAO-qDAAkry_GBJzU625.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1357, 79184, N'https://resource.pagoda.com.cn/group1/M1D/33/90/CmiLlF-lGJmAdGVSAAsGas_aMHg963.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1358, 79184, N'https://resource.pagoda.com.cn/group1/M0D/33/90/CmiLlF-lGJuAK58vAAx4RRIjp_Y659.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1359, 79184, N'https://resource.pagoda.com.cn/group1/M11/33/8E/CmiU8F-lGJmAHRauAAoNzaVZeiA723.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1360, 79184, N'https://resource.pagoda.com.cn/group1/M07/33/92/CmiWiF-lGJ6AeGhYAAEMT1gKb4g255.jpg?width=750&height=242', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1361, 79184, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1362, 78298, N'https://resource.pagoda.com.cn/group1/M10/33/1D/CmiLlF-XyYWAe549AAYRoV0CjqQ069.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1363, 78298, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiWa1sWQoaAPpcxAAPbjqv99dU745.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1364, 78298, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiWiFsWQoeAZG2uAAPfVUkxnqI440.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1365, 78298, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1366, 78298, N'https://resource.pagoda.com.cn/group1/M00/12/B9/CmiU8F1w1tuADJMCABC35c3cLLM442.jpg?width=750&height=3065', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1367, 78298, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1368, 78091, N'https://resource.pagoda.com.cn/group1/M0B/32/7C/CmiWa1-WO7WABLzYAARIPalzWEs614.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1369, 78091, N'https://resource.pagoda.com.cn/group1/M1E/33/0D/CmiLlF-WO7WAduj9AANsKHqWJoo626.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1370, 78091, N'https://resource.pagoda.com.cn/group1/M00/32/DE/CmiLkF-WO7-APAh_AAKHjC5QuSQ006.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1371, 78091, N'https://resource.pagoda.com.cn/group1/M00/33/0F/CmiWiF-WO8-AYz1jAAueLp026A0754.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1372, 77942, N'https://resource.pagoda.com.cn/group1/M19/2E/2F/CmiWa180oBuAWmKJAALtBi6ZqAg969.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1373, 77942, N'https://resource.pagoda.com.cn/group1/M1E/2E/26/CmiWiF8iLqqAIvTZAADbeXDaGAY441.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1374, 77942, N'https://resource.pagoda.com.cn/group1/M19/2F/67/CmiWiF9DNtqASUfJACFLqP7mUgE985.jpg?width=750&height=6690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1375, 77942, N'https://resource.pagoda.com.cn/group1/M05/2D/F4/CmiLkF8iLoCAYLUBAAjgxffXReg441.jpg?width=750&height=1840', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1376, 76858, N'https://resource.pagoda.com.cn/group1/M05/32/2F/CmiLkF-H5eKAU-WnAANEU-VcAbA937.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1377, 76858, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1378, 76858, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1379, 76858, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1380, 76858, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1381, 76858, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1382, 76858, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1383, 76858, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1384, 76854, N'https://resource.pagoda.com.cn/group1/M13/32/5F/CmiLlF-H5P2AWGreAALkqGnIRzo599.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1385, 76854, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1386, 76854, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1387, 76854, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1388, 76854, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1389, 76854, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1390, 76854, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1391, 76854, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1392, 76852, N'https://resource.pagoda.com.cn/group1/M0C/32/2F/CmiLkF-H44OAcy3FAAN85L492SU038.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1393, 76852, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1394, 76852, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1395, 76852, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1396, 76852, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1397, 76852, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1398, 76852, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1399, 76852, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1400, 76414, N'https://resource.pagoda.com.cn/group1/M14/2F/91/CmiWiF9HVfaAZ-iZAAeU3MlxnQw873.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1401, 76414, N'https://resource.pagoda.com.cn/group1/M1C/2F/8C/CmiU8F9HVfmAZTz8AARuSKMwk8s505.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1402, 76414, N'https://resource.pagoda.com.cn/group1/M03/2F/8E/CmiLlF9HVZGAYoq0AAKHjC5QuSQ529.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1403, 76414, N'https://resource.pagoda.com.cn/group1/M05/2F/91/CmiWiF9HVgaAdLQDAB7naUGWgQ8382.jpg?width=750&height=5026', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1404, 76414, N'https://resource.pagoda.com.cn/group1/M06/2F/5F/CmiLkF9HVZGAN9NcAAueLp026A0168.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1405, 75719, N'https://resource.pagoda.com.cn/group1/M00/15/59/CmiWa14ETMCABK-3AAaJfw1v4NA938.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1406, 75719, N'https://resource.pagoda.com.cn/group1/M00/15/60/CmiLkF4Fos6AAbXzAASXNYWiXos625.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1407, 75719, N'https://resource.pagoda.com.cn/group1/M00/15/5F/CmiWiF4Ff8iADNvzACu_qVsHHwk384.JPG?width=3293&height=3293', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1408, 75719, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1409, 75719, N'https://resource.pagoda.com.cn/group1/M00/1D/EF/CmiLkF676QqAVZXEADMBn0XFgR4297.jpg?width=750&height=6096', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1410, 75719, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1411, 75717, N'https://resource.pagoda.com.cn/group1/M13/31/A6/CmiLkF98XD2AKRsMAAWe9G4kmZ0591.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1412, 75717, N'https://resource.pagoda.com.cn/group1/M1C/31/7C/CmiLkF91vNCAVq08AAjujX0F8pY007.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1413, 75717, N'https://resource.pagoda.com.cn/group1/M17/31/AC/CmiLlF91vN6AfXi_AAreZMJJEiI991.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1414, 75717, N'https://resource.pagoda.com.cn/group1/M14/31/AA/CmiU8F91vOGAMC3-AAibHAaI0_A802.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1415, 75717, N'https://resource.pagoda.com.cn/group1/M17/31/AE/CmiWiF91vO6AXCF2AAgUfTCo_f8168.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1416, 75717, N'https://resource.pagoda.com.cn/group1/M0A/31/45/CmiWa198XBqATNdWAAKHjC5QuSQ948.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1417, 75717, N'https://resource.pagoda.com.cn/group1/M20/31/D8/CmiWiF98XCiAHwDjAAueLp026A0730.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1418, 75646, N'https://resource.pagoda.com.cn/group1/M00/13/28/CmiWa12JskCAceU0AAhNfnrfhpo126.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1419, 75646, N'https://resource.pagoda.com.cn/group1/M00/0B/CC/CmiU8FvFWlaAGYXYAAQ-zPNnQnE018.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1420, 75646, N'https://resource.pagoda.com.cn/group1/M00/0B/CC/CmiWa1vFWliAWWBcAATOt_LtdP8361.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1421, 75646, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1422, 75646, N'https://resource.pagoda.com.cn/group1/M01/31/D4/CmiWa1-ILiuACm4QAFjwlj0awXs803.jpg?width=751&height=10369', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1423, 75646, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1424, 75645, N'https://resource.pagoda.com.cn/group1/M00/13/28/CmiWa12JskCAceU0AAhNfnrfhpo126.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1425, 75645, N'https://resource.pagoda.com.cn/group1/M00/0B/CC/CmiU8FvFWlaAGYXYAAQ-zPNnQnE018.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1426, 75645, N'https://resource.pagoda.com.cn/group1/M00/0B/CC/CmiWa1vFWliAWWBcAATOt_LtdP8361.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1427, 75645, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1428, 75645, N'https://resource.pagoda.com.cn/group1/M01/31/D4/CmiWa1-ILiuACm4QAFjwlj0awXs803.jpg?width=751&height=10369', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1429, 75645, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1430, 75448, N'https://resource.pagoda.com.cn/group1/M13/31/A6/CmiLkF98XD2AKRsMAAWe9G4kmZ0591.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1431, 75448, N'https://resource.pagoda.com.cn/group1/M1C/31/7C/CmiLkF91vNCAVq08AAjujX0F8pY007.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1432, 75448, N'https://resource.pagoda.com.cn/group1/M17/31/AC/CmiLlF91vN6AfXi_AAreZMJJEiI991.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1433, 75448, N'https://resource.pagoda.com.cn/group1/M14/31/AA/CmiU8F91vOGAMC3-AAibHAaI0_A802.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1434, 75448, N'https://resource.pagoda.com.cn/group1/M17/31/AE/CmiWiF91vO6AXCF2AAgUfTCo_f8168.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1435, 75448, N'https://resource.pagoda.com.cn/group1/M0A/31/45/CmiWa198XBqATNdWAAKHjC5QuSQ948.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1436, 75448, N'https://resource.pagoda.com.cn/group1/M20/31/D8/CmiWiF98XCiAHwDjAAueLp026A0730.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1437, 74965, N'https://resource.pagoda.com.cn/group1/M1F/31/58/CmiLkF9xe5iAV7lDAAQVa9aexSg268.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1438, 74965, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1439, 74965, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1440, 74965, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1441, 74965, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1442, 74965, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1443, 74965, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1444, 74965, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1445, 74964, N'https://resource.pagoda.com.cn/group1/M13/31/8A/CmiWiF9xeqSAbfggAAQVa9aexSg569.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1446, 74964, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiU8F4DJN-ASYgaAADmrhNofjQ629.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1447, 74964, N'https://resource.pagoda.com.cn/group1/M00/15/51/CmiWa14DJOmARuoEAAGNT-iSyyA101.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1448, 74964, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiLkF4DJOmAWgX1AAIPHiGGrCY448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1449, 74964, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1450, 74964, N'https://resource.pagoda.com.cn/group1/M00/14/4A/CmiLkF3SOkiAYlXmADJHbfmjz_E476.png?width=750&height=8848', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1451, 74964, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1452, 74944, N'https://resource.pagoda.com.cn/group1/M00/0B/5E/CmiWa1uqA4KADQ9NAAZ-b1VXroU577.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1453, 74944, N'https://resource.pagoda.com.cn/group1/M00/13/08/CmiLlF2CCL2ADu_RAAQI--RcIGw794.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1454, 74944, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1455, 74944, N'https://resource.pagoda.com.cn/group1/M15/30/03/CmiLlF9R6-qAFwmDAAiELwuAReI725.jpg?width=750&height=6396', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1456, 74944, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1457, 74063, N'https://resource.pagoda.com.cn/group1/M00/0C/53/CmiLlFvj5kiAUjkRAAWNXlISUAY546.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1458, 74063, N'https://resource.pagoda.com.cn/group1/M00/0C/53/CmiU8Fvj5kmASIugAASEngD9nhk870.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1459, 74063, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1460, 74063, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiLkFs0ljaAe69TAADENi2kXcU602.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1461, 74063, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiU8Fs0ljmAUO7xAAEVY-lIR8c979.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1462, 74063, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiLkFs0ljuAE1XzAAFHTHe8cdk297.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1463, 74063, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiU8Fs0lj2AYMstAAEUGEqPxQE973.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1464, 74063, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiLkFs0lj-AKPghAADM5P2mKaY793.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1465, 74063, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiLlFs0lkKAa1dTAAFxay53N0Q698.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1466, 74063, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiU8Fs0lkSAL1O_AAC0g-12Fzk378.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1467, 74063, N'https://resource.pagoda.com.cn/group1/M00/08/66/CmiWa1s0lkaAJwuXAABPXMDsWuU203.jpg?width=750&height=391', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1468, 74063, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1469, 73890, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1470, 73890, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1471, 73890, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1472, 73890, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1473, 73890, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1474, 73890, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1475, 73890, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1476, 73553, N'https://resource.pagoda.com.cn/group1/M20/33/44/CmiLkF-iE_OAADBOAATln1zf8OA858.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1477, 73553, N'https://resource.pagoda.com.cn/group1/M18/2F/29/CmiLlF893b2ACK0-AAKHjC5QuSQ861.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1478, 73553, N'https://resource.pagoda.com.cn/group1/M07/33/73/CmiLlF-iFAKAKC1LAATln1zf8OA063.jpg?width=800&height=800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1479, 73553, N'https://resource.pagoda.com.cn/group1/M10/2E/FA/CmiLkF893b6AM0Y3AAueLp026A0690.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1480, 73293, N'https://resource.pagoda.com.cn/group1/M16/31/64/CmiU8F9tSdmAIiuIAAQnt5ClNp8198.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1481, 73293, N'https://resource.pagoda.com.cn/group1/M00/14/B9/CmiLkF3pu1aAWA8KAAJ0zJWP-FU771.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1482, 73293, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1483, 73293, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1484, 73276, N'https://resource.pagoda.com.cn/group1/M17/30/37/CmiWa19hee6Acy06AALc-EC1fHc296.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1485, 73276, N'https://resource.pagoda.com.cn/group1/M1A/30/CA/CmiWiF9hefaAUtD0AAWjY7crshA828.jpg?width=800&height=800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1486, 73276, N'https://resource.pagoda.com.cn/group1/M0F/30/98/CmiLkF9hefeAX2bVAAYubVC_fdM564.jpg?width=800&height=800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1487, 73276, N'https://resource.pagoda.com.cn/group1/M17/30/C5/CmiU8F9hegGAfd_jAAaKVpi0BJA619.jpg?width=800&height=800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1488, 73276, N'https://resource.pagoda.com.cn/group1/M0A/30/CA/CmiWiF9heh6AENpkAAXCwW6jiHw153.jpg?width=800&height=800', 0)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1489, 73276, N'https://resource.pagoda.com.cn/group1/M0A/30/C8/CmiLlF9hei6AbcfSAAJeS9EzdGE500.jpg?width=800&height=800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1490, 73013, N'https://resource.pagoda.com.cn/group1/M00/13/49/CmiU8F2Rd0aAOXMlAASFLh6bvEQ488.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1491, 73013, N'https://resource.pagoda.com.cn/group1/M00/13/4A/CmiWa12Rd0uADy78AANKEviPja8585.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1492, 73013, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1493, 73013, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1494, 72587, N'https://resource.pagoda.com.cn/group1/M1A/30/56/CmiU8F9Ye2GAO-46AAM7I1pqA7E451.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1495, 72587, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1496, 72587, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1497, 72587, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1498, 72587, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1499, 72587, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1500, 72587, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1501, 72587, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1502, 71105, N'https://resource.pagoda.com.cn/group1/M0C/2F/90/CmiWiF9HTyGAd9BpAARhh24Tyms229.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1503, 71105, N'https://resource.pagoda.com.cn/group1/M00/0A/EA/CmiWa1uSd9SAXw2iAASfaTQzkoE977.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1504, 71105, N'https://resource.pagoda.com.cn/group1/M00/0A/EA/CmiWiFuSd9aAc56vAAUCdSZcZZc864.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1505, 71105, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1506, 71105, N'https://resource.pagoda.com.cn/group1/M00/1D/EC/CmiU8F67z6mAbJGJABqWLkeb_9Y351.jpg?width=750&height=4900', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1507, 71105, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1508, 70621, N'https://resource.pagoda.com.cn/group1/M12/32/EB/CmiU8F-SdsOAYztXAAIvPy9-ATg672.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1509, 70621, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1510, 70621, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1511, 69347, N'https://resource.pagoda.com.cn/group1/M1B/2E/BB/CmiWiF8zwSGAD3UOAALI8yTybgI941.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1512, 69347, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1513, 69347, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1514, 69347, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1515, 69347, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1516, 69347, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1517, 69347, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1518, 69347, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1519, 69345, N'https://resource.pagoda.com.cn/group1/M18/2E/BB/CmiWiF8zwGGAY1M4AAO-irhVmuQ377.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1520, 69345, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1521, 69345, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1522, 69345, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1523, 69345, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1524, 69345, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1525, 69345, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1526, 69345, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1527, 69340, N'https://resource.pagoda.com.cn/group1/M1E/2E/B6/CmiU8F8zv5eADcbpAALMnYuiT78621.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1528, 69340, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1529, 69340, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1530, 69340, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1531, 69340, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1532, 69340, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1533, 69340, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1534, 69340, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1535, 69339, N'https://resource.pagoda.com.cn/group1/M07/2E/BB/CmiWiF8zvwuAYyhNAAM7I1pqA7E552.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1536, 69339, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1537, 69339, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1538, 69339, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1539, 69339, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1540, 69339, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1541, 69339, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1542, 69339, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1543, 69335, N'https://resource.pagoda.com.cn/group1/M03/2E/B8/CmiLlF8zvnSAO9qnAAKMKwiAN5U991.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1544, 69335, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1545, 69335, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1546, 69335, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1547, 69335, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1548, 69335, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1549, 69335, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1550, 69335, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1551, 69330, N'https://resource.pagoda.com.cn/group1/M0F/2E/BA/CmiWiF8zu1KAAN3oAANbQGT3rpc354.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1552, 69330, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1553, 69330, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1554, 69330, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1555, 69330, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1556, 69330, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1557, 69330, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1558, 69330, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1559, 69329, N'https://resource.pagoda.com.cn/group1/M1C/2E/89/CmiLkF8zuiCATlM0AAOOCQMEGW0562.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1560, 69329, N'https://resource.pagoda.com.cn/group1/M00/26/C5/CmiLkF7644eAft6JAABdmVsEE8Y285.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1561, 69329, N'https://resource.pagoda.com.cn/group1/M00/26/EF/CmiU8F76442APC3zAAA56IiRd5o682.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1562, 69329, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF7645OAQOzcAABPnjViAHw218.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1563, 69329, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7645yARPhJAAO8RgIP71E422.jpg?width=750&height=2945', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1564, 69329, N'https://resource.pagoda.com.cn/group1/M00/26/F5/CmiWiF76456AJofEAAM5Yf9sH40509.jpg?width=750&height=2538', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1565, 69329, N'https://resource.pagoda.com.cn/group1/M00/26/F1/CmiLlF7646GACPUgAAPS6BZD4P4323.jpg?width=750&height=2949', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1566, 69329, N'https://resource.pagoda.com.cn/group1/M00/26/68/CmiWa17646aAexqIAAOhuPqYUT4390.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1567, 68838, N'https://resource.pagoda.com.cn/group1/M00/0A/D1/CmiWiFuPQ7eAAtkzAAQKSQzEWek815.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1568, 68838, N'https://resource.pagoda.com.cn/group1/M00/11/27/CmiU8F0i2iqAeHAVAAMJSvtQAoE290.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1569, 68838, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1570, 68838, N'https://resource.pagoda.com.cn/group1/M02/31/FB/CmiLkF-DtSiAE0W9AB_vWdzJ_dY630.png?width=750&height=3691', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1571, 68838, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1572, 67696, N'https://resource.pagoda.com.cn/group1/M0C/33/1E/CmiWiF-XwYGAeFvjAAGnR8AwAPo734.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1573, 67696, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiLkFuQlneAKJ7OAAWAcfi1UMk026.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1574, 67696, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiWiFuQlnWADQL1AANuOPpcyRY788.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1575, 67696, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1576, 67696, N'https://resource.pagoda.com.cn/group1/M0E/2F/2E/CmiWa19MWCmABH6PAB9Jo9zoMxA069.jpg?width=750&height=4890', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1577, 67696, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1578, 66809, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiLlFsRIdaAbFYGAAZK6a_0KYk876.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1579, 66809, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiU8FsRIdeAQNmKAAQzvbCQvXc758.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1580, 66809, N'https://resource.pagoda.com.cn/group1/M00/01/13/CmiLkFg-avSAP1t4AAIePCsBtU0293.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1581, 66809, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1582, 66809, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoDqAfBw3AAHLQP9_oTM302.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1583, 66809, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoDuAcGcVAAKWjdjLyGI462.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1584, 66809, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWa1swoD2AZcEcAAJ4KouQnkY875.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1585, 66809, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoD6AEglkAAExo6oTZvE533.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1586, 66809, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoECAG62kAAIGfhiYAFY702.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1587, 66809, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEKAKJgfAAMNTO8wM98437.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1588, 66809, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiU8FswoESAZoY3AAE4qJbrK28075.jpg?width=750&height=400', 0)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1589, 66809, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEWAV2yaAAJut27cWJY213.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1590, 66809, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoEeAEPavAABxfjXxuOs711.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1591, 66809, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1592, 65502, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiWiFuwa-WAD91dAAV2FGCpsKs315.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1593, 65502, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiLlFuwa96ANGhjAARqw8-C12Q512.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1594, 65502, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1595, 65502, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiLkFuwa-iAdc5MAAG1lRbyqo0001.jpg?width=750&height=914', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1596, 65502, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiLlFuwa-qANUQFAAGroeTHm6U673.jpg?width=750&height=913', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1597, 65502, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiU8Fuwa-yAFnBSAAFk23JlFYk708.jpg?width=750&height=914', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1598, 65502, N'https://resource.pagoda.com.cn/group1/M00/0B/79/CmiWiFuwa-6AJN3TAAFLcoZTjyU571.jpg?width=750&height=913', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1599, 65502, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1600, 65411, N'https://resource.pagoda.com.cn/group1/M00/1C/D4/CmiWiF6qm8GATONIAAVEQ9WIqRY441.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1601, 65411, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1602, 65411, N'https://resource.pagoda.com.cn/group1/M00/1C/42/CmiWa16qm_GANjb-AB_OXL3_2VM795.jpg?width=750&height=5583', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1603, 65411, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1604, 64818, N'https://resource.pagoda.com.cn/group1/M00/08/C0/CmiLlFs8eQyAVVOPAAPLaJnqtiQ070.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1605, 64818, N'https://resource.pagoda.com.cn/group1/M00/0E/E1/CmiLlFyi2yKADzJ2AAOV_RSoHQI014.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1606, 64818, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1607, 64818, N'https://resource.pagoda.com.cn/group1/M00/07/F8/CmiWa1ssstmACdsoAAHHthnRcaY477.jpg?width=750&height=1191', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1608, 64818, N'https://resource.pagoda.com.cn/group1/M00/07/F8/CmiWiFssstuAeisjAAHes7W7El4622.jpg?width=750&height=1191', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1609, 64818, N'https://resource.pagoda.com.cn/group1/M00/07/F7/CmiLkFssst6ALYfjAAF2rpRvHZg375.jpg?width=750&height=1190', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1610, 64818, N'https://resource.pagoda.com.cn/group1/M00/07/F8/CmiLlFsssuCANAtyAAHz7gyyFaw225.jpg?width=750&height=1191', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1611, 64818, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1612, 64019, N'https://resource.pagoda.com.cn/group1/M02/33/75/CmiWiF-iEy-AIU_ZAASaj5EVlRo680.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1613, 64019, N'https://resource.pagoda.com.cn/group1/M00/2D/F4/CmiLkF8iMjWALv2HAADbeXDaGAY035.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1614, 64019, N'https://resource.pagoda.com.cn/group1/M1F/33/44/CmiLkF-iEz2Ab74MAASaj5EVlRo194.jpg?width=800&height=800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1615, 64019, N'https://resource.pagoda.com.cn/group1/M07/30/E5/CmiLlF9jJ-uAKc11AAueLp026A0918.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1616, 63717, N'https://resource.pagoda.com.cn/group1/M00/1C/D5/CmiWiF6qns2AUk6FAAQ1qx5tBZM541.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1617, 63717, N'https://resource.pagoda.com.cn/group1/M00/1C/D4/CmiLkF6qnsmAXOj0AALb7Re_P6s714.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1618, 63717, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1619, 63717, N'https://resource.pagoda.com.cn/group1/M00/1C/D3/CmiU8F6qnt-AQ70jAB_OXL3_2VM761.jpg?width=750&height=5583', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1620, 63717, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1621, 63649, N'https://resource.pagoda.com.cn/group1/M00/22/B8/CmiLkF7i7YmADFDtAARbNRjrZgA075.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1622, 63649, N'https://resource.pagoda.com.cn/group1/M00/22/B7/CmiLlF7i7Y2ARD1mAANUdEkLRzI379.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1623, 63649, N'https://resource.pagoda.com.cn/group1/M00/22/B8/CmiLkF7i7ZGAB5yPAAQzoI82AZ8351.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1624, 63649, N'https://resource.pagoda.com.cn/group1/M00/22/B6/CmiU8F7i7ZeAIzZxAATLbvbYUAg553.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1625, 63649, N'https://resource.pagoda.com.cn/group1/M00/22/B7/CmiLlF7i7ZqAbObpAAZOqHLyEhY878.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1626, 63649, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1627, 63649, N'https://resource.pagoda.com.cn/group1/M10/30/90/CmiLkF9gmzKAf63-AJ0rQUxz3Rg495.jpg?width=790&height=10915', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1628, 63649, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1629, 63631, N'https://resource.pagoda.com.cn/group1/M00/0C/C6/CmiLkFwAp5yAUb2MAAV2FGCpsKs877.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1630, 63631, N'https://resource.pagoda.com.cn/group1/M00/0C/C6/CmiLlFwAp5-AYV3HAARqw8-C12Q876.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1631, 63631, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1632, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiU8Fs5_OyAQ_VHAAHGSAcKWvY960.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1633, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiWa1s5_O6AfMOOAAJhrJOzmC0614.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1634, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiLlFs5_QqAMtyeAAJ54Dx2l9g517.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1635, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiWa1s5_QuAYm_PAAE0SAhfSzg689.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1636, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiWiFs5_Q2AW6EUAAHB43uTiVA895.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1637, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiLkFs5_Q-ADqRqAALIFmtvDB4683.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1638, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiLlFs5_RGAZiGsAAGR0KGlOF4572.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1639, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiU8Fs5_RKACv-YAAIkzhErXSs972.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1640, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiWa1s5_RSAWElTAABvtcekIr8044.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1641, 63631, N'https://resource.pagoda.com.cn/group1/M00/08/B1/CmiWiFs5_RWAIEhfAAAGRRyhII8908.jpg?width=750&height=54', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1642, 63631, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1643, 63300, N'https://resource.pagoda.com.cn/group1/M00/1B/06/CmiWa16Wy2-AAWHNAAOykZXRYY4326.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1644, 63300, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiWiF6Wy2-Abe1lAAWmqohYN7w796.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1645, 63300, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiLkF6Wy2yAUectAAQ47B5cMI0577.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1646, 63300, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1647, 63300, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxmiAPYOCAKzTonFVjDY790.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1648, 63300, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1649, 63298, N'https://resource.pagoda.com.cn/group1/M00/1B/06/CmiWa16Wy2-AAWHNAAOykZXRYY4326.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1650, 63298, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiWiF6Wy2-Abe1lAAWmqohYN7w796.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1651, 63298, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiLkF6Wy2yAUectAAQ47B5cMI0577.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1652, 63298, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1653, 63298, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxmiAPYOCAKzTonFVjDY790.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1654, 63298, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1655, 61338, N'https://resource.pagoda.com.cn/group1/M00/1B/08/CmiWa16W5vOANT68AAOykZXRYY4611.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1656, 61338, N'https://resource.pagoda.com.cn/group1/M00/1B/9A/CmiWiF6W5vKAcm7QAAWmqohYN7w792.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1657, 61338, N'https://resource.pagoda.com.cn/group1/M00/1B/9A/CmiLkF6W5u6AX5rSAAQ47B5cMI0749.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1658, 61338, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1659, 61338, N'https://resource.pagoda.com.cn/group1/M00/1A/0A/CmiWa16CxlSAIjR8AKzTonFVjDY234.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1660, 61338, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1661, 57298, N'https://resource.pagoda.com.cn/group1/M00/0C/F0/CmiLlFwN06iAHVc5AAx1PjxnuwM038.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1662, 57298, N'https://resource.pagoda.com.cn/group1/M00/0C/F0/CmiU8FwN06uAeg_EAAnWbIw88qA984.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1663, 57298, N'https://resource.pagoda.com.cn/group1/M00/0C/F0/CmiWa1wN062AeO94AAZF5bG1_es341.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1664, 57298, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1665, 57298, N'https://resource.pagoda.com.cn/group1/M00/15/77/CmiLkF4JqfWAH3tEAEWYiTPjfNM335.png?width=750&height=6816', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1666, 57298, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1667, 56460, N'https://resource.pagoda.com.cn/group1/M0E/31/29/CmiU8F9of2CAa1rsAGetdqdKopo930.jpg?width=5757&height=4301', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1668, 56460, N'https://resource.pagoda.com.cn/group1/M00/1B/06/CmiWa16Wy2-AAWHNAAOykZXRYY4326.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1669, 56460, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiWiF6Wy2-Abe1lAAWmqohYN7w796.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1670, 56460, N'https://resource.pagoda.com.cn/group1/M00/1B/98/CmiLkF6Wy2yAUectAAQ47B5cMI0577.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1671, 56460, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1672, 56460, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxmiAPYOCAKzTonFVjDY790.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1673, 56460, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1674, 55929, N'https://resource.pagoda.com.cn/group1/M1F/31/88/CmiWiF9xXKeAGky9AADnLxgBPeI962.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1675, 55929, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiU8F4DJN-ASYgaAADmrhNofjQ629.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1676, 55929, N'https://resource.pagoda.com.cn/group1/M00/15/51/CmiWa14DJOmARuoEAAGNT-iSyyA101.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1677, 55929, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiLkF4DJOmAWgX1AAIPHiGGrCY448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1678, 55929, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1679, 55929, N'https://resource.pagoda.com.cn/group1/M00/14/4A/CmiLkF3SOkiAYlXmADJHbfmjz_E476.png?width=750&height=8848', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1680, 55929, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1681, 55928, N'https://resource.pagoda.com.cn/group1/M1D/31/88/CmiWiF9xXNWASHw3AAIsWN5kVuo151.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1682, 55928, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiU8F4DJN-ASYgaAADmrhNofjQ629.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1683, 55928, N'https://resource.pagoda.com.cn/group1/M00/15/51/CmiWa14DJOmARuoEAAGNT-iSyyA101.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1684, 55928, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiLkF4DJOmAWgX1AAIPHiGGrCY448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1685, 55928, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1686, 55928, N'https://resource.pagoda.com.cn/group1/M00/14/4A/CmiLkF3SOkiAYlXmADJHbfmjz_E476.png?width=750&height=8848', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1687, 55928, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1688, 55927, N'https://resource.pagoda.com.cn/group1/M14/31/88/CmiWiF9xXBOAHuzzAAEW6jNFt-Q992.jpg?width=800&height=800', 1)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1689, 55927, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiU8F4DJN-ASYgaAADmrhNofjQ629.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1690, 55927, N'https://resource.pagoda.com.cn/group1/M00/15/51/CmiWa14DJOmARuoEAAGNT-iSyyA101.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1691, 55927, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiLkF4DJOmAWgX1AAIPHiGGrCY448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1692, 55927, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1693, 55927, N'https://resource.pagoda.com.cn/group1/M00/14/4A/CmiLkF3SOkiAYlXmADJHbfmjz_E476.png?width=750&height=8848', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1694, 55927, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1695, 55914, N'https://resource.pagoda.com.cn/group1/M00/1A/03/CmiWa16Bw4SAEkSbAARCcdThpoc437.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1696, 55914, N'https://resource.pagoda.com.cn/group1/M00/1A/95/CmiWiF6Bw4OAAtDEAAMIOGMPcbE067.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1697, 55914, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiLlFsRIdaAbFYGAAZK6a_0KYk876.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1698, 55914, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiU8FsRIdeAQNmKAAQzvbCQvXc758.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1699, 55914, N'https://resource.pagoda.com.cn/group1/M00/01/13/CmiLkFg-avSAP1t4AAIePCsBtU0293.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1700, 55914, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1701, 55914, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoDqAfBw3AAHLQP9_oTM302.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1702, 55914, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoDuAcGcVAAKWjdjLyGI462.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1703, 55914, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWa1swoD2AZcEcAAJ4KouQnkY875.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1704, 55914, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoD6AEglkAAExo6oTZvE533.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1705, 55914, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoECAG62kAAIGfhiYAFY702.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1706, 55914, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEKAKJgfAAMNTO8wM98437.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1707, 55914, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiU8FswoESAZoY3AAE4qJbrK28075.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1708, 55914, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEWAV2yaAAJut27cWJY213.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1709, 55914, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoEeAEPavAABxfjXxuOs711.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1710, 55914, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1711, 55038, N'https://resource.pagoda.com.cn/group1/M00/19/5B/CmiWa154e6OAc8csAAMSi2A6aQY555.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1712, 55038, N'https://resource.pagoda.com.cn/group1/M00/19/ED/CmiWiF54e6KAYMf5AAMYjtfJI54101.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1713, 55038, N'https://resource.pagoda.com.cn/group1/M00/08/2D/CmiU8FsyBN-AC2R7AAQnbKXZonA686.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1714, 55038, N'https://resource.pagoda.com.cn/group1/M00/08/2D/CmiLkFsyBOCAfOjYAAKBi0PukS0239.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1715, 55038, N'https://resource.pagoda.com.cn/group1/M00/05/67/CmiLkFqftoSAQ7zoAARSgVdnDjk360.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1716, 55038, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1717, 55038, N'https://resource.pagoda.com.cn/group1/M03/33/5D/CmiWa1-uQiaAOdHNABNBVUtS8nw224.jpg?width=750&height=3943', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1718, 55038, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1719, 55034, N'https://resource.pagoda.com.cn/group1/M00/19/8E/CmiWiF5zG5OAOvbcAAMOTLYAHeM350.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1720, 55034, N'https://resource.pagoda.com.cn/group1/M00/19/8D/CmiU8F5zG4yAF5wrAAJNRCM_nFs743.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1721, 55034, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1722, 55034, N'https://resource.pagoda.com.cn/group1/M00/1D/5D/CmiWa16753GAAQp0AB_OXL3_2VM491.jpg?width=750&height=5583', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1723, 55034, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1724, 55033, N'https://resource.pagoda.com.cn/group1/M00/19/E6/CmiU8F54We2AS1S8AAOaeLVi8sE591.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1725, 55033, N'https://resource.pagoda.com.cn/group1/M00/19/E7/CmiLlF54WeWANam5AAKUP9qnAK0905.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1726, 55033, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1727, 55033, N'https://resource.pagoda.com.cn/group1/M00/19/E6/CmiU8F54WgaAGjdGAB_OXL3_2VM781.jpg?width=750&height=5583', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1728, 55033, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1729, 53459, N'https://resource.pagoda.com.cn/group1/M00/16/88/CmiLkF41UzqAUKn-AAOCYJdPZtA720.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1730, 53459, N'https://resource.pagoda.com.cn/group1/M05/2E/D4/CmiWa19DNw2AH5-QACFLqP7mUgE479.jpg?width=750&height=6690', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1731, 53459, N'https://resource.pagoda.com.cn/group1/M00/13/DC/CmiWa124702ADc1FAALIuSLfkqw41.jpeg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1732, 50979, N'https://resource.pagoda.com.cn/group1/M00/15/5A/CmiLkF4EggyAa0vkAAPhUiXaXTI725.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1733, 50979, N'https://resource.pagoda.com.cn/group1/M00/15/59/CmiLlF4EghCABYQSAAQk8ZBa-zE889.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1734, 50979, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1735, 50979, N'https://resource.pagoda.com.cn/group1/M00/15/D2/CmiU8F4YKUiAA8KWADCAwMTXOTI418.png?width=750&height=5000', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1736, 50979, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1737, 50106, N'https://resource.pagoda.com.cn/group1/M00/17/03/CmiLlF5A3YyAYMbMAAa44hl4HIQ345.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1738, 50106, N'https://resource.pagoda.com.cn/group1/M00/17/04/CmiWiF5A3Z2AN2o_AATH7EDPA7Q261.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1739, 50106, N'https://resource.pagoda.com.cn/group1/M00/17/03/CmiU8F5A3ZOAHQ2KAAXdh-kFOLE152.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1740, 50106, N'https://resource.pagoda.com.cn/group1/M00/17/04/CmiLkF5A3ZyAYRPjAANAITnYHpQ593.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1741, 50106, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1742, 50106, N'https://resource.pagoda.com.cn/group1/M05/30/9E/CmiLkF9hyNyAKFjQAAvO_mg2fhs058.jpg?width=750&height=1194', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1743, 50106, N'https://resource.pagoda.com.cn/group1/M11/30/CE/CmiLlF9hyOSARFZ6ABSLSSDx3LU308.jpg?width=750&height=1455', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1744, 50106, N'https://resource.pagoda.com.cn/group1/M10/30/CE/CmiLlF9hyOaAD70JABAjNwj0xQA214.jpg?width=750&height=1335', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1745, 50106, N'https://resource.pagoda.com.cn/group1/M0E/30/3D/CmiWa19hyOuABoGXABZ46gbFbsA835.jpg?width=750&height=1790', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1746, 50106, N'https://resource.pagoda.com.cn/group1/M0F/30/CB/CmiU8F9hyOeAJhrsAA4FhjFttM8532.jpg?width=750&height=1120', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1747, 50106, N'https://resource.pagoda.com.cn/group1/M1F/30/9E/CmiLkF9hyOeAN-iSABOpo4kPxrg839.jpg?width=750&height=1626', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1748, 50106, N'https://resource.pagoda.com.cn/group1/M15/30/CB/CmiU8F9hyOuASezUAAv2TLF8_Rk086.jpg?width=750&height=1184', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1749, 50106, N'https://resource.pagoda.com.cn/group1/M07/30/D0/CmiWiF9hyPGAfY2sAAuAHQuU9KA825.jpg?width=750&height=1203', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1750, 50106, N'https://resource.pagoda.com.cn/group1/M11/30/3D/CmiWa19hyPWARNxHAA12gDPXQMQ703.jpg?width=750&height=1464', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1751, 50106, N'https://resource.pagoda.com.cn/group1/M16/30/9E/CmiLkF9hyO-AewS2AA5k6D7zQYs512.jpg?width=750&height=1664', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1752, 50106, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1753, 49683, N'https://resource.pagoda.com.cn/group1/M00/16/C9/CmiU8F48ClWAGErWAAKP1Ydu94E436.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1754, 49683, N'https://resource.pagoda.com.cn/group1/M00/16/CA/CmiWiF48CmCAOQ6GAALRrsbXEpM467.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1755, 49683, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1756, 49683, N'https://resource.pagoda.com.cn/group1/M1C/32/9B/CmiWa1-ZQ6SAYAl_AAg4799kCMg413.jpg?width=750&height=3688', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1757, 49683, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1758, 47706, N'https://resource.pagoda.com.cn/group1/M18/32/F1/CmiWa1-jnoqAb4x2AAFDNET0PUs200.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1759, 47706, N'https://resource.pagoda.com.cn/group1/M00/15/6C/CmiLkF4HagyAdOQMAAN7gFmqb_Y882.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1760, 47706, N'https://resource.pagoda.com.cn/group1/M00/15/6B/CmiLlF4Hag-AAJivAAMp86n4Z28526.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1761, 47706, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1762, 47706, N'https://resource.pagoda.com.cn/group1/M00/15/6C/CmiWiF4HajeAWe78AA4soOdBby8296.jpg?width=750&height=2911', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1763, 47706, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1764, 47266, N'https://resource.pagoda.com.cn/group1/M19/33/2A/CmiWa1-qEsuAbur8AAEjVnziLSY230.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1765, 47266, N'https://resource.pagoda.com.cn/group1/M00/0D/CE/CmiLlFxQFiKALbn0AADITJGfzkQ592.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1766, 47266, N'https://resource.pagoda.com.cn/group1/M00/0D/CE/CmiU8FxQFiSAKn_LAACljEKvYn8422.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1767, 47266, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1768, 47266, N'https://resource.pagoda.com.cn/group1/M00/0E/C0/CmiLlFyZo42AYw41ABRLgO7IGNk529.jpg?width=750&height=3661', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1769, 47266, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1770, 47009, N'https://resource.pagoda.com.cn/group1/M00/15/51/CmiWa14DJHCAZSAGAAIzAolo3Ok001.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1771, 47009, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiWiF4DJHGAEVCBAADFDssUxjk181.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1772, 47009, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiLkF4DJG2AMAuVAADsoSb-gUw854.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1773, 47009, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1774, 47009, N'https://resource.pagoda.com.cn/group1/M00/1D/EF/CmiLkF676biAWjUnADsxY04vLTQ260.png?width=750&height=6470', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1775, 47009, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1776, 46470, N'https://resource.pagoda.com.cn/group1/M00/15/4E/CmiWiF4DAgmAL-C2AAM0E8oulU8399.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1777, 46470, N'https://resource.pagoda.com.cn/group1/M00/15/4E/CmiLkF4DAgWAeJ_VAAcsNrJv16w545.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1778, 46470, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1779, 46470, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1780, 46279, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiLlF4DKCWAJuaOAAIty9_ppqE891.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1781, 46279, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiU8F4DKCqAXU0WAAE7AcAHPCM564.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1782, 46279, N'https://resource.pagoda.com.cn/group1/M00/15/51/CmiWa14DKDSAROO8AADsYqZ_m3g717.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1783, 46279, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1784, 46279, N'https://resource.pagoda.com.cn/group1/M00/15/59/CmiWa14EXUCATfHrACyo2qbBcF8357.jpg?width=750&height=7172', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1785, 46279, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1786, 46119, N'https://resource.pagoda.com.cn/group1/M1D/30/E0/CmiU8F9jEP2AaNgfAAQ6WFW3pGk770.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1787, 46119, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLlFsWQhaAfl1JAAQrjKMrIHc831.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1788, 46119, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiU8FsWQheAafpXAALZM-qqX78263.jpg?width=750&height=800', 1)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1789, 46119, N'https://resource.pagoda.com.cn/group1/M00/1D/58/CmiLkF60yYOAM4fcAATEU4Uh6Kw413.jpg?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1790, 46119, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1791, 46119, N'https://resource.pagoda.com.cn/group1/M00/15/26/CmiWa138JnSAR7jDACt3TRR1Ia8301.png?width=750&height=3424', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1792, 46119, N'https://resource.pagoda.com.cn/group1/M00/1D/F6/CmiWiF68tKCAaC0NADlj2G362w0899.jpg?width=750&height=8930', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1793, 46119, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1794, 44920, N'https://resource.pagoda.com.cn/group1/M00/15/4D/CmiWa14C1zGAJ3D8AAIeHyoZEq8572.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1795, 44920, N'https://resource.pagoda.com.cn/group1/M00/15/4C/CmiWiF4C1zCAeDKPAADlKZz68FI706.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1796, 44920, N'https://resource.pagoda.com.cn/group1/M00/13/B5/CmiLlF2upgiAN_NHAAa0H06wR1A023.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1797, 44920, N'https://resource.pagoda.com.cn/group1/M00/13/B5/CmiU8F2upgyACTC3AAMyrZNh6FQ268.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1798, 44920, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1799, 44920, N'https://resource.pagoda.com.cn/group1/M00/15/0D/CmiWiF34hl2APdBLADQZjMZ1MuQ234.jpg?width=750&height=6096', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1800, 44920, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1801, 44633, N'https://resource.pagoda.com.cn/group1/M0F/31/D6/CmiLlF98YCqAYLSXAAM-AWHuOec34.jpeg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1802, 44633, N'https://resource.pagoda.com.cn/group1/M00/15/4D/CmiWiF4C3QyAbniEAAL_7xWdfWw379.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1803, 44633, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1804, 44633, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1805, 43402, N'https://resource.pagoda.com.cn/group1/M00/15/4E/CmiLkF4DAluAEYwAAALN9vJiYxo170.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1806, 43402, N'https://resource.pagoda.com.cn/group1/M00/15/4D/CmiLlF4DAl6AVmVGAAnVLOCOC8g634.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1807, 43402, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1808, 43402, N'https://resource.pagoda.com.cn/group1/M00/16/0E/CmiWiF4hTDeANg7QAEuSUGCVRTo885.png?width=750&height=7400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1809, 43402, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1810, 43387, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiU8F4DJN-ASYgaAADmrhNofjQ629.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1811, 43387, N'https://resource.pagoda.com.cn/group1/M00/15/51/CmiWa14DJOmARuoEAAGNT-iSyyA101.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1812, 43387, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiLkF4DJOmAWgX1AAIPHiGGrCY448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1813, 43387, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1814, 43387, N'https://resource.pagoda.com.cn/group1/M00/14/4A/CmiLkF3SOkiAYlXmADJHbfmjz_E476.png?width=750&height=8848', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1815, 43387, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1816, 43300, N'https://resource.pagoda.com.cn/group1/M00/15/5A/CmiLkF4EggyAa0vkAAPhUiXaXTI725.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1817, 43300, N'https://resource.pagoda.com.cn/group1/M00/15/59/CmiLlF4EghCABYQSAAQk8ZBa-zE889.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1818, 43300, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1819, 43300, N'https://resource.pagoda.com.cn/group1/M00/15/D2/CmiU8F4YKUiAA8KWADCAwMTXOTI418.png?width=750&height=5000', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1820, 43300, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1821, 43252, N'https://resource.pagoda.com.cn/group1/M04/33/E9/CmiLlF-t63KAVYaxAAPlC_BKQts474.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1822, 43252, N'https://resource.pagoda.com.cn/group1/M00/14/29/CmiWiF3LazOAMBzwAAEaarPGrtg100.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1823, 43252, N'https://resource.pagoda.com.cn/group1/M00/14/29/CmiLkF3LazGAdDG6AADSiie-ygw584.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1824, 43252, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1825, 43252, N'https://resource.pagoda.com.cn/group1/M1F/32/B2/CmiLkF-RV8aAHmkrAAeOoDZjQHI218.jpg?width=750&height=5071', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1826, 43252, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1827, 39968, N'https://resource.pagoda.com.cn/group1/M00/15/50/CmiLkF4DJBKAc-eGAALKF19wSUQ064.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1828, 39968, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiLlF4DJBWAO7I0AAD1QH5JhR0165.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1829, 39968, N'https://resource.pagoda.com.cn/group1/M00/15/4F/CmiU8F4DJBuAEyhFAACf6opoj7w123.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1830, 39968, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1831, 39968, N'https://resource.pagoda.com.cn/group1/M00/15/76/CmiU8F4JqbCAZbhVADs1Er2diqU088.png?width=750&height=6152', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1832, 39968, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1833, 39853, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiWa1sWQoaAPpcxAAPbjqv99dU745.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1834, 39853, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiWiFsWQoeAZG2uAAPfVUkxnqI440.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1835, 39853, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1836, 39853, N'https://resource.pagoda.com.cn/group1/M00/12/B9/CmiU8F1w1tuADJMCABC35c3cLLM442.jpg?width=750&height=3065', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1837, 39853, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1838, 37718, N'https://resource.pagoda.com.cn/group1/M01/32/ED/CmiLkF-XxyiAAKevAAZrpydKX5I153.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1839, 37718, N'https://resource.pagoda.com.cn/group1/M00/07/61/CmiLlFsXnjKAJnLOAAOBlH0A3f0743.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1840, 37718, N'https://resource.pagoda.com.cn/group1/M00/07/61/CmiU8FsXnjOAAEYcAAN8WvDE9hk671.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1841, 37718, N'https://resource.pagoda.com.cn/group1/M00/00/6C/CmiLkFfGUhiAdNeuAAEeL_Uoe80317.jpg?width=750&height=421', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1842, 37718, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1843, 37718, N'https://resource.pagoda.com.cn/group1/M00/12/4F/CmiU8F1bryuAJzJoAB_OXL3_2VM557.jpg?width=750&height=5583', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1844, 37718, N'https://resource.pagoda.com.cn/group1/M00/1D/F5/CmiLlF68szmAN7avAA9L3uzhFXI605.png?width=750&height=2236', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1845, 37718, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1846, 37708, N'https://resource.pagoda.com.cn/group1/M00/12/4D/CmiLkF1baHaAEIkcAAPSUhENSno113.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1847, 37708, N'https://resource.pagoda.com.cn/group1/M00/12/4C/CmiU8F1baH-ABDJKAAPfmFs1SH4776.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1848, 37708, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiLlFsRIdaAbFYGAAZK6a_0KYk876.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1849, 37708, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiU8FsRIdeAQNmKAAQzvbCQvXc758.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1850, 37708, N'https://resource.pagoda.com.cn/group1/M00/01/13/CmiLkFg-avSAP1t4AAIePCsBtU0293.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1851, 37708, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1852, 37708, N'https://resource.pagoda.com.cn/group1/M00/12/50/CmiWiF1br1CASnRoAB_OXL3_2VM073.jpg?width=750&height=5583', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1853, 37708, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoDqAfBw3AAHLQP9_oTM302.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1854, 37708, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoDuAcGcVAAKWjdjLyGI462.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1855, 37708, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWa1swoD2AZcEcAAJ4KouQnkY875.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1856, 37708, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoD6AEglkAAExo6oTZvE533.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1857, 37708, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoECAG62kAAIGfhiYAFY702.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1858, 37708, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEKAKJgfAAMNTO8wM98437.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1859, 37708, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiU8FswoESAZoY3AAE4qJbrK28075.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1860, 37708, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEWAV2yaAAJut27cWJY213.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1861, 37708, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoEeAEPavAABxfjXxuOs711.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1862, 37708, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1863, 33882, N'https://resource.pagoda.com.cn/group1/M00/10/EE/CmiWa10VtbCAdg3aAANBDsziUoo596.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1864, 33882, N'https://resource.pagoda.com.cn/group1/M00/10/EE/CmiWa10VtbKAXq_oAAPBmfOS6ZQ703.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1865, 33882, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1866, 33882, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1867, 32110, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLkFuiFaiAaTvZAARoExEztTE218.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1868, 32110, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiWiFuiFaaAH_DfAAPjpeoQsvs301.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1869, 32110, N'https://resource.pagoda.com.cn/group1/M00/22/B5/CmiU8F7i61WAXianAAgnwciRsxM457.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1870, 32110, N'https://resource.pagoda.com.cn/group1/M00/22/B7/CmiWiF7i61yATqG4AAdrR3Y4KWg400.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1871, 32110, N'https://resource.pagoda.com.cn/group1/M00/22/B6/CmiLlF7i61qATi3rAAY_43dTPjc718.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1872, 32110, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1873, 32110, N'https://resource.pagoda.com.cn/group1/M00/12/AE/CmiLlF1vM8OAX7KOACBGGjV6kyg512.jpg?width=750&height=6342', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1874, 32110, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLkFuiFbOAENEHAALKHYhX_YU142.jpg?width=750&height=710', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1875, 32110, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLlFuiFbWAfaypAAMijwgXWwM089.jpg?width=750&height=706', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1876, 32110, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiU8FuiFbeARWwqAAL0My4cY50437.jpg?width=750&height=714', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1877, 32110, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiWa1uiFbiAb2JkAALOHfVbh00600.jpg?width=750&height=700', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1878, 32110, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiWiFuiFbqAfl8fAAQLoRwPVUw715.jpg?width=750&height=714', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1879, 32110, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLkFuiFbyATRfRAAP4J0WhBFU979.jpg?width=750&height=704', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1880, 32110, N'https://resource.pagoda.com.cn/group1/M00/0B/37/CmiLlFuiFb2AFwR_AAMbYYuNGVY559.jpg?width=750&height=662', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1881, 32110, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1882, 31335, N'https://resource.pagoda.com.cn/group1/M00/10/2D/CmiLkFzrjtmAMLqoAAKj5XcM-nY004.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1883, 31335, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLkFsWRcmAWNQSAATKbG-wzi0337.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1884, 31335, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiLlFsWRcqASM6WAAQzkxeSgwM401.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1885, 31335, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1886, 31335, N'https://resource.pagoda.com.cn/group1/M00/22/27/CmiWa17i8NmADBVwAAhvFtzuxD0946.jpg?width=750&height=5234', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1887, 31335, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1888, 31319, N'https://resource.pagoda.com.cn/group1/M00/10/2D/CmiWiFzriemAA39_AARZlMuCYN4840.jpg?width=750&height=800', 1)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1889, 31319, N'https://resource.pagoda.com.cn/group1/M00/10/2E/CmiWa1zriXeAaECvAAMrJZTmVRA914.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1890, 31319, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1891, 31319, N'https://resource.pagoda.com.cn/group1/M00/19/E9/CmiLlF54a8GAMXYRAB_OXL3_2VM199.jpg?width=750&height=5583', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1892, 31319, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1893, 31307, N'https://resource.pagoda.com.cn/group1/M00/10/2D/CmiLkFzrhLSAQkavAAR3Y9ReT-Q665.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1894, 31307, N'https://resource.pagoda.com.cn/group1/M00/10/2E/CmiWa1zrhNeAE3lsAAUCdSZcZZc889.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1895, 31307, N'https://resource.pagoda.com.cn/group1/M00/10/2D/CmiWiFzrhOeAJb9GAAZB_FtKs_I065.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1896, 31307, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1897, 31307, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1898, 31296, N'https://resource.pagoda.com.cn/group1/M00/10/2D/CmiWa1zrfz-AMIOhAAQ9aUrHA0Y004.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1899, 31296, N'https://resource.pagoda.com.cn/group1/M00/10/2C/CmiLlFzrf0CAKwIfAAMquFwYBSw442.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1900, 31296, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1901, 31296, N'https://resource.pagoda.com.cn/group1/M00/12/4F/CmiLlF1bsriALQAJAB_OXL3_2VM499.jpg?width=750&height=5583', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1902, 31296, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1903, 29640, N'https://resource.pagoda.com.cn/group1/M00/1C/9B/CmiLkF6nii-AerAkAAQ47B5cMI0152.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1904, 29640, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiLlF6nijKALCKaAAWmqohYN7w448.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1905, 29640, N'https://resource.pagoda.com.cn/group1/M00/1C/9A/CmiU8F6nijeAa_v1AAOykZXRYY4894.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1906, 29640, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1907, 29640, N'https://resource.pagoda.com.cn/group1/M00/1A/9C/CmiLkF6CxiqAXWKnAKzTonFVjDY382.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1908, 29640, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1909, 29588, N'https://resource.pagoda.com.cn/group1/M00/0F/AF/CmiWa1zScYOABPvlAAQVkD-i6FQ820.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1910, 29588, N'https://resource.pagoda.com.cn/group1/M00/0F/AE/CmiU8FzScIyAIHWuAAQUYEKwWDo020.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1911, 29588, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1912, 29588, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1913, 23321, N'https://resource.pagoda.com.cn/group1/M00/0A/DE/CmiWa1uQ1ziAMNjxAAT3HS5LEek604.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1914, 23321, N'https://resource.pagoda.com.cn/group1/M00/0A/DE/CmiU8FuQ1zaAH7IdAAMTU0bQYuo801.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1915, 23321, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1916, 23321, N'https://resource.pagoda.com.cn/group1/M00/1D/5B/CmiWa1670C6AEBgEABKtNXN37Z0093.jpg?width=750&height=3744', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1917, 23321, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1918, 23069, N'https://resource.pagoda.com.cn/group1/M00/0C/F0/CmiLlFwN06iAHVc5AAx1PjxnuwM038.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1919, 23069, N'https://resource.pagoda.com.cn/group1/M00/0C/F0/CmiU8FwN06uAeg_EAAnWbIw88qA984.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1920, 23069, N'https://resource.pagoda.com.cn/group1/M00/0C/F0/CmiWa1wN062AeO94AAZF5bG1_es341.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1921, 23069, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1922, 23069, N'https://resource.pagoda.com.cn/group1/M00/15/77/CmiLkF4JqfWAH3tEAEWYiTPjfNM335.png?width=750&height=6816', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1923, 23069, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1924, 22760, N'https://resource.pagoda.com.cn/group1/M00/0C/A5/CmiLlFv3fveARNYCAAVke5G-NEY815.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1925, 22760, N'https://resource.pagoda.com.cn/group1/M00/0C/A5/CmiU8Fv3fvmAEXPNAAM0cCgLNGs386.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1926, 22760, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1927, 22760, N'https://resource.pagoda.com.cn/group1/M00/22/A3/CmiWa17lpV2ADH6eABWkOF3_p5U714.jpg?width=750&height=3500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1928, 22760, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1929, 21335, N'https://resource.pagoda.com.cn/group1/M00/13/7A/CmiWa12ewFOAEw0WAANMb9u8SrI505.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1930, 21335, N'https://resource.pagoda.com.cn/group1/M00/13/79/CmiWiF2ewFWAN9VBAAKtr6s-S8w910.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1931, 21335, N'https://resource.pagoda.com.cn/group1/M00/13/78/CmiU8F2ewByAc1H_AAesLBOfByQ062.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1932, 21335, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1933, 21335, N'https://resource.pagoda.com.cn/group1/M04/30/E6/CmiLlF9jNWGAASOoAB-GbjzZaVs213.jpg?width=750&height=4747', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1934, 21335, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1935, 20676, N'https://resource.pagoda.com.cn/group1/M00/0C/02/CmiLkFvRdrWAMZUBAASfaTQzkoE927.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1936, 20676, N'https://resource.pagoda.com.cn/group1/M00/0C/02/CmiLlFvRdriAC2UdAAUCdSZcZZc286.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1937, 20676, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1938, 20676, N'https://resource.pagoda.com.cn/group1/M00/0C/02/CmiU8FvRdsmAQDh8AAHdJXU4xhM668.jpg?width=750&height=980', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1939, 20676, N'https://resource.pagoda.com.cn/group1/M00/0C/02/CmiWa1vRdsuAciumAAGEbibNI44081.jpg?width=750&height=980', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1940, 20676, N'https://resource.pagoda.com.cn/group1/M00/0C/02/CmiWiFvRds2AHHTlAAHbrLAf0FQ931.jpg?width=750&height=980', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1941, 20676, N'https://resource.pagoda.com.cn/group1/M00/0C/02/CmiLlFvRds-AIXkEAAGyMt05Lqk256.jpg?width=750&height=980', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1942, 20676, N'https://resource.pagoda.com.cn/group1/M00/0C/02/CmiU8FvRdtGAVt8KAAG4-PWVXdk986.jpg?width=750&height=980', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1943, 20676, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1944, 20186, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiU8FtQeJWAMEFzAAKPNtmNfGM786.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1945, 20186, N'https://resource.pagoda.com.cn/group1/M00/09/44/CmiLlFtQeJSATLIvAAJjYWMwITA285.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1946, 20186, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1947, 20186, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1948, 19286, N'https://resource.pagoda.com.cn/group1/M1A/32/ED/CmiLkF-Xy5uARzpwAAXfuEBeAh0160.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1949, 19286, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiLkFuQlneAKJ7OAAWAcfi1UMk026.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1950, 19286, N'https://resource.pagoda.com.cn/group1/M00/0A/DB/CmiWiFuQlnWADQL1AANuOPpcyRY788.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1951, 19286, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1952, 19286, N'https://resource.pagoda.com.cn/group1/M0E/2F/2E/CmiWa19MWCmABH6PAB9Jo9zoMxA069.jpg?width=750&height=4890', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1953, 19286, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1954, 17860, N'https://resource.pagoda.com.cn/group1/M00/09/F0/CmiWa1tqiUqAO-QcAAaJeY5BBYA669.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1955, 17860, N'https://resource.pagoda.com.cn/group1/M00/09/F1/CmiLlFtqiVGAVGmmAASVJ210Nj0247.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1956, 17860, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1957, 17860, N'https://resource.pagoda.com.cn/group1/M00/1D/ED/CmiWiF67zDqAL9OzABcRGNaojfs977.jpg?width=750&height=4240', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1958, 17860, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1959, 17304, N'https://resource.pagoda.com.cn/group1/M00/0C/2C/CmiLkFvaYXGAe3iGAAMJSvtQAoE764.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1960, 17304, N'https://resource.pagoda.com.cn/group1/M00/0C/2C/CmiLlFvaYXSAYNyZAAQKSQzEWek883.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1961, 17304, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1962, 17304, N'https://resource.pagoda.com.cn/group1/M0D/32/28/CmiU8F-DtP6AIa-iAB_vWdzJ_dY927.png?width=750&height=3691', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1963, 17304, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1964, 12575, N'https://resource.pagoda.com.cn/group1/M0C/33/73/CmiLlF-iE6iAEHofAAT1ptsvlxg095.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1965, 12575, N'https://resource.pagoda.com.cn/group1/M00/0C/F1/CmiWa1wN6AWAFoT7AADpFkDGKSg891.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1966, 12575, N'https://resource.pagoda.com.cn/group1/M00/13/12/CmiLlF2EbEiAOFU3ACBGGjV6kyg848.jpg?width=750&height=6342', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1967, 12575, N'https://resource.pagoda.com.cn/group1/M00/33/71/CmiU8F-iE6uAa7SfAAT1ptsvlxg770.jpg?width=800&height=800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1968, 12575, N'https://resource.pagoda.com.cn/group1/M00/0D/7C/CmiWa1w2uF2AGm9mAAlXF5oha7Q779.jpg?width=750&height=2124', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1969, 11484, N'https://resource.pagoda.com.cn/group1/M1F/33/CB/CmiU8F-rqimAVtNEAAaX3OYweL8296.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1970, 11484, N'https://resource.pagoda.com.cn/group1/M1C/33/CB/CmiU8F-rqjKAZ0JaAARWgwMgStc029.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1971, 11484, N'https://resource.pagoda.com.cn/group1/M0A/33/CB/CmiU8F-rqiyABPO8AAUos6G3glc052.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1972, 11484, N'https://resource.pagoda.com.cn/group1/M0C/33/3D/CmiWa1-rqjWAWVjoAATZ2d0uXEg562.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1973, 11484, N'https://resource.pagoda.com.cn/group1/M1F/33/CB/CmiU8F-rqjWAX4tKAARVPWIBZ2Q444.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1974, 11484, N'https://resource.pagoda.com.cn/group1/M00/2E/0F/CmiLlF8f9eCAAKPWAAK0EcILUl0741.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1975, 11484, N'https://resource.pagoda.com.cn/group1/M1E/33/92/CmiWiF-lGJGAJJBYAAyCzN5lr18102.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1976, 11484, N'https://resource.pagoda.com.cn/group1/M15/33/92/CmiWiF-lGJOAMbCiAAsCvCnu2YA362.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1977, 11484, N'https://resource.pagoda.com.cn/group1/M0E/32/FF/CmiWa1-lGJmAO-qDAAkry_GBJzU625.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1978, 11484, N'https://resource.pagoda.com.cn/group1/M1D/33/90/CmiLlF-lGJmAdGVSAAsGas_aMHg963.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1979, 11484, N'https://resource.pagoda.com.cn/group1/M0D/33/90/CmiLlF-lGJuAK58vAAx4RRIjp_Y659.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1980, 11484, N'https://resource.pagoda.com.cn/group1/M11/33/8E/CmiU8F-lGJmAHRauAAoNzaVZeiA723.jpg?width=750&height=1500', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1981, 11484, N'https://resource.pagoda.com.cn/group1/M07/33/92/CmiWiF-lGJ6AeGhYAAEMT1gKb4g255.jpg?width=750&height=242', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1982, 11484, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1983, 10369, N'https://resource.pagoda.com.cn/group1/M04/33/75/CmiWiF-iFFeAG-MoAAT6DOy8nMw875.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1984, 10369, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1985, 10369, N'https://resource.pagoda.com.cn/group1/M09/33/71/CmiU8F-iFFqANc5AAAT6DOy8nMw358.jpg?width=800&height=800', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1986, 10369, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1987, 9035, N'https://resource.pagoda.com.cn/group1/M1F/32/8C/CmiWa1-XxeyAeBrpAANufr49aFk683.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1988, 9035, N'https://resource.pagoda.com.cn/group1/M00/07/61/CmiLlFsXnjKAJnLOAAOBlH0A3f0743.jpg?width=750&height=800', 1)
GO
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1989, 9035, N'https://resource.pagoda.com.cn/group1/M00/07/61/CmiU8FsXnjOAAEYcAAN8WvDE9hk671.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1990, 9035, N'https://resource.pagoda.com.cn/group1/M00/00/6C/CmiLkFfGUhiAdNeuAAEeL_Uoe80317.jpg?width=750&height=421', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1991, 9035, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1992, 9035, N'https://resource.pagoda.com.cn/group1/M00/1D/F5/CmiLlF68szmAN7avAA9L3uzhFXI605.png?width=750&height=2236', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1993, 9035, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1994, 7522, N'https://resource.pagoda.com.cn/group1/M00/1C/9B/CmiLlF6njtiAbR-TAAPOtw0aeZY909.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1995, 7522, N'https://resource.pagoda.com.cn/group1/M00/1B/08/CmiWa16W5vOANT68AAOykZXRYY4611.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1996, 7522, N'https://resource.pagoda.com.cn/group1/M00/1B/9A/CmiWiF6W5vKAcm7QAAWmqohYN7w792.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1997, 7522, N'https://resource.pagoda.com.cn/group1/M00/1B/9A/CmiLkF6W5u6AX5rSAAQ47B5cMI0749.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1998, 7522, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (1999, 7522, N'https://resource.pagoda.com.cn/group1/M00/1A/0A/CmiWa16CxlSAIjR8AKzTonFVjDY234.jpg?width=790&height=11061', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2000, 7522, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2001, 4990, N'https://resource.pagoda.com.cn/group1/M00/33/1D/CmiLlF-Xyp-AHs8qAAVBULJcXuw553.jpg?width=800&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2002, 4990, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiWa1sWQoaAPpcxAAPbjqv99dU745.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2003, 4990, N'https://resource.pagoda.com.cn/group1/M00/07/57/CmiWiFsWQoeAZG2uAAPfVUkxnqI440.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2004, 4990, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2005, 4990, N'https://resource.pagoda.com.cn/group1/M00/12/B9/CmiU8F1w1tuADJMCABC35c3cLLM442.jpg?width=750&height=3065', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2006, 4990, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2007, 3204, N'https://resource.pagoda.com.cn/group1/M00/15/59/CmiWa14ETMCABK-3AAaJfw1v4NA938.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2008, 3204, N'https://resource.pagoda.com.cn/group1/M00/15/60/CmiLkF4Fos6AAbXzAASXNYWiXos625.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2009, 3204, N'https://resource.pagoda.com.cn/group1/M00/15/5F/CmiWiF4Ff8iADNvzACu_qVsHHwk384.JPG?width=3293&height=3293', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2010, 3204, N'https://resource.pagoda.com.cn/group1/M00/2E/0C/CmiU8F8f8o-AMKukAAKHjC5QuSQ066.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2011, 3204, N'https://resource.pagoda.com.cn/group1/M00/1D/EF/CmiLkF676QqAVZXEADMBn0XFgR4297.jpg?width=750&height=6096', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2012, 3204, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2013, 2621, N'https://resource.pagoda.com.cn/group1/M00/0D/49/CmiWiFwnrxOATBOkAANNVO7k6Tw400.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2014, 2621, N'https://resource.pagoda.com.cn/group1/M00/0D/49/CmiLkFwnrxWAQPb8AANcxPLxNeo636.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2015, 2621, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiLlFsRIdaAbFYGAAZK6a_0KYk876.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2016, 2621, N'https://resource.pagoda.com.cn/group1/M00/07/40/CmiU8FsRIdeAQNmKAAQzvbCQvXc758.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2017, 2621, N'https://resource.pagoda.com.cn/group1/M00/01/13/CmiLkFg-avSAP1t4AAIePCsBtU0293.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2018, 2621, N'https://resource.pagoda.com.cn/group1/M00/2E/0D/CmiU8F8f-oGAF-lVAAKyNdoU_1k640.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2019, 2621, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoDqAfBw3AAHLQP9_oTM302.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2020, 2621, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoDuAcGcVAAKWjdjLyGI462.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2021, 2621, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWa1swoD2AZcEcAAJ4KouQnkY875.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2022, 2621, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoD6AEglkAAExo6oTZvE533.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2023, 2621, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoECAG62kAAIGfhiYAFY702.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2024, 2621, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEKAKJgfAAMNTO8wM98437.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2025, 2621, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiU8FswoESAZoY3AAE4qJbrK28075.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2026, 2621, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiWiFswoEWAV2yaAAJut27cWJY213.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2027, 2621, N'https://resource.pagoda.com.cn/group1/M00/08/15/CmiLlFswoEeAEPavAABxfjXxuOs711.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2028, 2621, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2029, 2233, N'https://resource.pagoda.com.cn/group1/M00/07/51/CmiLlFsVGkSAQD4QAARH57pcJ-s492.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2030, 2233, N'https://resource.pagoda.com.cn/group1/M00/07/51/CmiU8FsVGkaALpoQAAPImW2bQec238.jpg?width=750&height=800', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2031, 2233, N'https://resource.pagoda.com.cn/group1/M00/01/13/CmiWiFg-ZGOAd44CAAH-TNCE7gY897.jpg?width=750&height=420', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2032, 2233, N'https://resource.pagoda.com.cn/group1/M00/2E/12/CmiWiF8f-l2AJZ0pAAKx4XoPEqY792.png?width=750&height=750', 1)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2033, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiLlFszSQqAL22AAAFSlpDvvP0556.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2034, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiWiFszSQyAe2pJAAIDUP5AY1M028.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2035, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiLkFszSQ6AeWISAAIdzw0javo397.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2036, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiWiFszSQ-AHBuqAAF7_NN69vw028.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2037, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiLlFszSRGAQ1ZcAAI4oWiCUN0622.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2038, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiWa1szSROAIbTaAAJp5ZLdF-g776.jpg?width=750&height=398', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2039, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiLkFszSRWAIHgGAAC_8XneeMs847.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2040, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiU8FszSRaAXfImAAJD3beHwDg600.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2041, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiWiFszSRiAOLWgAADfJEikTnY503.jpg?width=750&height=400', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2042, 2233, N'https://resource.pagoda.com.cn/group1/M00/08/49/CmiLlFszSRqAa0XtAAAGKNlwS9Y552.jpg?width=750&height=34', 0)
INSERT [dbo].[ProductInfo] ([Id], [ProductId], [ImgURL], [HeadPic]) VALUES (2043, 2233, N'https://resource.pagoda.com.cn/group1/M00/2D/7E/CmiWa18f8ZCAUc4OAAueLp026A0288.jpg?width=900&height=5131', 0)
SET IDENTITY_INSERT [dbo].[ProductInfo] OFF
ALTER TABLE [dbo].[FranchiseProduct] ADD  CONSTRAINT [DF_FranchiseCateProduct_Id]  DEFAULT (newid()) FOR [Id]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_DeliveryFee]  DEFAULT ((0)) FOR [DeliveryFee]
GO
ALTER TABLE [dbo].[RedEnvelopes] ADD  CONSTRAINT [DF_RedEnvelopes_Offline]  DEFAULT ((0)) FOR [Offline]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Integral]  DEFAULT ((0)) FOR [Integral]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Balance]  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_Level]  DEFAULT ((0)) FOR [Level]
GO
ALTER TABLE [dbo].[UserLocation] ADD  CONSTRAINT [DF_UserLocation_IsDefault]  DEFAULT ((0)) FOR [IsDefault]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Franchise', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Franchise', @level2type=N'COLUMN',@level2name=N'Latitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'配送费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'DeliveryFee'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'打折' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Discount'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'订单备注' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Order', @level2type=N'COLUMN',@level2name=N'Remark'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'有效期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RedEnvelopes', @level2type=N'COLUMN',@level2name=N'TermTimeSpan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否下线' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RedEnvelopes', @level2type=N'COLUMN',@level2name=N'Offline'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'联系电话' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'推荐人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Recommender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'积分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Integral'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'余额' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Balance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用户等级' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'User', @level2type=N'COLUMN',@level2name=N'Level'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'详细地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLocation', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'经度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLocation', @level2type=N'COLUMN',@level2name=N'Longitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'纬度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLocation', @level2type=N'COLUMN',@level2name=N'Latitude'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'默认地址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'UserLocation', @level2type=N'COLUMN',@level2name=N'IsDefault'
GO
USE [master]
GO
ALTER DATABASE [FruitMall] SET  READ_WRITE 
GO
