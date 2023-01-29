<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
    <%@ include file="menu.jsp" %>
  <div class="jumbotron container">
    <div class="container">
      <h1 class="display-6">추천상품</h1>
    </div>
  </div>
  <div class="container">
    <div class="row" align="center">
      <%@ include file="dbconn.jsp" %>
      
      <%
        PreparedStatement pstmt=null;
        ResultSet rs=null;
        
        String sql="select * from productpro";
        pstmt=conn.prepareStatement(sql);
        rs=pstmt.executeQuery();
        while(rs.next()){
        %>
      <div class="col-md-4">
        <img src="<%=request.getContextPath()%>/upload/<%=rs.getString("fileName")%>" style="width:100%">
        
        <h3><%=rs.getString("name") %></h3>
        <p><%=rs.getString("brand")%></p>
        <p><%=rs.getString("productId")%></p>
        <p><%=rs.getString("filename") %></p>
        <p><a href="product.jsp?id=<%=rs.getString("productId")%>" class="btn btn-secondary" role="button">상세정보 &raquo;</a></p>
      </div>  
        <%	
        }
        if(rs!=null)
        	rs.close();
        if(pstmt!=null)
        	pstmt.close();
        if(conn!=null)
        	conn.close();
      %>
    </div>
  </div>
</body>
</html>