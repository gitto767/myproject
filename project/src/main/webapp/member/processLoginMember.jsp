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
  PreparedStatement pstmt=null;
  ResultSet rs=null;
  String id=request.getParameter("id");
  String password=request.getParameter("password");
  
  String PASS="";
  try{
	  String sql="select password from memberpro where id=?";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setString(1, id);
	  rs=pstmt.executeQuery();
	  if(rs.next()){
		  PASS=rs.getString(1);
		  if(password.equals(PASS)){
			  session.setAttribute("sessionId", id);
			  response.sendRedirect("resultMember.jsp?msg=2");
		  }else{
			  response.sendRedirect("loginMember.jsp?error=1");			  
		  }
	  }else{
		  response.sendRedirect("loginMember.jsp?error=1");
	  }
  }catch(Exception e){
	  e.printStackTrace();
}
  
  
%>
</body>
</html>
