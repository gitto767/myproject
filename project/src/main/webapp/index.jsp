<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>
<body>
<%@ include file="menu.jsp" %>
  
    <div class="jumbotron">
      <div class="container">
        <h1 class="display-4">한정판 경매의 모든 것! gittokicks</h1>
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
        
        
        <p><a href="product.jsp?id=<%=rs.getString("productId")%>" class="btn btn-outline-secondary" role="button">상세정보 &raquo;</a></p>
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