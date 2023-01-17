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
  
  String id=request.getParameter("id");
  String password=request.getParameter("password");
  String name=request.getParameter("name");
  String gender=request.getParameter("gender");
  String year=request.getParameter("birthyy");
  String month=request.getParameterValues("birthmm")[0];
  String day=request.getParameter("birthdd");
  String birth=year+"/"+month+"/"+day;
  String mail1=request.getParameter("mail1");
  String mail2=request.getParameterValues("mail2")[0];
  String mail=mail1+"@"+mail2;
  String phone=request.getParameter("phone");
  String address=request.getParameter("address");
  
  try{
	  String sql="insert into memberpro values(?,?,?,?,?,?,?,?,sysdate)";
	  pstmt=conn.prepareStatement(sql);
	  pstmt.setString(1, id);
	  pstmt.setString(2, password);
	  pstmt.setString(3, name);
	  pstmt.setString(4, gender);
	  pstmt.setString(5, birth);
	  pstmt.setString(6, mail);
	  pstmt.setString(7, phone);
	  pstmt.setString(8, address);
	  pstmt.executeUpdate();
	  response.sendRedirect("resultMember.jsp?msg=1");
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
</body>
</html>