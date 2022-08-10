drop table item on cascade;

--상품정보테이블
create table item (
	item_id			number(20) primary key,
	item_name		varchar2(100) not null,
	item_price		number(10) not null,
	item_reg_date 	date default sysdate,
	item_image 		varchar2(200) not null,
	item_deliver	varchar2(200), --샛별배송 여부
	item_seller		varchar2(20) default '프레쉬컬리', --판매자
	item_package	varchar2(100), --포장타입
	item_expiredate varchar2(200), --유통기한
	item_unit 		varchar2(100), --단위
	item_weight 	varchar2(50), --중량, 용량
	item_category 	varchar2(20) not null,
	item_intro 		varchar2(200) not null, --상품 설명 본문
	item_stock 		number(10) not null
)

insert into item
values
(item_seq.nextval , '친환경 잎채소 깻잎 30g', 1590, sysdate,
 'image/깻잎', '샛별배송 23시 전 주문시 내일 아침 7시 전 도착',
'프레쉬컬리', '냉장(종이포장)', '농산물로 별도의 유통기한은 없으나 가급적 빠르게 드시기 바랍니다.',
'1봉', '30g', '채소', '상큼하고 쌉쌀한 향기 (1봉/30g)', 10000);

create sequence practice.item_seq
increment by 1
start with 10001
minvalue 10001
maxvalue 999999

select * from item;
select * from tab;