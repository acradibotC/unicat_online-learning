﻿ USE master
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
	[UserID] [int] NOT NULL,
	[CourseInfo] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PublishStatus] [int] NOT NULL,
	[Request] [nvarchar](max) NOT NULL,
	CONSTRAINT PK_Course_CourseID PRIMARY KEY (CourseID),
	CONSTRAINT FK_Course_CategoryID FOREIGN KEY (CategoryID) REFERENCES [Category](CategoryID),
	CONSTRAINT FK_Course_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID)
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
	[Vote] [float] NOT NULL,
	CONSTRAINT PK_Review_ReviewID PRIMARY KEY (ReviewID),
	CONSTRAINT FK_Review_UserID FOREIGN KEY (UserID) REFERENCES [User](UserID),
	CONSTRAINT FK_Review_CourseID FOREIGN KEY (CourseID) REFERENCES [Course](CourseID),
)

-- TABLE: [ReviewFeedback]
CREATE TABLE [ReviewFeedback] (
	[ReviewFeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewID] [int] NOT NULL,
	[ReviewFeedbackContent] [nvarchar](max) NOT NULL,
	[ReviewFeedbackDate] [datetime] NOT NULL,
	CONSTRAINT PK_ReviewFeedback_ReviewFeedbackID PRIMARY KEY (ReviewFeedbackID),
	CONSTRAINT FK_ReviewFeedback_ReviewID FOREIGN KEY (ReviewID) REFERENCES [Review](ReviewID)
)

