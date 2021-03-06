create database bookstore;
go
use bookstore

if exists (select * from sysobjects where id = OBJECT_ID('[book]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [book]

CREATE TABLE [book] (
[图书编号] [nchar]  (20) NOT NULL,
[图书类别] [nvarchar]  (20) NOT NULL,
[书名] [nvarchar]  (40) NOT NULL,
[作者] [nchar]  (10) NOT NULL,
[出版社] [nvarchar]  (20) NOT NULL,
[出版时间] [date]  NOT NULL,
[单价] [real]  NOT NULL,
[数量] [int]  NULL,
[折扣] [real]  NULL,
[封面图片] [nvarchar]  (40) NULL)

ALTER TABLE [book] WITH NOCHECK ADD  CONSTRAINT [PK_book] PRIMARY KEY  NONCLUSTERED ( [图书编号] )
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP115/12683         ', N'网页设计', N'计算机基础', N'李华        ', N'人民邮电出版社', CAST(0xD7350B00 AS Date), 27, NULL, NULL, NULL)
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP23/6625           ', N'计算机', N'JavaScript网站制作', N'谢为民       ', N'中国青年出版社', CAST(0x2F330B00 AS Date), 33, 60, 0.8, NULL)
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP24/25-p           ', N'计算机', N'PHP网站制作', N'林小红       ', N'清华大学出版社', CAST(0xD9340B00 AS Date), 23.5, 3, 0.8, NULL)
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP24/625-L          ', N'计算机', N'计算机应用基础', N'陆大强       ', N'清华大学出版社', CAST(0xD9340B00 AS Date), 45, 45, 0.8, NULL)
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP24/635-O          ', N'计算机', N'计算机网络技术', N'林力辉       ', N'清华大学出版社', CAST(0xD9340B00 AS Date), 25.5, 45, 0.8, NULL)
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP24/662-T          ', N'计算机', N'计算机文化基础', N'林华忠       ', N'清华大学出版社', CAST(0xD9340B00 AS Date), 45.5, 45, 0.8, N' D: IMAGEpicture.jpg ')
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP25/625-B          ', N'计算机', N'ASP网站制作', N'胡莉惠       ', N'中国青年出版社', CAST(0x2F330B00 AS Date), 30.5, 50, 0.8, NULL)
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP25/625-X          ', N'计算机', N'PHP_MySQL网站制作', N'王大卫       ', N'中国青年出版社', CAST(0x2F330B00 AS Date), 33.25, 50, 0.8, NULL)
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP301/0634          ', N'数据库', N'网络数据库', N'张小刚       ', N'北京大学出版社', CAST(0x8E340B00 AS Date), 28, NULL, NULL, NULL)
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP302/057           ', N'网页设计', N'网页程序设计', N'刘辉        ', N'清华大学出版社', CAST(0xE6330B00 AS Date), 25, NULL, NULL, NULL)
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP7/301-135         ', N'数据库技术', N'MYSQL数据库', N'李刚        ', N'北京大学出版社', CAST(0xAD360B00 AS Date), 20, 500, 0.8, N'')
INSERT [dbo].[book] ([图书编号], [图书类别], [书名], [作者], [出版社], [出版时间], [单价], [数量], [折扣], [封面图片]) VALUES (N'TP9/5006-T          ', N'计算机', N'Dreamwearer_8网站制作', N'鲍嘉        ', N'中国青年出版社', CAST(0x2F330B00 AS Date), 33.2, 50, 0.8, NULL)

if exists (select * from sysobjects where id = OBJECT_ID('[members]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [members]

CREATE TABLE [members] (
[用户号] [nchar]  (18) NOT NULL,
[姓名] [nchar]  (10) NOT NULL,
[性别] [nchar]  (2) NOT NULL,
[密码] [nchar]  (6) NOT NULL,
[联系电话] [nvarchar]  (20) NOT NULL,
[注册时间] [datetime2]  NULL)

ALTER TABLE [members] WITH NOCHECK ADD  CONSTRAINT [PK_members] PRIMARY KEY  NONCLUSTERED ( [用户号] )
INSERT [dbo].[members] ([用户号], [姓名], [性别], [密码], [联系电话], [注册时间]) VALUES (N'A0012             ', N'赵宏宇       ', N'男 ', N'080100', N'13601234123', CAST(0x00B10201422E0B0000 AS DateTime2))
INSERT [dbo].[members] ([用户号], [姓名], [性别], [密码], [联系电话], [注册时间]) VALUES (N'A3013             ', N'张凯        ', N'男 ', N'080100', N'13611320001', CAST(0x00778100122E0B0000 AS DateTime2))
INSERT [dbo].[members] ([用户号], [姓名], [性别], [密码], [联系电话], [注册时间]) VALUES (N'B0022             ', N'王林        ', N'男 ', N'080100', N'12501234123', CAST(0x006E73000F2E0B0000 AS DateTime2))
INSERT [dbo].[members] ([用户号], [姓名], [性别], [密码], [联系电话], [注册时间]) VALUES (N'B2023             ', N'李小冰       ', N'女 ', N'080100', N'13651111081', CAST(0x00EE7D00152E0B0000 AS DateTime2))
INSERT [dbo].[members] ([用户号], [姓名], [性别], [密码], [联系电话], [注册时间]) VALUES (N'C0132             ', N'张莉        ', N'女 ', N'123456', N'13822555432', CAST(0x0000000030360B0000 AS DateTime2))
INSERT [dbo].[members] ([用户号], [姓名], [性别], [密码], [联系电话], [注册时间]) VALUES (N'C0138             ', N'李华        ', N'女 ', N'123456', N'13822551234', CAST(0x000000007E370B0000 AS DateTime2))
INSERT [dbo].[members] ([用户号], [姓名], [性别], [密码], [联系电话], [注册时间]) VALUES (N'D1963             ', N'张三        ', N'男 ', N'222222', N'51985523', CAST(0x003174001A2E0B0000 AS DateTime2))
if exists (select * from sysobjects where id = OBJECT_ID('[sell]') and OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [sell]

CREATE TABLE [sell] (
[订单号] [nchar]  (10) NOT NULL,
[用户号] [nchar]  (18) NOT NULL,
[图书编号] [nchar]  (20) NOT NULL,
[订购册数] [int]  NOT NULL,
[订购单价] [real]  NOT NULL,
[订购时间] [datetime2]  NOT NULL,
[是否发货] [nvarchar]  (10) NULL,
[是否收货] [nvarchar]  (10) NULL,
[是否结清] [nvarchar]  (10) NULL)

ALTER TABLE [sell] WITH NOCHECK ADD  CONSTRAINT [PK_sell] PRIMARY KEY  NONCLUSTERED ( [订单号],[用户号],[图书编号] )
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'1         ', N'D1963             ', N'TP115/12683         ', 4, 25, CAST(0x009FAE0081370B0000 AS DateTime2), N'已发货', N'已收货', N'已结清')
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'10        ', N'C0132             ', N'TP115/12683         ', 10, 27, CAST(0x00FDAB0068370B0000 AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'11        ', N'C0132             ', N'TP302/057           ', 30, 25, CAST(0x00FDAB0068370B0000 AS DateTime2), N'已发货', N'已收货', N'已结清')
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'12        ', N'C0132             ', N'TP301/0634          ', 40, 28, CAST(0x00FDAB0068370B0000 AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'13        ', N'C0132             ', N'TP7/301-135         ', 13, 20, CAST(0x00FDAB0068370B0000 AS DateTime2), N'已发货', NULL, NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'14        ', N'C0138             ', N'TP24/25-p           ', 10, 23.5, CAST(0x00FDAB0068370B0000 AS DateTime2), N'已发货', N'已收货', N'已结清')
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'15        ', N'C0138             ', N'TP25/625-X          ', 133, 33.5, CAST(0x00FDAB0068370B0000 AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'16        ', N'C0138             ', N'TP23/6625           ', 43, 30, CAST(0x00FDAB0068370B0000 AS DateTime2), N'已发货', NULL, NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'2         ', N'D1963             ', N'TP302/057           ', 3, 31.5, CAST(0x00A8AE006C370B0000 AS DateTime2), N'已发货', NULL, NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'3         ', N'D1963             ', N'TP301/0634          ', 6, 23.45, CAST(0x00B3AE00E8360B0000 AS DateTime2), N'已发货', N'已收货', NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'4         ', N'B2023             ', N'TP7/301-135         ', 7, 37.1, CAST(0x000000000E310B0000 AS DateTime2), N'已发货', N'已收货', N'已结清')
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'5         ', N'A3013             ', N'TP115/12683         ', 7, 65.6, CAST(0x000000006B320B0000 AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'6         ', N'A3013             ', N'TP25/625-B          ', 4, 89, CAST(0x00000000C6310B0000 AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'7         ', N'C0138             ', N'TP24/625-L          ', 6, 23, CAST(0x00BCAE00E1360B0000 AS DateTime2), N'已发货', N'已收货', NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'8         ', N'C0138             ', N'TP25/625-B          ', 5, 45.5, CAST(0x000000006C320B0000 AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[sell] ([订单号], [用户号], [图书编号], [订购册数], [订购单价], [订购时间], [是否发货], [是否收货], [是否结清]) VALUES (N'9         ', N'C0132             ', N'TP24/625-L          ', 6, 23, CAST(0x00A7020173370B0000 AS DateTime2), N'已发货', N'已收货', NULL)
