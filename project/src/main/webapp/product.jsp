<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Productproject" %>    
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
 <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">상품 정보</h1>
    </div>
  </div>
<%
String id=request.getParameter("id");
    ProductRepository dao=ProductRepository.getInstance();
    Productproject product=dao.getProductById(id);
%>
  <div class="container">
    <%product.getFilename(); %>
    <div class="row">
      <div class="col-md-5">
        <img src="<%=request.getContextPath()%>/upload/<%=product.getFilename()%>" style="width:100%">
      </div>
      <div class="col-md-6">
        <h3><%=product.getName() %></h3>
       
        <p><b>상품 코드</b>:<span class="badge badge-danger"><%=product.getProductId() %></span>
        <p><b>제조사</b>:<%=product.getBrand() %>
       
        <p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId() %>" method="post">
          <a href="#" class="btn btn-info" onclick="addToCart()">상품 주문 &raquo;</a>
          <a href="./cart.jsp" class="btn btn-success">즉시구매 &raquo;</a>
          <a href="./products.jsp" class="btn btn-danger">즉시판매</a>
        </form>       
      </div>
    </div>
    <hr>
  </div>
</body>
</html>