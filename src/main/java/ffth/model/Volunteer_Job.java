package ffth.model;
public class Volunteer_Job {
	public Job unnamed_Job_;
	public Volunteer unnamed_Volunteer_;
	private int jobID;
	private int userID;

	public void setUnnamed_Job_(Job aUnnamed_Job_) {
		this.unnamed_Job_ = aUnnamed_Job_;
	}

	public Job getUnnamed_Job_() {
		return this.unnamed_Job_;
	}

	public void setUnnamed_Volunteer_(Volunteer aUnnamed_Volunteer_) {
		this.unnamed_Volunteer_ = aUnnamed_Volunteer_;
	}

	public Volunteer getUnnamed_Volunteer_() {
		return this.unnamed_Volunteer_;
	}
	
	
	
	public int getJobID() {
		return this.jobID;
	}

	public void setJobID(int aJobID) {
		this.jobID = aJobID;
	}
	
	public int getUserID() {
		return this.userID;
	}

	public void setUserID(int aUserID) {
		this.userID = aUserID;
	}
	
}