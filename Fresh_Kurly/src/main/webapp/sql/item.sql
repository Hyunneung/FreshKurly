drop table item;



create table item (
   item_id         number(20) primary key,
   item_name      varchar2(100) not null,
   item_price      number(10) not null,
   item_reg_date    date default sysdate,
   item_image       varchar2(200) not null,
   item_deliver   varchar2(200), --샛별배송 여부
   item_seller      varchar2(20) default '프레쉬컬리', --판매자
   item_package   varchar2(100), --포장타입
   item_expiredate varchar2(200), --유통기한
   item_unit       varchar2(100), --단위
   item_weight    varchar2(50), --중량, 용량
   item_category    varchar2(20) not null,
   item_intro       varchar2(200) not null, --상품 설명 본문
   item_stock       number(10) not null
)


drop table item ;
select * from item;
select * from tab;