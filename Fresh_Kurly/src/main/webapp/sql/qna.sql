drop table qna cascade constraints purge;

--문의하기 테이블
create table qna(
	qna_number 	number(10) primary key,	
	qna_name 	varchar2(20), 
	qna_subject varchar2(20), 
	qna_pass 	varchar2(20), 
	qna_content varchar2(200), 
	qna_view     number(10),
	qna_reg_date date default sysdate
);



select qna_content from qna;
insert into qna (qna_num,qna_name, qna_subject, qna_pass, qna_content)values (3,'하이','하이','1234','하이');

select * from qna;


<<<<<<< HEAD

--comm 테이블 (-> comm 테이블 sql 만들어지면 지울거임)
create table comm(
	num					number primary key,
	id					varchar2(30) references member(member_id),
	content				varchar2(200),
	reg_date			date,
	comment_qna_num	number references qna(qna_num) on delete cascade, -- comm 테이블이 참조하는 board 글 번호
	comment_re_lev number(1) check(comment_re_lev in(0,1,2)), -- 원문이면 0, 답글이면 1
	comment_re_seq number, -- 원문이면 0, 1레벨이면 1레벨 시퀀스 + 1
	comment_re_ref number  -- 원문은 자신 글번호, 답글이면 원문 글번호
);
=======
--comm 테이블 (-> comm 테이블 sql 만들어지면 지울거임)
create table comm(
	num					number primary key,
	id					varchar2(30) references member(member_id),
	content				varchar2(200),
	reg_date			date,
	comment_qna_num	number references qna(qna_num) on delete cascade, -- comm 테이블이 참조하는 board 글 번호
	comment_re_lev number(1) check(comment_re_lev in(0,1,2)), -- 원문이면 0, 답글이면 1
	comment_re_seq number, -- 원문이면 0, 1레벨이면 1레벨 시퀀스 + 1
	comment_re_ref number  -- 원문은 자신 글번호, 답글이면 원문 글번호
);

>>>>>>> branch 'main' of https://github.com/ahslxj1993/Fresh_Kurly.git
