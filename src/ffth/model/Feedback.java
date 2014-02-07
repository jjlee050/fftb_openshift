package ffth.model;
public class Feedback {
	private int userID;
	private String title;
	private String description;
	public Volunteer give;
	public Volunteer user;

	public Feedback() {
		throw new UnsupportedOperationException();
	}

	public int getUserID() {
		return this.userID;
	}

	public void setUserID(int aUserID) {
		this.userID = aUserID;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String aTitle) {
		this.title = aTitle;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String aDescription) {
		this.description = aDescription;
	}
}