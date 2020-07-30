<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>카테고리 편집</title>
</head>

<%String edit = request.getParameter("edit"); %>

<body>
<jsp:include page="menu.jsp"/>

<div class="jumbotron">

	<div class="container">

		<h1 class="display-3">상품 편집</h1>

	</div>

</div>

<div class="container">

 <div class="row" align="center">
 
<%@include file="dbconn.jsp" %>

<%
	String sql="select * from category";
	PreparedStatement pstmt=con.prepareStatement(sql);
	ResultSet rs= pstmt.executeQuery();
	
	while(rs.next()){
	%>
	  
	  <div class="col-md-4">

		<h3><%=rs.getString("categoryName")%></h3>
       <p><%=rs.getString("description")%></p>
	
	
 <%

    	if(edit.equals("update")){

    %>

    <a href="./addCategory.jsp?id=<%=rs.getString("categoryName")%>" 

       class="btn btn-success" role="button">추가 &raquo;></a>

    <%}else if(edit.equals("delete")){ %>

    <a href="#" onclick="deleteConfirm('<%=rs.getString("categoryName")%>')" 

       class="btn btn-danger" role="button">삭제 &raquo;></a>

<%} %>
</div>

  <%} 

     if(rs!=null) rs.close();

     if(pstmt!=null)pstmt.close();

     if(con!=null)con.close();

  %>

 </div>

<hr>

</div>

<jsp:include page="footer.jsp"/>

</body>

</html>
<script>
function deleteConfirm(categoryName){
	if(confirm("해당 카테고리를 삭제합니다")==true){
		location.href='./deleteCategory.jsp?categoryName='+categoryName;
	}else{
		return;
	}
	
}
</script>




