drop table qna cascade constraints purge;

--문의하기 테이블
create table qna(
	qna_number 	number(10) primary key,	
	qna_name 	varchar2(20), 
	qna_subject varchar2(100), 
	qna_pass 	varchar2(20), 
	qna_content varchar2(200), 
	qna_view     number(10),
	qna_reg_date date default sysdate
);



select qna_content from qna;
insert into qna (qna_num, qna_name, qna_subject, qna_pass, qna_content)values (3,'하이','하이','1234','하이');

select * from qna;

select *
from (select rownum rnum, j.*
	   from (
	   		 select qna_number, qna_subject, nvl(cnt,0) as cnt
	   		  from qna left outer join (select comment_qna_number, count(*) cnt
	   		  							  from comm
	   		  							  group by comment_qna_number)
	   		  on qna_number=comment_qna_number
	   		  ) j
	  where rownum <= 10
	  )
where rnum >= 1 and rnum <= 10;

select * 
from  (select rownum rnum, j.* 
from (select qna_num,  nvl(cnt,0) cnt 
from qna left outer join (select comment_qna_num,count(*) cnt
 from qnacomm
                                              group by comment_qna_number)
                on qna_num=comment_qna_number
	                  ) j 
	              where rownum<= 10      
	                 ) 
	       where rnum>=1 and rnum<=10;
	       
	       
	       
	       
	       update qna 
				    set QNA_SUBJECT='aa', QNA_CONTENT='addd', QNA_PRIVATE=1
				    where QNA_NUM=6 ;