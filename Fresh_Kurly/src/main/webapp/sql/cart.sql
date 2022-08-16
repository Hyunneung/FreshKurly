drop table cart;

--��ٱ��� ���̺�
create table cart(
	cart_id		number(10) primary key, 
	item_id		number(20) 	 references item(item_id) on delete cascade, 
	member_id	varchar2(20) references member(member_id) on delete cascade,	
	cart_amount number(10) default 0
)

alter table cart add constraint member_id
foreign cart(member_id) references member(member_id) on delete cascade

select * from cart;
drop table cart;

select * from CART
where member_id = 'admin';

select (nvl(max(order_id),0)+1) from orderinfo;
select nvl(max(order_number),0)+1 from orderinfo;

select * from item
where item_id = '1';

