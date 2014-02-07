package ffth.model;
import java.util.ArrayList;

public class Packing_List {
	private int packingListID;
	private String location;
	private String eventType;
	private int amountOfBags;
	public Delivery_Schedule contains;
	public ArrayList<Packing_List_Food_Item> unnamed_Packing_List_Food_Item_ = new ArrayList<Packing_List_Food_Item>();
	public Delivery_Schedule deliverySchedule;

	public Packing_List() {
	}

	public int getPackingListID() {
		return this.packingListID;
	}

	public void setPackingListID(int aPackingListID) {
		this.packingListID = aPackingListID;
	}

	public String getLocation() {
		return this.location;
	}

	public void setLocation(String aLocation) {
		this.location = aLocation;
	}

	public String getEventType() {
		return this.eventType;
	}

	public void setEventType(String aEventType) {
		this.eventType = aEventType;
	}

	public int getAmountOfBags() {
		return this.amountOfBags;
	}

	public void setAmountOfBags(int aAmountOfBags) {
		this.amountOfBags = aAmountOfBags;
	}
}