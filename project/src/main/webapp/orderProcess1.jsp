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
    int no=1;
    String sql="select max(orderid) from orderpro";
	pstmt=conn.prepareStatement(sql);    	
    ResultSet rs=null;
    rs=pstmt.executeQuery();
    if(rs.next()){
    	no=rs.getInt(1)+no;
    }
    String productid=request.getParameter("id");
    String shoesize=request.getParameter("shoesize");
    String buyid=request.getParameter("buyid");
    String sellid=request.getParameter("sellid");
    String soldprice=request.getParameter("buyingprice");
    String shipaddress=request.getParameter("shipaddress");
    String returnaddress=request.getParameter("returnaddress");
    
    try{
    	sql="insert into orderpro values(?,?,?,?,?,?,?,?)";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setInt(1, no);
    	pstmt.setString(2, productid);
    	pstmt.setString(3, shoesize);
    	pstmt.setString(4, buyid);
    	pstmt.setString(5, sellid);
    	pstmt.setString(6, soldprice);
    	pstmt.setString(7, shipaddress);
    	pstmt.setString(8, returnaddress);
    	pstmt.executeUpdate();
    	
    }catch(Exception e){
    	e.printStackTrace();
    }
    
    try{
    	sql="delete from buying where buyingprice=? and productid=? and shoesize=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, soldprice);
    	pstmt.setString(2, productid);
    	pstmt.setString(3, shoesize);
    	pstmt.executeUpdate();
    	/* response.sendRedirect("resultMember.jsp"); */
    }catch(Exception e){
    	e.printStackTrace();
    }
    %>
</body>
</html>