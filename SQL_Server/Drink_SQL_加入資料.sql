--建立資料表:

use Drink;
------------------------------ 會員 ------------------------------

-- 帳號
create table SQLMemberID(
UserID varchar(50) not null PRIMARY KEY,--帳號
UserPaws varchar(50) not null,--密碼
ClassMember varchar(10) not null,--類別
VAT varchar(10));--統編

--一般會員資料
create table SQLMemberData(
UserID varchar(50) not null,--帳號
Name varchar(50) ,--姓名
Birthday varchar(10) ,--生日
Email varchar(50));

--企業會員資料
create table SQLMemberDataVendor(
UserID varchar(50) not null,--帳號
Vendor varchar(50) ,--企業名稱
Principal varchar(10) ,--負責人
Address varchar(50) ,--地址
Email varchar(50) );

--加入資料

--ClassMember 使用者類別 a:一般 b:企業 c:店家 d:員工 fa:一般會員忘記密碼未修改 fb:企業會員忘記密碼未修改
--UserID 使者帳號, UserPaws 使用者密碼, ClassMember 使用者類別, VAT 統一編號
insert into SQLMemberID (UserID, UserPaws, ClassMember) values ('aaa', 'a123', 'a');
insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT) values ('bbb', 'a123', 'b','12345678');
insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT) values ('ccc', 'a123', 'c','12345678');
insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT) values ('ddd', 'a123', 'd','12345678');

--UserID 使者帳號, Name 使者名子, Birthday 生日, Email
insert into SQLMemberData (UserID, Name, Birthday, Email) values ('aaa', 'RRR', '2021-07-15','610323021@gms.ndhu.edu.tw');

--UserID 使者帳號,Vendor 企業名稱,Principal 負責人,Address 地址, Email
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address, Email) values ('bbb', 'TT', 'Ted','aaa123ddd','610323021@gms.ndhu.edu.tw');
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address, Email) values ('ccc', 'TT', 'Ted','aaa123ddd','sda@sadad.com');
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address, Email) values ('ddd', 'TT', 'Ted','aaa123ddd','sda@sadad.com');


--查詢
select * from SQLMemberID;--帳號
select * from SQLMemberData;--一般會員資料
select * from SQLMemberDataVendor;--企業會員資料


------------------------------ 購物車 ------------------------------

--產品
create table Prouct(
       prouctID int identity(1,1) constraint product_proid_pk primary key,
       storeID int,
       prouctName char(20) constraint prooct_proname_nn not null,
       prouctPrice numeric constraint prooct_proprice_nn not null,
       );

--訂單
create table Orderss(
   OrderssID int identity(1,1) constraint ORD_ORDID_pk primary key ,
   customerID int ,
   storeID int ,
   shopDate date default getdate(),
   total numeric);

--下訂訂單
 create table OrderssItem(
   OrderssID int ,
   OitemID int identity(100,1) ,
   poructName varchar(10) not null ,
   actualprice numeric,
   QTY int,
   itemtot numeric,
   constraint ORDitem_ORDID_itemID_pk primary key(OrderssID,OitemID),
   constraint ORDitem_ORDIDToORD_fk FOREIGN key(OrderssID) REFERENCES Orderss(OrderssID), );


--產品資料
insert into Prouct
values(2001,'熟成紅茶',30),
       (2001,'麗春紅茶',30),
	   (2001,'雪藏紅茶',55),
	   (2001,'春梅冰茶',45),
	   (2001,'紅寶歐雷',65);

--加入訂單
insert into Orderss(customerID,storeID,shopDate,total)
values(1001,2005,'2021-07-01',160),
     (1001,2002,'2021-07-04',270),
	 (1001,2006,'2021-07-29',250),
	 (1001,2006,'2021-07-30',290);

--查詢
select * from Prouct;--產品
select * from Orderss;--訂單
select * from OrderssItem;--下訂訂單


------------------------------ 討論區 ------------------------------

--新增討論區資料表
create table forum
(
discussID int identity(1001,1) primary key not null,
shopName varchar(20) not null,
drink varchar(20) not null,
drinkDiscuss varchar (50)  not null,
drinkstar int not null,
);

