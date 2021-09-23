--�إ߸�ƪ�:

use Drink;
------------------------------ �|�� ------------------------------

-- �b��
create table SQLMemberID(
UserID varchar(50) not null PRIMARY KEY,--�b��
UserPaws varchar(50) not null,--�K�X
ClassMember varchar(10) not null,--���O
VAT varchar(10));--�νs

--�@��|�����
create table SQLMemberData(
UserID varchar(50) not null,--�b��
Name varchar(50) ,--�m�W
Birthday varchar(10) ,--�ͤ�
Email varchar(50));

--���~�|�����
create table SQLMemberDataVendor(
UserID varchar(50) not null,--�b��
Vendor varchar(50) ,--���~�W��
Principal varchar(10) ,--�t�d�H
Address varchar(50) ,--�a�}
Email varchar(50) );

--�[�J���

--ClassMember �ϥΪ����O a:�@�� b:���~ c:���a d:���u fa:�@��|���ѰO�K�X���ק� fb:���~�|���ѰO�K�X���ק�
--UserID �Ϫ̱b��, UserPaws �ϥΪ̱K�X, ClassMember �ϥΪ����O, VAT �Τ@�s��
insert into SQLMemberID (UserID, UserPaws, ClassMember) values ('aaa', 'a123', 'a');
insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT) values ('bbb', 'a123', 'b','12345678');
insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT) values ('ccc', 'a123', 'c','12345678');
insert into SQLMemberID (UserID, UserPaws, ClassMember, VAT) values ('ddd', 'a123', 'd','12345678');

--UserID �Ϫ̱b��, Name �Ϫ̦W�l, Birthday �ͤ�, Email
insert into SQLMemberData (UserID, Name, Birthday, Email) values ('aaa', 'RRR', '2021-07-15','610323021@gms.ndhu.edu.tw');

--UserID �Ϫ̱b��,Vendor ���~�W��,Principal �t�d�H,Address �a�}, Email
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address, Email) values ('bbb', 'TT', 'Ted','aaa123ddd','610323021@gms.ndhu.edu.tw');
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address, Email) values ('ccc', 'TT', 'Ted','aaa123ddd','sda@sadad.com');
insert into SQLMemberDataVendor (UserID, Vendor,Principal ,Address, Email) values ('ddd', 'TT', 'Ted','aaa123ddd','sda@sadad.com');


--�d��
select * from SQLMemberID;--�b��
select * from SQLMemberData;--�@��|�����
select * from SQLMemberDataVendor;--���~�|�����


------------------------------ �ʪ��� ------------------------------

--���~
create table Prouct(
       prouctID int identity(1,1) constraint product_proid_pk primary key,
       storeID int,
       prouctName char(20) constraint prooct_proname_nn not null,
       prouctPrice numeric constraint prooct_proprice_nn not null,
       );

--�q��
create table Orderss(
   OrderssID int identity(1,1) constraint ORD_ORDID_pk primary key ,
   customerID int ,
   storeID int ,
   shopDate date default getdate(),
   total numeric);

--�U�q�q��
 create table OrderssItem(
   OrderssID int ,
   OitemID int identity(100,1) ,
   poructName varchar(10) not null ,
   actualprice numeric,
   QTY int,
   itemtot numeric,
   constraint ORDitem_ORDID_itemID_pk primary key(OrderssID,OitemID),
   constraint ORDitem_ORDIDToORD_fk FOREIGN key(OrderssID) REFERENCES Orderss(OrderssID), );


--���~���
insert into Prouct
values(2001,'��������',30),
       (2001,'�R�K����',30),
	   (2001,'���ì���',55),
	   (2001,'�K���B��',45),
	   (2001,'���_�ڹp',65);

--�[�J�q��
insert into Orderss(customerID,storeID,shopDate,total)
values(1001,2005,'2021-07-01',160),
     (1001,2002,'2021-07-04',270),
	 (1001,2006,'2021-07-29',250),
	 (1001,2006,'2021-07-30',290);

--�d��
select * from Prouct;--���~
select * from Orderss;--�q��
select * from OrderssItem;--�U�q�q��


------------------------------ �Q�װ� ------------------------------

--�s�W�Q�װϸ�ƪ�
create table forum
(
discussID int identity(1001,1) primary key not null,
shopName varchar(20) not null,
drink varchar(20) not null,
drinkDiscuss varchar (50)  not null,
drinkstar int not null,
);

--�[�J���
insert into forum(shopName,drink,drinkDiscuss,drinkstar)
values
('�M�Y','�h�h�B�A','�[�p�ܦn��',5),
('�i�G�i','��������','�ܸѪo���٦��G��',4),
('�i�G�i','�گ׬���','�[�F�ե����ڧ��h�Ѱ󪺸��F',5),
('�i�G�i','�եɼڹp','�u������,�i�H�h�j���R50�P�F�o����O���]�˪�',2);

--�d��
select * from forum;

------------------------------ ���a ------------------------------

--���a�n�Jtable[login]
create table login(
--���a�b���]�w�̦h20�Ӧr�A��PK
stuserid varchar(20) constraint login_account_pk PRIMARY KEY,
--���a�K�X�]�w�̦h20�Ӧr,���o��NULL
stpassword varchar(20) constraint login_pswd_nn NOT NULL,
--���~�νs�]�w�̦h15�Ӧr
company varchar(15) NOT NULL,
);

