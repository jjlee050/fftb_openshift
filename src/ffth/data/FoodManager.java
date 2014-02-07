package ffth.data;

import ffth.controller.DBController;
import ffth.model.Food;
import ffth.model.Food_Allergies;

import java.sql.Date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FoodManager {
	private DBController dbController = new DBController();
	
	public Food getFood(String Name, float Weight, String Type,  Date sqlDate, int Vegetarian, int Halal) {
		String sql = "SELECT * FROM Food WHERE name LIKE '%"+Name+"%' AND weight LIKE '%"+(int)Weight+"%' AND type LIKE '%"+Type+"%' AND expiryDate LIKE '%"+sqlDate+"%' AND vegetarian LIKE '%"+Vegetarian+"%' AND halal LIKE '%"+Halal+"%'";
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			Food food = new Food();
			if (rs.next()) {
				food.setName(rs.getString("name"));
				food.setType(rs.getString("type"));
				food.setWeight(rs.getFloat("weight"));
				food.setExpiryDate(rs.getDate("expiryDate"));
				food.setVegetarian(rs.getInt("vegetarian"));
				food.setHalal(rs.getInt("halal"));
				food.setFoodID(rs.getInt("foodID"));
				food.setActive(rs.getInt("active"));
			}
			conn.close();
			return food;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<Food> getAllFood() {
		String sql = "Select * From food left join food_allergies on food.foodID=food_allergies.foodID";
		ArrayList<Food> foodArrayList = new ArrayList<Food>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Food food = new Food();
				food.setName(rs.getString("food.name"));
				food.setType(rs.getString("food.type"));
				food.setWeight(rs.getFloat("food.weight"));
				food.setExpiryDate(rs.getDate("food.expiryDate"));
				food.setVegetarian(rs.getInt("food.vegetarian"));
				food.setHalal(rs.getInt("food.halal"));
				food.setFoodID(rs.getInt("food.foodID"));
				food.setActive(rs.getInt("food.active"));
				Food_Allergies fa = new Food_Allergies();
				FoodAllergiesManager foodAllergiesManager = new FoodAllergiesManager();
				food.setFoodAllergiesArrList(foodAllergiesManager.getFoodAllergies(food.getFoodID()));
				foodArrayList.add(food);
			}
			conn.close();
			return foodArrayList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<Food> getFood(int foodID) {
		String sql = "Select * From food left join food_allergies on food.foodID=food_allergies.foodID WHERE foodID=?";
		ArrayList<Food> foodArrayList = new ArrayList<Food>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, foodID);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Food food = new Food();
				food.setName(rs.getString("food.name"));
				food.setType(rs.getString("food.type"));
				food.setWeight(rs.getFloat("food.weight"));
				food.setExpiryDate(rs.getDate("food.expiryDate"));
				food.setVegetarian(rs.getInt("food.vegetarian"));
				food.setHalal(rs.getInt("food.halal"));
				food.setFoodID(rs.getInt("food.foodID"));
				food.setActive(rs.getInt("food.active"));
				Food_Allergies fa = new Food_Allergies();
				FoodAllergiesManager foodAllergiesManager = new FoodAllergiesManager();
				food.setFoodAllergiesArrList(foodAllergiesManager.getFoodAllergies(food.getFoodID()));
				foodArrayList.add(food);
			}
			conn.close();
			return foodArrayList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
