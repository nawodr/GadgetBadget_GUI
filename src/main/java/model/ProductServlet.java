package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ProductServlet {

	private Connection connect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// Provide the correct details: DBServer/DBName, username, password
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3333/gadgetbadget_gui", "root", "");
			System.out.println("Connection successfull");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public String insertProduct(String name, String cat, String price, String desc) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for inserting.";
			}
			// create a prepared statement
			String query = " insert into products(`product_Name`,`product_Category`,`product_Price`,`product_Description`)" + " values (?, ?, ?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, name);
			preparedStmt.setString(2, cat);
			preparedStmt.setString(3, price);
			preparedStmt.setString(4, desc);
			// execute the statement
			preparedStmt.execute();
			con.close();

			String newOrder = readProducts(); 
			 output = "{\"status\":\"success\", \"data\": \"" + newOrder + "\"}"; 
			
		} catch (Exception e) {
			output = "Error while inserting the item.";
			System.err.println(e.getMessage());
			System.out.println(e);
			e.printStackTrace();
		}
		return output;
	}

	public String readProducts() {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for reading.";
			}
			// Prepare the html table to be displayed
			output = "<table border='1'><tr><th>Product ID</th><th>Product Name</th>" + "<th>Product Category</th>"
					+ "<th>Product Price</th><th>Product Description</th>";

			String query = "select * from products";

			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			// iterate through the rows in the result set
			while (rs.next()) {
				String product_Id = Integer.toString(rs.getInt("product_Id"));
				String product_Name = rs.getString("product_Name");
				String product_Category = rs.getString("product_Category");
				String product_Price = rs.getString("product_Price");
				String product_Description = rs.getString("product_Description");
				output += "<tr><td>" + product_Id + "</td>";
				output += "<td>" + product_Name + "</td>";
				output += "<td>" + product_Category + "</td>";
				output += "<td>" + product_Price + "</td>";
				output += "<td>" + product_Description + "</td>";
				// buttons
				output += "<td><input name='btnUpdate' type='button' value='Update' class='btnUpdate btn btn-secondary'></td>"
						 + "<td><button class='btnRemove btn btn-danger' name='btnRemove' id ='btnRemove' value='"+ product_Id +"' >Remove</button></td></tr>";

			}
			con.close();
			// Complete the html table
			output += "</table>";
//			System.out.println("cc");

		} catch (Exception e) {
			output = "Error while reading the Product.";
			System.out.println(e.getMessage());
			System.out.println(e);
			e.printStackTrace();
		}
		return output;

	}

	public String updateProduct( String ID, String Name, String cat, String price, String desc) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for updating.";
			}
			// create a prepared statement
			String query = "UPDATE products SET product_Name=?,product_Category=?,product_Price=?,product_Description=? WHERE product_Id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setString(1, Name);
			preparedStmt.setString(2, cat);
			preparedStmt.setString(3, price);
			preparedStmt.setString(4, desc);
			preparedStmt.setString(5, ID);
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Updated successfully";
		} catch (Exception e) {
			output = "Error while updating the Product.";
			System.err.println(e.getMessage());
			System.out.println(e);
			e.printStackTrace();
		}
		return output;
	}
	
	public String deleteProduct(String productId) {
		String output = "";
		try {
			Connection con = connect();
			if (con == null) {
				return "Error while connecting to the database for deleting.";
			}
			// create a prepared statement
			String query = "delete from products where product_Id=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			// binding values
			preparedStmt.setInt(1, Integer.parseInt(productId));
			// execute the statement
			preparedStmt.execute();
			con.close();
			output = "Deleted successfully";
		} catch (Exception e) {
			output = "Error while deleting the Product.";
			System.err.println(e.getMessage());
			System.out.println(e);
			e.printStackTrace();
		}
		return output;
	}
}



