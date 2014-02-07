package ffth.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ffth.controller.DBController;
import ffth.model.Delivery_Schedule;
import ffth.model.Food;
import ffth.model.Packing_List;
import ffth.model.Packing_List_Food_Item;
import ffth.model.Vehicle;

/**
 * This is the data class to retrieve table from the Vehicle
 * 
 * @author Wang Guo Wei
 * 
 */
public class PackingListManager {
	private DBController dbController = new DBController();

	/**
	 * This method is to retrieve all Packing List Item from the database.
	 * 
	 * @return ArrayList<Food >
	 */
	public ArrayList<Food> getAllFood() {
		String sql = "SELECT * FROM food";
		ArrayList<Food> foodArrList = new ArrayList<Food>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Food food = new Food();
				food.setFoodID(rs.getInt("foodID"));
				food.setName(rs.getString("name"));
				food.setWeight(rs.getFloat("weight"));
				food.setType(rs.getString("type"));
				food.setActive(rs.getInt("active"));
				foodArrList.add(food);
			}
			conn.close();
			return foodArrList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public int getFoodId(String itemName,float itemWeight){
		int foodId=0;
		String sql="Select * from food";
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Food food = new Food();
				food.setFoodID(rs.getInt("foodID"));
				food.setName(rs.getString("name"));
				food.setWeight(rs.getFloat("weight"));
				food.setType(rs.getString("type"));
				food.setActive(rs.getInt("active"));
				if(food.getName().equals(itemName)&&food.getWeight()==itemWeight){
					foodId=food.getFoodID();
				}
			}
			conn.close();
			return foodId;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public boolean insertPackingList(Packing_List list){
		String sql="Insert into packing_list values(null,?,?)";
		
		String sql1="Insert into packing_list_food_item values(?,?,?)";
		String sqlCheck="Select * from packing_list";
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			//ps.setInt(1, 1);
			ps.setString(1, list.getEventType());
			ps.setInt(2, list.getAmountOfBags());
			
			System.out.println(ps);
			ps.executeUpdate();
			
			int count=1;
			PreparedStatement psCheck=conn.prepareStatement(sqlCheck);
			ResultSet rs=psCheck.executeQuery();
			
			while(rs.next()){
				count++;
			}
			//System.out.println(list.unnamed_Packing_List_Food_Item_.size());
			for(int i=0;i<list.unnamed_Packing_List_Food_Item_.size();i++){
				PreparedStatement ps1=conn.prepareStatement(sql1);
				ps1.setInt(1, count-1);
				int id=list.unnamed_Packing_List_Food_Item_.get(i).getUnnamed_Food_().getFoodID();
				System.out.println(id);
				int quantity=list.unnamed_Packing_List_Food_Item_.get(i).getQuantity();
				ps1.setInt(2, id);
				ps1.setInt(3, quantity);
				System.out.println(ps1);
				ps1.executeUpdate();
			}
			conn.setAutoCommit(true);
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public ArrayList<Packing_List> getAllList() {
		String sql = "SELECT * FROM packing_list";
		String sql1="SELECT * FROM packing_list_food_item where packingListID=?";
		ArrayList<Packing_List> packingArrList = new ArrayList<Packing_List>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			PreparedStatement ps1=conn.prepareStatement(sql1);
			
			while (rs.next()) {
				Packing_List list = new Packing_List();
				int id=rs.getInt("packingListID");
				list.setPackingListID(rs.getInt("packingListID"));
				list.setAmountOfBags(rs.getInt("amountOfBags"));
				list.setEventType(rs.getString("eventType"));
				ps1.setInt(1, id);
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next()){
					Packing_List_Food_Item listItem=new Packing_List_Food_Item();
					listItem.setId(rs1.getInt("packingListID"));
					listItem.setQuantity(rs1.getInt("quantity"));
					Food food=getFood(rs1.getInt("foodID"));
					listItem.setUnnamed_Food_(food);
					list.unnamed_Packing_List_Food_Item_.add(listItem);
				}
				
				packingArrList.add(list);
			}
			conn.close();
			/*for(int i=0;i<5;i++){
				System.out.println(packingArrList.get(i).getPackingListID());
				System.out.println(packingArrList.get(i).unnamed_Packing_List_Food_Item_.get(i).unnamed_Food_.getName());
				System.out.println(packingArrList.get(i).unnamed_Packing_List_Food_Item_.get(i).getQuantity());
			}*/
			return packingArrList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Packing_List getList(int packingListID) {
		String sql = "SELECT * FROM packing_list where packingListID=?";

		Packing_List list = new Packing_List();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, packingListID);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				list.setPackingListID(rs.getInt("packingListID"));
				list.setPackingListID(rs.getInt("packingListID"));
				list.setAmountOfBags(rs.getInt("amountOfBags"));
				list.setEventType(rs.getString("eventType"));
				
			}
			conn.close();
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Food getFood(int id) {
		String sql = "SELECT * FROM food where foodID='"+id+"'";
		Food food = new Food();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				food.setFoodID(rs.getInt("foodID"));
				food.setName(rs.getString("name"));
				food.setWeight(rs.getFloat("weight"));
				food.setType(rs.getString("type"));
				food.setExpiryDate(rs.getDate("expiryDate"));
				food.setVegetarian(rs.getInt("vegetarian"));
				food.setHalal(rs.getInt("halal"));
				food.setActive(rs.getInt("active"));
			}
			conn.close();
			return food;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
