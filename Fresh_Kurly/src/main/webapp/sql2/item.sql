--상품정보테이블
create table item (
	item_id			number(20) primary key,
	item_name		varchar2(20) not null,
	item_price		number(10) not null,
	item_reg_date 	date default sysdate,
	item_image 		varchar2(200) not null,
	item_category 	varchar2(20) not null,
	item_intro 		varchar2(200) not null,
	item_stock 		number(10) not null
)



select * from item;
select * from tab;