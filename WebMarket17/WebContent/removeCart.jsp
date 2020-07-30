<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%String id= request.getParameter("id");
if(id==null||id.trim().equals("")){
	response.sendRedirect("product.jsp");
	return;
}
ProductRepository dao=ProductRepository.getInstance();

Product product =dao.getProductById(id);
if(product==null){
	response.sendRedirect("exceptionNoProductId.jsp");
}

List<Product> cartList =(List<Product>)session.getAttribute("cartlist");
Product goodsQnt= new Product();
for(int i=0;i<cartList.size();i++){
	goodsQnt=cartList.get(i);
	if(goodsQnt.getProductId().equals(id)){
		cartList.remove(goodsQnt);
	}
}
response.sendRedirect("cart.jsp");
%>