<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"  href="./resources/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="menu.jsp"/>

<div class="jumbotron">

   <div class="container">

   	<h1 class="display-3">카테고리 추가</h1>
   </div>
</div>

<form action="processAddCategory.jsp" method="post">
<p>카테고리 명:<input type="text" name="categoryName">
<p>카테고리 이름 :<input type="text" name="description">
<p><input type="submit" value="전송">

<p><input type="reset" value="취소" >

</form>

</body>
</html>