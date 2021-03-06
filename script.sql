USE [master]
GO
/****** Object:  Database [StockManagementSystemDB]    Script Date: 29-Aug-18 1:16:48 AM ******/
CREATE DATABASE [StockManagementSystemDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StockManagementSystemDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagementSystemDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StockManagementSystemDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\StockManagementSystemDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StockManagementSystemDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StockManagementSystemDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StockManagementSystemDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StockManagementSystemDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StockManagementSystemDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StockManagementSystemDB] SET  MULTI_USER 
GO
ALTER DATABASE [StockManagementSystemDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StockManagementSystemDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StockManagementSystemDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StockManagementSystemDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StockManagementSystemDB]
GO
/****** Object:  Table [dbo].[CategoryTable]    Script Date: 29-Aug-18 1:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryTable](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoryTable] PRIMARY KEY CLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyTable]    Script Date: 29-Aug-18 1:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CompanyTable](
	[companyId] [int] IDENTITY(1,1) NOT NULL,
	[companyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CompanyTable_1] PRIMARY KEY CLUSTERED 
(
	[companyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ItemTable]    Script Date: 29-Aug-18 1:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ItemTable](
	[itemId] [int] IDENTITY(1,1) NOT NULL,
	[itemName] [varchar](50) NOT NULL,
	[categoryId] [int] NULL,
	[companyId] [int] NULL,
	[reorderLevel] [int] NULL,
 CONSTRAINT [PK_ItemTable] PRIMARY KEY CLUSTERED 
(
	[itemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockInTable]    Script Date: 29-Aug-18 1:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockInTable](
	[stockInId] [int] IDENTITY(1,1) NOT NULL,
	[itemId] [int] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_StockTable] PRIMARY KEY CLUSTERED 
(
	[stockInId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StockOutTable]    Script Date: 29-Aug-18 1:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockOutTable](
	[stockOutId] [int] IDENTITY(1,1) NOT NULL,
	[itemId] [int] NULL,
	[stockOutQuantity] [int] NULL,
	[stockOutDate] [date] NULL,
	[stockOutType] [varchar](50) NULL,
 CONSTRAINT [PK_StockOutTable] PRIMARY KEY CLUSTERED 
(
	[stockOutId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTable]    Script Date: 29-Aug-18 1:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTable](
	[userId] [varchar](10) NOT NULL,
	[userName] [varchar](50) NULL,
	[userPassword] [varchar](10) NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[SearchItem]    Script Date: 29-Aug-18 1:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SearchItem]
AS
SELECT        i.itemName, i.reorderLevel, cm.companyId, ct.categoryId, i.itemId, cm.companyName, ct.categoryName
FROM            dbo.ItemTable AS i INNER JOIN
                         dbo.CompanyTable AS cm ON i.companyId = cm.companyId INNER JOIN
                         dbo.CategoryTable AS ct ON i.categoryId = ct.categoryId

GO
/****** Object:  View [dbo].[StockOutView]    Script Date: 29-Aug-18 1:16:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[StockOutView]
AS
SELECT        dbo.StockOutTable.*, dbo.ItemTable.itemName
FROM            dbo.StockOutTable INNER JOIN
                         dbo.ItemTable ON dbo.StockOutTable.itemId = dbo.ItemTable.itemId

GO
SET IDENTITY_INSERT [dbo].[CategoryTable] ON 

INSERT [dbo].[CategoryTable] ([categoryId], [categoryName]) VALUES (1, N'Stationary')
INSERT [dbo].[CategoryTable] ([categoryId], [categoryName]) VALUES (2, N'Cosmetics')
INSERT [dbo].[CategoryTable] ([categoryId], [categoryName]) VALUES (3, N'Electronics')
INSERT [dbo].[CategoryTable] ([categoryId], [categoryName]) VALUES (4, N'Kitchen Items')
INSERT [dbo].[CategoryTable] ([categoryId], [categoryName]) VALUES (3002, N'Home Items')
INSERT [dbo].[CategoryTable] ([categoryId], [categoryName]) VALUES (3003, N'Others')
SET IDENTITY_INSERT [dbo].[CategoryTable] OFF
SET IDENTITY_INSERT [dbo].[CompanyTable] ON 

INSERT [dbo].[CompanyTable] ([companyId], [companyName]) VALUES (1, N'Unilever')
INSERT [dbo].[CompanyTable] ([companyId], [companyName]) VALUES (2, N'RFL')
INSERT [dbo].[CompanyTable] ([companyId], [companyName]) VALUES (3, N'Walton')
INSERT [dbo].[CompanyTable] ([companyId], [companyName]) VALUES (4, N'Nova')
INSERT [dbo].[CompanyTable] ([companyId], [companyName]) VALUES (2002, N'ABC')
INSERT [dbo].[CompanyTable] ([companyId], [companyName]) VALUES (2003, N'XYZ')
INSERT [dbo].[CompanyTable] ([companyId], [companyName]) VALUES (2004, N'GH''s')
SET IDENTITY_INSERT [dbo].[CompanyTable] OFF
SET IDENTITY_INSERT [dbo].[ItemTable] ON 

INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (13, N'Eraser ', 1, 2, 10)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (14, N'Pencil', 1, 2, 10)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (15, N'Pen', 1, 2, 12)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (16, N'Ponds Cold Cream', 2, 1, 5)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (17, N'Shampoo', 2, 1, 5)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (18, N'Soap', 2, 1, 10)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (19, N'LED TV', 3, 3, 2)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (20, N'Iron', 3, 3, 5)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (21, N'Mobile', 3, 3, 10)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (22, N'Blender', 4, 4, 2)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (23, N'Water Filter', 4, 4, 2)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (24, N'Microwave Oven', 4, 4, 2)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (25, N'Bucket', 4, 2, 0)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (1005, N'Lotion', 2, 1, 0)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (1007, N'Powder', 2, 1, 0)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (2005, N'ASDF', 2, 2, 0)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (2006, N'aaaa', 2, 2, 0)
INSERT [dbo].[ItemTable] ([itemId], [itemName], [categoryId], [companyId], [reorderLevel]) VALUES (3005, N'AC', 3, 2002, 5)
SET IDENTITY_INSERT [dbo].[ItemTable] OFF
SET IDENTITY_INSERT [dbo].[StockInTable] ON 

INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (3, 19, 20)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (4, 25, 20)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (5, 21, 10)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (8, 13, 30)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (1004, 20, 60)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (1005, 16, 80)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (1009, 19, 10)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (1010, 17, 20)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (1011, 17, 10)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (2007, 14, 20)
INSERT [dbo].[StockInTable] ([stockInId], [itemId], [quantity]) VALUES (3007, 3005, 20)
SET IDENTITY_INSERT [dbo].[StockInTable] OFF
SET IDENTITY_INSERT [dbo].[StockOutTable] ON 

INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (1, 17, 5, CAST(0x963E0B00 AS Date), N'Sell')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (2, 17, 5, CAST(0x75250B00 AS Date), N'Sell')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (3, 16, 10, CAST(0x75250B00 AS Date), N'Damage')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (4, 17, 5, CAST(0x75250B00 AS Date), N'Damage')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (5, 16, 5, CAST(0x75250B00 AS Date), N'Lost')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (7, 16, 5, CAST(0x75250B00 AS Date), N'Lost')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (12, 16, 5, CAST(0x983E0B00 AS Date), N'Sell')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (1011, 16, 5, CAST(0x9B3E0B00 AS Date), N'Damage')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (1012, 16, 5, CAST(0x9B3E0B00 AS Date), N'Lost')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (2011, 3005, 5, CAST(0xA53E0B00 AS Date), N'Lost')
INSERT [dbo].[StockOutTable] ([stockOutId], [itemId], [stockOutQuantity], [stockOutDate], [stockOutType]) VALUES (2012, 16, 5, CAST(0xA53E0B00 AS Date), N'Lost')
SET IDENTITY_INSERT [dbo].[StockOutTable] OFF
ALTER TABLE [dbo].[ItemTable]  WITH CHECK ADD  CONSTRAINT [FK_ItemTable_CategoryTable] FOREIGN KEY([categoryId])
REFERENCES [dbo].[CategoryTable] ([categoryId])
GO
ALTER TABLE [dbo].[ItemTable] CHECK CONSTRAINT [FK_ItemTable_CategoryTable]
GO
ALTER TABLE [dbo].[ItemTable]  WITH CHECK ADD  CONSTRAINT [FK_ItemTable_CompanyTable] FOREIGN KEY([companyId])
REFERENCES [dbo].[CompanyTable] ([companyId])
GO
ALTER TABLE [dbo].[ItemTable] CHECK CONSTRAINT [FK_ItemTable_CompanyTable]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "i"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "cm"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ct"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 198
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'SearchItem'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "StockOutTable"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 221
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ItemTable"
            Begin Extent = 
               Top = 6
               Left = 259
               Bottom = 136
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockOutView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'StockOutView'
GO
USE [master]
GO
ALTER DATABASE [StockManagementSystemDB] SET  READ_WRITE 
GO
