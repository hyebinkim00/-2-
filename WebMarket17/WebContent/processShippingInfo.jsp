<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");
Cookie cartId= new Cookie("Shipping_cartId",
		URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
Cookie name= new Cookie("Shipping_name",
		URLEncoder.encode(request.getParameter("name"),"utf-8"));
Cookie shippingDate= new Cookie("Shipping_shippingDate",
		URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
Cookie country= new Cookie("Shipping_country",
		URLEncoder.encode(request.getParameter("country"),"utf-8"));
Cookie zipCode= new Cookie("Shipping_zipCode",
		URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
Cookie addressName= new Cookie("Shipping_addressName",
		URLEncoder.encode(request.getParameter("addressName"),"utf-8"));

/* 유효기간 설정 (하루) */
cartId.setMaxAge(24*60*60);
name.setMaxAge(24*60*60);
zipCode.setMaxAge(24*60*60);
country.setMaxAge(24*60*60);
addressName.setMaxAge(24*60*60);

response.addCookie(cartId);
response.addCookie(name);
response.addCookie(shippingDate);
response.addCookie(country);
response.addCookie(zipCode);
response.addCookie(addressName);

response.sendRedirect("orderConfirmation.jsp");

%>


<%-- <%= request.getParameter("cartId")%><br>
<%= request.getParameter("name")%><br>
<%= request.getParameter("shippingDate")%><br>
<%= request.getParameter("country")%><br>
<%= request.getParameter("zipCode")%><br>
<%= request.getParameter("addressName")%><br> --%>

</body>
</html>