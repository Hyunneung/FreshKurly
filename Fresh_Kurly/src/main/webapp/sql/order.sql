drop table orderInfo;

--주문내역 테이블
create table orderInfo(
	order_number 	number(10) primary key, -- 주문번호
	item_id		 	number(20) 	 references item(item_id), 
	member_id		varchar2(20) references member(member_id),		
	order_deliver	varchar2(5) not null, 	
	order_date		date default sysdate,
	order_amount	number(10) not null
)	

drop table orderInfo;