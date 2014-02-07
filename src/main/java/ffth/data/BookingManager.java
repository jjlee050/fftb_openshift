package ffth.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ffth.controller.DBController;
import ffth.model.Job;
import ffth.model.Volunteer_Job;

public class BookingManager {
	private DBController dbController = new DBController();
	
	public boolean insertRecord(Volunteer_Job record) {
		String sql = "INSERT INTO volunteer_job ";
		sql += "VALUES( ? , ? )";
		
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			
			PreparedStatement ps = conn.prepareStatement(sql);
				
			ps.setInt(1, record.getUserID());
			ps.setInt(2, record.getJobID());
			
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
	
	public ArrayList<Volunteer_Job> getAllRecords() {
		String sql = "SELECT * FROM volunteer_job";
		ArrayList<Volunteer_Job> recordArrList = new ArrayList<Volunteer_Job>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Volunteer_Job record = new Volunteer_Job();
				
				record.setUserID(rs.getInt("userID"));
				record.setJobID(rs.getInt("jobID"));
					
				recordArrList.add(record);
			}
			conn.close();
			return recordArrList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
