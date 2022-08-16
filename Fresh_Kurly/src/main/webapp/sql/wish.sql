drop table wish;

--찜한상품 테이블
create table wish(
	wish_id 	number(10) primary key,
	item_id		number(20) 	 references item(item_id) on delete cascade, 
	member_id	varchar2(20) references member(member_id) on delete cascade
)

drop table wish;
select * from wish;