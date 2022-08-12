drop table qnacomm cascade constraints purge;

create table qnacomm(
	num				number			primary key,							 -- 댓글번호
	id				varchar2(30)	references member(member_id),			 -- 댓글아이디(회원아이디참조)			
	content			varchar2(200),											 -- 댓글 내용
	reg_date		date,													 -- 댓글 등록날짜
	comment_qna_number	number	references qna(qna_number) on delete cascade,-- 문의하기 댓글(qnacomm)이 참조하는 보드 글 번호
	comment_re_lev	number(1) check(comment_re_lev in (0,1,2)),				 -- 원문이면 0, 1레벨이면 1레벨 시퀀스 +1  
	comment_re_seq	number,	 												 -- 원문은 자신 글번호, 답글이면 원문 글번호
	comment_re_ref	number	 												 -- 원문은 자신 글번호, 답글이면 원문 글번호
);

 -- 게시판 글이 삭제되면 참조하는 댓글도 삭제 됩니다.

-- 시퀀스를 생성합니다.
create sequence com_seq;

-- 시퀀스를 삭제합니다.
drop sequence com_seq;

select * from qnacomm;