package ffth.model;
import java.util.ArrayList;
import java.util.Date;

public class Donator {
	private int donatorID;
	private String name;
	private Date dateOfDonation;
	public ArrayList<Food> donate = new ArrayList<Food>();

	public Donator() {
		throw new UnsupportedOperationException();
	}

	public int getDonatorID() {
		return this.donatorID;
	}

	public void setDonatorID(int aDonatorID) {
		this.donatorID = aDonatorID;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String aName) {
		this.name = aName;
	}

	public Date getDateOfDonation() {
		return this.dateOfDonation;
	}

	public void setDateOfDonation(Date aDateOfDonation) {
		this.dateOfDonation = aDateOfDonation;
	}
}