-- TABLE: [ReviewComments]
CREATE TABLE [ReviewComments] (
	[ReviewCommentID] [int] IDENTITY(1,1) NOT NULL,
	[ReviewFeedbackID] [int] NOT NULL,
	[ReviewID] [int] NOT NULL,
	[ReviewCommentContent] [nvarchar](max) NOT NULL,
	[ReviewCommentDate] [datetime] NOT NULL,
	CONSTRAINT PK_ReviewComments_ReviewCommentID PRIMARY KEY (ReviewCommentID),
	CONSTRAINT FK_ReviewComments_ReviewFeedbackID FOREIGN KEY (ReviewFeedbackID) REFERENCES [ReviewFeedback](ReviewFeedbackID),
	CONSTRAINT FK_ReviewComments_ReviewID FOREIGN KEY (ReviewID) REFERENCES [Review](ReviewID)
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
			VALUES ( N'ANHNT', N'123', 'Nguyen Tuan Anh', 'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', '', CAST(N'2005-12-04' AS Date), 123456789, 'Bac ninh', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'PHUNL', N'123', 'Nguyen Luong Phu', 'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', '', CAST(N'2005-12-04' AS Date), 123456789, 'Ha Noi', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'TUANLN', N'123', 'Le Nam Tuan', 'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', '', CAST(N'2005-12-04' AS Date), 123456789, 'Thai Nguyen', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'ANHHD', N'123', 'Hoang Duc Anh', 'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', '', CAST(N'2005-12-04' AS Date), 123456789, 'Thanh Hoa', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'MANHND', N'123', 'Nguyen Dinh Manh', 'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', '', CAST(N'2005-12-04' AS Date), 123456789, 'Bac ninh', 1, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'12345', N'123', 'Nguyen Dinh Manh', 'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', '', CAST(N'2005-12-04' AS Date), 123456789, 'Bac ninh', 3, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'tutor1', N'123', 'Giao Vien 1', 'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', '', CAST(N'2005-12-04' AS Date), 123456789, 'Bac ninh', 2, 1)
INSERT INTO [User] ( [UserName], [PassWord], [FullName], [Image], [Email], [DOB], [Phone], [Address], [RoleID], [Status]) 
			VALUES ( N'tutor2', N'123', 'Giao Vien 2', 'https://static2.yan.vn/YanNews/2167221/202102/facebook-cap-nhat-avatar-doi-voi-tai-khoan-khong-su-dung-anh-dai-dien-e4abd14d.jpg', '', CAST(N'2005-12-04' AS Date), 123456789, 'Bac ninh', 2, 1)

-- TABLE: [Blog]
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) 
			VALUES(1,
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
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate]) 
			VALUES(2,
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
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate])
			VALUES(1, 'What is an API (Application Programming Interface)?', 'https://media.geeksforgeeks.org/wp-content/uploads/20230216170349/What-is-an-API.png', 
			'<p>Everyone is in search of the highest-paying job so as to get into it. And, in the list, the web developer is on the top for years and will remain in the same place due to its demand. If you’re the one who’s looking for getting into it. you must be aware of the most important terms used in it. Out of all the terms, API is yet another term that plays a very important role while building a website. Now, what is an API – (Application Programming Interface)?</p>',
			GETDATE())
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate])
			VALUES(3, 'What is JavaDoc tool and how to use it?', 'https://media.geeksforgeeks.org/wp-content/uploads/20190408123340/JavaDoc-tool.jpg', 
			'<p>JavaDoc tool is a document generator tool in Java programming language for generating standard documentation in HTML format. It generates API documentation. It parses the declarations ad documentation in a set of source file describing classes, methods, constructors, and fields.</p>', GETDATE())
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate])
			VALUES(3, 'What is Linked List', 'https://media.geeksforgeeks.org/wp-content/uploads/20220816144425/LLdrawio.png',
			'<p>Like arrays, a Linked List is a linear data structure. Unlike arrays, linked list elements are not stored at a contiguous location; the elements are linked using pointers. They include a series of connected nodes. Here, each node stores the data and the address of the next node.</p>', GETDATE())
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate])
			VALUES(3, 'Requirements to become a full stack developer', 'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230215141955/Requirements-to-become-a-full-stack-developer.png',
			'<p>A full stack developer is a person who is an expert in designing, building, maintaining, and updating both the front end and back end of a website or a web application. A full-stack developer is someone who can develop both client and server software. One should be well familiar with front-end, and back-end technologies frameworks and database management systems, and web hosting platforms.</p>', GETDATE())
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate])
			VALUES(4, 'How To Write Thank You Email After Interview?', 'https://media.geeksforgeeks.org/wp-content/uploads/20230209164630/How-To-Write-Thank-You-Email-After-Interview.gif',
			'<p>Sending a thank you email after an interview is a great way to show your appreciation and express your enthusiasm for the opportunity presented to you. It also serves as an opportunity to reiterate why you feel you would be a great fit for the role and remind the hiring manager of your skills and qualifications. We’ve covered more about how to write a thank you email after an interview in this article.</p>', GETDATE())
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate])
			VALUES(4, 'Role of Business Intelligence in Finance', 'https://media.geeksforgeeks.org/wp-content/uploads/20230208105137/Role-of-Business-Intelligence-in-Finance.png', 
			'<p>Business Intelligence is the abbreviation for the technology, instruments, and procedures that businesses employ to analyze data and come to wise business judgments. In the field of finance, business intelligence (BI) is essential for assisting firms in tracking their financial performance, spotting patterns, and making data-driven choices. In this article, we’ll cover the role of business intelligence in finance and what are its pros.</p>', GETDATE())
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate])
			VALUES(5, 'How to Write a Cover Letter in 2023', 'https://media.geeksforgeeks.org/wp-content/uploads/20230209132824/How-to-Write-a-Cover-Letter-That-Will-Get-You-Noticed-(2023).png',
			'<p>After hours of job hunting, when you finally get the perfect opportunity that you were looking forward to, only submitting a great resume will not guarantee your success. It would be best if you had something more to ensure the recruiter that you are different and perfect for the opportunity. There is one more document that can fill this gap for you – Cover Letter. In this article, we’re going to talk about how to write a cover letter that will get you noticed.</p>', GETDATE())
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate])
			VALUES(2, '5 Websites for online surveys to make quick money', 'https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230210172004/5-Websites-for-online-surveys-to-make-quick-money.png',
			'<p>Extra money hurts-said nobody ever!! To some, the extra income might help to improve their present and future life. So those looking to earn extra money to increase their net worth, save for a big goal, or pay a debt, can take up a side gig and earn a respectable amount of cash. Working from home has created the perfect environment for anyone to earn extra money with a side hustle. Whether you are a student who wants a source of income or someone who is just looking to supplement your regular income with some online side jobs, there are many viable options available today like taking online surveys, freelancing, testing, blogging, tutoring, etc.</p>', GETDATE())
