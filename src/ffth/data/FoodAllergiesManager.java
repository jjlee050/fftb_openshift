package ffth.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ffth.controller.DBController;
import ffth.model.Food;
import ffth.model.Food_Allergies;

public class FoodAllergiesManager {
	
	private DBController dbController = new DBController();
	
	public ArrayList<Food_Allergies> getFoodAllergies(int foodID) {
		String sql = "SELECT * FROM food_allergies WHERE foodID=?";
		ArrayList<Food_Allergies> allergyArrayList = new ArrayList<Food_Allergies>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, foodID);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				Food_Allergies foodAllergies = new Food_Allergies();
				foodAllergies.setFoodID(rs.getInt("foodID"));
				foodAllergies.setDescription(rs.getString("description"));
				allergyArrayList.add(foodAllergies);
				
			}
			conn.close();
			return allergyArrayList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<Food_Allergies> getAllAllergies() {
		String sql = "SELECT * FROM food_allergies";
		ArrayList<Food_Allergies>allergyArrayList = new ArrayList<Food_Allergies>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Food_Allergies foodAllergies = new Food_Allergies();
				foodAllergies.setFoodID(rs.getInt("foodID"));
				foodAllergies.setDescription(rs.getString("description"));
				allergyArrayList.add(foodAllergies);
			}
			conn.close();
			return allergyArrayList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
