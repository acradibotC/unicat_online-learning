 USE master
 USE [Unicat Online Learning]
DROP DATABASE [Unicat Online Learning]
CREATE DATABASE [Unicat Online Learning]

------------------------------------------------- CREATE -----------------------------------------------------

-- TABLE: [UserRole]
CREATE TABLE [UserRole] (
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULl,
	CONSTRAINT PK_UserRole_RoleID PRIMARY KEY (RoleID)
)

-- TABLE: [User]
CREATE TABLE [User] (
	[UserID] [int] IDENTITY(1,1),
	[UserName] [nvarchar](max),
	[PassWord] [nvarchar](max),
	[FullName] [nvarchar](max),
	[Image] [nvarchar](max),
	[Email] [nvarchar](max),
	[DOB] [date] NOT NULL,
	[Phone] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[FacebookID] [nvarchar] NULL,
	[GmailID] [nvarchar] NULL,
	[RoleID] [int] NOT NULL,
	[Status] [int] NOT NULL,
	CONSTRAINT PK_User_UserID PRIMARY KEY (UserID),
	CONSTRAINT FK_User_RoleID FOREIGN KEY (RoleID) REFERENCES [UserRole](RoleID)
)

-- TABLE: [Category]
CREATE TABLE [Category] (
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	CONSTRAINT PK_Category_CategoryID PRIMARY KEY (CategoryID)
)

-- TABLE: [Course]
CREATE TABLE [Course] (
	[CourseID] [int] IDENTITY(1,1),
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[TutorID] [int] NOT NULL,
	[CourseInfo] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PublishStatus] [int] NOT NULL,
	CONSTRAINT PK_Course_CourseID PRIMARY KEY (CourseID),
	CONSTRAINT FK_Course_CategoryID FOREIGN KEY (CategoryID) REFERENCES [Category](CategoryID)
)

-- TABLE: [CourseEnroll]
CREATE TABLE [CourseEnroll] (
	[CourseEnrollID] [int] IDENTITY(1,1) NOT NULL, 
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[EnrollDate] [date] NOT NULL,
	[LessonCurrent] [int] NOT NULL,
	[CourseStatus] [int] NOT NULL,
	CONSTRAINT FK_CourseEnroll_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID),
	CONSTRAINT FK_CourseEnroll_CourseID FOREIGN KEY (CourseID) REFERENCES [Course](CourseID)
)

-- TABLE: [Lesson]
CREATE TABLE [Lesson] (
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	CONSTRAINT PK_Lesson_LessonID PRIMARY KEY (LessonID),
	CONSTRAINT FK_Lesson_CourseID FOREIGN KEY (CourseID) REFERENCES [Course](CourseID)
)

-- TABLE: [Quiz]
CREATE TABLE [Quiz] (
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	CONSTRAINT PK_Quiz_QuizID PRIMARY KEY (QuizID),
	CONSTRAINT FK_Quiz_LessonID FOREIGN KEY (LessonID) REFERENCES [Lesson](LessonID)
)

-- TABLE: [Question]
CREATE TABLE [Question] (
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CorrectAnswer] [int] NOT NULL,
	[QuizID] [int] NOT NULL,
	CONSTRAINT PK_Question_QuestionID PRIMARY KEY (QuestionID),
	CONSTRAINT FK_Question_QuizID FOREIGN KEY (QuizID) REFERENCES [Quiz](QuizID)
)

-- TABLE: [Answer]
CREATE TABLE [Answer] (
	[AnswerID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Answer] [nvarchar](max) NOT NULL,
	CONSTRAINT PK_Answer_AnswerID PRIMARY KEY (AnswerID),
	CONSTRAINT FK_Answer_QuestionID FOREIGN KEY (QuestionID) REFERENCES [Question](QuestionID)
)

-- TABLE: [LessonDetails]
CREATE TABLE [LessonDetails] (
	[LessonDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[LessonID] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Video] [nvarchar](max) NULL,
	CONSTRAINT PK_LessonDetails_LessonDetailsID PRIMARY KEY (LessonDetailsID),
	CONSTRAINT FK_LessonDetails_LessonID FOREIGN KEY (LessonID) REFERENCES [Lesson](LessonID)
)

