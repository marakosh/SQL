USE SportshopDB;

go

-- 1
create login Mark with password = 'Mark';

create user UserMark for login Mark;

grant select on SportShopDB.* to UserMark;

deny select on SportShopDB.Sellers to UserMark;



-- 2

create login David with password = 'David';

create user UserDavid for login David;

grant select on SportShopDB.Sellers to UserDavid;

grant select on SportShopDB.Persons to UserKonstantin;

grant select on SportShopDB.Positions to UserKonstantin;

grant select on SportShopDB.Genders to UserKonstantin;



-- 3

create login Olga with password = 'Olga';

create user UserOlga for login Olga;

exec sp_addrolemember 'db_owner' , 'UserOlga';



-- 4

create login Konstantin with password = 'Konstantin';

create user UserKonstantin for login Konstantin;

grant select on SportShopDB.Sellers to UserKonstantin;

grant select on SportShopDB.Persons to UserKonstantin;

grant select on SportShopDB.Positions to UserKonstantin;

grant select on SportShopDB.Genders to UserKonstantin;

grant select on SportShopDB.Products to UserKonstantin;

grant select on SportShopDB.ProductTypes to UserKonstantin;

grant select on SportShopDB.Manufacturers to UserKonstantin;