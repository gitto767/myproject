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
    function buy(){
    	var address=document.getElementById("address");
    	var buyingprice=document.getElementById("buyingprice");
    	var shoesize=document.getElementById("shoesize");
    	
       if(address.value.length==0){
    		alert("주소를 입력해주세요");
    		address.select();
    		address.focus();
    		return false;
    	} 
    	if(buyingprice.value.length==0||isNaN(buyingprice.value)){
    		alert("[가격]\n숫자만 입력하세요.");
    		buyingprice.select();
    		buyingprice.focus();
    		return false;
    	}
    	if(shoesize.value.length==0){
    		alert("사이즈를 선택하세요.");
    		shoesize.focus();
    		return false;
    	}
    	return true;
    }
    function order(frm){
    	alert("즉시구매하시겠습니까?");
    	frm.action="orderprocess.jsp";
    	frm.submit();
    	return true;
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
        <form name="buyingform" action="buyingProcess.jsp" method="post" onsubmit="buy()">
          <input type="text" name="id" value="<%=id%>" hidden>
          <input type="text" name="buyid" value="<%=sessionId%>" hidden>
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
          <input type="text" id="buyingprice" name="buyingprice">
          <div class="col-sm-offset-2 col-sm-10">
            
        <%
            try{
            String shoesize=request.getParameter("shoesize");
            sql="select sellid,sellingprice, address from selling where sellingprice= (select max(sellingprice) from selling where shoesize=?)";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, shoesize);
            rs=pstmt.executeQuery();
            if(rs.next()){
            	String sellingprice=rs.getString("sellingprice");
            	%>
            	
            
            <input type="button" class="btn btn-primary" value="즉시구매하기<%=sellingprice %>" onclick="return order(this.form);"> 
            <%
            }
            }catch(Exception e){
            	e.printStackTrace();
            }
            
            %>
            <p>fffffffffff</p>
            <input type="submit" class="btn btn-primary" value="구매입찰하기">
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