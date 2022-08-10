drop table qna;

--문의하기 테이블 (220810 수정)
create table qna( 
   qna_number    number(10) primary key, -- 글번호  
   qna_name      varchar2(20), -- 회원 아이디
   qna_pass      varchar2(20), -- 글 비밀번호
   qna_subject   varchar2(20) not null, -- 글 제목
   qna_content   varchar2(200) not null, -- 글 내용
   qna_view      number(10),    -- 조회수
   qna_reg_date  date default sysdate
);

<<<<<<< HEAD
select * from qna;

=======
select * from qna;
>>>>>>> branch 'main' of https://github.com/ahslxj1993/Fresh_Kurly.git
