<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<!-- Connection ��ü�� JNDI�� ����ϱ� ���� ��Ű���� import�մϴ�. -->
<!-- �Ϲ� �����ͺ��̽� �۾��� ���� import �մϴ�.  -->
<%@ page import="java.sql.*" %>	 
	 
<!-- javax.sql.DataSource ��ü�� ����ϱ� ���� import �մϴ�. -->	 
<%@ page import="javax.sql.*" %>	 

<!-- JNDI �۾��� �ϱ� ���� import �մϴ�. -->
<%@ page import="javax.naming.*" %>	 
<%
	Connection conn = null;

 	try {
 		Context init = new InitialContext();
 		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
 		conn = ds.getConnection();
 		out.println("<h3>���ؼ� Ǯ�� ����Ǿ����ϴ�.</h3>");
 		conn.close();
 	} catch (Exception e) {
 		out.println("<h3>���ؼ� Ǯ ���ῡ �����Ͽ����ϴ�.</h3>");
 		e.printStackTrace();
 	}
%>