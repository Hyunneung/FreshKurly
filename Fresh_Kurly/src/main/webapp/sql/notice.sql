--테이터 삭제
drop table notice cascade constraints purge;

--공지사항 테이블 생성하기
create table notice(
	notice_number   number(20) primary key,
	notice_name		varchar2(200),
	notice_subject  varchar2(100),
	notice_pass		number(20),
	notice_view     number(10),	
	notice_content  varchar2(200),
	notice_reg_date date default sysdate
)

select * from notice;

insert into NOTICE (notice_number, notice_name, notice_pass, notice_subject, NOTICE_CONTENT, notice_view 
                    ) 
values(1, 'admin', '1234', '공지사항', '테스트 입니다.'  ,0);



