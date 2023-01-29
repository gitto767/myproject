<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sessionId=(String) session.getAttribute("sessionId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link href="css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
<jsp:include page="menu.jsp"/>
<%@ include file="dbconn.jsp" %>
<div class="container">
    <h4>구매 주문서</h4>
    <table class="table table-danger">
      <tr>
        <th scope="col">#</th><th scope="col">제품</th><th scope="col">사이즈</th><th scope="col">구매가격</th>
      </tr>
      <tr>
<%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    try{
    	String sql="select orderid,productid,shoesize,soldprice from orderpro where buyid=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, sessionId);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String orderid=rs.getString("orderid");
    		String productid=rs.getString("productid");
    		String shoesize=rs.getString("shoesize");
    		String soldprice=rs.getString("soldprice");
    		%>
        <td><%=orderid %></td>
        <td><%=productid %></td>
        <td><%=shoesize %></td>
        <td><b><%=soldprice %></b></td>
    		<%
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
    </tr>
  </table>
</div>
<div class="container">
    <h4>판매 주문서</h4>
    <table class="table table-success " >
      <tr>
        <th>#</th><th>제품</th><th>사이즈</th><th>판매가격</th><th>배송주소</th>
      </tr>
      <tr>
    <%
    try{
    	String sql="select orderid,productid,shoesize,soldprice,shipaddress from orderpro where sellid=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, sessionId);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String orderid2=rs.getString("orderid");
    		String productid2=rs.getString("productid");
    		String shoesize2=rs.getString("shoesize");
    		String soldprice2=rs.getString("soldprice");
    		String shipaddress=rs.getString("shipaddress");
    		%>
    	<td><%=orderid2 %></td>
        <td><%=productid2 %></td>
        <td><%=shoesize2 %></td>
        <td><b><%=soldprice2 %></b></td>
        <td><%=shipaddress %></td>
   <%
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
    %>        
      </tr>
    </table>

</div>
<div class="container">
    <h5>구매 입찰</h5>
    <table class="table table-danger">
      <tr>
        <th scope="col">제품</th><th scope="col">사이즈</th><th scope="col">구매입찰가</th>
      </tr>
      <tr>
    <%
    try{
    	String sql="select * from buying where buyid=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, sessionId);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String productid3=rs.getString("productid");
    		String shoesize3=rs.getString("shoesize");
    		String buyingprice=rs.getString("buyingprice");    		
    		%>
    	
        <td><%=productid3 %></td>
        <td><%=shoesize3 %></td>
        <td><b><%=buyingprice %></b></td>
        
   <%
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
    %>        
      </tr>
    </table>

</div>

<div class="container">
    <h5>판매 입찰</h5>
    <table class="table table-success">
      <tr>
        <th>제품</th><th>사이즈</th><th>판매입찰가</th>
      </tr>
      <tr>
    <%
    try{
    	String sql="select productid,shoesize,sellingprice from selling where sellid=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, sessionId);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		
    		String productid4=rs.getString("productid");
    		String shoesize4=rs.getString("shoesize");
    		String sellingprice=rs.getString("sellingprice");
    		
    		%>
    	
        <td><%=productid4 %></td>
        <td><%=shoesize4 %></td>
        <td><b><%=sellingprice %></b></td>
       
   <%
    	}
    }catch(Exception e){
    	e.printStackTrace();
    }
    %>        
      </tr>
    </table>

</div>

</body>
</html>