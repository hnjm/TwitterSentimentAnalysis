USE [master]
GO
/****** Object:  Database [DEV_DB_LIC]    Script Date: 9/6/2019 1:28:31 PM ******/
CREATE DATABASE [DEV_DB_LIC]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DEV_DB_LIC', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DEV_DB_LIC.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DEV_DB_LIC_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\DEV_DB_LIC_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DEV_DB_LIC] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DEV_DB_LIC].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DEV_DB_LIC] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET ARITHABORT OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DEV_DB_LIC] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DEV_DB_LIC] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DEV_DB_LIC] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DEV_DB_LIC] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET RECOVERY FULL 
GO
ALTER DATABASE [DEV_DB_LIC] SET  MULTI_USER 
GO
ALTER DATABASE [DEV_DB_LIC] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DEV_DB_LIC] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DEV_DB_LIC] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DEV_DB_LIC] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DEV_DB_LIC] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DEV_DB_LIC', N'ON'
GO
ALTER DATABASE [DEV_DB_LIC] SET QUERY_STORE = OFF
GO
USE [DEV_DB_LIC]
GO
/****** Object:  Table [dbo].[DataSource]    Script Date: 9/6/2019 1:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataSource](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalApi]    Script Date: 9/6/2019 1:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalApi](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ExternalApiRequest]    Script Date: 9/6/2019 1:28:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExternalApiRequest](
	[UserSearchId] [int] NOT NULL,
	[ExternalApiId] [int] NOT NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedOn] [datetime] NULL,
	[Message] [nvarchar](500) NULL,
 CONSTRAINT [PK_ExternalApiRequest] PRIMARY KEY CLUSTERED 
(
	[UserSearchId] ASC,
	[ExternalApiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SearchResults]    Script Date: 9/6/2019 1:28:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SearchResults](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserSearchId] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[TweetText] [nvarchar](500) NULL,
	[Lang] [nvarchar](10) NULL,
	[ResultType] [nvarchar](50) NULL,
	[UserId] [bigint] NULL,
	[ScreenName] [nvarchar](50) NULL,
	[FollowersCount] [int] NULL,
	[FriendsCount] [int] NULL,
	[FavoritesCount] [int] NULL,
	[StatusesCount] [int] NULL,
	[RetweetCount] [int] NULL,
	[Latitude] [decimal](18, 2) NULL,
	[Longitude] [decimal](18, 2) NULL,
	[JsonTweetElement] [nvarchar](max) NULL,
	[TweetId] [bigint] NULL,
	[Score] [float] NULL,
	[KeyPhrases] [nvarchar](max) NULL,
 CONSTRAINT [PK_SearchResults_Id] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sysdiagrams]    Script Date: 9/6/2019 1:28:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sysdiagrams](
	[name] [sysname] NOT NULL,
	[principal_id] [int] NOT NULL,
	[diagram_id] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NULL,
	[definition] [varbinary](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[diagram_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UK_principal_name] UNIQUE NONCLUSTERED 
(
	[principal_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSearch]    Script Date: 9/6/2019 1:28:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSearch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QueryText] [nvarchar](50) NOT NULL,
	[CreatedOn] [datetime] NULL,
	[DataSourceId] [int] NULL,
	[JsonResult] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserSearch] ADD  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [dbo].[ExternalApiRequest]  WITH CHECK ADD  CONSTRAINT [FK_ExternalApi_ExternalApiRequest] FOREIGN KEY([ExternalApiId])
REFERENCES [dbo].[ExternalApi] ([Id])
GO
ALTER TABLE [dbo].[ExternalApiRequest] CHECK CONSTRAINT [FK_ExternalApi_ExternalApiRequest]
GO
ALTER TABLE [dbo].[ExternalApiRequest]  WITH CHECK ADD  CONSTRAINT [FK_UserSearch_ExternalApiRequest] FOREIGN KEY([UserSearchId])
REFERENCES [dbo].[UserSearch] ([Id])
GO
ALTER TABLE [dbo].[ExternalApiRequest] CHECK CONSTRAINT [FK_UserSearch_ExternalApiRequest]
GO
ALTER TABLE [dbo].[SearchResults]  WITH CHECK ADD  CONSTRAINT [PK_Search_SearchResults] FOREIGN KEY([UserSearchId])
REFERENCES [dbo].[UserSearch] ([Id])
GO
ALTER TABLE [dbo].[SearchResults] CHECK CONSTRAINT [PK_Search_SearchResults]
GO
ALTER TABLE [dbo].[UserSearch]  WITH CHECK ADD  CONSTRAINT [PK_DataSource_UserSearch] FOREIGN KEY([DataSourceId])
REFERENCES [dbo].[DataSource] ([Id])
GO
ALTER TABLE [dbo].[UserSearch] CHECK CONSTRAINT [PK_DataSource_UserSearch]
GO
/****** Object:  StoredProcedure [dbo].[usp_ImportTweetsBySearchId]    Script Date: 9/6/2019 1:28:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_ImportTweetsBySearchId]
@SearchId int
as
begin

declare @JSON nvarchar(max)

SELECT @JSON = JsonResult
	FROM dbo.UserSearch
WHERE Id = @SearchId

SELECT tweet.*
into #tweetData
	FROM OPENJSON(@JSON)
WITH(
	TweetId bigint '$.StatusID'
	, CreatedOn nvarchar(70) '$.CreatedAt'
	, TweetText nvarchar(500) '$.Text'
	, Lang nvarchar(10) '$.Lang'
	, ResultType nvarchar(50) '$.MetaData.ResultType'
	, UserId bigint '$.User.UserID'
	, ScreenName nvarchar(50) '$.User.ScreenName'
	, FollowersCount int '$.User.FollowersCount'
	, FriendsCount int '$.User.FriendsCount'
	, FavoritesCount int '$.User.FavoritesCount'
	, StatusesCount int '$.User.StatusesCount'
	, RetweetCount int '$.RetweetCount'
	, Latitude decimal(18,2) '$.Coordinates.Latitude'
	, Longitude decimal(18,2) '$.Coordinates.Longitude'
	, JsonTweetElement nvarchar(MAX) N'$' AS JSON
) AS tweet

insert into dbo.SearchResults (
	TweetId
	, UserSearchId
	, CreatedOn
	, TweetText
	, Lang
	, ResultType
	, UserId
	, ScreenName
	, FollowersCount
	, FriendsCount
	, FavoritesCount
	, StatusesCount
	, RetweetCount
	, Latitude
	, Longitude
	, JsonTweetElement)
select
	TweetId
	, @SearchId
	, CreatedOn
	, TweetText
	, Lang
	, ResultType
	, UserId
	, ScreenName
	, FollowersCount
	, FriendsCount
	, FavoritesCount
	, StatusesCount
	, RetweetCount
	, Latitude
	, Longitude
	, JsonTweetElement
from #tweetData

end
GO
USE [master]
GO
ALTER DATABASE [DEV_DB_LIC] SET  READ_WRITE 
GO
