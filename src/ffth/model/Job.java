package ffth.model;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Date;

public class Job {
	private int scheduleID;
	private int jobID;
	private String type;
	private String description;
	private Date date;
	private Time startTime;
	private Time endTime;
	private int slot;
	public Delivery_Schedule provide;
	public Delivery_Schedule schedule;
	public Volunteer user;
	public ArrayList<Volunteer_Job> unnamed_Volunteer_Job_ = new ArrayList<Volunteer_Job>();
	public Volunteer books;

	public Job() {
	}

	public int getJobID() {
		return this.jobID;
	}

	public void setJobID(int aJobID) {
		this.jobID = aJobID;
	}
	
	public int getScheduleID() {
		return this.scheduleID;
	}

	public void setScheduleID(int aScheduleID) {
		this.scheduleID = aScheduleID;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String aType) {
		this.type = aType;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String aDescription) {
		this.description = aDescription;
	}

	public Date getDate() {
		return this.date;
	}

	public void setDate(Date aDate) {
		this.date = aDate;
	}

	public Time getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Time aStartTime) {
		this.startTime = aStartTime;
	}

	public Time getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Time aEndTime) {
		this.endTime = aEndTime;
	}

	public int getSlot() {
		return this.slot;
	}

	public void setSlot(int aSlot) {
		this.slot = aSlot;
	}
	
}