--USE [master]
--DROP DATABASE [Online Learning]

CREATE DATABASE [Online Learning]
USE [Online Learning]

/****** Object:  Table [dbo].[Answer]  ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerID] [int] NULL,
	[QuestionID] [int] NULL,
	[Answer] [int] NULL,
	[AnswerInf] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogFeedback] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogFeedback](
	[BfbID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[BfbTitle] [nvarchar](max) NOT NULL,
	[BfbDate] [date] NULL,
 CONSTRAINT [PK_BlogFeedback] PRIMARY KEY CLUSTERED 
(
	[BfbID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogg] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogg](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BlogTitler] [nvarchar](max) NOT NULL,
	[BlogImage] [nvarchar](max) NULL,
	[BlogDescription] [nvarchar](max) NOT NULL,
	[bdate] [date] NULL,
 CONSTRAINT [PK_Blogg] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](max) NOT NULL,
	[CategoryImage] [nvarchar](max) NULL,
	[CategoryInf] [nvarchar](max) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comments] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[CmtID] [int] IDENTITY(1,1) NOT NULL,
	[BfbID] [int] NOT NULL,
	[BlogID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[CmtTitle] [nvarchar](max) NOT NULL,
	[Cdate] [date] NULL,
 CONSTRAINT [PK_comments_1] PRIMARY KEY CLUSTERED 
(
	[CmtID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[ContactDetail] [nvarchar](max) NOT NULL,
	[email] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CourseName] [nvarchar](max) NOT NULL,
	[CourseImage] [nvarchar](max) NOT NULL,
	[CourseCreator] [int] NOT NULL,
	[CourseInf] [nvarchar](max) NOT NULL,
	[CourseDescription] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enroll] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enroll](
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[EnrollDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Enroll] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lesson] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lesson](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[LessonName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Lesson] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lessondetail] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessondetail](
	[LessonID] [int] NOT NULL,
	[LessondetailID] [int] IDENTITY(1,1) NOT NULL,
	[LessonContent] [nvarchar](max) NOT NULL,
	[LessionImage] [nvarchar](max) NOT NULL,
	[LessonDescription] [nvarchar](max) NOT NULL,
	[LessonVideo] [nvarchar](max),
 CONSTRAINT [PK_Lessondetail] PRIMARY KEY CLUSTERED 
(
	[LessondetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionID] [int] NOT NULL,
	[QuestionInf] [nvarchar](max) NULL,
	[CorrectAnswer] [int] NULL,
	[QuizID] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
 CONSTRAINT [PK_Quiz] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[vote] [int] NOT NULL,
	[ReviewDetail] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Review] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Gmail] [nvarchar](max),
	[PassWord] [nvarchar](max),
	[Phone] [nvarchar](max) NOT NULL,
	[Dob] [date] NOT NULL,
	[Admin] [bit] NOT NULL,
	[Student] [bit] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (1, 1, 1, N'printf("Hello World");  ')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (2, 1, 2, N'System.out.printline("Hello World");')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (3, 1, 3, N'Console.WriteLine("Hello World");')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (4, 1, 4, N'cout << "Hello World";')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (9, 3, 1, N'The len property')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (10, 3, 2, N'The length property')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (11, 3, 3, N'The sizeof property  ')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (12, 3, 4, N'The sizer property')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (13, 4, 1, N'double x = 2.8;  ')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (14, 4, 2, N'x = 2.8;')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (15, 4, 3, N'byte x = 2.8
')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (16, 4, 4, N'int x = 2.8;')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (17, 5, 1, N'length()  ')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (18, 5, 2, N'getSize()')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (19, 5, 3, N'getLength()')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (20, 5, 4, N'len()')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (21, 6, 1, N'#include <iosstring>')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (22, 6, 2, N'#include <stream>')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (23, 6, 3, N'#include <inputstr>')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (24, 6, 4, N'#include <iostream>')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (25, 7, 1, N'x = 2.8f;')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (26, 7, 2, N'int x = 2.8f;')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (27, 7, 3, N'byte x = 2.8f')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (28, 7, 4, N'float x = 2.8f;  ')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (29, 8, 1, N'toUpperCase()  ')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (30, 8, 2, N'touppercase()')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (31, 8, 3, N'upperCase()')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (32, 8, 4, N'tuc()')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (33, 9, 1, N'methodName.  ')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (34, 9, 2, N'(methodName)')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (35, 9, 3, N'methodName()  ')
INSERT [dbo].[Answer] ([AnswerID], [QuestionID], [Answer], [AnswerInf]) VALUES (36, 9, 4, N'methodName[]')
GO
SET IDENTITY_INSERT [dbo].[BlogFeedback] ON 

INSERT [dbo].[BlogFeedback] ([BfbID], [BlogID], [UserID], [BfbTitle], [BfbDate]) VALUES (54, 1, 1, N'1234', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[BlogFeedback] ([BfbID], [BlogID], [UserID], [BfbTitle], [BfbDate]) VALUES (56, 27, 1, N'ngfhdsh', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[BlogFeedback] ([BfbID], [BlogID], [UserID], [BfbTitle], [BfbDate]) VALUES (57, 27, 1, N'no', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[BlogFeedback] ([BfbID], [BlogID], [UserID], [BfbTitle], [BfbDate]) VALUES (58, 7, 1, N'ngfhdsh', CAST(N'2022-07-24' AS Date))
SET IDENTITY_INSERT [dbo].[BlogFeedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogg] ON 

INSERT [dbo].[Blogg] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [bdate]) VALUES (1, 1, N'Learn HTML: Find Out How to Learn HTML Fast', N'images/1.jpg', N'HTML, or Hypertext Markup Language, is one of the most common forms of code in the world. It is used on pretty much every single web page in existence, and it allows web designers to present text, images, videos, and other content in a clear, concise manner.

Naturally, many beginners choose this language to learn first, yet find the difficulty to understand what is the best way to learn HTML. If you want to become a front-end web developer, learning HTML is essential.

Luckily for you, there are hundreds of websites out there teaching you HTML basics that will allow you to build a simple HTML page. Some of the best ones are edX, Coursera, and Udacity!

However, these websites don’t always teach you the best or most efficient way of how to learn HTML. They don’t always teach the most up to date version of the language, and they don’t always teach you everything that you need to know.', CAST(N'2022-02-02' AS Date))
INSERT [dbo].[Blogg] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [bdate]) VALUES (4, 4, N'5 Steps to Drastically Improve Your CSS Knowledge in 24 Hours', N'https://designshack.net/wp-content/uploads/css24hrs-01.jpg', N'1. Wrap Your Mind Around Positioning Contexts
If you really want to have a solid understanding of how to use CSS to move HTML elements to where you want them to go, you absolutely must get a grip on positioning contexts. And I don’t just mean a casual understanding, I mean a deep knowledge of their differences, behaviors, quirks, etc.

There are actually five position values that you should understand. If you can’t name all five without looking them up, then you’re definitely a prime candidate for this bit of education. Here they are: static, fixed, relative, absolute and inherit.

You need to know and understand all five, but the big two that will really change the way you code are absolute and relative positioning. Learning to wield these two positioning contexts separately, and then jumping into how they work together, will fundamentally change the way you view CSS layout, I promise. It’s a revelation that will make your job infinitely easier.
2. Master Floats
When you’re first learning CSS, floats seem like one of the most screwed up layout systems imaginable. Once you learn to use them on a basic level, you then have to learn all about how parents containing only floated children have a collapsed height, which then leads to forty-seven different ways to solve the problem through clearfixes and overflow manipulations.

Fortunately, in the long run, you do get used to the concepts behind floats and they can even become so easy to use that you don’t give them much thought at all. The only thing standing between you and that goal is a solid article or two that really digs in and thoroughly explains float behavior and techniques from the ground up.
3. Know Your Selectors
One of the keys to writing good clean CSS is to have a strong grasp of what CSS selectors are available to you, how they work and the degree to which they are supported on various browsers. It sounds like a simple enough topic, but in reality the world of CSS selectors is quite complex.
4. Learn DRY Coding Concepts
“Don’t Repeat Yourself.” This simple phrase has drastic implications when it comes to coding. When you really dive into DRY coding practices, the result is cleaner code, less work and a beautiful new workflow that is as empowering as it is flat out awesome.
5. Know Your Browser Support
The big secret that newbie web developers need to get into their heads is not that they need to memorize every single CSS feature and how every browser known to man handles it, instead its that there are absolutely amazing resources available to you that give you this information freely, you just have to know where to look.', CAST(N'2022-03-03' AS Date))
INSERT [dbo].[Blogg] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [bdate]) VALUES (7, 4, N'1123', N'images/1.jpg', N'dsvsdf', CAST(N'2022-02-02' AS Date))
INSERT [dbo].[Blogg] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [bdate]) VALUES (27, 1, N'bbbbbbbbbbbbb', N'images/2.jpg', N'll
', CAST(N'2022-07-24' AS Date))
SET IDENTITY_INSERT [dbo].[Blogg] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImage], [CategoryInf]) VALUES (1, N'HTML and CSS', N'https://media.proglib.io/posts/2020/12/06/62cf6bd0938fda2f588142b86920161a.png', N'HTML (HyperText Markup Language) : is a markup language designed to create web pages, that is, pieces of information presented on the World Wide Web. CSS (Cascading Style Sheets) : defines how an HTML document should be displayed. CSS is especially useful in Web design.')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImage], [CategoryInf]) VALUES (2, N'JavaScript', N'https://vietnix.vn/wp-content/uploads/2021/07/javascript-la-gi.webp', N'JavaScript is a popular website programming language today, it is integrated and embedded in HTML to make the website more vivid. JavaScript acts as part of the web page, the executable allows client-side scripts from both the user side as well as the server side (Nodejs) to create dynamic web pages.')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImage], [CategoryInf]) VALUES (3, N'Server Side', N'http://softwarebrothers.co/blog/content/images/2019/10/Blogpost-1.png', N'Server side is a script commonly used by the server to let users customize the website they are visiting. Server side is a technique used to develop websites. Besides providing the display of website files, it also responds to the server about the visitor''s customizations to the website.')
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImage], [CategoryInf]) VALUES (4, N'Progaming', N'https://img.freepik.com/premium-vector/programing-concept-program-code-white-isolated-background_197170-769.jpg?w=2000', N'Computer programming or computer programming, often abbreviated as programming, is the creation of a working program for a machine with a processor, in particular a computer, to perform certain information processing tasks. This program consists of a sequence of logical instructions for the machine to execute in chronological order.')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([CmtID], [BfbID], [BlogID], [UserID], [CmtTitle], [Cdate]) VALUES (10, 54, 1, 1, N'hay', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[comments] ([CmtID], [BfbID], [BlogID], [UserID], [CmtTitle], [Cdate]) VALUES (12, 56, 27, 1, N'gggg', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[comments] ([CmtID], [BfbID], [BlogID], [UserID], [CmtTitle], [Cdate]) VALUES (13, 56, 27, 1, N'123', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[comments] ([CmtID], [BfbID], [BlogID], [UserID], [CmtTitle], [Cdate]) VALUES (14, 56, 27, 1, N'h', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[comments] ([CmtID], [BfbID], [BlogID], [UserID], [CmtTitle], [Cdate]) VALUES (15, 56, 27, 1, N'123', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[comments] ([CmtID], [BfbID], [BlogID], [UserID], [CmtTitle], [Cdate]) VALUES (16, 56, 27, 1, N'ggggj', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[comments] ([CmtID], [BfbID], [BlogID], [UserID], [CmtTitle], [Cdate]) VALUES (17, 58, 7, 1, N'123', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[comments] ([CmtID], [BfbID], [BlogID], [UserID], [CmtTitle], [Cdate]) VALUES (18, 57, 27, 1, N'123', CAST(N'2022-07-24' AS Date))
INSERT [dbo].[comments] ([CmtID], [BfbID], [BlogID], [UserID], [CmtTitle], [Cdate]) VALUES (19, 57, 27, 1, N'hay', CAST(N'2022-07-24' AS Date))
SET IDENTITY_INSERT [dbo].[comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (1, 1, N'HTML', N'https://w7.pngwing.com/pngs/840/443/png-transparent-html-5-logo-web-development-html-css3-canvas-element-web-design-w3c-html5-logo-miscellaneous-text-orange-thumbnail.png', 1, N'HTML is a markup language designed to create web pages on the World Wide Web. It can be helped by technologies like CSS and JavaScript-like scripting languages', N'HTML is a markup language designed to create web pages on the World Wide Web. It can be helped by technologies like CSS and JavaScript-like scripting languages.
Web browsers receive an HTML document from a web server or a local storage and render the document into multimedia web pages. HTML describes the structure of a web page semantically and the initial markings are included for the appearance of the document.
HTML elements are the building blocks of HTML pages. With the HTML structure, images and other objects such as interactive forms can be embedded into the displayed page. HTML provides a means to create structured documents by expressing structural semantics to text such as headings, paragraphs, lists, links, quotes, and others. HTML elements are delimited by tags, written with curly braces. Tags like <img /> and <input /> introduce content directly to the page. Other tags such as <p> surround and provide information about the document text and may include other tags as sub-elements. Browsers do not display HTML tags, but use them to interpret the content of the page.
HTML can embed programs written with scripting such as JavaScript, which affects the behavior and content of web pages. The inclusion of CSS defines the look and layout of the content. The World Wide Web Consortium (W3C), formerly the maintainer of HTML and the current maintainer of the CSS standards, has been promoting the use of CSS over explicit HTML since 1997')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (2, 1, N'CSS', N'https://t3.ftcdn.net/jpg/04/40/47/34/360_F_440473457_oZ4blIQBcwM718DNiPmx26nEeUIEHB5v.jpg', 1, N'Cascading Style Sheets is a style sheet language used for describing the presentation of a document written in a markup language such as HTML. CSS is a cornerstone technology of the World Wide Web, alongside HTML and JavaScript.', N'CSS is used to describe the presentation of documents written in the HTML and XHTML languages. In addition, layered stylesheets can also be used for XML, SVG, and XUL. The CSS specification is maintained by the World Wide Web Consortium (W3C). Instead of placing tags that style HTML (or XHTML) text right within its content, you should use CSS.
The effect of CSS
Minimizes messing up the HTML code of the Web page with style-specific tags (bold, italic, underlined, colored text), making the source code of the Web page neater, separating the content of Web page and display format, easy for content updating.
Create styles that can be applied to multiple Web pages, helping to avoid repeating formatting for the same Web pages.')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (4, 4, N'C', N'https://laptrinhcanban.com/css/images/page/c-programe.webp', 4, N'C is a general-purpose computer programming language. It was created in the 1970s by Dennis Ritchie, and remains very widely used and influential. By design, C''s features cleanly reflect the capabilities of the targeted CPUs.', N'C is a general-purpose programming language, developed in 1972, and still quite popular.

C is very powerful; it has been used to develop operating systems, databases, applications, etc.')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (5, 4, N'C++', N'https://e7.pngegg.com/pngimages/46/626/png-clipart-c-logo-the-c-programming-language-computer-icons-computer-programming-source-code-programming-miscellaneous-template.png', 4, N'C++ is a general-purpose programming language created by Danish computer scientist Bjarne Stroustrup as an extension of the C programming language, or "C with Classes".', N'C++ is a popular programming language.

C++ is used to create computer programs, and is one of the most used language in game development.

')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (6, 4, N'Java', N'https://1000logos.net/wp-content/uploads/2020/09/Java-Logo.png', 4, N'Java is a high-level, class-based, object-oriented programming language that is designed to have as few implementation dependencies as possible.', N'JavaScript is the world''s most popular programming language.

JavaScript is the programming language of the Web.

JavaScript is easy to learn.

This tutorial will teach you JavaScript from basic to advanced.')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (7, 3, N'Learn SQL', N'https://www.webtekno.com/images/editor/default/0003/32/153e57d951908a41f40d54abcf6089680c1e6597.jpeg', 3, N'SQL is a standard language for storing, manipulating and retrieving data in databases.

Our SQL tutorial will teach you how to use SQL in: MySQL, SQL Server, MS Access, Oracle, Sybase, Informix, Postgres, and other database systems.', N'SQL is a standard language for storing, manipulating and retrieving data in databases.')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (8, 3, N'Learn PHP', N'https://i.ytimg.com/vi/3PkJwuY06jE/maxresdefault.jpg', 3, N'PHP is a general-purpose scripting language widely used as a server-side language for creating dynamic web pages. Though its reputation is mixed, PHP is still extremely popular and is used in over 75% of all websites where the server-side programming language is known.', N'PHP is a server scripting language, and a powerful tool for making dynamic and interactive Web pages.')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (9, 3, N'Learn Git', N'https://axisting.com/wp-content/uploads/2019/02/Git-Logo-2Color-770x321-1280x720.jpg', 3, N'Git is a version control tool used widely by developers across the world. It helps individual developers keep track of changes as they work on different features in the same project, and helps teams organize their code. GitHub can integrate with Git - it is a web application that allows users to host, explore, and collaborate on code with their teams and the wider developer community.', N'Git is a version control system.It helps you keep track of code changes and used to collaborate on code.')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (10, 2, N'Learn Javascript', N'data:image/png;base64,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', 2, N'JavaScript, often abbreviated JS, is a programming language that is one of the core technologies of the World Wide Web, alongside HTML and CSS. Over 97% of websites use JavaScript on the client side for web page behavior, often incorporating third-party libraries', N'This tutorial will teach you JavaScript from basic to advanced')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (11, 2, N'Learn jQuery', N'https://codecondo.com/wp-content/uploads/2015/09/12-Best-Resources-to-learn-jQuery_785.png', 2, N'jQuery is a JavaScript library designed to simplify HTML DOM tree traversal and manipulation, as well as event handling, CSS animation, and Ajax. It is free, open-source software using the permissive MIT License. As of May 2019, jQuery is used by 73% of the 10 million most popular websites', N'jQuery greatly simplifies JavaScript programming.')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [CourseName], [CourseImage], [CourseCreator], [CourseInf], [CourseDescription]) VALUES (12, 2, N'Learn React', N'https://thienanblog.com/wp-content/uploads/2017/10/react-logo.png', 3, N'React is a free and open-source front-end JavaScript library for building user interfaces based on UI components. It is maintained by Meta and a community of individual developers and companies.', N'React allows us to create reusable UI components.')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
INSERT [dbo].[Enroll] ([UserID], [CourseID], [EnrollDate]) VALUES (1, 2, GETDATE())
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (1, 4, N'C Intro')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (2, 4, N'C Comment')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (3, 4, N'C Functions')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (4, 5, N'C++ Intro')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (6, 5, N'C++ Comments')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (7, 5, N'C++ FUnctions')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (8, 6, N'Java Intro')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (9, 6, N'Java Comment')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (10, 6, N'Java Methods')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (11, 1, N'HTML Introduction       ')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (12, 1, N'HTML Editors')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (13, 1, N'HTML Attributes')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (14, 2, N'CSS Introduction')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (15, 2, N'CSS Syntax')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (16, 2, N'CSS Selectors')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (30, 10, N'JS Introduction')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (31, 10, N'JS Where to')
INSERT [dbo].[Lesson] ([LessonID], [CourseID], [LessonName]) VALUES (32, 10, N'JS Output')
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[Lessondetail] ON 

INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (1, 3, N'What is C?', N'', N'C is a general-purpose programming language created by Dennis Ritchie at the Bell Laboratories in 1972.

It is a very popular language, despite being old.

C is strongly associated with UNIX, as it was developed to write the UNIX operating system.

')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (1, 4, N'Difference between C and C++', N'', N'C++ was developed as an extension of C, and both languages have almost the same syntax
The main difference between C and C++ is that C++ support classes and objects, while C does not')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (2, 5, N'Comments in C', N'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20191113114930/Comments.png', N'Comments can be used to explain code, and to make it more readable. It can also be used to prevent execution when testing alternative code.

Comments can be singled-lined or multi-lined.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (2, 6, N'Single-line Comments', N'', N'Single-line comments start with two forward slashes (//).

Any text between // and the end of the line is ignored by the compiler (will not be executed).

This example uses a single-line comment before a line of code:')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (2, 9, N'C Multi-line Comments', N'', N'Multi-line comments start with /* and ends with */.

