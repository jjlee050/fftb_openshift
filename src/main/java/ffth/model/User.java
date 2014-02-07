package ffth.model;
import java.sql.Timestamp;
import java.util.ArrayList;

public class User {
	private int userID;
	private String userName;
	private String password;
	private String type;
	private String imageFile;
	public ArrayList<Volunteer> volunteer = new ArrayList<Volunteer>();

	public User() {}
	
	public User(int userID, String userName, String password, String type, String imageFile) {
		this.userID = userID;
		this.userName = userName;
		this.password = password;
		this.type = type;
		this.imageFile = imageFile;
	}

	public int getUserID() {
		return this.userID;
	}

	public void setUserID(int aUserID) {
		this.userID = aUserID;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String aUserName) {
		this.userName = aUserName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String aPassword) {
		this.password = aPassword;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String aType) {
		this.type = aType;
	}

	public String getImageFile() {
		return this.imageFile;
	}

	public void setImageFile(String aImageFile) {
		this.imageFile = aImageFile;
	}
}