package ffth.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ffth.controller.DBController;
import ffth.model.Vehicle;

/**
 * This is the data access class to retrieve table from the Vehicle
 * 
 * @author Lee Zhuo Xun
 * 
 */
public class VehicleManager {
	private DBController dbController = new DBController();

	/**
	 * This method is to insert vehicle into database
	 * 
	 * @param vehicle
	 * @return boolean
	 */
	public boolean insertVehicle(Vehicle vehicle) {
		String sql = "INSERT INTO vehicle ";
		sql += "VALUES( ? , ? , ? , ? , ? , ? , ?  )";
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vehicle.getVehicleNo());
			ps.setString(2, vehicle.getModel());
			ps.setFloat(3, vehicle.getWeight());
			ps.setString(4, vehicle.getStatus());
			ps.setString(5, vehicle.getType());
			ps.setString(6, vehicle.getImage());
			ps.setInt(7, vehicle.getActive());
			System.out.println(ps);
			ps.executeUpdate();
			conn.setAutoCommit(true);
			conn.close();
			success = true;
		}
		catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}

	/**
	 * This method is to retrieve all vehicle from the database.
	 * 
	 * @return ArrayList<Vehicle>
	 */
	public ArrayList<Vehicle> getAllVehicles() {
		String sql = "SELECT * FROM vehicle";
		ArrayList<Vehicle> vehicleArrList = new ArrayList<Vehicle>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Vehicle vehicle = new Vehicle();
				vehicle.setVehicleNo(rs.getString("vehicleNo"));
				vehicle.setModel(rs.getString("model"));
				vehicle.setStatus(rs.getString("status"));
				vehicle.setWeight(rs.getFloat("weight"));
				vehicle.setType(rs.getString("type"));
				vehicle.setImage(rs.getString("image"));
				vehicle.setActive(rs.getInt("active"));
				if(rs.getInt("active") == 1){
					vehicleArrList.add(vehicle);
				}
			}
			conn.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
			vehicleArrList = null;
		}
		return vehicleArrList;
	}

	/**
	 * This method is to retrieve a particular vehicle from the database
	 * 
	 * @param vehicleNo
	 * @return Vehicle
	 */
	public Vehicle getVehicle(String vehicleNo) {
		String sql = "SELECT * FROM vehicle WHERE vehicleNo=? AND active = ?";
		Vehicle vehicle = new Vehicle();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vehicleNo);
			ps.setInt(2, 1);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				vehicle.setVehicleNo(rs.getString("vehicleNo"));
				vehicle.setModel(rs.getString("model"));
				vehicle.setStatus(rs.getString("status"));
				vehicle.setWeight(rs.getFloat("weight"));
				vehicle.setType(rs.getString("type"));
				vehicle.setImage(rs.getString("image"));
				vehicle.setActive(rs.getInt("active"));
			}
			conn.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
			vehicle = null;
		}
		return vehicle;
	}

	/**
	 * This method is to update a particular vehicle in the database
	 * 
	 * @param vehicle
	 * @return boolean
	 */
	public boolean updateVehicle(Vehicle vehicle) {
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			if (vehicle.getImage() != null) {
				String sql = "UPDATE vehicle ";
				sql += "SET model=? , weight=? , status=? , type=? , image=? WHERE vehicleNo = ? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, vehicle.getModel());
				ps.setFloat(2, vehicle.getWeight());
				ps.setString(3, vehicle.getStatus());
				ps.setString(4, vehicle.getType());
				ps.setString(5, vehicle.getImage());
				ps.setString(6, vehicle.getVehicleNo());
				System.out.println(ps);
				ps.executeUpdate();
			} 
			else {
				String sql = "UPDATE vehicle ";
				sql += "SET model=? , weight=? , status=? , type=? WHERE vehicleNo = ? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, vehicle.getModel());
				ps.setFloat(2, vehicle.getWeight());
				ps.setString(3, vehicle.getStatus());
				ps.setString(4, vehicle.getType());
				ps.setString(5, vehicle.getVehicleNo());
				System.out.println(ps);
				ps.executeUpdate();
			}
			conn.setAutoCommit(true);
			conn.close();
			success = true;
		} 
		catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}

	/**
	 * This method is to obsolete a particular vehicle in the database
	 * 
	 * @param vehicleNo
	 * @return boolean
	 */
	public boolean obsoleteVehicle(String vehicleNo) {
		String sql = "UPDATE vehicle ";
		sql += "SET active=? WHERE vehicleNo = ? ";
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setString(2, vehicleNo);
			System.out.println(ps);
			ps.executeUpdate();
			conn.setAutoCommit(true);
			conn.close();
			success = true;
		} 
		catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}
}
