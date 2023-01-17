<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../dbconn.jsp" %>
<%
    String sessionId=(String) session.getAttribute("sessionId");
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    try{
    	String sql="delete from memberpro where id=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, sessionId);
    	pstmt.executeUpdate();
    	response.sendRedirect("resultMember.jsp");
    }catch(Exception e){
    	e.printStackTrace();
    }

%>
</body>
</html>