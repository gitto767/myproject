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
    function sell(frm){
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
    	alert("판매 입찰 하시겠습니까?");
    	frm.action="sellingProcess.jsp";
    	frm.submit();
    	return true;
    }
    function order(frm){
    	alert("즉시판매하시겠습니까?");
    	frm.action="orderProcess1.jsp";
    	frm.submit();
    	return true;
    }
    function changesubmit(){
  	  sellingform.submit();
    }
</script>
</head>
<body>
<jsp:include page="menu.jsp"/>
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
    <%product.getFilename() ;%>
    <div class="row">
      <div class="col-md-5">
        <img src="<%=request.getContextPath()%>/upload/<%=product.getFilename()%>" style="width:100%">
      </div>
      <div class="col-md-6">
        <h3><%=product.getName() %></h3>
       
        <p><b>상품 코드</b>:<span class="badge badge-danger"><%=product.getProductId() %></span>
        <p><b>제조사</b>:<%=product.getBrand() %>
       
        <p>
        <div class="col-md-6">
        <form class="form-horizontal" name="sellingform" action="selling.jsp?id=<%=id %>" method="post"onsubmit="sell()">
          <input  type="text" name="id" value="<%=id%>" hidden>
          <input  type="text" name="sellid" value="<%=sessionId%>" hidden>
          <input class="form-control" type="text" id="address" name="returnaddress" value="<%=address%>">
         
          <%
          String shoesize=request.getParameter("shoesize");
          if(shoesize==null){
        	  shoesize="265";
          }
          String sizechange="";
          if(shoesize.equals("230")){
        	  sizechange="230";
          }else if(shoesize.equals("235")){
        	  sizechange="235";
          }else if(shoesize.equals("240")){
        	  sizechange="240";
          }else if(shoesize.equals("245")){
        	  sizechange="245";
          }else if(shoesize.equals("250")){
        	  sizechange="250";
          }else if(shoesize.equals("255")){
        	  sizechange="255";
          }else if(shoesize.equals("260")){
        	  sizechange="260";
          }else if(shoesize.equals("265")){
        	  sizechange="265";
          }else if(shoesize.equals("270")){
        	  sizechange="270";
          }else if(shoesize.equals("275")){
        	  sizechange="275";
          }else if(shoesize.equals("280")){
        	  sizechange="280";
          }else if(shoesize.equals("285")){
        	  sizechange="285";
          }else if(shoesize.equals("290")){
        	  sizechange="290";
          }else if(shoesize.equals("295")){
        	  sizechange="295";
          }else if(shoesize.equals("300")){
        	  sizechange="300";
          }
          %>
          <br>
         <select class="form-control" name="shoesize" id="shoesize"  onchange="changesubmit()">
          <option value="" >선택</option>
          <option value="230" <%if(shoesize.equals("230")){%>selected<%} %>>230</option>
          <option value="235" <%if(shoesize.equals("235")){%>selected<%} %>>235</option>
          <option value="240" <%if(shoesize.equals("240")){%>selected<%} %>>240</option>
          <option value="245" <%if(shoesize.equals("245")){%>selected<%} %>>245</option>
          <option value="250" <%if(shoesize.equals("250")){%>selected<%} %>>250</option>
          <option value="255" <%if(shoesize.equals("255")){%>selected<%} %>>255</option>
          <option value="260" <%if(shoesize.equals("260")){%>selected<%} %>>260</option>
          <option value="265" <%if(shoesize.equals("265")){%>selected<%} %>>265</option>
          <option value="270" <%if(shoesize.equals("270")){%>selected<%} %>>270</option>
          <option value="275" <%if(shoesize.equals("275")){%>selected<%} %>>275</option>
          <option value="280" <%if(shoesize.equals("280")){%>selected<%} %>>280</option>
          <option value="285" <%if(shoesize.equals("285")){%>selected<%} %>>285</option>
          <option value="290" <%if(shoesize.equals("290")){%>selected<%} %>>290</option>
          <option value="295" <%if(shoesize.equals("295")){%>selected<%} %>>295</option>
          <option value="300" <%if(shoesize.equals("300")){%>selected<%} %>>300</option>
          </select>
          <br>
          <input class="form-control" type="text" id="sellingprice" name="sellingprice" placeholder="판매가격">
          <br>
          <div class="col-md-6">
          <input type="button" class="btn btn-outline-success" value="판매입찰하기" onclick="return sell(this.form);">
          <br>
          <%
          String buyid;
          String maxprice;
          String shipaddress;
          try{
        	  sql="select buyid,buyingprice,shipaddress from buying where buyingprice=(select max(buyingprice) from buying where shoesize='"+sizechange+"')and productid='"+id+"'";
        	  pstmt=conn.prepareStatement(sql);
        	  rs=pstmt.executeQuery();
        	  if(rs.next()){
        		  buyid=rs.getString(1);
        		  maxprice=rs.getString(2);
        		  shipaddress=rs.getString(3);
         %>
            <input type="text" name="buyid" value="<%=buyid %>" hidden>
            <input type="text" name="buyingprice" value="<%=maxprice %>" hidden>
            <input type="text" name="shipaddress" value="<%=shipaddress %>" hidden>
           <br>
            <input type="button" class="btn btn-success" value="즉시판매하기<%=maxprice %>" onclick="return order(this.form);">
           <%
        	  }
          }catch(Exception e){
        	  e.printStackTrace();
          }
          %>
          
          </div>
        </form> 
        </div>
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