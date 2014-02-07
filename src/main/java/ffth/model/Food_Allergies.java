package ffth.model;
public class Food_Allergies {
	private int foodID;
	private String description;
	public Food add;
	public Food provide;

	public Food_Allergies() {
	}

	public int getFoodID() {
		return this.foodID;
	}

	public void setFoodID(int aFoodID) {
		this.foodID = aFoodID;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String aDescription) {
		this.description = aDescription;
	}

	public void setDescription(String[] parameterValues) {
		// TODO Auto-generated method stub
		
	}
}