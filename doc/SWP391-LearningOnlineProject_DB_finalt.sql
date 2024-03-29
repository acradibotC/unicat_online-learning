/****** Object:  Database [unicat-db]    Script Date: 21/3/2023 2:51:24 PM ******/
CREATE DATABASE [unicat-db]  (EDITION = 'Standard', SERVICE_OBJECTIVE = 'S0', MAXSIZE = 250 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [unicat-db] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [unicat-db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [unicat-db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [unicat-db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [unicat-db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [unicat-db] SET ARITHABORT OFF 
GO
ALTER DATABASE [unicat-db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [unicat-db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [unicat-db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [unicat-db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [unicat-db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [unicat-db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [unicat-db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [unicat-db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [unicat-db] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [unicat-db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [unicat-db] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [unicat-db] SET  MULTI_USER 
GO
ALTER DATABASE [unicat-db] SET ENCRYPTION ON
GO
ALTER DATABASE [unicat-db] SET QUERY_STORE = ON
GO
ALTER DATABASE [unicat-db] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  Table [dbo].[Answer]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[QuestionID] [int] NOT NULL,
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Answer_AnswerID] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BlogTitler] [nvarchar](max) NOT NULL,
	[BlogImage] [nvarchar](max) NULL,
	[BlogDescription] [nvarchar](max) NULL,
	[PostDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Blog_BlogID] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogComments]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogComments](
	[BlogCommentID] [int] IDENTITY(1,1) NOT NULL,
	[BlogFeedbackID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[BlogCommentContent] [nvarchar](max) NOT NULL,
	[BlogCommentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BlogComments_BlogCommentID] PRIMARY KEY CLUSTERED 
(
	[BlogCommentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogFeedback]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogFeedback](
	[BlogFeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[BlogFeedbackContent] [nvarchar](max) NOT NULL,
	[BlogFeedbackDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BlogFeedback_BlogFeedbackID] PRIMARY KEY CLUSTERED 
(
	[BlogFeedbackID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Category_CategoryID] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseInfo] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PublishStatus] [int] NOT NULL,
	[Request] [nvarchar](max) NULL,
 CONSTRAINT [PK_Course_CourseID] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEnroll]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseEnroll](
	[CourseEnrollID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[EnrollDate] [date] NOT NULL,
	[LessonCurrent] [int] NOT NULL,
	[CourseStatus] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[LessonNum] [int] NULL,
	[CourseID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](4000) NULL,
	[Video] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Lesson_LessonID] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionNum] [int] NOT NULL,
	[LessonID] [int] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CorrectAnswer] [int] NULL,
 CONSTRAINT [PK_Question_QuestionID] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Vote] [float] NOT NULL,
 CONSTRAINT [PK_Review_ReviewID] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewComments]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewComments](
	[ReviewCommentID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewFeedbackID] [int] NOT NULL,
	[ReviewID] [int] NOT NULL,
	[ReviewCommentContent] [nvarchar](max) NOT NULL,
	[ReviewCommentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReviewComments_ReviewCommentID] PRIMARY KEY CLUSTERED 
(
	[ReviewCommentID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewFeedback]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewFeedback](
	[ReviewFeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewID] [int] NOT NULL,
	[ReviewFeedbackContent] [nvarchar](max) NOT NULL,
	[ReviewFeedbackDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReviewFeedback_ReviewFeedbackID] PRIMARY KEY CLUSTERED 
(
	[ReviewFeedbackID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](150) NULL,
	[PassWord] [nvarchar](150) NULL,
	[FullName] [nvarchar](150) NULL,
	[Image] [nvarchar](max) NULL,
	[Email] [nvarchar](150) NULL,
	[DOB] [date] NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[FacebookID] [nvarchar](150) NULL,
	[GmailID] [nvarchar](150) NULL,
	[RoleID] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_User_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 21/3/2023 2:51:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_UserRole_RoleID] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD  CONSTRAINT [FK_Answer_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
GO
ALTER TABLE [dbo].[Answer] CHECK CONSTRAINT [FK_Answer_QuestionID]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_UserID]
GO
ALTER TABLE [dbo].[BlogComments]  WITH CHECK ADD  CONSTRAINT [FK_BlogComments_BlogFeedbackID] FOREIGN KEY([BlogFeedbackID])
REFERENCES [dbo].[BlogFeedback] ([BlogFeedbackID])
GO
ALTER TABLE [dbo].[BlogComments] CHECK CONSTRAINT [FK_BlogComments_BlogFeedbackID]
GO
ALTER TABLE [dbo].[BlogComments]  WITH CHECK ADD  CONSTRAINT [FK_BlogComments_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BlogComments] CHECK CONSTRAINT [FK_BlogComments_UserID]
GO
ALTER TABLE [dbo].[BlogFeedback]  WITH CHECK ADD  CONSTRAINT [FK_BlogFeedback_BlogID] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blog] ([BlogID])
GO
ALTER TABLE [dbo].[BlogFeedback] CHECK CONSTRAINT [FK_BlogFeedback_BlogID]
GO
ALTER TABLE [dbo].[BlogFeedback]  WITH CHECK ADD  CONSTRAINT [FK_BlogFeedback_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BlogFeedback] CHECK CONSTRAINT [FK_BlogFeedback_UserID]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_CategoryID]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_UserID]
GO
ALTER TABLE [dbo].[CourseEnroll]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnroll_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[CourseEnroll] CHECK CONSTRAINT [FK_CourseEnroll_CourseID]
GO
ALTER TABLE [dbo].[CourseEnroll]  WITH CHECK ADD  CONSTRAINT [FK_CourseEnroll_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[CourseEnroll] CHECK CONSTRAINT [FK_CourseEnroll_UserID]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_CourseID]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_LessonID] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_LessonID]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_CourseID]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_UserID]
GO
ALTER TABLE [dbo].[ReviewComments]  WITH CHECK ADD  CONSTRAINT [FK_ReviewComments_ReviewFeedbackID] FOREIGN KEY([ReviewFeedbackID])
REFERENCES [dbo].[ReviewFeedback] ([ReviewFeedbackID])
GO
ALTER TABLE [dbo].[ReviewComments] CHECK CONSTRAINT [FK_ReviewComments_ReviewFeedbackID]
GO
ALTER TABLE [dbo].[ReviewComments]  WITH CHECK ADD  CONSTRAINT [FK_ReviewComments_ReviewID] FOREIGN KEY([ReviewID])
REFERENCES [dbo].[Review] ([ReviewID])
GO
ALTER TABLE [dbo].[ReviewComments] CHECK CONSTRAINT [FK_ReviewComments_ReviewID]
GO
ALTER TABLE [dbo].[ReviewFeedback]  WITH CHECK ADD  CONSTRAINT [FK_ReviewFeedback_ReviewID] FOREIGN KEY([ReviewID])
REFERENCES [dbo].[Review] ([ReviewID])
GO
ALTER TABLE [dbo].[ReviewFeedback] CHECK CONSTRAINT [FK_ReviewFeedback_ReviewID]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRole] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_RoleID]
GO
ALTER DATABASE [unicat-db] SET  READ_WRITE 
GO
