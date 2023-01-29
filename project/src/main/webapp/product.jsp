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


</head>
<body>
<%@ include file="menu.jsp" %>
 <div class="jumbotron">
    <div class="container">
      <h1 class="display-3">상품 정보</h1>
    </div>
  </div>
<%
    String id=request.getParameter("id");
    ProductRepository dao=ProductRepository.getInstance();
    Productproject product=dao.getProductById(id);    
%>
  <div class="container">
    <%product.getFilename(); %>
    
    <div class="row">
      <div class="col-md-5">
        <img src="<%=request.getContextPath()%>/upload/<%=product.getFilename()%>" style="width:100%">
      </div>
      <div class="col-md-6">
        <h3><%=product.getName() %></h3>
       
        <p><b>상품 코드</b>:<span class="badge badge-dark"><%=product.getProductId() %></span>
        <p><b>제조사</b>:<%=product.getBrand() %>
       
        <p>
        
        <form>  
          <a href="buying.jsp?id=<%=id %>" class="btn btn-danger">    구매    </a>
          <a href="selling.jsp?id=<%=id %>" class="btn btn-success">판매    </a>
        </form>  
        <p>
        <div class="col-md-8">
        
        <p>
        
     <%@ include file="dbconn.jsp"  %>  
        <%
          PreparedStatement pstmt=null;
          ResultSet rs=null;
          String ids=product.getProductId();
          try{
        	  String sql="select buyingprice,shoesize from buying where productid=? order by buyingprice desc ";
        	  
        	  pstmt=conn.prepareStatement(sql);
        	  pstmt.setString(1, ids);
        	  rs=pstmt.executeQuery();
        	  
        	  while(rs.next()){
        		  String buyingprice=rs.getString(1);
        		  String shoesize1=rs.getString(2);
        %>
        
        <table class="table table-success table-striped">
          <tr>
            <td><%=shoesize1 %></td>
            <td><%= buyingprice %></td>
          </tr>
        </table>
        <p></p>
        
        
        <%
        	  }
          }catch(Exception e){
        	  e.printStackTrace();
          }
          
        %>  
        <%
          try{
        	  String sql="select sellingprice,shoesize from selling where productid=? order by sellingprice";
        	 
        	  pstmt=conn.prepareStatement(sql);
        	  pstmt.setString(1, ids);
        	  rs=pstmt.executeQuery();
        	  
        	  while(rs.next()){
        		  String sellingprice=rs.getString(1);
        		  String shoesize2=rs.getString(2);
        %>
            
        <table class="table table-danger table-striped">
          <tr>
            <td><%=shoesize2 %></td>
            <td><%= sellingprice %></td>
          </tr>
        </table>
        <p></p>
       
        <%
        }
        	  
          }catch(Exception e){
        	  e.printStackTrace();
          }
        %>  
       
       
      </div>
    </div>
    <hr>
  </div>
  
</body>

</html>