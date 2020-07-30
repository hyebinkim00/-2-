<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	session.invalidate(); //브라우저가 켜져 있어도 접속정보 삭제하는 메소드
	response.sendRedirect("addProduct.jsp");
%>