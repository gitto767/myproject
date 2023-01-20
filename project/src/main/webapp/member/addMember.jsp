<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
<title>회원가입</title>
</head>
<body>
    <%@ include file="../menu.jsp" %>
  <div>
    <div>
      <h1>회원가입</h1>
    </div>
  </div>
  <div>
    <form name="newMember" action="processAddMember.jsp" method="post" onsubmit="return checkForm()">
      <div>
        <label>아이디</label>
        <div>
          <input name="id" type="text" placeholder="id">
        </div>
      </div>
      <div>
        <label>비밀번호</label>
        <div>
          <input name="password" type="text" class="form-control" placeholder="password">
        </div>
      </div> 
      <div>
        <label>비밀번호확인</label>
        <div>
          <input name="password_confirm" type="text"placeholder="password confirm">
        </div>
      </div> 
      <div>
        <label>성명</label>
        <div>
          <input name="name" type="text"placeholder="name">
        </div>
      </div> 
      <div>
        <label>성별</label>
        <div>
          <input name="gender" type="radio" value="남"/> 남
          <input name="gender" type="radio" value="여"/> 여
        </div>
      </div>  
      <div>
        <label>생일</label>
        <div>
          <input name="birthyy" type="text" maxlength="4" placeholder="년(xxxx)" size="6">
          <select name="birthmm">
            <option value="">월</option>
            <option value="01">1</option>
            <option value="02">2</option>
            <option value="03">3</option>
            <option value="04">4</option>
            <option value="05">5</option>
            <option value="06">6</option>
            <option value="07">7</option>
            <option value="08">8</option>
            <option value="09">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12">12</option>            
          </select><input name="birthdd" type="text" maxlength="2" placeholder="일" size="4">
        </div>
      </div> 
      <div>
        <label>이메일</label>
        <div>
          <input name="mail1" type="text" maxlength="50">@
          <select name="mail2">
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
            <option value="nate.com">nate.com</option>  
          </select>
        </div>
      </div>
      <div>
        <label>전화번호</label>
        <div>
          <input name="phone" type="text"placeholder="phone">
        </div>
      </div> 
      <div>
        <label>주소</label>
        <div>
          <input name="address" type="text"placeholder="address">
        </div>
      </div>
      <div>
        <div>
          <input type="submit"value="등록">
          <input type="reset" value="취소" onclick="reset()">
        </div>
      </div>              
    </form>
  </div>
</body>
</html>