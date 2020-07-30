<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="dbconn.jsp" %>

<% 
	String id= request.getParameter("id");
	String sql= "delete from product where p_id=?";
	con.setAutoCommit(false);
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	//삭제 처리
	
	pstmt.setString(1, id);
	
	int result = pstmt.executeUpdate();
	
	
	//삭제된 행의수가 있으면 db에 반영
	if(result>0)
		con.commit();
	if(result==0)
		con.rollback();
	con.setAutoCommit(true);
	
	response.sendRedirect("editProduct.jsp?edit=delete");
	
%>