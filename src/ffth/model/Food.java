package ffth.model;
import java.util.ArrayList;
import java.sql.Date;

public class Food {
	private int foodID;
	private String name;
	private float weight;
	private String type;
	private Date expiryDate;
	private int vegetarian;
	private int halal;
	private String imageFile;
	private int active;
	private String allergies;
	private String nameOfDonator;
	private Date dateOfDonation;
	private String description;
	private int rows;
	private int location;
	public Donator donate;
	public ArrayList<Report_Food> unnamed_Report_Food_ = new ArrayList<Report_Food>();
	public ArrayList<Food_Allergies> foodAllergiesArrList = new ArrayList<Food_Allergies>();
	public ArrayList<Food_Allergies> provide = new ArrayList<Food_Allergies>();
	public Food_Location provides;
	public ArrayList<Packing_List_Food_Item> unnamed_Packing_List_Food_Item_ = new ArrayList<Packing_List_Food_Item>();
	private int quantity;
	
	public Food() {
	}

	public Food(String name, float weight, String type, Date date, int vegetarian, int halal, Date dateOfDonation, int location){
		this.name = name;
		this.weight = weight;
		this.type = type;
		this.expiryDate = date;
		this.vegetarian = vegetarian;
		this.halal = halal;
		this.dateOfDonation = dateOfDonation;
		this.location = location;
	}
	
	public Food(String nameOfDonator, Date dateOfDonation){
		this.nameOfDonator = nameOfDonator;
		this.dateOfDonation = dateOfDonation;
	}
	
	public Food(String allergies, int rows){
		this.setAllergies(allergies);
		this.rows = rows;
	}

	public int getFoodID() {
		return this.foodID;
	}

	public void setFoodID(int aFoodID) {
		this.foodID = aFoodID;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String aName) {
		this.name = aName;
	}

	public float getWeight() {
		return this.weight;
	}

	public void setWeight(float aWeight) {
		this.weight = aWeight;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String aType) {
		this.type = aType;
	}

	public Date getExpiryDate() {
		return this.expiryDate;
	}

	public void setExpiryDate(Date aExpiryDate) {
		this.expiryDate = aExpiryDate;
	}

	public int getVegetarian() {
		return this.vegetarian;
	}

	public void setVegetarian(int aVegetarian) {
		this.vegetarian = aVegetarian;
	}

	public int getHalal() {
		return this.halal;
	}

	public void setHalal(int aHalal) {
		this.halal = aHalal;
	}

	public String getImageFile() {
		return this.imageFile;
	}

	public void setImageFile(String aImageFile) {
		this.imageFile = aImageFile;
	}

	public int getActive() {
		return this.active;
	}

	public void setActive(int aActive) {
		this.active = aActive;
	}
	
	public String getAllergies() {
		return allergies;
	}

	public void setAllergies(String allergies) {
		this.allergies = allergies;
	}

	public ArrayList<Food_Allergies> getFoodAllergiesArrList() {
		return foodAllergiesArrList;
	}

	public void setFoodAllergiesArrList(
			ArrayList<Food_Allergies> foodAllergiesArrList) {
		this.foodAllergiesArrList = foodAllergiesArrList;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getNameOfDonator() {
		return nameOfDonator;
	}

	public void setNameOfDonator(String nameOfDonator) {
		this.nameOfDonator = nameOfDonator;
	}

	public Date getDateOfDonation() {
		return dateOfDonation;
	}

	public void setDateOfDonation(Date dateOfDonation) {
		this.dateOfDonation = dateOfDonation;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getLocation() {
		return location;
	}

	public void setLocation(int location) {
		this.location = location;
	}
	
}