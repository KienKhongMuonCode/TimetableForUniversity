USE [PRJ301_BL5_FA22_2]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attandance]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attandance](
	[sesid] [int] NOT NULL,
	[stdid] [varchar](150) NOT NULL,
	[present] [bit] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[record_time] [datetime] NULL,
 CONSTRAINT [PK_Attandance] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC,
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [varchar](150) NOT NULL,
	[sem] [varchar](150) NOT NULL,
	[year] [int] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [varchar](150) NOT NULL,
	[lname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[rid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role_Account] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Session]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session](
	[sesid] [int] NOT NULL,
	[gid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[tid] [int] NOT NULL,
	[index] [int] NOT NULL,
	[lid] [varchar](150) NOT NULL,
	[attanded] [bit] NULL,
 CONSTRAINT [PK_Session] PRIMARY KEY CLUSTERED 
(
	[sesid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[stdid] [varchar](150) NOT NULL,
	[stdname] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student_Group]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Group](
	[stdid] [varchar](150) NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Student_Group] PRIMARY KEY CLUSTERED 
(
	[stdid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[subname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 8/11/2022 9:29:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'KienPTHE161863', N'123456', N'Phan Trung Kiên')
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'Annv64', N'654321', N'Nguyễn Việt Anh')
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'DungNTHE131615', N'123', N'Nguyễn Trung Dung')
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'HoangTVHE131415', N'1234', N'Trần Văn Hoàng')
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'KhanhHDHE161417', N'12345', N'Hứa Duy Khánh')
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'Longnt1', N'241002', N'Nguyễn Thành Long')
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'LongNTHE161416', N'321', N'Nguyễn Thành Long')
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'KhuongPD', N'123456', N'Phùng Duy Khương')
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'ThanhLBHE161616', N'4321', N'Lai Bảo Thành')
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'TrangDTHE151415', N'54321', N'Ðặng Thuỳ Trang')
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, N'KienPTHE161863', 1, N'', CAST(N'2022-12-13T12:14:42.783' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, N'HoangTVHE131415', 0, N'Khong phep', CAST(N'2022-12-13T12:14:42.783' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, N'KhanhHDHE161417', 1, N'', CAST(N'2022-12-13T12:14:42.783' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (1, N'LongNTHE161416', 1, N'', CAST(N'2022-12-13T12:14:42.783' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, N'AnhNTQHE161713', 0, N'', CAST(N'2022-12-13T03:19:32.740' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, N'HoangTVHE131415', 1, N'', CAST(N'2022-12-13T03:19:32.743' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, N'KhanhHDHE161417', 1, N'', CAST(N'2022-12-13T03:19:32.743' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (2, N'LongNTHE161416', 0, N'', CAST(N'2022-12-13T03:19:32.743' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, N'DungNTHE131615', 0, N'X', CAST(N'2022-11-03T01:26:54.853' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, N'HoangTVHE131415', 1, N'', CAST(N'2022-11-03T01:26:54.857' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (6, N'TrangDTHE151415', 0, N'', CAST(N'2022-11-03T01:26:54.857' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, N'DungNTHE131615', 0, N'', CAST(N'2022-11-08T03:20:10.797' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, N'HoangTVHE131415', 0, N'', CAST(N'2022-11-08T03:20:10.797' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (7, N'TrangDTHE151415', 1, N'', CAST(N'2022-11-08T03:20:10.797' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (11, N'ThanhLBHE161616', 1, N'', CAST(N'2022-11-07T22:49:59.040' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, N'HoangTVHE131415', 1, N'', CAST(N'2022-11-07T22:48:19.013' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (16, N'LongNTHE161416', 0, N'', CAST(N'2022-11-07T22:48:19.013' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, N'HoangTVHE131415', 1, N'', CAST(N'2022-11-08T03:20:29.943' AS DateTime))
GO
INSERT [dbo].[Attandance] ([sesid], [stdid], [present], [description], [record_time]) VALUES (17, N'LongNTHE161416', 1, N'', CAST(N'2022-11-08T03:20:29.943' AS DateTime))
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'Timetable', N'/lecturer/timetable')
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'Take Attendance', N'/lecturer/takeatt')
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (3, N'Attendance Status', N'/lecturer/status')
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (4, N'Timetable', N'/student/timetable')
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (5, N'Attendance Status', N'/student/status')
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (6, N'Home', N'/home')
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (1, N'PRJ301-SE1643', 1, N'KhuongPD', N'FALL', 2022)
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (2, N'MAS391-SE1643', 3, N'Annv64', N'FALL', 2022)
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (3, N'PRO192-SE1643', 2, N'Annv64', N'FALL', 2022)
GO
INSERT [dbo].[Group] ([gid], [gname], [subid], [lid], [sem], [year]) VALUES (4, N'PRO192-SE1648', 2, N'KhuongPD', N'FALL', 2022)
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (N'Annv64', N'Nguyễn Việt Anh')
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (N'Longnt1', N'Nguyễn Thành Long')
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (N'KhuongPD', N'Phùng Duy Khương')
GO
INSERT [dbo].[Role] ([rid], [rname]) VALUES (1, N'Lecturer ')
GO
INSERT [dbo].[Role] ([rid], [rname]) VALUES (2, N'Student')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'Annv64')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'Longnt1')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (1, N'KhuongPD')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'KienPTHE161863')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'DungNTHE131615')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'HoangTVHE131415')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'LongNTHE161416')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'ThanhLBHE161616')
GO
INSERT [dbo].[Role_Account] ([rid], [username]) VALUES (2, N'TrangDTHE151415')
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 1)
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 2)
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 3)
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (1, 6)
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 4)
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 5)
GO
INSERT [dbo].[Role_Feature] ([rid], [fid]) VALUES (2, 6)
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'AL-L302')
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'BE-211')
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (3, N'AL-R203')
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (4, N'BE-401')
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (1, 1, 1, CAST(N'2022-12-12' AS Date), 1, 1, N'KhuongPD', 1)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (2, 1, 1, CAST(N'2022-12-13' AS Date), 1, 2, N'KhuongPD', 1)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (3, 1, 1, CAST(N'2022-12-14' AS Date), 1, 3, N'KhuongPD', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (4, 1, 1, CAST(N'2022-12-15' AS Date), 1, 4, N'KhuongPD', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (5, 1, 1, CAST(N'2022-12-16' AS Date), 1, 5, N'KhuongPD', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (6, 2, 1, CAST(N'2022-12-12' AS Date), 2, 1, N'KhuongPD', 1)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (7, 2, 1, CAST(N'2022-12-13' AS Date), 2, 2, N'KhuongPD', 1)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (8, 2, 1, CAST(N'2022-12-14' AS Date), 2, 3, N'KhuongPD', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (9, 2, 1, CAST(N'2022-12-15' AS Date), 2, 4, N'KhuongPD', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (10, 2, 1, CAST(N'2022-12-16' AS Date), 2, 5, N'KhuongPD', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (11, 3, 2, CAST(N'2022-11-07' AS Date), 1, 1, N'Annv64', 1)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (12, 3, 2, CAST(N'2022-11-08' AS Date), 1, 2, N'Annv64', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (13, 3, 2, CAST(N'2022-11-09' AS Date), 1, 3, N'Annv64', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (14, 3, 2, CAST(N'2022-11-17' AS Date), 1, 4, N'Annv64', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (15, 3, 2, CAST(N'2022-11-19' AS Date), 1, 5, N'Annv64', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (16, 4, 1, CAST(N'2022-12-12' AS Date), 3, 1, N'KhuongPD', 1)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (17, 4, 1, CAST(N'2022-12-13' AS Date), 3, 2, N'KhuongPD', 1)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (18, 4, 1, CAST(N'2022-12-14' AS Date), 3, 3, N'KhuongPD', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (19, 4, 1, CAST(N'2022-12-15' AS Date), 3, 4, N'KhuongPD', 0)
GO
INSERT [dbo].[Session] ([sesid], [gid], [rid], [date], [tid], [index], [lid], [attanded]) VALUES (20, 4, 1, CAST(N'2022-12-16' AS Date), 3, 5, N'KhuongPD', 0)
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (N'KienPTHE161863', N'Phan Trung Kiên')
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (N'DungNTHE131615', N'Nguyễn Trung Dung')
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (N'HoangTVHE131415', N'Trần Văn Hoàng')
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (N'KhanhHDHE161417', N'Hứa Duy Khánh')
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (N'LongNTHE161416', N'Nguyễn Thành Long')
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (N'ThanhLBHE161616', N'Lai Bảo Thành')
GO
INSERT [dbo].[Student] ([stdid], [stdname]) VALUES (N'TrangDTHE151415', N'Ðặng Thuỳ Trang')
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'KienPTHE161863', 1)
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'DungNTHE131615', 2)
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'HoangTVHE131415', 1)
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'HoangTVHE131415', 2)
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'HoangTVHE131415', 4)
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'KhanhHDHE161417', 1)
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'LongNTHE161416', 1)
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'LongNTHE161416', 4)
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'ThanhLBHE161616', 3)
GO
INSERT [dbo].[Student_Group] ([stdid], [gid]) VALUES (N'TrangDTHE151415', 2)
GO
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (1, N'PRJ301')
GO
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (2, N'PRO192')
GO
INSERT [dbo].[Subject] ([subid], [subname]) VALUES (3, N'MAS391')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (1, N'7:30 - 9:00')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (2, N'9:10 - 10:40')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (3, N'10:50 - 12:20')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (4, N'12:50 - 14:20')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (5, N'14:30 - 16:00')
GO
INSERT [dbo].[TimeSlot] ([tid], [description]) VALUES (6, N'16:10 - 17:40')
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Session] FOREIGN KEY([sesid])
REFERENCES [dbo].[Session] ([sesid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Session]
GO
ALTER TABLE [dbo].[Attandance]  WITH CHECK ADD  CONSTRAINT [FK_Attandance_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Attandance] CHECK CONSTRAINT [FK_Attandance_Student]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Lecturer]
GO
ALTER TABLE [dbo].[Group]  WITH CHECK ADD  CONSTRAINT [FK_Group_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[Group] CHECK CONSTRAINT [FK_Group_Subject]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Account] FOREIGN KEY([lid])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Role]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Group]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Lecturer]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_Room]
GO
ALTER TABLE [dbo].[Session]  WITH CHECK ADD  CONSTRAINT [FK_Session_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Session] CHECK CONSTRAINT [FK_Session_TimeSlot]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Account] FOREIGN KEY([stdid])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Account]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Group] FOREIGN KEY([gid])
REFERENCES [dbo].[Group] ([gid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Group]
GO
ALTER TABLE [dbo].[Student_Group]  WITH CHECK ADD  CONSTRAINT [FK_Student_Group_Student] FOREIGN KEY([stdid])
REFERENCES [dbo].[Student] ([stdid])
GO
ALTER TABLE [dbo].[Student_Group] CHECK CONSTRAINT [FK_Student_Group_Student]
GO