INSERT INTO [Blog] ([UserID], [BlogTitler], [BlogImage], [BlogDescription], [PostDate])
			VALUES(2, 'Grid System in UI Design [Beginner’s Guide]', 'https://media.geeksforgeeks.org/wp-content/uploads/20230209170229/Grid-System-In-UI-Design.gif',
			'<p>Grid layouts are the building blocks of final amazing-looking designs. Creating symmetric and unified designs using grids is very important. Effective use of grids helps designers in creating designs that are simple for end users to scan and use. Grids ensure consistency across different platforms by adjusting to different screen sizes and orientations. In this article, we’ll dive deep into the concept of grids and understand how to use this tool to create consistent and unified designs. In this article, we’ll cover Grid System In UI Design. </p>', GETDATE())


-- TABLE: [BlogFeedbacks]
INSERT INTO [BlogFeedback] ( [BlogID], [UserID], [BlogFeedbackContent], [BlogFeedbackDate])
			VALUES( 1, 5, 'Ao that day lan 2', GETDATE())
INSERT INTO [BlogFeedback] ( [BlogID], [UserID], [BlogFeedbackContent], [BlogFeedbackDate])
			VALUES( 2, 5, 'Ao that day lan 2', GETDATE())
INSERT INTO [BlogFeedback] ( [BlogID], [UserID], [BlogFeedbackContent], [BlogFeedbackDate])
			VALUES( 1, 2, 'Ao that day lan 2', GETDATE())

-- TABLE: [BlogComments]
INSERT INTO [BlogComments] ( [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate])
			VALUES( 1, 5, 'rep lan 1', GETDATE())
INSERT INTO [BlogComments] ( [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate])
			VALUES( 1, 4, 'rep lan 2', GETDATE())
INSERT INTO [BlogComments] ( [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate])
			VALUES( 2, 3, 'rep lan 3', GETDATE())
INSERT INTO [BlogComments] ( [BlogFeedbackID], [UserID], [BlogCommentContent], [BlogCommentDate])
			VALUES(2, 3, 'rep lan 4', GETDATE())

-- TABLE: [Category]
INSERT INTO [Category] ([Name])VALUES('Program')
INSERT INTO [Category] ([Name])VALUES('IT & Software')
INSERT INTO [Category] ([Name])VALUES('Graphic Design')

