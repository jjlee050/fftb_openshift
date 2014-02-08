package ffth.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ffth.controller.DBController;
import ffth.model.Job;
import ffth.model.User;
import ffth.model.Volunteer;

public class JobManager {
	
	private DBController dbController = new DBController();

	/**
	 * This method is to insert job into database
	 * @param volunteer
	 * @return boolean
	 */
	public boolean insertJob(Job job) {
		String sql = "INSERT INTO job ";
		sql += "VALUES( ? , ? , ? , ? , ? , ? , ?)";
		
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			
				PreparedStatement ps = conn.prepareStatement(sql);
				
				ps.setInt(1, job.getJobID());
				ps.setString(2, job.getType());
				//ps.setDate(3, job.getDate());
				ps.setTime(3, job.getStartTime());
				ps.setTime(3, job.getEndTime());
				ps.setInt(3, job.getSlot());
				ps.setString(4, job.getDescription());
				
				
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
	
	/**
	 * This method is to retrieve all job from the database.
	 * @return ArrayList<Volunteer>
	 */
	public ArrayList<Job> getAllJobs() {
		String sql = "SELECT * FROM job";
		ArrayList<Job> jobArrList = new ArrayList<Job>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Job job = new Job();
				job.setJobID(rs.getInt("jobID"));
				job.setScheduleID(rs.getInt("scheduleID"));
				job.setType(rs.getString("type"));
				job.setDate(rs.getDate("Date"));
				job.setStartTime(rs.getTime("startTime"));
				job.setEndTime(rs.getTime("endTime"));
				job.setSlot(rs.getInt("slot"));
				job.setDescription(rs.getString("description"));
			
				jobArrList.add(job);
			}
			conn.close();
			return jobArrList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public ArrayList<Job> getBookedJobs(int userID) {
		String sql = "SELECT * FROM job WHERE userID = " + userID;
		ArrayList<Job> jobArrList = new ArrayList<Job>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Job job = new Job();
				job.setJobID(rs.getInt("jobID"));
				job.setScheduleID(rs.getInt("scheduleID"));
				job.setType(rs.getString("type"));
				job.setDate(rs.getDate("Date"));
				job.setStartTime(rs.getTime("startTime"));
				job.setEndTime(rs.getTime("endTime"));
				job.setSlot(rs.getInt("slot"));
				job.setDescription(rs.getString("description"));
			
				jobArrList.add(job);
			}
			conn.close();
			return jobArrList;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public boolean checkBooked(int userID, int jobID) {
		String sql = "SELECT * FROM volunteer_job WHERE userID = " + userID + " AND jobID = " + jobID;
		//ArrayList<Job> jobArrList = new ArrayList<Job>();
		boolean booked = false;
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				booked = true;
			}
			else{
				booked = false;
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return booked;
	}
	
	public Job getJob(int jobID) {
		String sql = "SELECT * FROM job WHERE jobID = " + jobID;
		System.out.println(sql);
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			//ps.setInt(1, userID);
			//ps.setInt(2, 1);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			Job job = new Job();
			if (rs.next()) {
				job.setJobID(rs.getInt("jobID"));
				job.setScheduleID(rs.getInt("scheduleID"));
				job.setType(rs.getString("type"));
				job.setDescription(rs.getString("description"));
				job.setDate(rs.getDate("date"));
				job.setStartTime(rs.getTime("startTime"));
				job.setEndTime(rs.getTime("endTime"));
				job.setSlot(rs.getInt("slot"));
			} 
			else {
					return null;
				}
			
			conn.close();
			return job;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}


	
}