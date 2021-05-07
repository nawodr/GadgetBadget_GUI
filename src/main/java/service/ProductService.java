package service;

import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import model.ProductServlet;
import service.ProductService;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.parser.Parser;



@Path("/Produts")
public class ProductService {
	ProductServlet product = new ProductServlet();

	@GET
	@Path("/")
	@Produces(MediaType.TEXT_HTML)
	public String readProducts() {
		return product.readProducts();

	}
	
	@POST
	@Path("/")
	@Consumes(javax.ws.rs.core.MediaType.APPLICATION_FORM_URLENCODED)
	@Produces(javax.ws.rs.core.MediaType.TEXT_PLAIN)
	public String insertProduct(
				@FormParam("product_Name") String product_Name,
				@FormParam("product_category") String product_category,
				@FormParam("product_Price") String price,
				@FormParam("product_Description") String description) {
		
		String output =  product.insertProduct(product_Name, product_category, price, description);
		return output;
	}

	
	@DELETE
	@Path("/") 
	@Consumes(MediaType.APPLICATION_XML) 
	@Produces(MediaType.TEXT_PLAIN) 
	public String deleteProduct(String productData) 
	{ 
	//Convert the input string to an XML document
	 Document doc = Jsoup.parse(productData, "", Parser.xmlParser()); 
	 
	//Read the value from the element <itemID>
	 String product_Id = doc.select("product_Id").text(); 
	 String output = product.deleteProduct(product_Id); 
	return output; 
	}
	
	@PUT
	@Path("/")
	@Consumes(MediaType.APPLICATION_JSON)
	@Produces(MediaType.TEXT_PLAIN)
	public String updateProduct(String productData) {
		//Convert the input string to a JSON object
		
		JsonObject productObject = new JsonParser().parse(productData).getAsJsonObject();
		 
		//Read the values from the JSON object
		
		 String product_ID = productObject.get("product_Id").getAsString(); 
		 String product_Name = productObject.get("product_Name").getAsString();
		 String product_Category = productObject.get("product_Category").getAsString();
		 String product_Price = productObject.get("product_Price").getAsString();
		 String product_Description= productObject.get("product_Description").getAsString();
		 String output = product.updateProduct(product_ID, product_Name, product_Category, product_Price, product_Description);
		return output;
		 
	}

}
