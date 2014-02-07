package ffth.model;
import java.util.ArrayList;

public class Food_Location {
	private int locationID;
	private String description;
	public ArrayList<Food> provides = new ArrayList<Food>();

	public Food_Location() {
		throw new UnsupportedOperationException();
	}

	public int getLocationID() {
		return this.locationID;
	}

	public void setLocationID(int aLocationID) {
		this.locationID = aLocationID;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String aDescription) {
		this.description = aDescription;
	}
}