-- TABLE: [Blog]
CREATE TABLE [Blog] (
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[BlogTitler] [nvarchar](max) NOT NULL,
	[BlogImage] [nvarchar](max) NULL,
	[BlogDescription] [nvarchar](max) NULL,
	[PostDate] [datetime] NOT NULL,
	CONSTRAINT PK_Blog_BlogID PRIMARY KEY (BlogID),
	CONSTRAINT FK_Blog_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID)
)

-- TABLE: [BlogFeedback]
CREATE TABLE [BlogFeedback] (
	[BlogFeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[BlogID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[BlogFeedbackContent] [nvarchar](max) NOT NULL,
	[BlogFeedbackDate] [datetime] NOT NULL,
	CONSTRAINT PK_BlogFeedback_BlogFeedbackID PRIMARY KEY (BlogFeedbackID),
	CONSTRAINT FK_BlogFeedback_BlogID FOREIGN KEY (BlogID) REFERENCES [Blog](BlogID),
	CONSTRAINT FK_BlogFeedback_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID)
)

-- TABLE: [BlogComments]
CREATE TABLE [BlogComments](
	[BlogCommentID] [int] IDENTITY(1,1) NOT NULL,
	[BlogFeedbackID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[BlogCommentContent] [nvarchar](max) NOT NULL,
	[BlogCommentDate] [datetime] NOT NULL,
	CONSTRAINT PK_BlogComments_BlogCommentID PRIMARY KEY (BlogCommentID),
	CONSTRAINT FK_BlogComments_BlogFeedbackID FOREIGN KEY (BlogFeedbackID) REFERENCES [BlogFeedback](BlogFeedbackID),
	CONSTRAINT FK_BlogComments_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID)
)

-- TABLE: [Review]
CREATE TABLE [Review] (
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[Vote] [int] NOT NULL,
	CONSTRAINT PK_Review_ReviewID PRIMARY KEY (ReviewID),
	CONSTRAINT FK_Review_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID),
	CONSTRAINT FK_Review_CourseID FOREIGN KEY (CourseID) REFERENCES [Course](CourseID),
)

-- TABLE: [ReviewFeedback]
CREATE TABLE [ReviewFeedback] (
	[ReviewFeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ReviewFeedbackContent] [nvarchar](max) NOT NULL,
	[ReviewFeedbackDate] [datetime] NOT NULL,
	CONSTRAINT PK_ReviewFeedback_ReviewFeedbackID PRIMARY KEY (ReviewFeedbackID),
	CONSTRAINT FK_ReviewFeedback_ReviewID FOREIGN KEY (ReviewID) REFERENCES [Review](ReviewID),
	CONSTRAINT FK_ReviewFeedback_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID)
)

-- TABLE: [ReviewComments]
CREATE TABLE [ReviewComments] (
	[ReviewCommentID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewFeedbackID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ReviewCommentContent] [nvarchar](max) NOT NULL,
	[ReviewCommentDate] [datetime] NOT NULL,
	CONSTRAINT PK_ReviewComments_ReviewCommentID PRIMARY KEY (ReviewCommentID),
	CONSTRAINT FK_ReviewComments_ReviewFeedbackID FOREIGN KEY (ReviewFeedbackID) REFERENCES [ReviewFeedback](ReviewFeedbackID),
	CONSTRAINT FK_ReviewComments_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID)
)

------------------------------------------------- END CREATE -----------------------------------------------------

------------------------------------------------- INSERT -----------------------------------------------------
-- TABLE: [UserRole]
INSERT INTO [UserRole] ( [Name]) VALUES ( 'Admin')
INSERT INTO [UserRole] ( [Name]) VALUES ( 'Tutor')
INSERT INTO [UserRole] ( [Name]) VALUES ( 'Student')
INSERT INTO [UserRole] ( [Name]) VALUES ( 'Guest')

