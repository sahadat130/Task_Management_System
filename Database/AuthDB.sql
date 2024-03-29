USE [master]
GO
/****** Object:  Database [AuthDB]    Script Date: 12/20/2023 12:20:51 PM ******/
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
/****** Object:  Table [dbo].[Information]    Script Date: 12/20/2023 12:20:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Information](
	[InfoId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[Status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Information] PRIMARY KEY CLUSTERED 
(
	[InfoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MenuInfo]    Script Date: 12/20/2023 12:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuInfo](
	[MenuID] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NOT NULL,
	[Url] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MenuInfo] PRIMARY KEY CLUSTERED 
(
	[MenuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permission]    Script Date: 12/20/2023 12:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permission](
	[PermissionID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionName] [varchar](255) NOT NULL,
	[RoleID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_permissions] PRIMARY KEY CLUSTERED 
(
	[PermissionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/20/2023 12:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](255) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdateAt] [datetime] NOT NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/20/2023 12:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersRole]    Script Date: 12/20/2023 12:20:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersRole](
	[UserRoleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_users_roles] PRIMARY KEY CLUSTERED 
(
	[UserRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Information] ON 

INSERT [dbo].[Information] ([InfoId], [Title], [Description], [DueDate], [Status]) VALUES (1, N'22222212412412412', N'2adadadad', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Pending')
INSERT [dbo].[Information] ([InfoId], [Title], [Description], [DueDate], [Status]) VALUES (3, N'1fsdfsdfs', N'1fdsdfsdfsdfsdf', CAST(N'1900-01-01T00:00:00.000' AS DateTime), N'Complete')
INSERT [dbo].[Information] ([InfoId], [Title], [Description], [DueDate], [Status]) VALUES (4, N'1', N'1', CAST(N'2023-12-17T18:00:00.000' AS DateTime), N'Complete')
INSERT [dbo].[Information] ([InfoId], [Title], [Description], [DueDate], [Status]) VALUES (5, N'dasd', N'asdad', CAST(N'2023-12-14T18:00:00.000' AS DateTime), N'Pending')
SET IDENTITY_INSERT [dbo].[Information] OFF
GO
SET IDENTITY_INSERT [dbo].[MenuInfo] ON 

INSERT [dbo].[MenuInfo] ([MenuID], [MenuName], [Url]) VALUES (1, N'User Info', N'/User')
INSERT [dbo].[MenuInfo] ([MenuID], [MenuName], [Url]) VALUES (2, N'Role Info', N'/Role')
INSERT [dbo].[MenuInfo] ([MenuID], [MenuName], [Url]) VALUES (3, N'Permission Info', N'/Permission')
INSERT [dbo].[MenuInfo] ([MenuID], [MenuName], [Url]) VALUES (4, N'Information', N'/Information')
SET IDENTITY_INSERT [dbo].[MenuInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Permission] ON 

INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (1, N'/Privacy', 1, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-12T20:14:56.033' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (2, N'/Permission', 1, CAST(N'2023-12-12T20:13:57.340' AS DateTime), CAST(N'2023-12-19T17:59:51.327' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (3, N'/Role', 1, CAST(N'2023-12-12T20:14:05.627' AS DateTime), CAST(N'2023-12-12T20:15:01.920' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (4, N'/User', 1, CAST(N'2023-12-12T20:25:15.653' AS DateTime), CAST(N'2023-12-12T20:25:15.653' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (5, N'/Privacy', 2, CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-12T20:14:56.033' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (6, N'/Permission', 2, CAST(N'2023-12-12T20:13:57.340' AS DateTime), CAST(N'2023-12-18T18:12:59.777' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (7, N'/Role', 2, CAST(N'2023-12-12T20:14:05.627' AS DateTime), CAST(N'2023-12-12T20:15:01.920' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (8, N'/User', 2, CAST(N'2023-12-12T20:25:15.653' AS DateTime), CAST(N'2023-12-13T15:39:10.000' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (9, N'/User', 3, CAST(N'2023-12-13T14:56:37.240' AS DateTime), CAST(N'2023-12-13T14:56:37.240' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (10, N'/Permission', 0, CAST(N'2023-12-12T20:13:57.340' AS DateTime), CAST(N'2023-12-18T18:06:04.277' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (11, N'/Information', 1, CAST(N'2023-12-18T18:31:47.797' AS DateTime), CAST(N'2023-12-18T18:31:47.797' AS DateTime))
INSERT [dbo].[Permission] ([PermissionID], [PermissionName], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (12, N'/Information', 3, CAST(N'2023-12-19T18:14:24.413' AS DateTime), CAST(N'2023-12-19T18:14:24.413' AS DateTime))
SET IDENTITY_INSERT [dbo].[Permission] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [CreatedAt], [UpdateAt]) VALUES (1, N'Super Admin', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-18T18:19:51.683' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [RoleName], [CreatedAt], [UpdateAt]) VALUES (2, N'Admin', CAST(N'2023-12-12T19:41:26.513' AS DateTime), CAST(N'2023-12-12T19:56:18.193' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [RoleName], [CreatedAt], [UpdateAt]) VALUES (3, N'User', CAST(N'2023-12-12T19:56:07.217' AS DateTime), CAST(N'2023-12-12T19:56:07.217' AS DateTime))
INSERT [dbo].[Role] ([RoleID], [RoleName], [CreatedAt], [UpdateAt]) VALUES (4, N'Manager', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-19T18:00:01.630' AS DateTime))
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [CreatedAt], [UpdatedAt]) VALUES (1, N'hasib', N'1', N'hasib@gmail.com', CAST(N'1900-01-01T00:00:00.000' AS DateTime), CAST(N'2023-12-19T18:00:11.587' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [CreatedAt], [UpdatedAt]) VALUES (2, N'Tanvir', N'1', N'tanvir@gmail.com', CAST(N'2023-12-12T18:02:58.153' AS DateTime), CAST(N'2023-12-13T15:37:12.747' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [CreatedAt], [UpdatedAt]) VALUES (3, N'1', N'1', N'1', CAST(N'2023-12-12T19:24:21.110' AS DateTime), CAST(N'2023-12-12T19:24:21.110' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [CreatedAt], [UpdatedAt]) VALUES (4, N'1', N'1', N'1', CAST(N'2023-12-12T19:27:05.267' AS DateTime), CAST(N'2023-12-12T19:27:05.487' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [CreatedAt], [UpdatedAt]) VALUES (5, N'Sojib', N'1', N'sojib@gmail.com', CAST(N'2023-12-13T14:57:20.180' AS DateTime), CAST(N'2023-12-13T14:57:20.180' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [CreatedAt], [UpdatedAt]) VALUES (9, N'Yasin', N'1', N'yasin@gmail.com', CAST(N'2023-12-19T18:13:43.627' AS DateTime), CAST(N'2023-12-19T18:13:43.627' AS DateTime))
INSERT [dbo].[User] ([UserID], [UserName], [Password], [Email], [CreatedAt], [UpdatedAt]) VALUES (10, N'tanvir', N'1', N'tanvir@gmail.com', CAST(N'2023-12-19T18:57:33.557' AS DateTime), CAST(N'2023-12-19T18:57:33.557' AS DateTime))
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersRole] ON 

INSERT [dbo].[UsersRole] ([UserRoleID], [UserID], [RoleID]) VALUES (1, 1, 1)
INSERT [dbo].[UsersRole] ([UserRoleID], [UserID], [RoleID]) VALUES (2, 2, 2)
INSERT [dbo].[UsersRole] ([UserRoleID], [UserID], [RoleID]) VALUES (3, 5, 3)
INSERT [dbo].[UsersRole] ([UserRoleID], [UserID], [RoleID]) VALUES (7, 9, 3)
INSERT [dbo].[UsersRole] ([UserRoleID], [UserID], [RoleID]) VALUES (8, 10, 3)
SET IDENTITY_INSERT [dbo].[UsersRole] OFF
GO
USE [master]
GO
ALTER DATABASE [AuthDB] SET  READ_WRITE 
GO
