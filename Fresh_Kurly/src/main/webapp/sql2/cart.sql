--장바구니 테이블
create table cart(
	cart_id		number(10) primary key, 
	item_id		number(20) 	 references item(item_id), 
	member_id	varchar2(20) references member(member_id),	
	cart_amount number(10) default 0
)