-- TABLE: [User]
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'ANHNT', N'123', 'Nguyen Tuan Anh', '', '', CAST(N'2005-12-04' AS Date), 123456789, 'Bac ninh', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'PHUNL', N'123', 'Nguyen Luong Phu', '', '', CAST(N'2005-12-04' AS Date), 123456789, 'Ha Noi', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'TUANLN', N'123', 'Le Nam Tuan', '', '', CAST(N'2005-12-04' AS Date), 123456789, 'Thai Nguyen', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'ANHHD', N'123', 'Hoang Duc Anh', '', '', CAST(N'2005-12-04' AS Date), 123456789, 'Thanh Hoa', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'MANHND', N'123', 'Nguyen Dinh Manh', '', '', CAST(N'2005-12-04' AS Date), 123456789, 'Bac ninh', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'sd', N'123', 'Nguyen Dinh Manh', '', '', CAST(N'2005-12-04' AS Date), 123456789, 'Bac ninh', 3, 1)

-- TABLE: [Blog]
SET IDENTITY_INSERT [dbo].[Blog] ON 
INSERT INTO [Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) 
			VALUES(1, 1,
			'Top 3 Programming Languages to Learn in 2023',
			'https://media.geeksforgeeks.org/wp-content/uploads/20230117173131/Top-10-Programming-Languages-That-You-Should-Learn-in-2023.png',
			'<div class="blog_image"><img src="https://www.simplilearn.com/ice9/free_resources_article_thumb/Best-Programming-Languages-to-Start-Learning-Today.jpg" alt=""></div>
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
				<p style="font-weight: bold;">Average Annual Salary of Java Developer – $104,000</p>',
				GETDATE())

INSERT INTO [Blog] ([BlogID], [UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) 
			VALUES(2, 2,
			'5 Ways to Improve Time Management Skills',
			'https://media.geeksforgeeks.org/wp-content/uploads/20230202174722/5-Ways-to-Improve-Time-Management.gif',
			'	<p>Time management is a task that requires constant attention to stay on track and achieve goals. It involves planning, prioritizing, and executing tasks in a way that allows you to meet deadlines and achieve the most critical goals in your life. If you want to enhance your time management skills but need help figuring out where to start, this blog is for you! In this article, we’ll cover the most practical ways to improve time management.</p>
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
				',
				GETDATE())

SET IDENTITY_INSERT [dbo].[Blog] OFF


-- TABLE: [BlogFeedbacks]
SET IDENTITY_INSERT [dbo].[BlogFeedbacks] ON
			INSERT INTO [BlogFeedback] ( [BlogID], [UserID], [BlogFeedbackContent], [BlogFeedbackDate])
			VALUES( 1, 5, 'Ao that day lan 2', GETDATE())
SET IDENTITY_INSERT [dbo].[BlogFeedbacks] OFF

-- TABLE: [BlogComments]
SET IDENTITY_INSERT [dbo].[BlogComments] ON
INSERT INTO [BlogComments] ([BlogCommentID], [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate])
			VALUES(1, 1, 5, 'rep lan 1', GETDATE())
INSERT INTO [BlogComments] ([BlogCommentID], [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate])
			VALUES(2, 1, 4, 'rep lan 2', GETDATE())
INSERT INTO [BlogComments] ([BlogCommentID], [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate])
			VALUES(3, 2, 3, 'rep lan 3', GETDATE())
INSERT INTO [BlogComments] ([BlogCommentID], [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate])
			VALUES(4, 4, 3, 'rep lan 4', GETDATE())
SET IDENTITY_INSERT [dbo].[BlogComments] OFF
------------------------------------------------- END INSERT -----------------------------------------------------

------------------------------------------------- TEST -----------------------------------------------------
select * from Blog
select * from [User]
select * from BlogFeedback
select * from BlogComments
select * from BlogFeedback WHERE BlogID = 1

SELECT TOP 5 * FROM Blog ORDER BY BlogID DESC