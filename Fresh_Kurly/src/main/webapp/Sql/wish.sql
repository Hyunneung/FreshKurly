drop table wish;

--���ѻ�ǰ ���̺�
create table wish(
	wish_id 	number(10) primary key,
	item_id		number(20) 	 references item(item_id), 
	member_id	varchar2(20) references member(member_id)
)