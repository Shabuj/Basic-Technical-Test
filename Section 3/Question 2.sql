USE [master]
GO
/****** Object:  Database [Student]    Script Date: 2/17/2022 9:42:48 AM ******/
CREATE DATABASE [Student]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Student', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Student.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Student_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Student_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Student] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Student].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Student] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Student] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Student] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Student] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Student] SET ARITHABORT OFF 
GO
ALTER DATABASE [Student] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Student] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Student] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Student] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Student] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Student] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Student] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Student] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Student] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Student] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Student] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Student] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Student] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Student] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Student] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Student] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Student] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Student] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Student] SET  MULTI_USER 
GO
ALTER DATABASE [Student] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Student] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Student] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Student] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Student] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Student] SET QUERY_STORE = OFF
GO
USE [Student]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2/17/2022 9:42:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[Course Number] [int] IDENTITY(1,1) NOT NULL,
	[Course Name] [varchar](100) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[Course Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourseMark_tbl]    Script Date: 2/17/2022 9:42:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourseMark_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student Number] [int] NULL,
	[Course Number] [int] NULL,
	[Test Date] [datetime] NULL,
	[Test Mark] [float] NULL,
 CONSTRAINT [PK_StudentCourseMark_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentCourses_tbl]    Script Date: 2/17/2022 9:42:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentCourses_tbl](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Student Number] [int] NULL,
	[Course Number] [int] NULL,
 CONSTRAINT [PK_StudentCourses_tbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2/17/2022 9:42:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Student number] [int] IDENTITY(1,1) NOT NULL,
	[Student Name] [varchar](50) NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Student number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[StudentCourseMark_tbl]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourseMark_tbl_Courses] FOREIGN KEY([Course Number])
REFERENCES [dbo].[Courses] ([Course Number])
GO
ALTER TABLE [dbo].[StudentCourseMark_tbl] CHECK CONSTRAINT [FK_StudentCourseMark_tbl_Courses]
GO
ALTER TABLE [dbo].[StudentCourseMark_tbl]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourseMark_tbl_Students] FOREIGN KEY([Student Number])
REFERENCES [dbo].[Students] ([Student number])
GO
ALTER TABLE [dbo].[StudentCourseMark_tbl] CHECK CONSTRAINT [FK_StudentCourseMark_tbl_Students]
GO
ALTER TABLE [dbo].[StudentCourses_tbl]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_tbl_Courses] FOREIGN KEY([Course Number])
REFERENCES [dbo].[Courses] ([Course Number])
GO
ALTER TABLE [dbo].[StudentCourses_tbl] CHECK CONSTRAINT [FK_StudentCourses_tbl_Courses]
GO
ALTER TABLE [dbo].[StudentCourses_tbl]  WITH CHECK ADD  CONSTRAINT [FK_StudentCourses_tbl_Students] FOREIGN KEY([Student Number])
REFERENCES [dbo].[Students] ([Student number])
GO
ALTER TABLE [dbo].[StudentCourses_tbl] CHECK CONSTRAINT [FK_StudentCourses_tbl_Students]
GO
USE [master]
GO
ALTER DATABASE [Student] SET  READ_WRITE 
GO
