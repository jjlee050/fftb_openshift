package ffth.model;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.Date;

public class Volunteer extends User {
	private int userID;
	private String name;
	private String email;
	private String address;
	private String contactNo;
	private Timestamp dateOfRegistration;
	private String gender;
	private Date dateOfBirth;
	public ArrayList<Volunteer_Job> unnamed_Volunteer_Job_ = new ArrayList<Volunteer_Job>();
	//public User user;
	public ArrayList<Feedback> give = new ArrayList<Feedback>();
	public ArrayList<Feedback> feedback = new ArrayList<Feedback>();
	public ArrayList<Job> job = new ArrayList<Job>();
	public ArrayList<Job> books = new ArrayList<Job>();

	public Volunteer() {
	}
	
	public Volunteer(int userID, String userName, String password, String type, String imageFile, String name, String email, String contactNo, Timestamp dateOfRegistration, String gender, Date dateOfBirth) {
		super(userID, userName, password, type, imageFile);
		this.name = name;
		this.email = email;
		this.contactNo = contactNo;
		this.dateOfRegistration = dateOfRegistration;
		this.gender = gender;
		this.dateOfBirth = dateOfBirth;
	}
	
	public int getUserID() {
		return this.userID;
	}

	public void setUserID(int aUserID) {
		this.userID = aUserID;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String aName) {
		this.name = aName;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String aEmail) {
		this.email = aEmail;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String aAddress) {
		this.address = aAddress;
	}

	public String getContactNo() {
		return this.contactNo;
	}

	public void setContactNo(String aContactNo) {
		this.contactNo = aContactNo;
	}

	public Timestamp getDateOfRegistration() {
		return this.dateOfRegistration;
	}

	public void setDateOfRegistration(Timestamp aDateOfRegistration) {
		this.dateOfRegistration = aDateOfRegistration;
	}

	public String getGender() {
		return this.gender;
	}

	public void setGender(String aGender) {
		this.gender = aGender;
	}

	public Date getDateOfBirth() {
		return this.dateOfBirth;
	}

	public void setDateOfBirth(Date aDateOfBirth) {
		this.dateOfBirth = aDateOfBirth;
	}

}