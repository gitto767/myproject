<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp" %>

<%
  String filename="";
  String realFolder="C:\\hrd1102\\project\\src\\main\\webapp\\upload";
  String encType="utf-8";
  int maxSize=5*1024*1024;
  
  MultipartRequest multi=new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
  
  String productid=multi.getParameter("productid");
  String name=multi.getParameter("name");
  String brand=multi.getParameter("brand");
   
   
  //@SuppressWarnings("rawtypes")
  Enumeration files=multi.getFileNames();
  String fname=(String) files.nextElement();
  String fileName=multi.getFilesystemName(fname);
  PreparedStatement pstmt=null;
  String sql="insert into productpro values(?,?,?,?)";
  pstmt=conn.prepareStatement(sql);
  pstmt.setString(1, productid);
  pstmt.setString(2, name);
  pstmt.setString(3, brand);
  pstmt.setString(4, fileName);
  pstmt.executeUpdate();
  
  response.sendRedirect("index.jsp");
		  
		  
%>