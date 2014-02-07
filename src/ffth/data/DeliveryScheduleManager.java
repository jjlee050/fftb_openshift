package ffth.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ffth.controller.DBController;
import ffth.model.Beneficiary;
import ffth.model.Delivery_Schedule;
import ffth.model.Packing_List;
import ffth.model.Vehicle;

/**
 * This is the data access class to retrieve table from the Delivery Schedule
 * @author Lee Zhuo Xun
 *
 */
public class DeliveryScheduleManager {
	private DBController dbController = new DBController();
	
	/**
	 * This method is to insert the delivery schedule into the database
	 * @param deliverySchedule 
	 * @return boolean
	 */
	public boolean insertDeliverySchedule(Delivery_Schedule deliverySchedule) {
		String sql = "INSERT INTO delivery_schedule ";
		sql += "VALUES( null , ? , ? , ? , ? , ? , ? , ? , ? )";
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, deliverySchedule.getBeneficiary().getBeneficiaryID());
			ps.setString(2, deliverySchedule.getVehicle().getVehicleNo());
			ps.setInt(3, deliverySchedule.getPackingList().getPackingListID());
			ps.setString(4, deliverySchedule.getDescription());
			ps.setString(5, deliverySchedule.getStatus());
			ps.setDate(6, deliverySchedule.getDate());
			ps.setTime(7, deliverySchedule.getTime());
			ps.setInt(8, deliverySchedule.getActive());
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
	 * This method is to insert the delivery schedule from copying existing schedule or/and upload schedule from excel spreadsheet
	 * @param deliveryScheduleArrList 
	 * @return boolean
	 */
	public boolean insertDeliverySchedule(ArrayList<Delivery_Schedule> deliveryScheduleArrList) {
		String sql = "INSERT INTO delivery_schedule ";
		sql += "VALUES( null , ? , ? , ? , ? , ? , ? , ? , ? )";
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			for(int i=0;i<deliveryScheduleArrList.size();i++){
				ps.setInt(1, deliveryScheduleArrList.get(i).getBeneficiary().getBeneficiaryID());
				ps.setString(2, deliveryScheduleArrList.get(i).getVehicle().getVehicleNo());
				ps.setInt(3, deliveryScheduleArrList.get(i).getPackingList().getPackingListID());
				ps.setString(4, deliveryScheduleArrList.get(i).getDescription());
				ps.setString(5, deliveryScheduleArrList.get(i).getStatus());
				ps.setDate(6, deliveryScheduleArrList.get(i).getDate());
				ps.setTime(7, deliveryScheduleArrList.get(i).getTime());
				ps.setInt(8, deliveryScheduleArrList.get(i).getActive());
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
	 * This method is to retrieve all delivery schedule from the database.
	 * @return ArrayList<Delivery_Schedule>
	 */
	public ArrayList<Delivery_Schedule> getAllDeliverySchedules() {
		String sql = "SELECT * FROM delivery_schedule";
		ArrayList<Delivery_Schedule> deliveryScheduleArrList = new ArrayList<Delivery_Schedule>();
		BeneficiaryManager beneficiaryManager = new BeneficiaryManager();
		VehicleManager vehicleManager = new VehicleManager();
		PackingListManager packingListManager = new PackingListManager();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Delivery_Schedule deliverySchedule = new Delivery_Schedule();
				deliverySchedule.setScheduleID(rs.getInt("scheduleID"));
				Beneficiary beneficiary = beneficiaryManager.getBeneficiary(rs.getInt("beneficiaryID"));
				Vehicle vehicle = vehicleManager.getVehicle(rs.getString("vehicleNo"));
				Packing_List packingList = packingListManager.getList(rs.getInt("packingListID"));
				deliverySchedule.setBeneficiary(beneficiary);
				deliverySchedule.setVehicle(vehicle);
				deliverySchedule.setPackingList(packingList);
				deliverySchedule.setDescription(rs.getString("description"));
				deliverySchedule.setStatus(rs.getString("status"));
				deliverySchedule.setDate(rs.getDate("date"));
				deliverySchedule.setTime(rs.getTime("time"));
				deliverySchedule.setActive(rs.getInt("active"));
				if(rs.getInt("active") == 1){
					deliveryScheduleArrList.add(deliverySchedule);
				}
			}
			conn.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
			deliveryScheduleArrList = null;
		}
		return deliveryScheduleArrList;
	}

	/**
	 * This method is to retrieve a particular delivery schedule from the database
	 * @param scheduleID
	 * @return Delivery_Schedule
	 */
	public Delivery_Schedule getDeliverySchedule(int scheduleID) {
		String sql = "SELECT * FROM delivery_schedule WHERE scheduleID=? AND active = ?";
		Delivery_Schedule deliverySchedule = new Delivery_Schedule();
		BeneficiaryManager beneficiaryManager = new BeneficiaryManager();
		VehicleManager vehicleManager = new VehicleManager();
		PackingListManager packingListManager = new PackingListManager();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, scheduleID);
			ps.setInt(2, 1);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				Beneficiary beneficiary = beneficiaryManager.getBeneficiary(rs.getInt("beneficiaryID"));
				Vehicle vehicle = vehicleManager.getVehicle(rs.getString("vehicleNo"));
				Packing_List packingList = packingListManager.getList(rs.getInt("packingListID"));
				deliverySchedule.setScheduleID(rs.getInt("scheduleID"));
				deliverySchedule.setBeneficiary(beneficiary);
				deliverySchedule.setVehicle(vehicle);
				deliverySchedule.setPackingList(packingList);
				deliverySchedule.setDescription(rs.getString("description"));
				deliverySchedule.setStatus(rs.getString("status"));
				deliverySchedule.setDate(rs.getDate("date"));
				deliverySchedule.setTime(rs.getTime("time"));
				deliverySchedule.setActive(rs.getInt("active"));
			}
			conn.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
			deliverySchedule = null;
		}
		return deliverySchedule;
	}
	

	/**
	 * This method is to update a particular delivery schedule into the database
	 * @param deliverySchedule
	 * @return boolean
	 */
	public boolean updateDeliverySchedule(Delivery_Schedule deliverySchedule) {
		String sql = "UPDATE delivery_schedule ";
		sql += "SET vehicleNo=? , packingListID=? , description=? , status=? , date=? , time=? WHERE scheduleID = ? ";
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, deliverySchedule.getVehicle().getVehicleNo());	
			ps.setInt(2, deliverySchedule.getPackingList().getPackingListID());
			ps.setString(3, deliverySchedule.getDescription());
			ps.setString(4, deliverySchedule.getStatus());
			ps.setDate(5, deliverySchedule.getDate());
			ps.setTime(6, deliverySchedule.getTime());
			ps.setInt(7, deliverySchedule.getScheduleID());
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
	 * This method is to obsolete delivery schedule in the database
	 * @param scheduleID
	 * @return boolean
	 */
	public boolean obsoleteDeliverySchedule(int scheduleID) {
		String sql = "UPDATE delivery_schedule ";
		sql += "SET active=? WHERE scheduleID = ? ";
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setInt(2, scheduleID);
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
