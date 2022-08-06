<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<!-- Connection 객체와 JNDI를 사용하기 위한 패키지를 import합니다. -->
<!-- 일반 데이터베이스 작업을 위해 import 합니다.  -->
<%@ page import="java.sql.*" %>	 
	 
<!-- javax.sql.DataSource 객체를 사용하기 위해 import 합니다. -->	 
<%@ page import="javax.sql.*" %>	 

<!-- JNDI 작업을 하기 위해 import 합니다. -->
<%@ page import="javax.naming.*" %>	 
<%
	Connection conn = null;

 	try {
 		Context init = new InitialContext();
 		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
 		conn = ds.getConnection();
 		out.println("<h3>컨넥션 풀에 연결되었습니다.</h3>");
 		conn.close();
 	} catch (Exception e) {
 		out.println("<h3>컨넥션 풀 연결에 실패하였습니다.</h3>");
 		e.printStackTrace();
 	}
%>