<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.net.URLDecoder"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
   
<%@include file="dbconn.jsp"%>

<!DOCTYPE html><html><head>

<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>

<meta charset="UTF-8">

<title>주문완료</title>

</head>

<body>

<%

	String shipping_cartId ="";

    String shipping_name="";

    String shipping_shippingDate="";

    String shipping_country="";

    String shipping_zipCode="";

    String shipping_addressName="";

    

    Cookie[] cookies = request.getCookies();

    

    if(cookies!=null){

    	for(int i=0;i<cookies.length;i++){

    		Cookie thisCookie=cookies[i];

    		String n=thisCookie.getName();

    		if(n.equals("Shipping_cartId"))

    		shipping_cartId

    		  =URLDecoder.decode((thisCookie.getValue()),"utf-8");
    		
    		else if(n.equals("Shipping_name")){
				shipping_name 
				= URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}

    		else if(n.equals("Shipping_shippingDate"))

    		 shipping_shippingDate

    		  =URLDecoder.decode((thisCookie.getValue()),"utf-8");
    		
    		else if(n.equals("Shipping_country")){
				shipping_country = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}
    		else if(n.equals("Shipping_zipCode")){
				shipping_zipCode = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}
    		else if(n.equals("Shipping_addressName")){
				shipping_addressName = URLDecoder.decode(thisCookie.getValue(),"utf-8");
			}
    		
    		

    	}

    }



   //오늘의 과제

   //sale테이블, delivery테이블에 저장,날짜 2020/07/22
   		con.setAutoCommit(false);

		List<Product> cartList = (List<Product>) session.getAttribute("cartlist");
		
		Product product = new Product();
		
		String id = "";
		int price= 0;
		int qty = 0;
		String sql="";
		
		PreparedStatement pstmt= null;
		
		for(int i=0;i<cartList.size();i++){
			product = cartList.get(i);
			
			id = product.getProductId();
			price = product.getUnitPrices();
			qty = product.getQuantity();
			product.setUnitsInStock(qty);
	
Date shipping_date= new Date();
SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy/MM/dd");
String date=simpleDateFormat.format(shipping_date);

sql = "insert into sale(saledate, sessionId, productId, unitprice, saleqty, status ) values (?,?,?,?,?,1)";

pstmt = con.prepareStatement(sql);

pstmt.setString(1, date);
pstmt.setString(2, shipping_cartId);
pstmt.setString(3, id);
pstmt.setInt(4, price);
pstmt.setInt(5, qty); 

pstmt.executeUpdate();
		}
sql="insert into delivery(sessionid,name,deliverydate,nation,zipcode,address) values(?,?,?,?,?,?)";

pstmt = con.prepareStatement(sql);

pstmt.setString(1, shipping_cartId);
pstmt.setString(2, shipping_name);
pstmt.setString(3, shipping_shippingDate);
pstmt.setString(4, shipping_country);
pstmt.setString(5, shipping_zipCode);
pstmt.setString(6, shipping_addressName);


int result = pstmt.executeUpdate();

if(result>0){
	out.print("<script>alert('추가완료!')</script>");
	
}else{
	out.print("<script>alert('주문 추가 실패')</script>");
}
	if(result>0)con.commit();
	if(result==0)con.rollback();
	con.setAutoCommit(true);


		


%>

<jsp:include page="menu.jsp"/>

<div class="jumbotron">

	<div class="container">

		<h1 class="display-3">주문 완료</h1>

	</div>

</div>

<div class="container">

   <h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>

   <p> 주문은 <%=shipping_shippingDate %>에 배송될 예정입니다.

   <p> 주문번호:<%=shipping_cartId %>
   
 

</div>

<div class="container">

	<p><a href="./products.jsp" 

	     class="btn btn-secondary">&laquo;상품목록</a>
	     
	<p><a href="./salesinfo.jsp?id=<%=shipping_cartId%>"

	     class="btn btn-secondary">&laquo;배송조회</a>

</div>

<%
	//세션 정보 삭제
	/* session.invalidate(); */
	/* session.removeAttribute("cartlist"); */
	session.setAttribute("cartlist", null);
	//쿠키에 저장된 장바구니 정보 삭제(0--즉시 삭제)
	for(int i=0;i<cookies.length;i++){
			Cookie thisC = cookies[i];
			String n = thisC.getName();
			if(n.equals("Shipping_cartId")) thisC.setMaxAge(0);
			if(n.equals("Shipping_name")) thisC.setMaxAge(0);
			if(n.equals("Shipping_date")) thisC.setMaxAge(0);
			if(n.equals("Shipping_country")) thisC.setMaxAge(0);
			if(n.equals("Shipping_zipCode")) thisC.setMaxAge(0);
			if(n.equals("Shipping_address")) thisC.setMaxAge(0);
			
			//응답 객체에 추가
			response.addCookie(thisC);
	}
	
 %>

<jsp:include page="footer.jsp"/>



</body>

</html>






