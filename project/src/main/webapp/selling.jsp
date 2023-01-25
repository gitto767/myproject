<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Productproject" %>    
<%@ page import="dao.ProductRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<script>
    function sell(){
    	var address=document.getElementById("address");
    	var sellingprice=document.getElementById("sellingprice");
    	var shoesize=document.getElementById("shoesize");
    	
       if(address.value.length==0){
    		alert("주소를 입력해주세요");
    		address.select();
    		address.focus();
    		return false;
    	} 
    	if(sellingprice.value.length==0||isNaN(sellingprice.value)){
    		alert("[가격]\n숫자만 입력하세요.");
    		sellingprice.select();
    		sellingprice.focus();
    		return false;
    	}
    	if(shoesize.value.length==0){
    		alert("사이즈를 선택하세요.");
    		shoesize.focus();
    		return false;
    	}
    	document.sellingform.submit()
    }
</script>
</head>
<body>
<%
    String id=request.getParameter("id");
    ProductRepository dao=ProductRepository.getInstance();
    Productproject product=dao.getProductById(id);
%>
<%
    String sessionId=(String) session.getAttribute("sessionId");
%>
<%@ include file="dbconn.jsp" %>
<%
try{
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select address from memberpro where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, sessionId);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String address=rs.getString("address");
%>
     <div class="container">
    <%product.getFilename(); %>
    <div class="row">
      <div class="col-md-5">
        <img src="<%=request.getContextPath()%>/upload/<%=product.getFilename()%>" style="width:100%">
      </div>
      <div class="col-md-6">
        <h3><%=product.getName() %></h3>
       
        <p><b>상품 코드</b>:<span class="badge badge-danger"><%=product.getProductId() %></span>
        <p><b>제조사</b>:<%=product.getBrand() %>
       
        <p>
        <form name="sellingform" action="sellingProcess.jsp" method="post">
          <input type="text" name="id" value="<%=id%>" hidden>
          <input type="text" name="sellid" value="<%=sessionId%>" hidden>
          <input type="text" id="address" name="address" value="<%=address%>">
          <select name="shoesize" id="shoesize">
          <option value="" >선택</option>
          <option value="230">230</option>
          <option value="235">235</option>
          <option value="240">240</option>
          <option value="245">245</option>
          <option value="250">250</option>
          <option value="255">255</option>
          <option value="260">260</option>
          <option value="265">265</option>
          <option value="270">270</option>
          <option value="275">275</option>
          <option value="280">280</option>
          <option value="285">285</option>
          <option value="290">290</option>
          <option value="295">295</option>
          <option value="300">300</option>
          </select>
          <input type="text" id="sellingprice" name="sellingprice">
          <div class="col-sm-offset-2 col-sm-10">
            <input type="button" class="btn btn-primary" value="판매입찰하기" onclick="sell()">
            <input type="button" class="btn btn-primary" value="즉시판매하기" onclick="order()">
          </div>
        </form> 
      </div>
    </div>
    </div>
   
<%
	   }
	}catch(Exception e){
		e.printStackTrace();
	}
%>



</body>
</html>