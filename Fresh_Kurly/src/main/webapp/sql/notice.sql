
drop table notice;

--공지사항 테이블
create table notice(
	notice_number   number(20) primary key, 
	notice_subject  varchar2(20),
	notice_view     number(10),	
	notice_content  varchar2(200),
	notice_reg_date date default sysdate
)
