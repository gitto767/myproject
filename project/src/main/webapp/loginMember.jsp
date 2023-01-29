<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css"/>
<title>Insert title here</title>
</head>
<body>
   <%@ include file="menu.jsp" %>
  
  <div class="container" align="center">
    <div class="col-md-4 col-md-offset-4">
      
      <%
        String error =request.getParameter("error");
        if(error!=null){
        	out.println("<div class='alert alert-danger'>");
        	out.println("아이디와 비밀번호를 확인해주세요.");
        	out.println("</div>");
        }
      %>
      
      
    <main class="form-signin w-100 m-auto">
      <form action="processLoginMember.jsp" method="post">
        <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
        <div class="form-floating">
          <input type="test" class="form-control" id="floatingInput" placeholder="ID" name="id" required autofocus>
          <label for="floatingInput">ID</label>
        </div>
        <div class="form-floating">
          <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password" required>
          <label for="floatingPassword">Password</label>
        </div>
        <div class="checkbox mb-3">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="w-100 btn btn-lg btn-secondary" type="submit">Sign in</button>
      </form>
    </main>
      
      
    </div>
  
  </div>

</body>
</html>