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
	String sql="select max(no) from buying";
	pstmt=conn.prepareStatement(sql);    	
    ResultSet rs=null;
    rs=pstmt.executeQuery();
    if(rs.next()){
    	no=rs.getInt(1)+1;
    }
    String productid=request.getParameter("id");
    String buyingprice=request.getParameter("buyingprice");
    String buyid=request.getParameter("buyid");
    String address=request.getParameter("address");
    String shoesize=request.getParameter("shoesize");
       
    try{
    	sql="insert into buying values(?,?,?,?,?,?)";
    	pstmt=conn.prepareStatement(sql);    	
    	pstmt.setInt(1, no);
    	pstmt.setString(2, productid);
    	pstmt.setString(3, buyingprice);
    	pstmt.setString(4, buyid);
    	pstmt.setString(5, address);
    	pstmt.setString(6, shoesize);
    	pstmt.executeUpdate();
    	
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
</body>
</html>