--加入資料
insert into forum(shopName,drink,drinkDiscuss,drinkstar)
values
('清欣','多多翡翠','加厚很好喝',5),
('可佈可','熟成紅茶','很解油膩還有果香',4),
('可佈可','胭脂紅茶','加了白玉讓我找到去天堂的路了',5),
('可佈可','白玉歐雷','真的不行,可以去隔壁買50嵐了這兩分是給包裝的',2);

--查詢
select * from forum;

------------------------------ 店家 ------------------------------

--店家登入table[login]
create table login(
--店家帳號設定最多20個字，為PK
stuserid varchar(20) constraint login_account_pk PRIMARY KEY,
--店家密碼設定最多20個字,不得為NULL
stpassword varchar(20) constraint login_pswd_nn NOT NULL,
--企業統編設定最多15個字
company varchar(15) NOT NULL,
);

--店家登入後新增店家資訊
create table store(
--店家ID，自動新增
storeid numeric(10) identity(1,1) constraint store_storeid_pk PRIMARY KEY,
--建立日期,預設日期為當日
startdate date default getdate(),
--店家帳號，FK,與login連結
stuserid varchar(20) constraint store_stuserid_fk REFERENCES login(stuserid),
--店家名設定最多25字，不得為NULL,為UK
title varchar(50) constraint store_title_nn NOT NULL,
--店長，不得為NULL
manager	varchar(10) constraint store_manager_nn NOT NULL,
--地址，不得為NULL
stadd varchar(80) constraint store_stadd_nn NOT NULL,
--電話
tel varchar(15),
--簡介
intro varchar(200),
--店家封面,
photo varbinary(max),

constraint store_stuserid_uk UNIQUE(stuserid)
);

--新增資料進入login
insert into login
values('aa12345','12345','88888888'),
	  ('bb12345','12345','52446587'),
	  ('cc12345','12345','88888888'),
	  ('dd12345','12345','52446587'),
	  ('ee12345','12345','88888888'),
	  ('ff12345','12345','12345678'),
	  ('gg12345','12345','88888888'),
	  ('hh12345','12345','12345678');


--新增資料進入store
insert into store(stuserid,title,manager,stadd,tel,intro)
values('aa12345','清新飲料shop','陳清欣','基隆市中山區中山二路20巷','02-27412555','基隆第一間清新，百年老店'),
	  ('bb12345','武石藍','陳清欣','基隆市中山區中山一路20巷','02-123456789','廟口常駐店'),
	  ('dd12345','請對我尖叫','王美華','基隆市中山區愛四路500號','02-12345678','總店'),
	  ('cc12345','春陽茶是','陳小姐','台北市南港區南港路85號','02-12345678','南港CITY LINK店'),
	  ('ee12345','輸油頭','王店長','台北市內湖區江南街500號','02-25252525','內湖店'),
	  ('ff12345','屋弄','烏龍店長','台北市松山區南京東路三段256號1巷','02-88885858','松山店'),
	  ('gg12345','水象茶弄','劉小姐','台北市南港區成福路6號','02-85965478','南港店'),
	  ('hh12345','茶的磨手','小拳石店長','台中市北區五權路500號','02-85965478','北區店');


--查詢
select * from store;
select * from login;

------------------------------ 活動 ------------------------------

--新增活動資料表
create table Activity(
	-- ID 自動生成，從1000 開始，為 PK
	ID int identity(1000,1) primary key not null,
	-- 活動主題，最多30字
	activityTopic varchar(30) not null,
	-- 活動開始時間，輸入格式'2020-10-10 13:00:00'
	startTime datetime not null,
	-- 活動結束時間，輸入格式'2020-10-10 13:00:00'
	endTime datetime not null,
	-- 活動內容，最多500 字
	activityContent varchar(500),
	-- 活動類型，目前只有1(限時優惠) 、 2(優惠券)
	activityType int not null
);

-- insert 資料
insert into Activity(activityTopic,startTime,endTime,activityContent,activityType)
values('飲料買一送一','2021-10-10 13:00:00','2021-12-22 11:00:00','飲料買一送一，限50元以上品項',1),
('飲料折扣5元','2021-07-20 12:00:00','2021-07-31 12:00:00','飲料折扣5元，不限品項',1),
('冰品優惠券','2021-08-01 01:00:00','2022-08-01 01:00:00','所有冰品85折',2);

--查詢
select * from Activity;
