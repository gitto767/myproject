<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<%@ include file="dbconn.jsp" %>
<%
    PreparedStatement pstmt=null;
    int no=0;
	String sql="select max(no) from selling";
	pstmt=conn.prepareStatement(sql);    	
    ResultSet rs=null;
    rs=pstmt.executeQuery();
    if(rs.next()){
    	no=rs.getInt(1)+1;
    }
    String productid=request.getParameter("id");
    String sellingprice=request.getParameter("sellingprice");
    String sellid=request.getParameter("sellid");
    String returnaddress=request.getParameter("returnaddress");
    String shoesize=request.getParameter("shoesize");
       
    try{
    	sql="insert into selling values(?,?,?,?,?,?)";
    	pstmt=conn.prepareStatement(sql);    	
    	pstmt.setInt(1, no);
    	pstmt.setString(2, productid);
    	pstmt.setString(3, sellingprice);
    	pstmt.setString(4, sellid);
    	pstmt.setString(5, returnaddress);
    	pstmt.setString(6, shoesize);
    	pstmt.executeUpdate();
    	
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
</body>
</html>