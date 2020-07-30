<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="dbconn.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../resources/css/bootstrap.min.css"/>
<title>Insert title here</title>
</head>
<body>


<%
String id= request.getParameter("id"); 
String sql="select * from member where id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1,id);

ResultSet rs= pstmt.executeQuery();

if(rs.next()){
	out.print("<script>alert('이미 사용중인 아이디 입니다.')</script>");
	
}else{
	out.print("<script>alert('사용 가능한 아이디 입니다.')</script>");
	/* response.sendRedirect("addMember.jsp?id=+id"); */
}

if (pstmt != null) {
	pstmt.close();
}
if (con!= null) {
	con.close();
}

%>

<script> 
window.close();
</script>




</body>
</html>