--practice 라는 사용자를 사용할거에요
CREATE USER practice IDENTIFIED BY 1234;  
--권한 부여
GRANT RESOURCE, CONNECT TO practice; 
--시스템 계정에서 사용해야 하니까 cmd 창에서 사용하세요