-- TABLE: [Course]
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(1, 'JavaScript Notebook', 'https://tenten.vn/tin-tuc/wp-content/uploads/2022/06/Java-Script-4.jpg', 7, N'Khóa học JavaScript hiện đại dành cho mọi người! Làm chủ JavaScript với các dự án, thử thách và lý thuyết. Nhiều khóa học trong một!',
		N'Trong thời gian gần đây, JavaScript luôn là ngôn ngữ rất nhiều lập trình viên và sinh viên IT đang quan tâm và bàn tán vì tính linh hoạt, đa năng và cơ hội nghề nghiệp hấp dẫn mà ngôn ngữ này mang lại. Với sự phát triển nhanh các tính năng mới của JavaScript khiến nhiều người đang nghiên cứu cũng khó nhớ hết những tính năng và hiểu bản chất cụ thể của nó. Thông qua khóa học SỔ TAY JAVASCRIPT, đây chỉ là những ghi chép mà Kteam tổng hợp như để có thể nghiên cứu lại khi cần thiết và giúp các bạn học hiểu được những tính năng JavaScript hiện nay. Khóa học này không hướng dẫn bạn từ cơ bản như các tutorial khác của Howkteam.com, vì vậy để theo dõi khóa này một cách tốt nhất hãy đảm bảo bạn đã có kiến thức về JavaScript cơ bản.', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(1, 'Data Structures and Algorithms', 'https://camo.githubusercontent.com/209cff110067a8a1d41863dfd9e6469c02571dc51197ee8bccfe11abfc79aaf1/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f636f75727365736974792d626c6f672f323032302f30372f646174612d7374727563747572652d616c676f726974686d2d636f75727365732e706e67', 7, N'Cấu trúc dữ liệu và thuật toán từ Zero đến Hero',
		N'Bạn đã từng đau đầu với các cấu trúc stack, queue,.. hoặc cảm thấy cực kỳ khó khăn với các thuật toán sắp xếp, tìm kiếm được sử dụng trong lập trình. Đừng lo lắng! Trong khoá học này, chúng ta sẽ cùng nhau tìm hiểu một cách đơn giản nhất về cấu trúc dữ liệu và giải thuật, cũng như giúp bạn nắm rõ hơn về các kiến thức này.', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(1, 'Cracking Technique', 'https://media.cybernews.com/images/featured/2020/08/password-cracking-techniques-1.jpg', 8, N'',
		N'', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(1, 'Basic Front End Programming with Website Landing Page', 'https://fiverr-res.cloudinary.com/images/q_auto,f_auto/gigs/299940393/original/434c252828262c1472630677abdeed4c13a9a774/do-the-front-end-for-a-landing-page.jpg', 8, N'',
		N'Nếu bạn yêu thích lập trình web nhưng còn lơ ngơ không biết bắt đầu từ đâu hay đã biết cơ bản mà chưa làm được một sản phẩm nhất định nào, thì đây chính là khóa học dành cho bạn – LẬP TRÌNH FRONT END CƠ BẢN VỚI WEBSITE LANDING PAGE. Trong phần này, Chúng tôi sẽ giới thiệu cho các bạn về nội dung chúng ta sẽ được hướng dẫn cho khóa học này, cũng như là project mà chúng ta sẽ cùng nhau thực hiện.', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(1, 'Basic Winform Programming', 'https://d3n0h9tb65y8q.cloudfront.net/public_assets/assets/000/002/068/original/WPF.png?1639058248', 7, N'',
		N'Serial dành cho những bạn chưa có bất kỳ kiến thức gì về lập trình Winform, hoặc những bạn mất căn bản muốn lấy lại kiến thức nền tảng C# Winform. Nội dung Serial này được phân tách chi tiết nhất có thể, nhằm giúp các bạn dễ hiểu và thực hành được ngay.', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(1, 'Basic to Object Oriented Java Programming', 'https://venturebeat.com/wp-content/uploads/2015/12/oracle-java-e1450723340931.jpg?fit=800%2C450&strip=all', 7, N'Lập trình Java cơ bản đến hướng đối tượng',
		N'Thông qua khóa học LẬP TRÌNH JAVA CƠ BẢN ĐẾN HƯỚNG ĐỐI TƯỢNG, Chúng tôi sẽ hướng dẫn các bạn kiến thức cơ bản của Java. Để từ đó, có được nền tảng cho phép bạn tiếp tục tìm hiểu những kiến thức tuyệt vời khác của Java hoặc là một ngôn ngữ khác. Cụ thể trong khóa học này, Chúng tôi sẽ giới thiệu với các bạn Java ở phiên bản Java 8', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(1, 'Basic to Advanced Selenium Course', 'https://nareshit.com/wp-content/uploads/2018/08/Selenium-online-training-nareshit.jpg', 8, N'Khóa học Selenium cơ bản đến nâng cao',
		N'Trong khóa học này chúng tôi sẽ giới thiệu đến các bạn một công cụ mạnh mẽ giúp bạn tạo ra các Script tự động thao tác với Web browers – Đó chính là Selenium. Thông qua khóa học LẬP TRÌNH SELENIUM, chúng tôi sẽ hướng dẫn các bạn những thao tác cơ bản với Selenium. Bạn hoàn toàn có thể kết hợp Selenium và các code C#, Java, Python hay ngôn ngữ lập trình khác mà Selenium có thư viện hỗ trợ, để tạo ra một tổ hợp thao tác kinh khủng khiếp cho tool của bạn.', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(2, 'Computer tips', 'https://ramarcsolutions.com/wp-content/uploads/2018/05/computertips.png', 8, N'Thủ thuật máy tính',
		N'Trong khóa học này chúng tôi sẽ giới thiệu đến các bạn các thủ thuật tối ưu máy tính.', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(2, 'Certified Ethical Hacker v10 Vietnamese', 'https://i.ytimg.com/vi/MrJj9kRFPO0/maxresdefault.jpg', 8, N'CEH là từ viết tắt của Certified Ethical Hacker, là một trong những chứng chỉ bảo mật thông tin mạng/ứng dụng hàng đầu trong năm 2018 (Theo businessnewsdaily.com ). Là bước đầu tiên giúp bạn trở thành một hacker mũ trắng, với phương châm “ Hiểu hacker để chống lại hacker”.',
		N'Nội dung của cuốn sách CEH v10 Tiếng Việt sẽ trang bị cho bạn các kiến thức từ cơ bản đến chuyên sâu về bảo mật, biết sử dụng thành thạo các công cụ và phương thức tấn công của các hacker qua 21 Modules( Module 21 là phần bổ sung chỉ có tại bản Tiếng Việt gồm các bài thi thử từ EC-Council kèm theo đáp án), từ đó giúp bạn làm chủ các phương pháp tấn công mà hacker thường sử dụng và có khả năng ngăn chặn,phòng chống lại các hành vi xâm phạm trái phép và phá hoại hệ thống mạng trong các công ty, tổ chức hay doanh nghiệp.', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(2, 'Installation Instructions', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1I_auLCilG6qWtd9T6XEymoYwMnHy_8_8iSB8naX_39uzcpho6lY7mWNjI2bcBw4MUbo&usqp=CAU', 8, N'Hướng dẫn cài đặt phần mềm, hệ điều hành',
		N'', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(3, 'Adobe LightRoom Part I', 'https://www.classcentral.com/report/wp-content/uploads/2022/08/Adobe-Lightroom-BCG-Banner.png', 8, N'Tinh Nhuệ Với LightRoom',
		N'', 
		1, 'none')
INSERT INTO [Course] ([CategoryID], [Name], [Image], [UserID], [CourseInfo], [Description], [PublishStatus], [request])
		VALUES(3, 'Adobe LightRoom Part II', 'https://www.classcentral.com/report/wp-content/uploads/2022/08/Adobe-Lightroom-BCG-Banner.png', 8, N'Phần Xử Lý Hậu Kỳ',
		N'', 
		1, 'none')

-- TABLE: [Review]
INSERT INTO [Review] ([UserID], [CourseID], [Vote]) VALUES (1, 1, 2.5)
INSERT INTO [Review] ([UserID], [CourseID], [Vote]) VALUES (2, 1, 3.7)
INSERT INTO [Review] ([UserID], [CourseID], [Vote]) VALUES (3, 1, 0)
INSERT INTO [Review] ([UserID], [CourseID], [Vote]) VALUES (1, 2, 2)
INSERT INTO [Review] ([UserID], [CourseID], [Vote]) VALUES (1, 1, 2)

-- TABLE: [ReviewFeedback]
INSERT INTO [ReviewFeedback] ([ReviewID], [ReviewFeedbackContent], [ReviewFeedbackDate]) VALUES(1, '123', GETDATE())
INSERT INTO [ReviewFeedback] ([ReviewID], [ReviewFeedbackContent], [ReviewFeedbackDate]) VALUES(1, '112233', GETDATE())
INSERT INTO [ReviewFeedback] ([ReviewID], [ReviewFeedbackContent], [ReviewFeedbackDate]) VALUES(2, '456', GETDATE())
INSERT INTO [ReviewFeedback] ([ReviewID], [ReviewFeedbackContent], [ReviewFeedbackDate]) VALUES(3, '789', GETDATE())
INSERT INTO [ReviewFeedback] ([ReviewID], [ReviewFeedbackContent], [ReviewFeedbackDate]) VALUES(4, '123', GETDATE())

------------------------------------------------- END INSERT -----------------------------------------------------

------------------------------------------------- TEST -----------------------------------------------------
select * from Blog
select * from [User] where [roleID] =2 
select * from BlogFeedback
select * from BlogComments
select * from BlogFeedback WHERE BlogID = 1

SELECT TOP 9 * FROM Blog ORDER BY BlogID DESC
delete from [User] WHERE UserID > 6

SELECT TOP 5 * FROM Blog 
WHERE BlogID != (SELECT Max(BlogID) FROM Blog) 
ORDER BY BlogID DESC

select * from category

SELECT * FROM [UserRole] ORDER BY [RoleID] desc

SELECT * FROM [Course] WHERE [Name] LIKE '%te%'
SELECT * FROM Review
SELECT * FROM [ReviewFeedback]

SELECT a.ReviewID, a.UserID, a.CourseID, a.Vote, b.ReviewFeedbackID, b.ReviewFeedbackContent, b.ReviewFeedbackDate
FROM [Review] a JOIN [ReviewFeedback] b
ON a.ReviewID = b.ReviewID 
WHERE a.CourseID = 1

SELECT a.ReviewID, a.UserID, a.CourseID, a.Vote, b.ReviewFeedbackID, b.ReviewFeedbackContent, b.ReviewFeedbackDate
FROM [Review] a JOIN [ReviewFeedback] b
ON a.ReviewID = b.ReviewID 
WHERE b.ReviewFeedbackID = 4

DELETE FROM [Review] 

SELECT * FROM [Review]
SELECT * FROM [ReviewComments]
SELECT * FROM [ReviewFeedback]

INSERT INTO [ReviewComments] VALUES(9, 10, 'testcomment', GETDATE())