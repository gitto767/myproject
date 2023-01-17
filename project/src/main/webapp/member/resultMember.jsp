<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css"/>
<title>회원 정보</title>
</head>
<body>
 <%@ include file="../jsp/menu.jsp" %>
  <div>
    <div>
      <h1>회원 정보</h1>
    </div>
  </div>
  <div align="center">
    <%
      String msg=request.getParameter("msg");
    
      if(msg!= null){
    	  if(msg.equals("0"))
    		  out.println("<h2 class='alert alert-danger'>회원 정보가 수정 되었습니다.</h2>");
    	  else if(msg.equals("1"))
    		  out.println("<h2 class='alert alert-danger'>회원가입을 축하드립니다.</h2>");
    	  else if(msg.equals("2")){
    		  String loginId=(String) session.getAttribute("sessionId");
    		  out.println("<h2 class='alert alert-danger'>"+loginId+"님 환영합니다</h2");
    	  }
      }else{
    	  out.println("<h2 class='alert alert-danger'>회원 정보가 삭제되었습니다.</h2>");
      }
    
    %>
  </div>

</body>
</html>