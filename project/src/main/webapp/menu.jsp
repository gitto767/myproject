<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sessionId=(String) session.getAttribute("sessionId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script> -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link href="css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
 <style>
  @import url('https://fonts.googleapis.com/css2?family=Unbounded&display=swap');
  #logo{
  font-family: 'Unbounded', cursive;
  }
</style>
</head>
<body>


<div class="container">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <a href="index.jsp" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <h1 id="logo">gittokicks</h1>
      </a>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0 text-dark ">
        <li><a href="index.jsp" class="nav-link px-2 link-secondary text-dark">Home</a></li>
        <li><a href="products.jsp" class="nav-link px-2 link-dark  text-dark">추천상품</a></li>        
      </ul>

      <div class="col-md-3 text-end">
      <% System.out.println("error : "+sessionId);
             if(sessionId==null){%> 
                 <button type="button" class="btn btn-outline-secondary" onclick = "location.href = 'loginMember.jsp'">Login</button>
                 <button type="button" class="btn btn-secondary" onclick = "location.href = 'addMember.jsp'" >Sign-up</button>
          <%
             }else if(sessionId.equals("admin")){%>
                  <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle text-dark" data-bs-toggle="dropdown" aria-expanded="false" id="dropdownBtn">
                    <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
                    <span class="text-dark"><%=sessionId%></span>
                    </a>
                      <ul class="dropdown-menu text-small">
                        
                        <li><a class="dropdown-item" href="addproduct.jsp">상품 등록</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logoutMember.jsp">Sign out</a></li>
                     </ul>
                   </div>          
              
          <%        
             }else{%>
                  <div class="dropdown text-end">
                    <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle text-dark" data-bs-toggle="dropdown" aria-expanded="false" id="dropdownBtn">
                    <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
                    <span class="text-dark"><%=sessionId%></span>
                    </a>
                      <ul class="dropdown-menu text-small">
                        <li><a class="dropdown-item" href="myorder.jsp">주 문</a></li>
                        <li><a class="dropdown-item" href="updateMember.jsp">회원정보수정</a></li>
                        <li><a class="dropdown-item" href="#"></a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logoutMember.jsp">Sign out</a></li>
                     </ul>
                   </div>          
          <%}%>
           
        
      
      </div>
          
    </header>
    </div>
    
 
    
</body>
</html>