use WNrea
go
--用户信息表
create table UserInfo(
UserID int primary key identity(1,1),
Admin nvarchar(50) not null,
NickName nvarchar(20) not null,
Pwd nvarchar(20) not null,
Sex int,
Age int,
Profession nvarchar(50),
AnIncome money
)

--管理员表
create table PowerInfo(
PowerID int primary key identity(1,1),
Account nvarchar(50) not null,
PowerPwd nvarchar(20) not null
)

--房产公司表
create table Corporation(
CorporationID int primary key identity(1,1),
CpName nvarchar(50) not null,
CpAddress nvarchar(50) not null,
FoundTime date not null,
Scale nvarchar(20),
 Hotline nvarchar(20) not null
)

--房屋信息表
create table HouseInfo(
HouseID int primary key identity(1,1),
Name nvarchar(200) not null,
Contacts nvarchar(20) not null,
Phone int not null,
SaleType nvarchar(20) not null,
Address nvarchar(200) not null,
FloorSpace decimal(10,2) not null,
HouseType nvarchar(15) not null,
Price money,
ContainGear int not null,
Introduction nvarchar(500),
SaleStatus int not null,
CorporationID int foreign key references Corporation(CorporationID),
UserID int foreign key references UserInfo(UserID)
)

--房屋图片集表
create table PictureSet(
PictureID int primary key identity(1,1),
Picture nvarchar(200),
HouseID int foreign key references HouseInfo(HouseID)
)

--合租表
create table Cotenancy(
CotenancyID int primary key identity(1,1),
ReqSex int,
ReqAge nvarchar(50),
Num int not null,
UserID int foreign key references UserInfo(UserID),
HouseID int foreign key references HouseInfo(HouseID)
)


--中介人表
create table Intermediary(
IntermediaryID int primary key identity(1,1),
ItdName nvarchar(50) not null,
ItdSex int,
Experience int,
ItdPhone nvarchar(20) not null,
CorporationID int foreign key references Corporation(CorporationID)
)

--房价信息表
create table HousePrice(
HousePricesID int primary key identity(1,1),
ChangeTime date not null,
Prices money not null,
HouseID int foreign key references HouseInfo(HouseID)
)
