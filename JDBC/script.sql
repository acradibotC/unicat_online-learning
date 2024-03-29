USE master
CREATE DATABASE [Unicat Online Learning]
USE [Unicat Online Learning]
GO

/****** Object:  Table [dbo].[Answer]    Script Date: 1/3/2023 4:24:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answer](
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Answer_AnswerID] PRIMARY KEY CLUSTERED 
(
	[AnswerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 1/3/2023 4:24:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogComments]    Script Date: 1/3/2023 4:24:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogFeedback]    Script Date: 1/3/2023 4:24:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/3/2023 4:24:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 1/3/2023 4:24:20 AM ******/
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
	[Request] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Course_CourseID] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseEnroll]    Script Date: 1/3/2023 4:24:20 AM ******/
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
/****** Object:  Table [dbo].[Lesson]    Script Date: 1/3/2023 4:24:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Question]    Script Date: 1/3/2023 4:24:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Question](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CorrectAnswer] [int] NOT NULL,
	[QuizID] [int] NOT NULL,
 CONSTRAINT [PK_Question_QuestionID] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 1/3/2023 4:24:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
 CONSTRAINT [PK_Quiz_QuizID] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 1/3/2023 4:24:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Vote] [int] NOT NULL,
 CONSTRAINT [PK_Review_ReviewID] PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewComments]    Script Date: 1/3/2023 4:24:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewComments](
	[ReviewCommentID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewFeedbackID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ReviewCommentContent] [nvarchar](max) NOT NULL,
	[ReviewCommentDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReviewComments_ReviewCommentID] PRIMARY KEY CLUSTERED 
(
	[ReviewCommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReviewFeedback]    Script Date: 1/3/2023 4:24:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReviewFeedback](
	[ReviewFeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ReviewFeedbackContent] [nvarchar](max) NOT NULL,
	[ReviewFeedbackDate] [datetime] NOT NULL,
 CONSTRAINT [PK_ReviewFeedback_ReviewFeedbackID] PRIMARY KEY CLUSTERED 
(
	[ReviewFeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/3/2023 4:24:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PassWord] [nvarchar](max) NULL,
	[FullName] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[DOB] [date] NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[FacebookID] [nvarchar](1) NULL,
	[GmailID] [nvarchar](1) NULL,
	[RoleID] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_User_UserID] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 1/3/2023 4:24:20 AM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (1, 1, N'Top 3 Programming Languages to Learn in 2023', N'https://media.geeksforgeeks.org/wp-content/uploads/20230117173131/Top-10-Programming-Languages-That-You-Should-Learn-in-2023.png', N'<div class="blog_image"><img src="https://www.simplilearn.com/ice9/free_resources_article_thumb/Best-Programming-Languages-to-Start-Learning-Today.jpg" alt=""></div>
				<p>Having complete knowledge of at least one programming language is a boon to every upcoming developer who’s entering the world of technology. Improve your coding and problem-solving skills and become a software developer. Software developers have a lucrative career and hence, they’re the most demanding ones. As per the survey, programming jobs are expected to rise by 21% by the year 2028. Wikipedia claims that there are around 700 programming languages. So deciding which language to learn among the most popular programming language is quite confusing.
				<p>Every year, new programming languages are added to the list, and hence, the confusion increases. Hence, to come up with a solution where you can choose the best programming language among hundreds, we have articulated this article keeping several factors in demand. The factors may be career perception, future demands, business requirements, and features of different programming languages. Without much ado, let’s get started:</p>
				<p style="font-weight: bold;">What is a Programming Language?</p>
                <p>A programming language is a language that computers understand and is used to build software programs, and scripts. It is also referred to as a set of instructions (syntax) written by programmers that computers use to build applications. Every language share similarity, having its own syntax. </p>
                <p>You need to have a strong command over any one programming language while having a basic idea of the most popular programming languages is appreciated. The count in the list of programming languages increases day by day. </p>
				<p style="font-weight: bold;">Types of Programming Languages:</p>
				<ul>
				<li> - Procedural programming language</li>
				<li> - Functional programming language</li>
				<li> - Object-oriented programming language</li>
				<li> - Scripting programming language</li>
				<li> - Logic programming language</li>
				</ul>
                <p>Some of the most popular programming languages are Python, JavaScript, Java, C/C++, C#, and many more.</p>
				<p style="font-weight: bold;">Best Programming Languages to Learn in 2023</p>
				<p style="font-style: italic; font-weight: bold;">1. JavaScript: </p>
				<p>JavaScript is one of the world’s most popular programming languages on the web. Using JavaScript, you can build some of the most interactive websites. Also, it is one of the most demanding languages in programming as per recent reports by Stack Overflow. As per the survey, more than 97 percent of the websites use JavaScript on the client side of the webpage. As per the latest statistics, 72% of companies are looking for JavaScript developers. Hence learning Advanced Javascript can be the most amazing decision that you can make in 2023 to fuel your career.</p>
				<ul>
				<li> - It has a well-organized codebase that provides enhanced productivity and readability</li>
				<li> - Platform independence and greater control of the browser</li>
				<li> - Provide user input validation features</li>
				<li> - The top companies using JavaScript are Microsoft, Uber, PayPal, Google, Walmart, etc.</li>
				</ul>
				<p style="font-weight: bold;">Average Annual Salary of JavaScript Developer – $118,000</p>
				<p style="font-style: italic; font-weight: bold;">2. Python: </p>
				<p>Python can be regarded as the future of programming languages. As per the latest statistics, Python is the main coding language for around 80% of developers. The presence of extensive libraries in Python facilitates artificial intelligence, data science, and machine learning processes. Currently, Python is trending and can be regarded as the king of programming languages. Hence, learning this programming language in 2023 promises you success and growth, offering amazing features like:</p>
				<ul>
				<li> - Easy to learn and code</li>
				<li> - Extensive libraries and frameworks that support a plethora of applications</li>
				<li> - Incorporated the variants of Java and C like CPython, Jython, etc.</li>
				<li> - GUI support</li>
				<li> - Companies working on Python: Intel, Facebook, Spotify, Netflix, etc. </li>
				</ul>
				<p style="font-weight: bold;">Average Annual Salary of Python Developer – $120,000</p>
				<p style="font-style: italic; font-weight: bold;">3. Java:</p>
				<p>Java is one of the most powerful programming languages that is currently used in more than 3 billion devices. Java is currently one of the most trending technologies being used in desktop applications, mobile applications, web development, Artificial intelligence, cloud applications, and many more. So learning and acing in this technology offers insanely high salaries, amazing growth opportunities, and global recognition. So Java can be regarded as one of the topmost programming languages to learn in 2023. Some of the prominent features of Java are:</p>
				<ul>
				<li> - Platform independence and Object-oriented programming</li>
				<li> - Enhanced productivity, performance, and security</li>
				<li> - It is the most secure language</li>
				<li> - Companies working on Java are Amazon, Adobe, Flipkart, Instagram, etc.</li>
				</ul>
				<p style="font-weight: bold;">Average Annual Salary of Java Developer – $104,000</p>', CAST(N'2023-02-25T21:04:11.967' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (2, 2, N'5 Ways to Improve Time Management Skills', N'https://media.geeksforgeeks.org/wp-content/uploads/20230202174722/5-Ways-to-Improve-Time-Management.gif', N'	<p>Time management is a task that requires constant attention to stay on track and achieve goals. It involves planning, prioritizing, and executing tasks in a way that allows you to meet deadlines and achieve the most critical goals in your life. If you want to enhance your time management skills but need help figuring out where to start, this blog is for you! In this article, we’ll cover the most practical ways to improve time management.</p>
				<div class="blog_image"><img src="https://interaction-training.com/wp-content/uploads/elementor/thumbs/improve-your-time-management-skills-olbd7w3ii2scu1hkfz2plovds3icc0yr1ct2ydnjpk.jpg" alt=""></div>
				<p style="font-weight: bold;">Why is Time Management Critical?</p>
                <p>There are a few points why time management is so important, take a look:</p>
				<ul>
				<li> - Time management skills can help you organize and prioritize your work, enabling you to focus on the most critical tasks.</li>
				<li> - Good time management skills can also help you to stay organized and efficient when working with a busy schedule, minimizing stress and maximizing productivity.</li>
				<li> - Finally, good time management skills can allow you to manage your resources better – both mental and physical – so that they are used effectively to achieve goals. </li>
				</ul>
				<p>So, how can you improve your time management skills? Here’s the answer.</p>
				<p style="font-weight: bold;">5 Key Strategies To Improve Your Time Management Skills</p>
				<p>You can do a few key things to improve your time management skills. Here’s how you can improve your time management skills and get your work done on time</p>
				<p style="font-style: italic; font-weight: bold;">1. Set Realistic Goals and Deadlines</p>
				<p>One of the first things you must do is set reasonable goals and deadlines for yourself. If you’re working towards a goal that needs to be more ambitious or realistic, achieving success will be much more challenging. So instead, stick to goals that are within reach but still challenging enough to avoid becoming bored or complacent with your work. Also, you can write down the deadline by which you want to complete the task as it will help you to analyze your thoughts according and the work will be completed properly. </p>
				<p style="font-weight: bold;">Average Annual Salary of JavaScript Developer – $118,000</p>
				<p style="font-style: italic; font-weight: bold;">2. Prioritize Tasks</p>
				<p>Once you set your goals, the next step is to prioritize your tasks. Determining which task should take priority and why can be challenging, but you must decide based on what will best achieve your objectives. </p>
				<p>Follow these steps to complete your task in order:</p>
				<ul>
				<li> - Make a list of tasks</li>
				<li> - Organize tasks on the basis of prioritization</li>
				<li> - Use a calendar for scheduling the tasks</li>
				<li> - Communicate about your progress with the teammates</li>
				</ul>
				<p style="font-style: italic; font-weight: bold;">3. Execution Plan</p>
				<p>Finally, always keep in mind that executing your plan is very important – everything from breaking down a significant goal into specific steps to creating timelines for each stage of the project. By having an effective execution plan, you can ensure that all tasks are completed as planned and on time. </p>
				<p>It also helps in the micro-management of tasks along with maintaining control over the work that you are about to start. Also, it helps in establishing a proper relationship among the team members for achieving the milestones.</p>
				<p style="font-style: italic; font-weight: bold;">4. Manage Stress</p>
				<p>Another essential strategy to improve your time management skills is to manage stress. Too much stress can hurt your mental and physical well-being, so you must reduce the stress you experience.</p>
				<p>You can manage stress by taking such steps:</p>
				<ul>
				<li> - Establish boundaries</li>
				<li> - Take time to replenish</li>
				<li> - Identify your stress level</li>
				<li> - Practice relaxing techniques</li>
				<li> - Accept your condition and ask for support</li>
				</ul>
				<p style="font-style: italic; font-weight: bold;">5. Develop a Systems-based Approach</p>
				<p>In addition to effective time management strategies, it’s crucial to have a systems-based approach when working on tasks. This means organizing your work in a way that makes sense and allows you to track progress. By taking these steps, you can better manage your time and achieve your most important objectives.</p>
				<p>You can also follow these steps to manage time in a proper way:</p>
				<ul>
				<li> - Taking regular breaks: Even if it’s just for 5 minutes, spending time away from work daily will help reduce stress. Try nature walk, meditating, or reading a book.</li>
				<li> - Set boundaries: When things get too hectic, take time to set boundaries with your work. Make a list of what you’re willing to accept, and take your time with the task.</li>
				<li> - Enhance your productivity: One of the best ways to manage stress is to improve your productivity. This means working smarter, not harder- try using tools such as day planners or tracking software that will require you to stay organized and on task throughout the day.</li>
				</ul>
				<p>So how do you go about improving these time management skills in practice?</p>
				', CAST(N'2023-02-25T21:04:11.970' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (3, 1, N'What is an API (Application Programming Interface)?', N'https://media.geeksforgeeks.org/wp-content/uploads/20230216170349/What-is-an-API.png', N'<p>Everyone is in search of the highest-paying job so as to get into it. And, in the list, the web developer is on the top for years and will remain in the same place due to its demand. If you’re the one who’s looking for getting into it. you must be aware of the most important terms used in it. Out of all the terms, API is yet another term that plays a very important role while building a website. Now, what is an API – (Application Programming Interface)?</p>', CAST(N'2023-02-25T21:04:11.970' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (4, 3, N'What is JavaDoc tool and how to use it?', N'https://media.geeksforgeeks.org/wp-content/uploads/20190408123340/JavaDoc-tool.jpg', N'<p>JavaDoc tool is a document generator tool in Java programming language for generating standard documentation in HTML format. It generates API documentation. It parses the declarations ad documentation in a set of source file describing classes, methods, constructors, and fields.</p>', CAST(N'2023-02-25T21:04:11.970' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (5, 3, N'What is Linked List', N'https://media.geeksforgeeks.org/wp-content/uploads/20220816144425/LLdrawio.png', N'<p>Like arrays, a Linked List is a linear data structure. Unlike arrays, linked list elements are not stored at a contiguous location; the elements are linked using pointers. They include a series of connected nodes. Here, each node stores the data and the address of the next node.</p>', CAST(N'2023-02-25T21:04:11.970' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (6, 3, N'Requirements to become a full stack developer', N'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230215141955/Requirements-to-become-a-full-stack-developer.png', N'<p>A full stack developer is a person who is an expert in designing, building, maintaining, and updating both the front end and back end of a website or a web application. A full-stack developer is someone who can develop both client and server software. One should be well familiar with front-end, and back-end technologies frameworks and database management systems, and web hosting platforms.</p>', CAST(N'2023-02-25T21:04:11.970' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (7, 4, N'How To Write Thank You Email After Interview?', N'https://media.geeksforgeeks.org/wp-content/uploads/20230209164630/How-To-Write-Thank-You-Email-After-Interview.gif', N'<p>Sending a thank you email after an interview is a great way to show your appreciation and express your enthusiasm for the opportunity presented to you. It also serves as an opportunity to reiterate why you feel you would be a great fit for the role and remind the hiring manager of your skills and qualifications. We’ve covered more about how to write a thank you email after an interview in this article.</p>', CAST(N'2023-02-25T21:04:11.970' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (8, 4, N'Role of Business Intelligence in Finance', N'https://media.geeksforgeeks.org/wp-content/uploads/20230208105137/Role-of-Business-Intelligence-in-Finance.png', N'<p>Business Intelligence is the abbreviation for the technology, instruments, and procedures that businesses employ to analyze data and come to wise business judgments. In the field of finance, business intelligence (BI) is essential for assisting firms in tracking their financial performance, spotting patterns, and making data-driven choices. In this article, we’ll cover the role of business intelligence in finance and what are its pros.</p>', CAST(N'2023-02-25T21:04:11.970' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (9, 5, N'How to Write a Cover Letter in 2023', N'https://media.geeksforgeeks.org/wp-content/uploads/20230209132824/How-to-Write-a-Cover-Letter-That-Will-Get-You-Noticed-(2023).png', N'<p>After hours of job hunting, when you finally get the perfect opportunity that you were looking forward to, only submitting a great resume will not guarantee your success. It would be best if you had something more to ensure the recruiter that you are different and perfect for the opportunity. There is one more document that can fill this gap for you – Cover Letter. In this article, we’re going to talk about how to write a cover letter that will get you noticed.</p>', CAST(N'2023-02-25T21:04:11.973' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (10, 2, N'5 Websites for online surveys to make quick money', N'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230210172004/5-Websites-for-online-surveys-to-make-quick-money.png', N'<p>Extra money hurts-said nobody ever!! To some, the extra income might help to improve their present and future life. So those looking to earn extra money to increase their net worth, save for a big goal, or pay a debt, can take up a side gig and earn a respectable amount of cash. Working from home has created the perfect environment for anyone to earn extra money with a side hustle. Whether you are a student who wants a source of income or someone who is just looking to supplement your regular income with some online side jobs, there are many viable options available today like taking online surveys, freelancing, testing, blogging, tutoring, etc.</p>', CAST(N'2023-02-25T21:04:11.973' AS DateTime))
INSERT [dbo].[Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) VALUES (11, 2, N'Grid System in UI Design [Beginner’s Guide]', N'https://media.geeksforgeeks.org/wp-content/uploads/20230209170229/Grid-System-In-UI-Design.gif', N'<p>Grid layouts are the building blocks of final amazing-looking designs. Creating symmetric and unified designs using grids is very important. Effective use of grids helps designers in creating designs that are simple for end users to scan and use. Grids ensure consistency across different platforms by adjusting to different screen sizes and orientations. In this article, we’ll dive deep into the concept of grids and understand how to use this tool to create consistent and unified designs. In this article, we’ll cover Grid System In UI Design. </p>', CAST(N'2023-02-25T21:04:11.973' AS DateTime))
SET IDENTITY_INSERT [dbo].[Blog] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogComments] ON 

INSERT [dbo].[BlogComments] ([BlogCommentID], [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate]) VALUES (1, 1, 5, N'rep lan 1', CAST(N'2023-02-25T21:04:11.977' AS DateTime))
INSERT [dbo].[BlogComments] ([BlogCommentID], [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate]) VALUES (2, 1, 4, N'rep lan 2', CAST(N'2023-02-25T21:04:11.977' AS DateTime))
INSERT [dbo].[BlogComments] ([BlogCommentID], [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate]) VALUES (3, 2, 3, N'rep lan 3', CAST(N'2023-02-25T21:04:11.980' AS DateTime))
INSERT [dbo].[BlogComments] ([BlogCommentID], [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate]) VALUES (4, 2, 3, N'rep lan 4', CAST(N'2023-02-25T21:04:11.980' AS DateTime))
SET IDENTITY_INSERT [dbo].[BlogComments] OFF
GO
SET IDENTITY_INSERT [dbo].[BlogFeedback] ON 

INSERT [dbo].[BlogFeedback] ([BlogFeedbackID], [BlogID], [UserID], [BlogFeedbackContent], [BlogFeedbackDate]) VALUES (1, 1, 5, N'Ao that day lan 2', CAST(N'2023-02-25T21:04:11.973' AS DateTime))
INSERT [dbo].[BlogFeedback] ([BlogFeedbackID], [BlogID], [UserID], [BlogFeedbackContent], [BlogFeedbackDate]) VALUES (2, 2, 5, N'Ao that day lan 2', CAST(N'2023-02-25T21:04:11.973' AS DateTime))
INSERT [dbo].[BlogFeedback] ([BlogFeedbackID], [BlogID], [UserID], [BlogFeedbackContent], [BlogFeedbackDate]) VALUES (3, 1, 2, N'Ao that day lan 2', CAST(N'2023-02-25T21:04:11.977' AS DateTime))
SET IDENTITY_INSERT [dbo].[BlogFeedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (1, N'Program')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (2, N'IT & Software')
INSERT [dbo].[Category] ([CategoryID], [Name]) VALUES (3, N'Graphic Design')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (1, 1, N'JavaScript Notebook', N'https://tenten.vn/tin-tuc/wp-content/uploads/2022/06/Java-Script-4.jpg', 7, N'Khóa học JavaScript hiện đại dành cho mọi người! Làm chủ JavaScript với các dự án, thử thách và lý thuyết. Nhiều khóa học trong một!', N'Trong thời gian gần đây, JavaScript luôn là ngôn ngữ rất nhiều lập trình viên và sinh viên IT đang quan tâm và bàn tán vì tính linh hoạt, đa năng và cơ hội nghề nghiệp hấp dẫn mà ngôn ngữ này mang lại. Với sự phát triển nhanh các tính năng mới của JavaScript khiến nhiều người đang nghiên cứu cũng khó nhớ hết những tính năng và hiểu bản chất cụ thể của nó. Thông qua khóa học SỔ TAY JAVASCRIPT, đây chỉ là những ghi chép mà Kteam tổng hợp như để có thể nghiên cứu lại khi cần thiết và giúp các bạn học hiểu được những tính năng JavaScript hiện nay. Khóa học này không hướng dẫn bạn từ cơ bản như các tutorial khác của Howkteam.com, vì vậy để theo dõi khóa này một cách tốt nhất hãy đảm bảo bạn đã có kiến thức về JavaScript cơ bản.', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (2, 1, N'Data Structures and Algorithms', N'https://camo.githubusercontent.com/209cff110067a8a1d41863dfd9e6469c02571dc51197ee8bccfe11abfc79aaf1/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f636f75727365736974792d626c6f672f323032302f30372f646174612d7374727563747572652d616c676f726974686d2d636f75727365732e706e67', 7, N'Cấu trúc dữ liệu và thuật toán từ Zero đến Hero', N'Bạn đã từng đau đầu với các cấu trúc stack, queue,.. hoặc cảm thấy cực kỳ khó khăn với các thuật toán sắp xếp, tìm kiếm được sử dụng trong lập trình. Đừng lo lắng! Trong khoá học này, chúng ta sẽ cùng nhau tìm hiểu một cách đơn giản nhất về cấu trúc dữ liệu và giải thuật, cũng như giúp bạn nắm rõ hơn về các kiến thức này.', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (3, 1, N'Cracking Technique', N'https://media.cybernews.com/images/featured/2020/08/password-cracking-techniques-1.jpg', 8, N'', N'', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (4, 1, N'Basic Front End Programming with Website Landing Page', N'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/299940393/original/434c252828262c1472630677abdeed4c13a9a774/do-the-front-end-for-a-landing-page.jpg', 8, N'', N'Nếu bạn yêu thích lập trình web nhưng còn lơ ngơ không biết bắt đầu từ đâu hay đã biết cơ bản mà chưa làm được một sản phẩm nhất định nào, thì đây chính là khóa học dành cho bạn – LẬP TRÌNH FRONT END CƠ BẢN VỚI WEBSITE LANDING PAGE. Trong phần này, Chúng tôi sẽ giới thiệu cho các bạn về nội dung chúng ta sẽ được hướng dẫn cho khóa học này, cũng như là project mà chúng ta sẽ cùng nhau thực hiện.', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (5, 1, N'Basic Winform Programming', N'https://d3n0h9tb65y8q.cloudfront.net/public_assets/assets/000/002/068/original/WPF.png?1639058248', 7, N'', N'Serial dành cho những bạn chưa có bất kỳ kiến thức gì về lập trình Winform, hoặc những bạn mất căn bản muốn lấy lại kiến thức nền tảng C# Winform. Nội dung Serial này được phân tách chi tiết nhất có thể, nhằm giúp các bạn dễ hiểu và thực hành được ngay.', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (6, 1, N'Basic to Object Oriented Java Programming', N'https://venturebeat.com/wp-content/uploads/2015/12/oracle-java-e1450723340931.jpg?fit=800%2C450&strip=all', 7, N'Lập trình Java cơ bản đến hướng đối tượng', N'Thông qua khóa học LẬP TRÌNH JAVA CƠ BẢN ĐẾN HƯỚNG ĐỐI TƯỢNG, Chúng tôi sẽ hướng dẫn các bạn kiến thức cơ bản của Java. Để từ đó, có được nền tảng cho phép bạn tiếp tục tìm hiểu những kiến thức tuyệt vời khác của Java hoặc là một ngôn ngữ khác. Cụ thể trong khóa học này, Chúng tôi sẽ giới thiệu với các bạn Java ở phiên bản Java 8', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (7, 1, N'Basic to Advanced Selenium Course', N'https://nareshit.com/wp-content/uploads/2018/08/Selenium-online-training-nareshit.jpg', 8, N'Khóa học Selenium cơ bản đến nâng cao', N'Trong khóa học này chúng tôi sẽ giới thiệu đến các bạn một công cụ mạnh mẽ giúp bạn tạo ra các Script tự động thao tác với Web browers – Đó chính là Selenium. Thông qua khóa học LẬP TRÌNH SELENIUM, chúng tôi sẽ hướng dẫn các bạn những thao tác cơ bản với Selenium. Bạn hoàn toàn có thể kết hợp Selenium và các code C#, Java, Python hay ngôn ngữ lập trình khác mà Selenium có thư viện hỗ trợ, để tạo ra một tổ hợp thao tác kinh khủng khiếp cho tool của bạn.', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (8, 2, N'Computer tips', N'https://ramarcsolutions.com/wp-content/uploads/2018/05/computertips.png', 8, N'Thủ thuật máy tính', N'Trong khóa học này chúng tôi sẽ giới thiệu đến các bạn các thủ thuật tối ưu máy tính.', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (9, 2, N'Certified Ethical Hacker v10 Vietnamese', N'https://i.ytimg.com/vi/MrJj9kRFPO0/maxresdefault.jpg', 8, N'CEH là từ viết tắt của Certified Ethical Hacker, là một trong những chứng chỉ bảo mật thông tin mạng/ứng dụng hàng đầu trong năm 2018 (Theo businessnewsdaily.com ). Là bước đầu tiên giúp bạn trở thành một hacker mũ trắng, với phương châm “ Hiểu hacker để chống lại hacker”.', N'Nội dung của cuốn sách CEH v10 Tiếng Việt sẽ trang bị cho bạn các kiến thức từ cơ bản đến chuyên sâu về bảo mật, biết sử dụng thành thạo các công cụ và phương thức tấn công của các hacker qua 21 Modules( Module 21 là phần bổ sung chỉ có tại bản Tiếng Việt gồm các bài thi thử từ EC-Council kèm theo đáp án), từ đó giúp bạn làm chủ các phương pháp tấn công mà hacker thường sử dụng và có khả năng ngăn chặn,phòng chống lại các hành vi xâm phạm trái phép và phá hoại hệ thống mạng trong các công ty, tổ chức hay doanh nghiệp.', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (10, 2, N'Installation Instructions', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1I_auLCilG6qWtd9T6XEymoYwMnHy_8_8iSB8naX_39uzcpho6lY7mWNjI2bcBw4MUbo&usqp=CAU', 8, N'Hướng dẫn cài đặt phần mềm, hệ điều hành', N'', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (11, 3, N'Adobe LightRoom Part I', N'https://www.classcentral.com/report/wp-content/uploads/2022/08/Adobe-Lightroom-BCG-Banner.png', 8, N'Tinh Nhuệ Với LightRoom', N'', 1,N'None')
INSERT [dbo].[Course] ([CourseID], [CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus],[Request]) VALUES (12, 3, N'Adobe LightRoom Part II', N'https://www.classcentral.com/report/wp-content/uploads/2022/08/Adobe-Lightroom-BCG-Banner.png', 8, N'Phần Xử Lý Hậu Kỳ', N'', 1,N'None')
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Lesson] ON 

INSERT [dbo].[Lesson] ([LessonID], [LessonNum], [CourseID], [Name], [Title], [Description], [Video]) VALUES (1, 1, 1, N'ECMAScript trong JavaScript là gì?', N'ECMAScript trong JavaScript là gì?', N'Tiêu chuẩn ECMAScript (viết tắt là ES) là một trong những tiêu chuẩn của ngôn ngữ Javascript khá phổ biến nhất hiện nay. Ta sẽ xem lại lịch sử ra đời của tiêu chuẩn nay:

Vào thời kỳ cạnh tranh thị phần trình duyệt, Brendan Eich đã phát triển một ngôn ngữ đặc tả kịch bản cho trình duyệt Netscape, lúc đầu gọi là Mocha, rồi sang LiveScript rồi cuối cùng thành Javascript.
12-1995, Sun Microsystem và Netscape công bố Javascript, 3-1996 trình duyệt Netscape 2.0 đã hỗ trợ ngôn ngữ này. Tuy nhiên Microsoft cũng ra mắt một ngôn ngữ tương tự là JScript hỗ trợ cho trình duyệt IE 3.0 (việc đổi tên để tránh bản quyền)
Netscape đã đưa Javascript tới ECMA International, đây là một tổ chức chuẩn hóa thông tin và hệ thống giao tiếp. Và việc chuẩn hóa ngôn ngữ Javascript được gọi là ECMA-262. Rồi cái tên ECMAScript hình thành từ đây
Trong quá trình hình thành và phát triển tiêu chuẩn này, bước ngoặt lớn nhất là 2015, tiêu chuẩn ECMAScript 6 (ES6, ES2015) đánh dấu sự thay đổi rất lớn ngôn ngữ Javascript về cú pháp lẫn tính năng.

Ngoài tiêu chuẩn ECMAScript là tiêu chuẩn phổ biến, thì có những tiêu chuẩn cũng có tiếng khác như Typescript (được Microsoft phát triển), Coffeescript, ..', N'<iframe width="1280" height="720" src="https://www.youtube.com/embed/zk8JvziUKO0" title="[Sổ tay #JavaScript] - Bài 1: #ECMAScript trong Javascript là gì?| #LeBaoChau #HowKteam" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Lesson] ([LessonID], [LessonNum], [CourseID], [Name], [Title], [Description], [Video]) VALUES (2, 2, 1, N'Node.js là gì?', N'Node.js là gì?', N'Ở bài học trước thì Kteam có nói chút về lịch sử của Javascript là đây là ngôn ngữ lập trình phía Client được chạy trên trình duyệt.

Như vậy, trên con đường của web developer thì không thể thiếu ngôn ngữ Javascript, và trước đây web developer cần biết ít nhất 2 ngôn ngữ lập trình để phát triển website (1 là Javascript để làm Frontend, 2 là ngôn ngữ khác như Python, C#, Java để làm Backend). Như vậy nảy sinh ra ý tưởng đưa ngôn ngữ Javascript về làm Backend để cùng 1 ngôn ngữ có thể thực hiện 2 chức năng.

Từ đó ra đời Node.js, là một platform đa nền tảng, chạy trên môi trường Javascript V8 runtime (thông dịch Javascript chạy trên trình duyệt Chrome) để có thể thực thi code Javascript ngoài trình duyệt. Node.js cho phép developer sử dụng Javascript viết tool command line hoặc xử lý server-side để tạo ra những trang web dynamic.', N'<iframe width="893" height="502" src="https://www.youtube.com/embed/DpXLg9nINXY" title="Sổ tay #JavaScript- Bài 2: #Node.js là gì? | #LeBaoChau #Howkteam" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Lesson] ([LessonID], [LessonNum], [CourseID], [Name], [Title], [Description], [Video]) VALUES (3, 3, 1, N'Cơ chế bất đồng bộ trong Javascript', N'Bất đồng bộ là gì?', N'Đầu tiên ta sẽ tìm hiểu lại xử lý đồng bộ (Synchronous) là gì? Nếu như ta đã hiểu lập trình cơ bản thì chắc chắn biết là khi khi dòng code hoàn thành thì mới chạy dòng code tiếp theo, nếu dòng code đang thực hiện quá lâu thì chương trình đang ở trạng thái chờ.

Trái với ý tưởng đồng bộ phải chờ dòng code thực hiện xong, bất đồng bộ (Asynchronous) có thể bỏ qua trạng thái chờ nếu không cần thiết và thực hiện các dòng code tiếp theo. Ví dụ như sau: Bạn vừa có tin nhắn, bạn sẽ gửi lại tin cho bạn mình, có thể bạn của bạn chưa phản hồi ngay lập tức, bạn không cần phải chờ đợi người ta mà có thể làm việc khác như lướt news feed hay nhắn tin cho người khác,... khi nào có tin rep lại thì xử lý tiếp.

Mặt tốt của bất đồng bộ là giúp chúng ta xử lý nhiều công việc xen kẽ với nhau để tiết kiệm thời gian. Mặt xấu là làm chương trình mình viết phức tạp lên, và ta phải hiểu rõ nguyên lý hoạt động của bất đồng bộ, nếu không sẽ dính những trường hợp như cái tiền đề chưa làm mà đã xử lý cái kết quả.', N'<iframe width="893" height="502" src="https://www.youtube.com/embed/t2kjqDLkSCw" title="Sổ tay #JavaScript - Bài 3: Cơ chế bất đồng bộ trong Javascript | #Howkteam" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Lesson] ([LessonID], [LessonNum], [CourseID], [Name], [Title], [Description], [Video]) VALUES (4, 4, 1, N'Node.js hoạt động như thế nào?', N'Kiến trúc Node.js', N'Node.js được sinh ra để phát triển server-side, vậy chúng ta tìm hiểu vì sao Javascript có thể tương tác đọc file, database. Ngoài ra, Javascript là single thread, nếu chạy ở client-side phục vụ cho 1 client thì có thể đáp ứng được, trong khi ở server-side phải đáp ứng hàng ngàn request từ client gửi đến.
Về bản chất, ngôn ngữ Javascript không thực hiện những công việc ở server-side như đọc file, truy vấn database mà nó ủy quyền cho phần core thực hiện. Như phía trên đã giới thiệu, phần core được viết bởi C/C++.
Ở các ngôn ngữ thực hiện Back-end khác, thì sẽ áp dụng multi-thread có nghĩa mỗi request vào server sẽ thành 1 thread để xử lý request đó. Còn ở Node.js, nếu những xử lý cần block chương trình thì lại đẩy xuống Thread Pool thực hiện.
Ví dụ: khi có request đến server, nó đẩy event vào Event Queue, event loop sẽ nhận lần lượt các event để xử lý. Nếu event đó không Block lại chương trình quá lâu, nó tự xử lý rồi trả response lại. Rồi có những request có thao tác truy vấn database, việc truy vấn sẽ tốn rất nhiều thời gian, Event Loop sẽ đưa công việc qua Thread Pool (thông qua thư viện Libuv đã nói phía trên), khi thread đó đã thực hiện xong thì có kết quả truy vấn database, Node.js đẩy callback của event đó về Event Queue để xử lý việc này. Callback chính là function Javascript xử lý sau khi có kết quả truy vấn database, có thể là response ngay về client.
', N'<iframe width="893" height="502" src="https://www.youtube.com/embed/I7Fo0NcMoc8" title="Sổ tay #JavaScript - Bài 4: Node.js hoạt động như thế nào | #Howkteam" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Lesson] ([LessonID], [LessonNum], [CourseID], [Name], [Title], [Description], [Video]) VALUES (5, 5, 1, N'Promise là gì?', N'Promise là gì?', N'•	Sổ tay Javascript
•	ECMAScript là gì?
•	Node.js là gì?
•	Cơ chế bất đồng bộ trong Javascript
•	Node.js hoạt động như thế nào?
Bài này sẽ giới thiệu những nội dung sau:
•	Promise là gì?
•	Cơ chế hoạt động của Promise
•	Tại sao phải sử dụng Promise?
•	Promise chaining
', N'<iframe width="893" height="502" src="https://www.youtube.com/embed/oQDzxyp73e0" title="Sổ tay #JavaScript - Bài 5: Promise là gì? | #Howkteam" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Lesson] ([LessonID], [LessonNum], [CourseID], [Name], [Title], [Description], [Video]) VALUES (11, 1, 3, N'Tạo Patch file c.r.a.c.k app', N'Tạo Patch file c.r.a.c.k app', N'Chỉnh sửa một file exe cơ bản và tạo lại một bản patch của nó. Là một trong những kỹ thuật crack cơ bản.

Mong kỹ thuật này sẽ giúp các bạn hiểu hơn phần nào về ngành CNTT có thể làm được.

Để chuẩn bị tốt nhất cho buổi này bạn nên tải phần Project ở phía dưới.

Tải phần mềm OllyDbg  để có thể dịch ngược code và chỉnh sửa.', N'<iframe width="825" height="464" src="https://www.youtube.com/embed/sBjA3R1noGI" title="Stream hàng tuần - 02/03/2022 - Tạo Patch file crack app" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Lesson] ([LessonID], [LessonNum], [CourseID], [Name], [Title], [Description], [Video]) VALUES (12, 2, 3, N'Tạo script c.r.a.c.k hàng loạt file easy', N'Tạo script c.r.a.c.k hàng loạt file easy', N'Chỉnh sửa hàng loạt file exe cơ bản và tạo lại một bản patch của nó.

Mong kỹ thuật này sẽ giúp các bạn hiểu hơn phần nào về ngành CNTT có thể làm được.

Để chuẩn bị tốt nhất cho buổi này bạn nên tải phần Project ở phía dưới.

Tải phần mềm OllyDbg  để có thể dịch ngược code và chỉnh sửa.

Cài đặt Visual Studio Code để có thể lập trình Python .

Cài đặt các package cần thiết liên quan đến python: Python và pip-packages', N'<iframe width="825" height="464" src="https://www.youtube.com/embed/4fHazsuEl8s" title="Stream hàng tuần - 04/03/2022 - Tạo script crack hàng loạt file easy" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
INSERT [dbo].[Lesson] ([LessonID], [LessonNum], [CourseID], [Name], [Title], [Description], [Video]) VALUES (13, 3, 3, N'Gọi MessageBox từ file đã crack', N'Gọi MessageBox từ file đã crack', N'Chúng ta sẽ cố gắng nhúng một đoạn code gọi Message Box của User32.Dll từ file chúng ta đã crack.', N'<iframe width="825" height="464" src="https://www.youtube.com/embed/Fa4HZxT6EH4" title="Stream hàng tuần - 07/03/2022 - Hiển thị MessageBox lên Calculator" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>')
SET IDENTITY_INSERT [dbo].[Lesson] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [FacebookID], [GmailID], [RoleID], [Status]) VALUES (1, N'ANHNT', N'123', N'Nguyen Tuan Anh', N'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', N'', CAST(N'2005-12-04' AS Date), N'123456789', N'Bac ninh', NULL, NULL, 1, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [FacebookID], [GmailID], [RoleID], [Status]) VALUES (2, N'PHUNL', N'123', N'Nguyen Luong Phu', N'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', N'', CAST(N'2005-12-04' AS Date), N'123456789', N'Ha Noi', NULL, NULL, 1, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [FacebookID], [GmailID], [RoleID], [Status]) VALUES (3, N'TUANLN', N'123', N'Le Nam Tuan', N'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', N'', CAST(N'2005-12-04' AS Date), N'123456789', N'Thai Nguyen', NULL, NULL, 1, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [FacebookID], [GmailID], [RoleID], [Status]) VALUES (4, N'ANHHD', N'123', N'Hoang Duc Anh', N'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', N'', CAST(N'2005-12-04' AS Date), N'123456789', N'Thanh Hoa', NULL, NULL, 1, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [FacebookID], [GmailID], [RoleID], [Status]) VALUES (5, N'MANHND', N'123', N'Nguyen Dinh Manh', N'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', N'', CAST(N'2005-12-04' AS Date), N'123456789', N'Bac ninh', NULL, NULL, 1, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [FacebookID], [GmailID], [RoleID], [Status]) VALUES (6, N'12345', N'123', N'Nguyen Dinh Manh', N'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', N'', CAST(N'2005-12-04' AS Date), N'123456789', N'Bac ninh', NULL, NULL, 3, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [FacebookID], [GmailID], [RoleID], [Status]) VALUES (7, N'tutor1', N'123', N'Giao Vien 1', N'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', N'', CAST(N'2005-12-04' AS Date), N'123456789', N'Bac ninh', NULL, NULL, 2, 1)
INSERT [dbo].[User] ([UserID], [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [FacebookID], [GmailID], [RoleID], [Status]) VALUES (8, N'tutor2', N'123', N'Giao Vien 2', N'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', N'', CAST(N'2005-12-04' AS Date), N'123456789', N'Bac ninh', NULL, NULL, 2, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([RoleID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserRole] ([RoleID], [Name]) VALUES (2, N'Tutor')
INSERT [dbo].[UserRole] ([RoleID], [Name]) VALUES (3, N'Student')
INSERT [dbo].[UserRole] ([RoleID], [Name]) VALUES (4, N'Guest')
SET IDENTITY_INSERT [dbo].[UserRole] OFF
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
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_QuizID] FOREIGN KEY([QuizID])
REFERENCES [dbo].[Quiz] ([QuizID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_QuizID]
GO
ALTER TABLE [dbo].[Quiz]  WITH CHECK ADD  CONSTRAINT [FK_Quiz_LessonID] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lesson] ([LessonID])
GO
ALTER TABLE [dbo].[Quiz] CHECK CONSTRAINT [FK_Quiz_LessonID]
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
ALTER TABLE [dbo].[ReviewComments]  WITH CHECK ADD  CONSTRAINT [FK_ReviewComments_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ReviewComments] CHECK CONSTRAINT [FK_ReviewComments_UserID]
GO
ALTER TABLE [dbo].[ReviewFeedback]  WITH CHECK ADD  CONSTRAINT [FK_ReviewFeedback_ReviewID] FOREIGN KEY([ReviewID])
REFERENCES [dbo].[Review] ([ReviewID])
GO
ALTER TABLE [dbo].[ReviewFeedback] CHECK CONSTRAINT [FK_ReviewFeedback_ReviewID]
GO
ALTER TABLE [dbo].[ReviewFeedback]  WITH CHECK ADD  CONSTRAINT [FK_ReviewFeedback_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[ReviewFeedback] CHECK CONSTRAINT [FK_ReviewFeedback_UserID]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[UserRole] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_RoleID]
GO
