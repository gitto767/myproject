<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String sessionId=(String) session.getAttribute("sessionId"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <nav class="navbar navbar-expand navbar-dark bg-dark">
      <div class="container">
        <div class="navbar-header">
          <a class="navbar-brand" href="../jsp/index.jsp">Home</a>
        </div>
        <div>
          <ul class="navbar-nav mr-auto">
          <% System.out.println("error : "+sessionId);
             if(sessionId==null){%>             
            	  <li class="nav-item"><a class="nav-link" href="../member/loginMember.jsp">로그인</a></li>
                  <li class="nav-item"><a class="nav-link" href="../member/addMember.jsp">회원 가입</a></li>
          <%        
             }else{%>
                  <li style="padding-top:7px; color:white">[<%=sessionId%>님 환영합니다.]</li>
                  <li class="nav-item"><a class="nav-link" href="../member/logoutMember.jsp">로그아웃</a></li>
                  <li class="nav-item"><a class="nav-link" href="../member/updateMember.jsp">회원 수정</a></li>
          
          <%}%>
            
            <li class="nav-item"><a class="nav-link" href="../jsp/products.jsp">상품 목록</a></li>
            <li class="nav-item"><a class="nav-link" href="../jsp/addProduct.jsp">상품 등록</a></li>
            <li class="nav-item"><a class="nav-link" href="../jsp/editProdut.jsp?edit=update">상품 수정</a></li>
            <li class="nav-item"><a class="nav-link" href="../jsp/editProdut.jsp?edit=delete">상품 삭제</a></li>
            <li class="nav-item"><a class="nav-link" href="../jsp/BoardListAction.do?pageNum=1">게시판</a></li>
          </ul>
        </div>
      </div>
    </nav>
</body>
</html>