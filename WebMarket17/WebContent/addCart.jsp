<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%@page import="dto.Product"%>
<%@page import="dao.ProductRepository"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//파라미터로 넘어온 id값으로
	String id=request.getParameter("id");
	//id존재 확인
	if(id==null||id.trim().equals("")){
		response.sendRedirect("products.jsp");
		return;
	}
	//id값이 존재하면 상품 처리 객체 생성
	ProductRepository dao= ProductRepository.getInstance();
	//상품 담을 객체 생성
	Product product=dao.getProductById(id);
	
	if(product==null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	List<Product> goodsList=dao.getAllProducts();
	Product goods = new Product();
	
	for(int i=0;i<goodsList.size();i++){
		goods=goodsList.get(i);
		if(goods.getProductId().equals(id)){
			break;
		}
	}
	//세션에 cartlist가 있는지 확인
	//없으면 cartlist 생성하여 session에 저장
	List<Product> list=(List<Product>)session.getAttribute("cartlist");
	if(list==null){
		list= new ArrayList<Product>();
		session.setAttribute("cartlist",list);
	}
	
	int cnt=0;
	//장바구니에 해당 상품이 있으면 수량 추가
	Product goodsQnt= new Product();
	for(int i=0;i<list.size();i++){
		goodsQnt=list.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt++;
			int orderQuantity=goodsQnt.getQuantity()+1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	//장바구니에 해당상품이 없으면
	if(cnt==0){
		goods.setQuantity(1); //수량 1개로 설정
		list.add(goods);
	}
	System.out.println("상품수량: "+cnt);
	out.print("<script>");
/* 	outp.print("location,hrdf") */
	//상세페이지로 이동시 원래 상품 정보 출력
	response.sendRedirect("product.jsp?id="+id);
	
	
%>