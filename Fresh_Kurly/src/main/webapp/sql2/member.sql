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




select * from member order by member_id;




