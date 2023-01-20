<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Insert title here</title>

<script>
function CheckAddProduct(){
	var productId=document.getElementById("productid");
	var name=document.getElementById("name");
	var brand=document.getElementById("brand");

	
	//상품아이디 체크
	
	//상품명 체크
	if(name.value.length<4||name.value.length>50){
		alert("[상품명]\n최소 4자에서 최대 50자 까지 입력하세요.");
		name.select();
		name.focus();
		return false;
	}
	//상품가격체크
	
	//재고수체크

	function check(regExp, e, msg){
		if(regExp.test(e.value)){
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}
	document.newProduct.submit()
}
</script>
</head>
<body>
<%--     <%@ include file="menu.jsp" %> --%>
    <div class="jumbotron">
      <div class="container">
        <h1 class="display-6">상품등록</h1>
      </div>
    </div>
    <div class="container">
      <form name="newProduct" action="addproductProcess.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
        <div class="form-group row">
          <label class="col-sm-2">품번</label>
          <div class="col-sm-3">
            <input type="text" id="productid" name="productid" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">제품명</label>
          <div class="col-sm-3">
            <input type="text" id="name" name="name" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <label class="col-sm-2">브랜드</label>
          <div class="col-sm-3">
            <input type="text" id="brand" name="brand" class="form-control">
          </div>
        </div>
                
        <div class="form-group row">
          <label class="col-sm-2">이미지</label>
          <div class="col-sm-5">
            <input type="file" name="productimage" class="form-control">
          </div>
        </div>
        
        <div class="form-group row">
          <div class="col-sm-offset-2 col-sm-10">
            <input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
          </div>
        </div>
      </form>
    </div>


</body>
</html>