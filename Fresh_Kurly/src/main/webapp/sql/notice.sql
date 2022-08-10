
drop table notice;

create table notice(
	notice_num   	number(20) primary key,
	notice_name		varchar2(20),
	notice_subject  varchar2(20),
	notice_pass		number(20),
	notice_view     number(10),	
	notice_content  varchar2(200),
	notice_date date default sysdate
)

private int		notice_num;	     //글번호
	private String	notice_name;     //글 작성자
	private String	notice_pass;     //글 비밀번호
	private String	notice_subject;  //글 제목
	private String	notice_content;  //글 내용
	private int		notice_veiw;//글의 조회수
	private String  notice_date;	
	

insert into NOTICE (notice_num, notice_name, notice_pass, notice_subject, NOTICE_CONTENT, notice_view) 
			values	(5, 'admin', 1234, '공지사항', '테스트 입니다.'  ,0);

select * from notice;


create table comm(
 num			  number		primary key,
 id				  varchar2(30)  references member(member_id),
 content		  varchar2(200),
 reg_date		  date,
 comment_notice_num	number	references notice(notice_num) on delete cascade,
 										--comm 테이블이 참조하는 보드 글 번호
 comment_re_lev		number(1) check(comment_re_lev in (0,1,2)),--원문이면0 답급이면 1
 comment_re_seq		number, -- 원문이면 0, 1레벨이면 1레벨 시퀀스 + 1
 comment_re_ref		number	-- 원문은 자신 글 번호, 답글이면 원문 글번호
 );