Any text between /* and */ will be ignored by the compiler:')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (3, 11, N'Predefined Functions', N'https://engineerstutor.com/wp-content/uploads/2018/11/f1.jpg', N'So it turns out you already know what a function is. You have been using it the whole time while studying this tutorial!

For example, main() is a function, which is used to execute code, and printf() is a function; used to output/print text to the screen:')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (3, 12, N'Create a Function', N'', N'To create (often referred to as declare) your own function, specify the name of the function, followed by parentheses () and curly brackets {}:

Syntax
void myFunction() {
  // code to be executed
}
Example Explained
myFunction() is the name of the function
void means that the function does not have a return value. You will learn more about return values later in the next chapter
Inside the function (the body), add code that defines what the function should do')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (3, 13, N'Call a Function', N'', N'Declared functions are not executed immediately. They are "saved for later use", and will be executed when they are called.

To call a function, write the function''s name followed by two parentheses () and a semicolon ;')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (4, 14, N'What is C++?', N'https://i.ytimg.com/vi/-HE9Dj9WuuY/maxresdefault.jpg', N'C++ is a cross-platform language that can be used to create high-performance applications.C++ was developed by Bjarne Stroustrup, as an extension to the C language.C++ gives programmers a high level of control over system resources and memory.The language was updated 4 major times in 2011, 2014, 2017, and 2020 to C++11, C++14, C++17, C++20.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (4, 16, N'Difference between C and C++', N'', N'C++ was developed as an extension of C, and both languages have almost the same syntax.

