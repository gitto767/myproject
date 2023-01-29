<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
    String sessionId=(String) session.getAttribute("sessionId");
%>
<%@ include file="dbconn.jsp" %>
<%
try{
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from memberpro where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, sessionId);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String password=rs.getString("password");
		String name=rs.getString("name");
		String gender=rs.getString("gender");
		String birth=rs.getString("birth");
		String mail=rs.getString("mail");
		String phone=rs.getString("phone");
		String address=rs.getString("address");
		System.out.println("gender : "+gender);
		String mail1=mail.split("@")[0];
		String mail2=mail.split("@")[0];
		System.out.println("mail2 : "+mail2);
		String year=birth.split("/")[0];
		String month=birth.split("/")[1];
		String day=birth.split("/")[2];
		%>

<meta charset="UTF-8">
<title>회원 수정</title>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</head>
<body onload="init()">
    <jsp:include page="menu.jsp"/>
    <div class="jumbotron container">
      <div class="container">
        <h1 class="display-5">회원 수정</h1>
      </div>
    </div>
    
    <div class="container">
      <form name="newMember" class="form-horizontal"
          action="processUpdateMember.jsp" method="post"
          onsubmit="return checkForm()">
      <div class="form-group row">
        <label class="col-sm-2">아이디</label>
        <div class="col-sm-3">
          <input name="id" type="text" class="form-control" placeholder="id" value="<%=sessionId %>">
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">비밀번호</label>
        <div class="col-sm-3">
          <input name="password" type="text" class="form-control" placeholder="password" value="<%=password %>">
        </div>
      </div> 
      <div class="form-group row">
        <label class="col-sm-2">비밀번호확인</label>
        <div class="col-sm-3">
          <input name="password_confirm" type="text" class="form-control" placeholder="password confirm">
        </div>
      </div> 
      <div class="form-group row">
        <label class="col-sm-2">성명</label>
        <div class="col-sm-3">
          <input name="name" type="text" class="form-control" placeholder="name" value="<%=name %>">
        </div>
      </div> 
      <div class="form-group row">
        <label class="col-sm-2">성별</label>
        <div class="col-sm-10">
          <input name="gender" type="radio" value="남" <%=gender.equals("남")?"checked":"" %>/> 남
          <input name="gender" type="radio" value="여" <%=gender.equals("여")?"checked":"" %>/> 여
        </div>
      </div>  
      <div class="form-group row">
        <label class="col-sm-2">생일</label>
        <div class="col-sm-4">
          <input name="birthyy" type="text" maxlength="4" placeholder="년(xxxx)" size="6" value="<%=year %>">
          <select name="birthmm" value="<%=month %>">
            <option value="">월</option>
            <option value="01" <%if(month.equals("01")){%>selected<%} %>>1</option>
            <option value="02" <%if(month.equals("02")){%>selected<%} %>>2</option>
            <option value="03" <%if(month.equals("03")){%>selected<%} %>>3</option>
            <option value="04" <%if(month.equals("04")){%>selected<%} %>>4</option>
            <option value="05" <%if(month.equals("05")){%>selected<%} %>>5</option>
            <option value="06" <%if(month.equals("06")){%>selected<%} %>>6</option>
            <option value="07" <%if(month.equals("07")){%>selected<%} %>>7</option>
            <option value="08" <%if(month.equals("08")){%>selected<%} %>>8</option>
            <option value="09" <%if(month.equals("09")){%>selected<%} %>>9</option>
            <option value="10" <%if(month.equals("10")){%>selected<%} %>>10</option>
            <option value="11" <%if(month.equals("11")){%>selected<%} %>>11</option>
            <option value="12" <%if(month.equals("12")){%>selected<%} %>>12</option>            
          </select><input name="birthdd" type="text" maxlength="2" placeholder="일" size="4" value="<%=day %>">
        </div>
      </div> 
      <div class="form-group row">
        <label class="col-sm-2">이메일</label>
        <div class="col-sm-10">
          <input name="mail1" type="text" maxlength="50" value="<%=mail1 %>">@
          <select name="mail2">
            <option value="naver.com" <%if(mail2.equals("naver.com")){%>selected<%} %>>naver.com</option>
            <option value="daum.net" <%if(mail2.equals("daum.net")){%>selected<%} %>>daum.net</option>
            <option value="gmail.com" <%if(mail2.equals("gmail.com")){%>selected<%} %>>gmail.com</option>
            <option value="nate.com" <%if(mail2.equals("nate.com")){%>selected<%} %>>nate.com</option>  
          </select>
        </div>
      </div>
      <div class="form-group row">
        <label class="col-sm-2">전화번호</label>
        <div class="col-sm-3">
          <input name="phone" type="text" class="form-control" placeholder="phone" value="<%=phone %>">
        </div>
      </div> 
      <div class="form-group row">
        <label class="col-sm-2">주소</label>
        <div class="col-sm-5">
          <input name="address" type="text" class="form-control" placeholder="address" value="<%=address %>">
        </div>
      </div>
      <div class="form-group row">
        <div class="col-sm-offset-2 col-sm-10">
          <input type="submit" class="btn btn-secondary value="회원수정">
          <a href="deleteMember.jsp" class="btn btn-danger">회원탈퇴</a>
        </div>
      </div>  
<%		
	}
}catch(Exception e){
	e.printStackTrace();
}
%>      
      </form>
    </div>

</body>
<script type="text/javascript">
  function checkForm(){
	  if(!document.newMember.id.value){
		  alert("아이디를 입력하세요");
		  return false;
	  }
	  if(!document.newMember.password.value){
		  alert("비밀번호를 입력하세요");
		  return false;
	  }	  
	  if(document.newMember.password.value !=document.newMember.password_confirm.value){
		  alert("비밀번호를 확인하세요");
		  return false;
	  }
	  
  }
</script>
</html>