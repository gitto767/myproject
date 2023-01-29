package dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;

import dto.Productproject;

public class ProductRepository {
	private ArrayList<Productproject> listOfProducts=new ArrayList<Productproject>();
	private static ProductRepository instance=new ProductRepository();
	
	public static ProductRepository getInstance() {
		return instance;
	}
	
	public ProductRepository() {
		Connection conn=null;
		try {
			String url="jdbc:oracle:thin:@//localhost:1521/xe";
			String user="system";
			String pass="1234";
			String driver="oracle.jdbc.OracleDriver";
			Class.forName(driver);
			conn=DriverManager.getConnection(url, user, pass);
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from productpro";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Productproject phone=new Productproject(rs.getString("productId"),rs.getString("name"),rs.getString("brand"));
				phone.setFilename(rs.getString("filename"));
				listOfProducts.add(phone);
			}
		}catch(Exception ex) {
			System.out.println("데이터베이스 연결에 실패하였습니다.");
			System.out.println("SQL Exception: "+ex.getMessage());;
		}
	}
	
	public ArrayList<Productproject> getAllProducts(){
		return listOfProducts;
	}
	public Productproject getProductById(String productId) {
		System.out.println("id : "+productId);
		Productproject productById=null;
		    for(int i=0;i<listOfProducts.size();i++) {
		    	Productproject product=listOfProducts.get(i);
		    	if(product !=null && product.getProductId()!=null && product.getProductId().equals(productId)) {
		    		productById=product;
		    		break;
		    	}
		    }
		    return productById;
	}
	
	public void addProduct(Productproject product) {
		listOfProducts.add(product);
	}

}