<%@page import="java.util.Date"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% response.setIntHeader("Refresh",1);
Date day= new java.util.Date();
String am_pm;
int hour=day.getHours();
int minute=day.getMinutes();
int second=day.getSeconds();

if(hour/12==0)
{am_pm="AM";}
else{
	am_pm="PM";
	hour=hour-12;
}
DecimalFormat df=new DecimalFormat("00");
String CT= df.format(hour)+":"+df.format(minute)+":"+df.format(second)+" "+am_pm;
out.print("현재 접속시간 "+CT+",<br>");
%>
<div></div>
<hr>
<%@include file="footer.jsp" %>
</body>
</html>