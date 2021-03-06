USE [master]
GO
/****** Object:  Database [UnivalleBD]    Script Date: 3/10/2021 22:18:52 ******/
CREATE DATABASE [UnivalleBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UnivalleBD', FILENAME = N'D:\Bases de Datos\DATA\UnivalleBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UnivalleBD_log', FILENAME = N'D:\Bases de Datos\DATA\UnivalleBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UnivalleBD] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UnivalleBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UnivalleBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UnivalleBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UnivalleBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UnivalleBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UnivalleBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [UnivalleBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UnivalleBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UnivalleBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UnivalleBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UnivalleBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UnivalleBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UnivalleBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UnivalleBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UnivalleBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UnivalleBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UnivalleBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UnivalleBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UnivalleBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UnivalleBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UnivalleBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UnivalleBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UnivalleBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UnivalleBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UnivalleBD] SET  MULTI_USER 
GO
ALTER DATABASE [UnivalleBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UnivalleBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UnivalleBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UnivalleBD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UnivalleBD] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UnivalleBD', N'ON'
GO
ALTER DATABASE [UnivalleBD] SET QUERY_STORE = OFF
GO
USE [UnivalleBD]
GO
/****** Object:  Table [dbo].[coments]    Script Date: 3/10/2021 22:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[coments](
	[comentID] [int] IDENTITY(1,1) NOT NULL,
	[coment] [varchar](max) NOT NULL,
	[state] [tinyint] NOT NULL,
	[userID] [int] NOT NULL,
	[subjectID] [tinyint] NULL,
	[teacherID] [tinyint] NULL,
	[registerDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_coments] PRIMARY KEY CLUSTERED 
(
	[comentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[likeComent]    Script Date: 3/10/2021 22:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[likeComent](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[comentID] [int] NOT NULL,
	[registerDate] [datetime] NOT NULL,
 CONSTRAINT [PK_likeComent] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[comentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 3/10/2021 22:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[subjectID] [tinyint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[semester] [tinyint] NOT NULL,
	[description] [varchar](300) NOT NULL,
 CONSTRAINT [PK_subject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[teacher]    Script Date: 3/10/2021 22:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[teacher](
	[teacherID] [tinyint] IDENTITY(1,1) NOT NULL,
	[description] [varchar](300) NOT NULL,
 CONSTRAINT [PK_teacher] PRIMARY KEY CLUSTERED 
(
	[teacherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 3/10/2021 22:18:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[lastName] [varchar](60) NOT NULL,
	[secondLastName] [varchar](60) NOT NULL,
	[userName] [varchar](20) NOT NULL,
	[password] [varbinary](50) NOT NULL,
	[mail] [varchar](50) NOT NULL,
	[type] [tinyint] NOT NULL,
	[registerDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[coments] ADD  CONSTRAINT [DF_coments_state]  DEFAULT ((1)) FOR [state]
GO
ALTER TABLE [dbo].[coments] ADD  CONSTRAINT [DF_coments_registerDate]  DEFAULT (getdate()) FOR [registerDate]
GO
ALTER TABLE [dbo].[coments] ADD  CONSTRAINT [DF_coments_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[likeComent] ADD  CONSTRAINT [DF_likeComent_registerDate]  DEFAULT (getdate()) FOR [registerDate]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_registerDate]  DEFAULT (getdate()) FOR [registerDate]
GO
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[coments]  WITH CHECK ADD  CONSTRAINT [FK_coments_subject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[subject] ([subjectID])
GO
ALTER TABLE [dbo].[coments] CHECK CONSTRAINT [FK_coments_subject]
GO
ALTER TABLE [dbo].[coments]  WITH CHECK ADD  CONSTRAINT [FK_coments_teacher] FOREIGN KEY([teacherID])
REFERENCES [dbo].[teacher] ([teacherID])
GO
ALTER TABLE [dbo].[coments] CHECK CONSTRAINT [FK_coments_teacher]
GO
ALTER TABLE [dbo].[coments]  WITH CHECK ADD  CONSTRAINT [FK_coments_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[coments] CHECK CONSTRAINT [FK_coments_users]
GO
ALTER TABLE [dbo].[likeComent]  WITH CHECK ADD  CONSTRAINT [FK_likeComent_coments] FOREIGN KEY([comentID])
REFERENCES [dbo].[coments] ([comentID])
GO
ALTER TABLE [dbo].[likeComent] CHECK CONSTRAINT [FK_likeComent_coments]
GO
ALTER TABLE [dbo].[likeComent]  WITH CHECK ADD  CONSTRAINT [FK_likeComent_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([userID])
GO
ALTER TABLE [dbo].[likeComent] CHECK CONSTRAINT [FK_likeComent_users]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1=activo
0=eliminado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'coments', @level2type=N'COLUMN',@level2name=N'state'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0=Docente
1=Estudiante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'users', @level2type=N'COLUMN',@level2name=N'type'
GO
USE [master]
GO
ALTER DATABASE [UnivalleBD] SET  READ_WRITE 
GO
