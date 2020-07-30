<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbconn.jsp"%>

<%

String categoryName= request.getParameter("categoryName");
String description=request.getParameter("description");

String sql="insert into category(categoryName,description) values (?,?)";
PreparedStatement pstmt= con.prepareStatement(sql);


pstmt.setString(1, categoryName);
pstmt.setString(2, description);

int result=pstmt.executeUpdate();

if(result>0){
	out.print("<script>alert('"+categoryName+"추가완료!')</script>");
}else{
	out.print("<script>alert('카테고리 추가 실패')</script>");

}if (pstmt != null) {
	pstmt.close();
}
if (con!= null) {
	con.close();
}


response.sendRedirect("products.jsp");

%> 