The main difference between C and C++ is that C++ support classes and objects, while C does not.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (6, 28, N'C++ Comments', N'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20191113114930/Comments.png', N'Comments can be used to explain C++ code, and to make it more readable. It can also be used to prevent execution when testing alternative code. Comments can be singled-lined or multi-lined')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (6, 29, N'Single-line Comments', N'', N'Single-line comments start with two forward slashes (//).

Any text between // and the end of the line is ignored by the compiler (will not be executed). This example uses a single-line comment before a line of code:

Example
// This is a comment
cout << "Hello World!";')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (6, 30, N'C++ Multi-line Comments', N'', N'Multi-line comments start with /* and ends with */.

Any text between /* and */ will be ignored by the compiler:

Example
/* The code below will print the words Hello World!
to the screen, and it is amazing */
cout << "Hello World!";')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (7, 31, N'Create a Function', N'data:image/png;base64,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', N'C++ provides some pre-defined functions, such as main(), which is used to execute code. But you can also create your own functions to perform certain actions.

To create (often referred to as declare) a function, specify the name of the function, followed by parentheses ():

Syntax
void myFunction() {
  // code to be executed
}')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (7, 32, N'Call a Function', N'', N'Declared functions are not executed immediately. They are "saved for later use", and will be executed later, when they are called.

To call a function, write the function''s name followed by two parentheses () and a semicolon ;

In the following example, myFunction() is used to print a text (the action), when it is called:

Example
Inside main, call myFunction():

// Create a function
void myFunction() {
  cout << "I just got executed!";
}

int main() {
  myFunction(); // call the function
  return 0;
}

// Outputs "I just got executed!"
A function can be called multiple times:

Example
void myFunction() {
  cout << "I just got executed!\n";
}

int main() {
  myFunction();
  myFunction();
  myFunction();
  return 0;
}

// I just got executed!
// I just got executed!
// I just got executed!')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (7, 33, N'Function Declaration and Definition', N'', N'A C++ function consist of two parts:

Declaration: the return type, the name of the function, and parameters (if any)
Definition: the body of the function (code to be executed)
void myFunction() { // declaration
  // the body of the function (definition)
}
Note: If a user-defined function, such as myFunction() is declared after the main() function, an error will occur:

Example
int main() {
  myFunction();
  return 0;
}

void myFunction() {
  cout << "I just got executed!";
}

// Error
However, it is possible to separate the declaration and the definition of the function - for code optimization.

You will often see C++ programs that have function declaration above main(), and function definition below main(). This will make the code better organized and easier to read:

Example
// Function declaration
void myFunction();

// The main method
int main() {
  myFunction();  // call the function
  return 0;
}

// Function definition
void myFunction() {
  cout << "I just got executed!";
}')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (8, 34, N'What is Java?', N'https://cdn.ttgtmedia.com/rms/onlineimages/hello-world-examples_mobile.gif', N'Java is a popular programming language, created in 1995.

It is owned by Oracle, and more than 3 billion devices run Java.

It is used for:

Mobile applications (specially Android apps)
Desktop applications
Web applications
Web servers and application servers
Games
Database connection
And much, much more!')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (8, 35, N'Why Use Java?', N'', N'Java works on different platforms (Windows, Mac, Linux, Raspberry Pi, etc.)
It is one of the most popular programming language in the world
It is easy to learn and simple to use
It is open-source and free
It is secure, fast and powerful
It has a huge community support (tens of millions of developers)
Java is an object oriented language which gives a clear structure to programs and allows code to be reused, lowering development costs
As Java is close to C++ and C#, it makes it easy for programmers to switch to Java or vice versa')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (9, 36, N'Java Comments', N'http://www.avajava.com/tutorials/eclipse/how-do-i-comment-out-a-section-of-code/how-do-i-comment-out-a-section-of-code-02.gif', N'Comments can be used to explain Java code, and to make it more readable. It can also be used to prevent execution when testing alternative code.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (9, 37, N'Single-line Comments', N'', N'Single-line comments start with two forward slashes (//).

Any text between // and the end of the line is ignored by Java (will not be executed).

This example uses a single-line comment before a line of code:

Example
// This is a comment
System.out.println("Hello World");

This example uses a single-line comment at the end of a line of code:

Example
System.out.println("Hello World"); // This is a comment')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (9, 38, N'Java Multi-line Comments', N'', N'Multi-line comments start with /* and ends with */.

Any text between /* and */ will be ignored by Java.

This example uses a multi-line comment (a comment block) to explain the code:

Example
/* The code below will print the words Hello World
to the screen, and it is amazing */
System.out.println("Hello World");')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (10, 39, N'NUCreate a MethodLL', N'https://linuxhint.com/wp-content/uploads/2022/02/methods-java-01.png', N'A method must be declared within a class. It is defined with the name of the method, followed by parentheses (). Java provides some pre-defined methods, such as System.out.println(), but you can also create your own methods to perform certain actions:

Example
Create a method inside Main:

public class Main {
  static void myMethod() {
    // code to be executed
  }
}
 
Example Explained
myMethod() is the name of the method
static means that the method belongs to the Main class and not an object of the Main class. You will learn more about objects and how to access methods through objects later in this tutorial.
void means that this method does not have a return value. You will learn more about return values later in this chapter
')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (10, 40, N'Call a Method', N'', N'To call a method in Java, write the method''s name followed by two parentheses () and a semicolon;

In the following example, myMethod() is used to print a text (the action), when it is called:

Example
Inside main, call the myMethod() method:

public class Main {
  static void myMethod() {
    System.out.println("I just got executed!");
  }

  public static void main(String[] args) {
    myMethod();
  }
}

// Outputs "I just got executed!"
 

A method can also be called multiple times:

Example
public class Main {
  static void myMethod() {
    System.out.println("I just got executed!");
  }

  public static void main(String[] args) {
    myMethod();
    myMethod();
    myMethod();
  }
}

// I just got executed!
// I just got executed!
// I just got executed!')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (11, 42, N'A Simple HTML Document', N'https://1.bp.blogspot.com/-GpQBhQO7idw/XVAi0hblXiI/AAAAAAAAIOk/HMTEaGCft_kJuhKAma7ii2SWoeTKsujqgCK4BGAsYHg/s1575/basicHTML.png', N'Example Explained
The <!DOCTYPE html> declaration defines that this document is an HTML5 document
The <html> element is the root element of an HTML page
The <head> element contains meta information about the HTML page
The <title> element specifies a title for the HTML page (which is shown in the browser''s title bar or in the page''s tab)
The <body> element defines the document''s body, and is a container for all the visible contents, such as headings, paragraphs, images, hyperlinks, tables, lists, etc.
')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (11, 43, N'What is an HTML Element?', N'https://schoolsofweb.com/wp-content/uploads/anatomy-of-an-html-element.jpg', N'An HTML element is defined by a start tag, some content, and an end tag:
<tagname> Content goes here... </tagname>
Note: Some HTML elements have no content (like the <br> element). These elements are called empty elements. Empty elements do not have an end tag!
')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (11, 44, N'HTML History', N'https://2.bp.blogspot.com/-XZtCh2gZThc/UqLqxqhc8NI/AAAAAAAAAcc/VMH7qotTRnA/s1600/HTML+Version+History-all-web-programing.blogspot.com.jpg', N'This tutorial follows the latest HTML5 standard.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (12, 45, N'Step 1: Open TextEdit (Mac)', N'https://cdn.osxdaily.com/wp-content/uploads/2016/12/textedit-tabs-mac-1-610x376.jpg', N'Open Finder > Applications > TextEdit

Also change some preferences to get the application to save files correctly. In Preferences > Format > choose "Plain Text"

Then under "Open and Save", check the box that says "Display HTML files as HTML code instead of formatted text".

Then open a new document to place the code.
')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (12, 46, N'Step 2: Write Some HTML', N'https://th.bing.com/th/id/R.9191d62b947c3a5c86593ad8cfde812c?rik=eNWIfXMCEVclhw&riu=http%3a%2f%2fwww-db.deis.unibo.it%2fcourses%2fTW%2fDOCS%2fw3schools%2fhtml%2fimg_notepad.png&ehk=LjdyMp7COM6JWPScBNT%2bPB84WmSloI%2bJbWArim1ES1U%3d&risl=&pid=ImgRaw&r=0', N'Write or copy the following HTML code into Notepad')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (12, 47, N'Step 3: Save the HTML Page', N'https://th.bing.com/th/id/R.d1ad00708a26db4d90d0621fda31380d?rik=3IakjmA0ZcO6aQ&riu=http%3a%2f%2fwww.gadgetsright.com%2fwp-content%2fuploads%2f2018%2f06%2fMSD-2007-6-7.jpg&ehk=gaEXzLWO8zKggnw6Yyc2kBl6S8Z%2fjZJVl94v0hRCLes%3d&risl=&pid=ImgRaw&r=0', N'Save the file on your computer. Select File > Save as in the Notepad menu.
Tip: You can use either .htm or .html as file extension. There is no difference, it is up to you.
')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (12, 51, N'Step 4: View the HTML Page in Your Browser', N'https://th.bing.com/th/id/R.55d7db265df16b3d3a3cd00240ce20e8?rik=qebSZx2jnhMRhA&pid=ImgRaw&r=0', N'Open the saved HTML file in your favorite browser (double click on the file, or right-click - and choose "Open with").')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (13, 52, N'The href Attribute', N'https://i.ytimg.com/vi/E2DHD0nLTnY/maxresdefault.jpg', N'The <a> tag defines a hyperlink. The href attribute specifies the URL of the page the link goes to:')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (13, 53, N'The src Attribute', N'https://discourse-user-assets.s3.amazonaws.com/original/3X/3/8/38324c7ccd8787a69917e7a622d45c3d94e18585.png', N'The <img> tag is used to embed an image in an HTML page. The src attribute specifies the path to the image to be displayed')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (13, 54, N'The width and height Attributes', N'https://www.wikihow.com/images/thumb/b/be/Set-Image-Width-and-Height-Using-HTML-Step-3-Version-3.jpg/v4-460px-Set-Image-Width-and-Height-Using-HTML-Step-3-Version-3.jpg', N'The <img> tag should also contain the width and height attributes, which specifies the width and height of the image (in pixels)')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (14, 55, N'Why Use CSS?', N'https://external-preview.redd.it/YyzoMSk5ftbg_x-udvt00GInP0P8a85BiR4DHXICLw8.jpg?auto=webp&s=a8319728e4821bfa7138e4eecc324300156bffce', N'CSS is used to define styles for your web pages, including the design, layout and variations in display for different devices and screen sizes.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (14, 56, N'CSS Solved a Big Problem', N'https://th.bing.com/th/id/R.70dd66c9b8a761cd6e6b97bd0b351954?rik=Y2wsHbr9MrzSLg&pid=ImgRaw&r=0', N'HTML was NEVER intended to contain tags for formatting a web page!

HTML was created to describe the content of a web page, like:

<h1>This is a heading</h1>

<p>This is a paragraph.</p>
 When tags like <font>, and color attributes were added to the HTML 3.2 specification, it started a nightmare for web developers. Development of large websites, where fonts and color information were added to every single page, became a long and expensive process.

To solve this problem, the World Wide Web Consortium (W3C) created CSS.

CSS removed the style formatting from the HTML page!
')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (15, 57, N'CSS Syntax', N'https://th.bing.com/th/id/R.aba7b647604797e5d23a44c772d12322?rik=kxRlPuO0jiH7Rg&pid=ImgRaw&r=0', N'Example Explained
p is a selector in CSS (it points to the HTML element you want to style: <p>).
color is a property, and red is the property value

The selector points to the HTML element you want to style.
The declaration block contains one or more declarations separated by semicolons.
Each declaration includes a CSS property name and a value, separated by a colon.
Multiple CSS declarations are separated with semicolons, and declaration blocks are surrounded by curly braces.
')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (16, 58, N'The CSS element Selector', N'https://th.bing.com/th/id/R.df7456f5a9a2a82f337c64735e1ac513?rik=9xlOt4%2fGpLV6%2fw&riu=http%3a%2f%2fwww.corelangs.com%2fcss%2fbasics%2fimg%2fselectors.png&ehk=f%2bc9dDTay%2bgSvmm0QverKjDM83PLdADiPIlQ0Mh8kQk%3d&risl=&pid=ImgRaw&r=0', N'The element selector selects HTML elements based on the element name.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (16, 59, N'The CSS id Selector', N'https://th.bing.com/th/id/R.1cc5499f0ebba8e6228a4e745d86fba3?rik=nTIAlYzHpNPg6Q&riu=http%3a%2f%2f4.bp.blogspot.com%2f-OrpFUE2V7TU%2fT1uovTj_BgI%2fAAAAAAAAAEM%2foh-V2R8NY_E%2fs1600%2fid_selector.jpg&ehk=zHUHHP9hpVzq%2f2czjhH%2f%2f3Our6NS%2bvsk06%2bv8RH%2foGc%3d&risl=&pid=ImgRaw&r=0&sres=1&sresct=1

', N'The id selector uses the id attribute of an HTML element to select a specific element.

The id of an element is unique within a page, so the id selector is used to select one unique element!

To select an element with a specific id, write a hash (#) character, followed by the id of the element.

')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (16, 60, N'The CSS class Selector', N'https://th.bing.com/th/id/R.bea9cae13e82c84a34414b011ed47c3a?rik=sxpyidOHdLQBAA&riu=http%3a%2f%2f1.bp.blogspot.com%2f-n-2AViW6HXc%2fT1umJtAy_dI%2fAAAAAAAAAEE%2fCjeM5rPxylw%2fs1600%2fclass_selector.jpg&ehk=0ORTNUXAM9pyWQgNI%2bl8ZL%2f8EhXSWbXkonv0Jy6N3YQ%3d&risl=&pid=ImgRaw&r=0

', N'https://th.bing.com/th/id/R.bea9cae13e82c84a34414b011ed47c3a?rik=sxpyidOHdLQBAA&riu=http%3a%2f%2f1.bp.blogspot.com%2f-n-2AViW6HXc%2fT1umJtAy_dI%2fAAAAAAAAAEE%2fCjeM5rPxylw%2fs1600%2fclass_selector.jpg&ehk=0ORTNUXAM9pyWQgNI%2bl8ZL%2f8EhXSWbXkonv0Jy6N3YQ%3d&risl=&pid=ImgRaw&r=0')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (16, 61, N'The CSS Universal Selector', N'https://i.ytimg.com/vi/UgX8gfErOGg/maxresdefault.jpg', N'The universal selector (*) selects all HTML elements on the page.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (16, 62, N'The CSS Grouping Selector', N'https://i.ytimg.com/vi/-I1KUN7cg0Q/maxresdefault.jpg', N'The grouping selector selects all the HTML elements with the same style definitions.
It will be better to group the selectors, to minimize the code.
To group selectors, separate each selector with a comma.
')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (30, 82, N'JavaScript Can Change HTML Content', N'LessonJSintrol1.png', N'One of many JavaScript HTML methods is getElementById().The example below "finds" an HTML element (with id="demo"), and changes the element content (innerHTML) to "Hello JavaScript":'')')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (30, 84, N'JavaScript Can Change HTML Styles (CSS)', N'LessonJSintrol2.png', N'Changing the style of an HTML element, is a variant of changing an HTML attribute:')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (30, 85, N'JavaScript Can Hide HTML Elements', N'LessonJSintrol3.png', N'Hiding HTML elements can be done by changing the display style:')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (31, 86, N'The <script> Tag', N'where1.png', N'In HTML, JavaScript code is inserted between <script> and </script> tags.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (31, 87, N'JavaScript Functions and Events', N'', N'A JavaScript function is a block of JavaScript code, that can be executed when "called" for.
		   For example, a function can be called when an event occurs, like when the user clicks a button.')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (31, 88, N'JavaScript in <head>', N'where3.png', N'In this example, a JavaScript function is placed in the <head> section of an HTML page.
           The function is invoked (called) when a button is clicked:')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (32, 89, N'Using innerHTML', N'Output1.png', N'To access an HTML element, JavaScript can use the document.getElementById(id) method. 
           The id attribute defines the HTML element. The innerHTML property defines the HTML content:')
INSERT [dbo].[Lessondetail] ([LessonID], [LessondetailID], [LessonContent], [LessionImage], [LessonDescription]) VALUES (32, 90, N'Using document.write()', N'Output2.png', N'For testing purposes, it is convenient to use document.write():')
SET IDENTITY_INSERT [dbo].[Lessondetail] OFF
GO
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (1, N'What is a correct syntax to output "Hello World" in C?', 1, 2)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (2, N'Which operator is used to add together two values?', 1, 3)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (3, N'Which operator can be used to find the memory size (in bytes) of a data type or variable?', 3, 4)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (4, N'How do you create a variable with the floating number 2.8?', 1, 5)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (5, N'Which method can be used to find the length of a string?', 1, 7)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (6, N'Which header file lets us work with input and output objects?', 4, 8)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (7, N'How do you create a variable with the floating number 2.8?', 4, 9)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (8, N'Which method can be used to return a string in upper case letters?', 1, 10)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (9, N'How do you create a method in Java?', 3, 11)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (10, N'Who is making the Web standards?', 2, 15)
INSERT [dbo].[Question] ([QuestionID], [QuestionInf], [CorrectAnswer], [QuizID]) VALUES (11, N'Choose the correct HTML element for the largest heading:', 4, 16)
GO
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (2, 1)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (3, 2)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (4, 3)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (5, 4)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (7, 6)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (8, 7)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (9, 8)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (10, 9)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (11, 10)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (15, 11)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (16, 12)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (17, 13)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (18, 14)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (19, 15)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (20, 16)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (21, 30)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (22, 31)
INSERT [dbo].[Quiz] ([QuizID], [LessonID]) VALUES (23, 32)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [Phone], [Dob], [Admin], [Student], [Name],Gmail) 
VALUES (1, N'ANHNT', N'123', '123456789', CAST(N'2005-12-04' AS Date), 1, 0, 'Nguyen Tuan Anh','tuananh@gmail.com')
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [Phone], [Dob], [Admin], [Student], [Name],Gmail) 
VALUES (2, N'TUANLN', N'123', '210011001', CAST(N'2005-12-04' AS Date), 1, 0, 'Le Nam Tuan','namtuan@gmail.com')
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [Phone], [Dob], [Admin], [Student], [Name],Gmail) 
VALUES (3, N'MANHND', N'123', '210011001', CAST(N'2005-12-04' AS Date), 1, 0, 'Nguyen Dinh Manh','dinhmanh@gmail.com')
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [Phone], [Dob], [Admin], [Student], [Name],Gmail) 
VALUES (4, N'ANHHD', N'123', '210011001', CAST(N'2005-12-04' AS Date), 1, 0, 'Hoang Duc Anh','ducanh@gmail.com')
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [Phone], [Dob], [Admin], [Student], [Name],Gmail) 
VALUES (5, N'PHUNL', N'123', '210011001', CAST(N'2005-12-04' AS Date), 1, 0, 'Nguyen Luong Phu','luongphu@gmail.com')
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [Phone], [Dob], [Admin], [Student], [Name],Gmail) 
VALUES (6, N'sd1', N'123', '210011001', CAST(N'2005-12-04' AS Date), 0, 1, 'Student','stu@gmail.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Answer]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Question] ([QuestionID])
GO
ALTER TABLE [dbo].[BlogFeedback]  WITH CHECK ADD  CONSTRAINT [FK_BlogFeedback_Blogg] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blogg] ([BlogID])
GO
ALTER TABLE [dbo].[BlogFeedback] CHECK CONSTRAINT [FK_BlogFeedback_Blogg]
GO
ALTER TABLE [dbo].[BlogFeedback]  WITH CHECK ADD  CONSTRAINT [FK_BlogFeedback_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[BlogFeedback] CHECK CONSTRAINT [FK_BlogFeedback_User]
GO
ALTER TABLE [dbo].[Blogg]  WITH CHECK ADD  CONSTRAINT [FK_Blogg_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Blogg] CHECK CONSTRAINT [FK_Blogg_User]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_BlogFeedback] FOREIGN KEY([BfbID])
REFERENCES [dbo].[BlogFeedback] ([BfbID])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_BlogFeedback]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_Blogg] FOREIGN KEY([BlogID])
REFERENCES [dbo].[Blogg] ([BlogID])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_Blogg]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_User]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Category] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Category]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_Course]
GO
ALTER TABLE [dbo].[Enroll]  WITH CHECK ADD  CONSTRAINT [FK_Enroll_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Enroll] CHECK CONSTRAINT [FK_Enroll_User]
GO
ALTER TABLE [dbo].[Lesson]  WITH CHECK ADD  CONSTRAINT [FK_Lesson_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Lesson] CHECK CONSTRAINT [FK_Lesson_Course]
GO
ALTER TABLE [dbo].[Lessondetail]  WITH CHECK ADD  CONSTRAINT [FK_Lessondetail_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[Lessondetail] CHECK CONSTRAINT [FK_Lessondetail_Lesson]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_Lesson]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_Course] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_Course]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK_Review_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK_Review_User]
GO
USE [master]
GO
ALTER DATABASE [Online Learning] SET  READ_WRITE 
GO
