package ffth.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ffth.controller.DBController;
import ffth.model.Beneficiary;
import ffth.model.Delivery_Schedule;
import ffth.model.School;
import ffth.model.Self_Collection_Centre;
import ffth.model.User;
import ffth.model.Volunteer;

public class UserManager {
	
	private DBController dbController = new DBController();

	/**
	 * This method is to insert volunteer into database
	 * @param volunteer
	 * @return boolean
	 */
	public boolean insertUser(Volunteer volunteer) {
		String sql1 = "INSERT INTO user ";
		sql1 += "VALUES( ? , ? , ? , ? , ? )";
		String sql2 = "INSERT INTO volunteer ";
		sql2 += "VALUES( ? , ? , ? , ? , ? , ? , ? )";
		
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			
				PreparedStatement ps = conn.prepareStatement(sql1);
				PreparedStatement ps1 = conn.prepareStatement(sql2);
				
				ps.setInt(1, volunteer.getUserID());
				ps.setString(2, volunteer.getUserName());
				ps.setString(3, volunteer.getPassword());
				ps.setString(4, volunteer.getType());
				ps.setString(5, volunteer.getImageFile());
				
				ps1.setInt(1, volunteer.getUserID());
				ps1.setString(2, volunteer.getName());
				ps1.setString(3, volunteer.getEmail());
				ps1.setString(4, volunteer.getContactNo());
				ps1.setTimestamp(5, volunteer.getDateOfRegistration());
				ps1.setString(6, volunteer.getGender());
				ps1.setDate(7, volunteer.getDateOfBirth());

				System.out.println(ps);
				ps.executeUpdate();
				System.out.println(ps1);
				ps1.executeUpdate();
			 
			conn.setAutoCommit(true);
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/**
	 * This method is to retrieve all beneficiary from the database.
	 * @return ArrayList<Volunteer>
	 */
	public ArrayList<User> getAllUsers() {
		String sql = "SELECT * FROM user";
		ArrayList<User> userArrList = new ArrayList<User>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				User user = new User();
				user.setUserID(rs.getInt("userID"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getString("type"));
				user.setImageFile(rs.getString("image"));
				/*
					//db order: userID, name, email,address, contactNo, dateOfRegistration, nric, gender, race, dateOfBirth, Nationality
			
					user.setUserID(rs.getInt("userID"));
					user.setName(rs.getString("name"));
					user.setEmail(rs.getString("email"));
					user.setAddress(rs.getString("address"));
					user.setContactNo(rs.getString("contactNo"));
					user.setDateOfRegistration(rs.getTimestamp("dateOfRegistration"));
					user.setNric(rs.getString("nric"));
					user.setGender(rs.getString("gender"));
					user.setRace(rs.getString("race"));
					user.setDateOfBirth(rs.getDate("dateOfBirth"));
					user.setNationality(rs.getString("nationality"));
					user.setImageFile(rs.getString("image"));
					*/
					
					userArrList.add(user);
			}
			conn.close();
			return userArrList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public User getUser(int userID) {
		String sql = "SELECT * FROM user WHERE userID = " + userID;
		System.out.println(sql);
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			//ps.setInt(1, userID);
			//ps.setInt(2, 1);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			User user = new User();
			if (rs.next()) {
				user.setUserID(rs.getInt("userID"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getString("type"));
				user.setImageFile(rs.getString("image"));
			} 
			else {
					return null;
				}
			
			conn.close();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public Volunteer getVolunteer(int userID) {
		String sql = "SELECT * FROM volunteer WHERE userID = " + userID;
		System.out.println(sql);
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			Volunteer volunteer = new Volunteer();
			if (rs.next()) {
				//user stuffs
				volunteer.setUserID(rs.getInt("userID"));
			/*	volunteer.setUserName(rs.getString("userName"));
				volunteer.setPassword(rs.getString("password"));
				volunteer.setType(rs.getString("type"));
				volunteer.setImageFile(rs.getString("image"));
				*/
				//volunteer stuffs
				volunteer.setName(rs.getString("name"));
				volunteer.setEmail(rs.getString("email"));
				volunteer.setContactNo(rs.getString("contactNo"));
				volunteer.setDateOfRegistration(rs.getTimestamp("dateOfRegistration"));
				volunteer.setGender(rs.getString("gender"));
				volunteer.setDateOfBirth(rs.getDate("dateOfBirth"));
			} 
			else {
					return null;
				}
			
			conn.close();
			return volunteer;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	

	/**
	 * This method is to update a particular beneficiary in the database
	 * @param beneficiary
	 * @return boolean
	 */
	/**
	 * This method is to update a particular delivery schedule into the database
	 * @param deliverySchedule
	 * @return boolean
	 */
	public boolean updateVolunteer(Volunteer volunteer) {
		String sql = "UPDATE volunteer ";
		sql += "SET email=? , contactNo=? WHERE userID = ? ";
		
		String sql2 = "UPDATE user ";
		sql2 += "SET image=? WHERE userID = ? ";
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			
			PreparedStatement ps = conn.prepareStatement(sql);
			PreparedStatement ps2 = conn.prepareStatement(sql2);
			
			ps.setString(1, volunteer.getEmail());
			ps.setString(2, volunteer.getContactNo());
			ps.setInt(3, volunteer.getUserID());
			
			ps2.setString(1, volunteer.getImageFile());
			ps2.setInt(2, volunteer.getUserID());
			
			System.out.println(ps);
			System.out.println(ps2);
			
			ps2.executeUpdate();
			ps.executeUpdate();
			conn.setAutoCommit(true);
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean updatePassword(Volunteer volunteer) {
		String sql = "UPDATE user ";
		sql += "SET password=? WHERE userID = ? ";
		
		System.out.println(sql);
		
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			
			ps.setString(1, volunteer.getPassword());
			ps.setInt(2, volunteer.getUserID());
			System.out.println(sql);
			
			System.out.println(ps);
			ps.executeUpdate();
			conn.setAutoCommit(true);
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public User getUserID(String username) {
		String sql = "SELECT * FROM user WHERE userName = '" + username + "'";
		System.out.println(sql);
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			User user = new User();
			if (rs.next()) {
				user.setUserID(rs.getInt("userID"));
				user.setUserName(rs.getString("userName"));
				user.setPassword(rs.getString("password"));
				user.setType(rs.getString("type"));
				user.setImageFile(rs.getString("image"));
			} 
			else {
				return null;
			}
			
			conn.close();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	
}
