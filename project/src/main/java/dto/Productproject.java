package dto;

import lombok.Data;

@Data
public class Productproject {
	private String productId;
	private String name;
	private String brand;
	private String filename;
	
	
	public Productproject() {
		super();
	}
	
	public Productproject(String productId,String name,String brand) {
		this.productId=productId;
		this.name=name;
		this.brand=brand;
	}
	

}
