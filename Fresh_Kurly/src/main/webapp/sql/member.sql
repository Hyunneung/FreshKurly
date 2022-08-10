select * from member;


drop table member;

create table member (
    member_id       varchar2(20) primary key, 
    member_pass     varchar2(20),
    member_name     varchar2(20) not null,   
    member_email    varchar2(50) not null, 
    member_phone    varchar2(11),
    member_post     varchar2(5),
    member_address  varchar2(100),
    member_gender   varchar2(10),
    member_jumin    varchar2(14),
    member_reg_date date default sysdate
)



insert into member (member_id, member_pass, member_name, member_email) values ('admin','1234','admin','@');

select * from member order by member_id;

delete from member where member_pass is null;




