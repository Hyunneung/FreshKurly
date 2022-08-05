drop table item;

--상품정보테이블
create table item (
	item_id			number(20) primary key,
	item_name		varchar2(20) not null,
	item_price		number(10) not null,
	item_reg_date 	date default sysdate,
	item_image 		varchar2(200) not null,
	item_deliver	varcahr2(100), --샛별배송 여부
	item_seller		varchar2(20) default '프레쉬컬리', --판매자
	item_package	varchar2(50), --포장타입
	item_expiredate varcahr2(50) ,		--유통기한
	item_unit 		varchar2(20), --단위
	item_weight 	varchar2(10), --중량, 용량
	item_category 	varchar2(20) not null,
	item_intro 		varchar2(200) not null, --상품 설명 본문
	item_stock 		number(10) not null
)



select * from item;
select * from tab;