--���a�n�J��s�W���a��T
create table store(
--���aID�A�۰ʷs�W
storeid numeric(10) identity(1,1) constraint store_storeid_pk PRIMARY KEY,
--�إߤ��,�w�]��������
startdate date default getdate(),
--���a�b���AFK,�Plogin�s��
stuserid varchar(20) constraint store_stuserid_fk REFERENCES login(stuserid),
--���a�W�]�w�̦h25�r�A���o��NULL,��UK
title varchar(50) constraint store_title_nn NOT NULL,
--�����A���o��NULL
manager	varchar(10) constraint store_manager_nn NOT NULL,
--�a�}�A���o��NULL
stadd varchar(80) constraint store_stadd_nn NOT NULL,
--�q��
tel varchar(15),
--²��
intro varchar(200),
--���a�ʭ�,
photo varbinary(max),

constraint store_stuserid_uk UNIQUE(stuserid)
);

--�s�W��ƶi�Jlogin
insert into login
values('aa12345','12345','88888888'),
	  ('bb12345','12345','52446587'),
	  ('cc12345','12345','88888888'),
	  ('dd12345','12345','52446587'),
	  ('ee12345','12345','88888888'),
	  ('ff12345','12345','12345678'),
	  ('gg12345','12345','88888888'),
	  ('hh12345','12345','12345678');


--�s�W��ƶi�Jstore
insert into store(stuserid,title,manager,stadd,tel,intro)
values('aa12345','�M�s����shop','���M�Y','�򶩥����s�Ϥ��s�G��20��','02-27412555','�򶩲Ĥ@���M�s�A�ʦ~�ѩ�'),
	  ('bb12345','�Z����','���M�Y','�򶩥����s�Ϥ��s�@��20��','02-123456789','�q�f�`�n��'),
	  ('dd12345','�й�ڦy�s','������','�򶩥����s�ϷR�|��500��','02-12345678','�`��'),
	  ('cc12345','�K�����O','���p�j','�x�_���n��ϫn���85��','02-12345678','�n��CITY LINK��'),
	  ('ee12345','��o�Y','������','�x�_������Ϧ��n��500��','02-25252525','����'),
	  ('ff12345','�Χ�','�Q�s����','�x�_���Q�s�ϫn�ʪF���T�q256��1��','02-88885858','�Q�s��'),
	  ('gg12345','���H����','�B�p�j','�x�_���n��Ϧ��ָ�6��','02-85965478','�n�䩱'),
	  ('hh12345','�����i��','�p���۩���','�x�����_�Ϥ��v��500��','02-85965478','�_�ϩ�');


--�d��
select * from store;
select * from login;

------------------------------ ���� ------------------------------

--�s�W���ʸ�ƪ�
create table Activity(
	-- ID �۰ʥͦ��A�q1000 �}�l�A�� PK
	ID int identity(1000,1) primary key not null,
	-- ���ʥD�D�A�̦h30�r
	activityTopic varchar(30) not null,
	-- ���ʶ}�l�ɶ��A��J�榡'2020-10-10 13:00:00'
	startTime datetime not null,
	-- ���ʵ����ɶ��A��J�榡'2020-10-10 13:00:00'
	endTime datetime not null,
	-- ���ʤ��e�A�̦h500 �r
	activityContent varchar(500),
	-- ���������A�ثe�u��1(�����u�f) �B 2(�u�f��)
	activityType int not null
);

-- insert ���
insert into Activity(activityTopic,startTime,endTime,activityContent,activityType)
values('���ƶR�@�e�@','2021-10-10 13:00:00','2021-12-22 11:00:00','���ƶR�@�e�@�A��50���H�W�~��',1),
('���Ƨ馩5��','2021-07-20 12:00:00','2021-07-31 12:00:00','���Ƨ馩5���A�����~��',1),
('�B�~�u�f��','2021-08-01 01:00:00','2022-08-01 01:00:00','�Ҧ��B�~85��',2);

--�d��
select * from Activity;
