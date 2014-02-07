package ffth.model;

import java.sql.Date;
import java.sql.Time;

/**
 * This is the model class for the Delivery_Schedule
 * @author Lee Zhuo Xun
 *
 */
public class Delivery_Schedule {
	private int scheduleID;
	private String description;
	private String status;
	private Date date;
	private Time time;
	private int active;
	public Vehicle vehicle;
	public Packing_List packingList;
	public Beneficiary beneficiary;
	public Job job;
	
	/**
	 * This is the default constructor
	 */
	public Delivery_Schedule() {
	}
	
	/**
	 * This is the constructor to get all the data in Delivery_Schedule
	 * @param scheduleID
	 * @param description
	 * @param status
	 * @param date
	 * @param time
	 * @param active
	 */
	public Delivery_Schedule(int scheduleID, String description, String status, Date date, Time time, int active) {
		this.scheduleID = scheduleID;
		this.description = description;
		this.status = status;
		this.date = date;
		this.time = time;
		this.active = active;
	}

	/**
	 * This is the getter method for schedule id
	 * @return int
	 */
	public int getScheduleID() {
		return this.scheduleID;
	}

	/**
	 * This is the setter method for schedule id
	 * @param scheduleID
	 */
	public void setScheduleID(int scheduleID) {
		this.scheduleID = scheduleID;
	}

	/**
	 * This is the getter method for description
	 * @return String
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * This is the setter method for description
	 * @param description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * This is the getter method for status
	 * @return String
	 */
	public String getStatus() {
		return this.status;
	}

	/**
	 * This is the setter method for status
	 * @param status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * This is the getter method for date
	 * @return Date
	 */
	public Date getDate() {
		return this.date;
	}

	/**
	 * This is the setter method for date
	 * @param date
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * This is the getter method for time
	 * @return Time
	 */
	public Time getTime() {
		return this.time;
	}

	/**
	 * This is the setter method for time
	 * @param time
	 */
	public void setTime(Time time) {
		this.time = time;
	}

	/**
	 * This is the getter method for active
	 * @return int
	 */
	public int getActive() {
		return this.active;
	}

	/**
	 * This is the setter method for active
	 * @param active
	 */
	public void setActive(int active) {
		this.active = active;
	}

	/**
	 * This is the getter method for vehicle
	 * @return Vehicle
	 */
	public Vehicle getVehicle() {
		return vehicle;
	}

	/**
	 * This is the setter method for vehicle
	 * @param vehicle
	 */
	public void setVehicle(Vehicle vehicle) {
		this.vehicle = vehicle;
	}

	/**
	 * This is the getter method for packing list
	 * @return Packing_List
	 */
	public Packing_List getPackingList() {
		return packingList;
	}

	/**
	 * This is the setter method for packing list
	 * @param packingList
	 */
	public void setPackingList(Packing_List packingList) {
		this.packingList = packingList;
	}

	/**
	 * This is the getter method for beneficiary
	 * @return Beneficiary
	 */
	public Beneficiary getBeneficiary() {
		return beneficiary;
	}

	/**
	 * This is the setter method for beneficiary
	 * @param beneficiary
	 */
	public void setBeneficiary(Beneficiary beneficiary) {
		this.beneficiary = beneficiary;
	}

	/**
	 * This is the getter method for job
	 * @return Job
	 */
	public Job getJob() {
		return job;
	}

	/**
	 * This is the setter method for job
	 * @param job
	 */
	public void setJob(Job job) {
		this.job = job;
	}
}