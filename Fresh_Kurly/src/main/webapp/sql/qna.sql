drop table qna;

--문의하기 테이블
create table qna(
	qna_number 	number(10) primary key,	
	member_id 	varchar2(20) references member(member_id),
	qna_subject varchar2(20) not null,
	qna_content varchar2(200) not null,
	qna_private varchar2(5) not null,
	qna_check 	varchar2(5) not null,
	qna_answer 	varchar2(200) not null,
	qna_reg_date date default sysdate
)
