USE [master]
GO
/****** Object:  Database [AuthDB]    Script Date: 12/13/2023 03:42:17 PM ******/
CREATE DATABASE [AuthDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AuthDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AuthDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AuthDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AuthDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AuthDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AuthDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AuthDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AuthDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AuthDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AuthDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AuthDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AuthDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AuthDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AuthDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AuthDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AuthDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AuthDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AuthDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AuthDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AuthDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AuthDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AuthDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AuthDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AuthDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AuthDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AuthDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AuthDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AuthDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AuthDB] SET RECOVERY FULL 
GO
ALTER DATABASE [AuthDB] SET  MULTI_USER 
GO
ALTER DATABASE [AuthDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AuthDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AuthDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AuthDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AuthDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AuthDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AuthDB', N'ON'
GO
ALTER DATABASE [AuthDB] SET QUERY_STORE = OFF
GO
USE [AuthDB]
GO
/****** Object:  Table [dbo].[MenuInfo]    Script Date: 12/13/2023 03:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NOT NULL,
	[Url] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MenuInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[permissions]    Script Date: 12/13/2023 03:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[permissions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[permission_name] [varchar](255) NOT NULL,
	[role_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 12/13/2023 03:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[update_at] [datetime] NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/13/2023 03:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_roles]    Script Date: 12/13/2023 03:42:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_users_roles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[MenuInfo] ON 

INSERT [dbo].[MenuInfo] ([ID], [MenuName], [Url]) VALUES (1, N'User Info', N'/User')
INSERT [dbo].[MenuInfo] ([ID], [MenuName], [Url]) VALUES (2, N'Role Info', N'/Role')
INSERT [dbo].[MenuInfo] ([ID], [MenuName], [Url]) VALUES (3, N'Permission Info', N'/Permission')
SET IDENTITY_INSERT [dbo].[MenuInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[permissions] ON 

INSERT [dbo].[permissions] ([id], [permission_name], [role_id], [created_at], [updated_at]) VALUES (1, N'/Privacy', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-12T20:14:56.033' AS DateTime))
INSERT [dbo].[permissions] ([id], [permission_name], [role_id], [created_at], [updated_at]) VALUES (2, N'/Permission', 1, CAST(N'2023-12-12T20:13:57.340' AS DateTime), CAST(N'2023-12-13T14:35:23.260' AS DateTime))
INSERT [dbo].[permissions] ([id], [permission_name], [role_id], [created_at], [updated_at]) VALUES (3, N'/Role', 1, CAST(N'2023-12-12T20:14:05.627' AS DateTime), CAST(N'2023-12-12T20:15:01.920' AS DateTime))
INSERT [dbo].[permissions] ([id], [permission_name], [role_id], [created_at], [updated_at]) VALUES (4, N'/User', 1, CAST(N'2023-12-12T20:25:15.653' AS DateTime), CAST(N'2023-12-12T20:25:15.653' AS DateTime))
INSERT [dbo].[permissions] ([id], [permission_name], [role_id], [created_at], [updated_at]) VALUES (5, N'/Privacy', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-12T20:14:56.033' AS DateTime))
INSERT [dbo].[permissions] ([id], [permission_name], [role_id], [created_at], [updated_at]) VALUES (6, N'/Permission', 2, CAST(N'2023-12-12T20:13:57.340' AS DateTime), CAST(N'2023-12-13T14:35:23.260' AS DateTime))
INSERT [dbo].[permissions] ([id], [permission_name], [role_id], [created_at], [updated_at]) VALUES (7, N'/Role', 2, CAST(N'2023-12-12T20:14:05.627' AS DateTime), CAST(N'2023-12-12T20:15:01.920' AS DateTime))
INSERT [dbo].[permissions] ([id], [permission_name], [role_id], [created_at], [updated_at]) VALUES (8, N'/User', 2, CAST(N'2023-12-12T20:25:15.653' AS DateTime), CAST(N'2023-12-13T15:39:10.000' AS DateTime))
INSERT [dbo].[permissions] ([id], [permission_name], [role_id], [created_at], [updated_at]) VALUES (9, N'/User', 3, CAST(N'2023-12-13T14:56:37.240' AS DateTime), CAST(N'2023-12-13T14:56:37.240' AS DateTime))
SET IDENTITY_INSERT [dbo].[permissions] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([id], [role_name], [created_at], [update_at]) VALUES (1, N'Super Admin', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-13T15:37:33.723' AS DateTime))
INSERT [dbo].[roles] ([id], [role_name], [created_at], [update_at]) VALUES (2, N'Admin', CAST(N'2023-12-12T19:41:26.513' AS DateTime), CAST(N'2023-12-12T19:56:18.193' AS DateTime))
INSERT [dbo].[roles] ([id], [role_name], [created_at], [update_at]) VALUES (3, N'User', CAST(N'2023-12-12T19:56:07.217' AS DateTime), CAST(N'2023-12-12T19:56:07.217' AS DateTime))
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [email], [created_at], [updated_at]) VALUES (1, N'hasib', N'1', N'hasib@gmail.com', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-13T15:36:56.327' AS DateTime))
INSERT [dbo].[users] ([id], [username], [password], [email], [created_at], [updated_at]) VALUES (2, N'Tanvir', N'1', N'tanvir@gmail.com', CAST(N'2023-12-12T18:02:58.153' AS DateTime), CAST(N'2023-12-13T15:37:12.747' AS DateTime))
INSERT [dbo].[users] ([id], [username], [password], [email], [created_at], [updated_at]) VALUES (3, N'1', N'1', N'1', CAST(N'2023-12-12T19:24:21.110' AS DateTime), CAST(N'2023-12-12T19:24:21.110' AS DateTime))
INSERT [dbo].[users] ([id], [username], [password], [email], [created_at], [updated_at]) VALUES (4, N'1', N'1', N'1', CAST(N'2023-12-12T19:27:05.267' AS DateTime), CAST(N'2023-12-12T19:27:05.487' AS DateTime))
INSERT [dbo].[users] ([id], [username], [password], [email], [created_at], [updated_at]) VALUES (5, N'Sojib', N'1', N'sojib@gmail.com', CAST(N'2023-12-13T14:57:20.180' AS DateTime), CAST(N'2023-12-13T14:57:20.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[users_roles] ON 

INSERT [dbo].[users_roles] ([id], [user_id], [role_id]) VALUES (1, 1, 1)
INSERT [dbo].[users_roles] ([id], [user_id], [role_id]) VALUES (2, 2, 2)
INSERT [dbo].[users_roles] ([id], [user_id], [role_id]) VALUES (3, 5, 3)
SET IDENTITY_INSERT [dbo].[users_roles] OFF
GO
USE [master]
GO
ALTER DATABASE [AuthDB] SET  READ_WRITE 
GO
