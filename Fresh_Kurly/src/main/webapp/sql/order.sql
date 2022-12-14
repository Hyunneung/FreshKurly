drop table orderInfo;

--주문내역 테이블
create table orderInfo(
	order_id		number(10) primary key, -- 주문번호
	order_number 	number(10), -- 같이 주문하면 같은 번호
	item_id		 	number(20) 	 references item(item_id) on delete cascade, 
	member_id		varchar2(20) references member(member_id) on delete cascade,		
	order_deliver	varchar2(5) not null, 	
	order_date		date default sysdate,
	order_amount	number(10) not null
)	

drop table orderInfo;

select (nvl(max(order_number),0)+1) from orderinfo;
select count(*) from cart where member_id = 'admin';

private String item_image; // 상품 사진 
private String item_name; // 상품명
private int item_price; // 상품 단가