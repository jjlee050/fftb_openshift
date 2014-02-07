package ffth.data;

import java.sql.Connection;
import java.sql.PreparedStatement;

import ffth.controller.DBController;
import ffth.model.Food;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class newProductManager {
	private DBController dbController = new DBController();
	public boolean insertFood(Food food) {
		String sql = "INSERT INTO food ";
		sql += "VALUES( null, 1 , ? , ? , ? , ? , ? , ? , ? , ? , 0)";
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, food.getLocation());
			ps.setString(2, food.getName());
			ps.setFloat(3, food.getWeight());
			ps.setString(4, food.getType());
			ps.setDate(5, food.getExpiryDate());
			ps.setInt(6, food.getVegetarian());
			ps.setInt(7, food.getHalal());
			ps.setDate(8, food.getDateOfDonation());
			
			System.out.println(ps);
			ps.executeUpdate();
			conn.setAutoCommit(true);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean insertAllergies(Food food){
		String sql = "INSERT INTO food_allergies ";
		sql += "VALUES( (SELECT COUNT(*) from food) , ? )";
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, food.getAllergies());
			
			System.out.println(ps);
			ps.executeUpdate();
			conn.setAutoCommit(true);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean insertDonator(Food food){
		String sql = "INSERT INTO donator ";
		sql += "VALUES( null, ? )";
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, food.getNameOfDonator());
			
			System.out.println(ps);
			ps.executeUpdate();
			conn.setAutoCommit(true);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean insertLocation(Food food){
		String sql = "INSERT INTO food_location ";
		sql += "VALUES( null, ? )";
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, food.getDescription());
			
			System.out.println(ps);
			ps.executeUpdate();
			conn.setAutoCommit(true);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/*public ArrayList<Food> getData(String type){
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Food> foodData = new ArrayList<Food>();


		try {
			Connection conn = dbController.getConnection();
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery("SELECT * FROM food WHERE type ='"+ type + "'");

		    // or alternatively, if you don't know ahead of time that
		    // the query will be a SELECT...

		    if (stmt.execute("SELECT * FROM food WHERE type ='"+ type + "'")) {
		        rs = stmt.getResultSet();
		    }
		    
		    while(rs.next()){
				Food food = new Food(rs.getString(4),rs.getFloat(5),rs.getString(6),rs.getDate(7),rs.getInt(8),rs.getInt(9),rs.getDate(10));
		    	
		    	foodData.add(food);
		    }

		    // Now do something with the ResultSet ....
		}
		catch (Exception ex){
			ex.printStackTrace();
		}		
		
		return foodData;
	}
	
	public ArrayList<Food> getWeight(){
		Statement stmt = null;
		ResultSet rs = null;
		ArrayList<Food> foodData = new ArrayList<Food>();


		try {
			Connection conn = dbController.getConnection();
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery("SELECT * FROM food GROUP BY weight ORDER BY weight");

		    // or alternatively, if you don't know ahead of time that
		    // the query will be a SELECT...

		    if (stmt.execute("SELECT * FROM food GROUP BY weight ORDER BY weight")) {
		        rs = stmt.getResultSet();
		    }
		    
		    while(rs.next()){
				Food food = new Food(rs.getString(4),rs.getFloat(5),rs.getString(6),rs.getDate(7),rs.getInt(8),rs.getInt(9),rs.getDate(10));
		    	
		    	foodData.add(food);
		    }

		    // Now do something with the ResultSet ....
		}
		catch (Exception ex){
			ex.printStackTrace();
		}		
		
		return foodData;
	}*/
	
	public int getRows(String table){
		Statement stmt = null;
		ResultSet rs = null;
		int count = 0;

		try {
			Connection conn = dbController.getConnection();
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery("SELECT COUNT(*) FROM "+ table);

		    // or alternatively, if you don't know ahead of time that
		    // the query will be a SELECT...

		    if (stmt.execute("SELECT COUNT(*) FROM "+ table)) {
		        rs = stmt.getResultSet();
		    }
		    
		    if(rs.next()){
		    	++count;
		    }

		    // Now do something with the ResultSet ....
		}
		catch (Exception ex){
			ex.printStackTrace();
		}		
		
		return count;
	}
	
	public ArrayList<Food> getData(){
		Statement stmt = null;
		String sql = "SELECT * FROM food";
		ResultSet rs = null;
		ArrayList<Food> foodData = new ArrayList<Food>();
		

		try {
			Connection conn = dbController.getConnection();
		    stmt = conn.createStatement();
		    rs = stmt.executeQuery(sql);

		    // or alternatively, if you don't know ahead of time that
		    // the query will be a SELECT...

		    if (stmt.execute(sql)) {
		        rs = stmt.getResultSet();
		    }
		    
		    while(rs.next()){
				Food food = new Food();
				food.setWeight(rs.getInt(5));
				food.setType(rs.getString(6));
				food.setLocation(rs.getInt(3));
		    	food.setName(rs.getString(4));
		    	food.setDateOfDonation(rs.getDate(10));
		    	food.setExpiryDate(rs.getDate(7));
				
				
		    	foodData.add(food);
		    }

		    // Now do something with the ResultSet ....
		}
		catch (Exception ex){
			ex.printStackTrace();
		}		
		
		return foodData;
	}
}
