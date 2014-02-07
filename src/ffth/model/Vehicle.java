package ffth.model;

/**
 * This is the model class for Vehicle 
 * @author Lee Zhuo Xun
 *
 */
public class Vehicle {
	private String vehicleNo;
	private String model;
	private float weight;
	private String status;
	private String type;
	private String image;
	private int active;

	/**
	 * This is the default constructor
	 */
	public Vehicle() {
	}
	
	/**
	 * This is the constructor to get all the data in Vehicle
	 * @param vehicleNo
	 * @param model
	 * @param weight
	 * @param status
	 * @param type
	 * @param image
	 * @param active
	 */
	public Vehicle(String vehicleNo, String model, float weight, String status,String type, String image, int active) {
		this.vehicleNo = vehicleNo;
		this.model = model;
		this.weight = weight;
		this.status = status;
		this.type = type;
		this.image = image;
		this.active = active;
	}

	/**
	 * This is the getter method for vehicle number
	 * @return String
	 */
	public String getVehicleNo() {
		return this.vehicleNo;
	}

	/**
	 * This is the setter method for vehicle number
	 * @param vehicleNo
	 */
	public void setVehicleNo(String vehicleNo) {
		this.vehicleNo = vehicleNo;
	}

	/**
	 * This is the getter method for vehicle model
	 * @return String
	 */
	public String getModel() {
		return this.model;
	}

	/**
	 * This is the setter method for vehicle model
	 * @param model
	 */
	public void setModel(String model) {
		this.model = model;
	}

	/**
	 * This is the getter method for vehicle weight
	 * @return float
	 */
	public float getWeight() {
		return this.weight;
	}

	/**
	 * This is the setter method for vehicle weight
	 * @param weight
	 */
	public void setWeight(float weight) {
		this.weight = weight;
	}

	/**
	 * This is the getter method for vehicle status
	 * @return String
	 */
	public String getStatus() {
		return this.status;
	}

	/**
	 * This is the setter method for vehicle status
	 * @param status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * This is the getter method for vehicle type
	 * @return String
	 */
	public String getType() {
		return this.type;
	}

	/**
	 * This is the setter method for vehicle type
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * This is the getter method for vehicle image
	 * @return String
	 */
	public String getImage() {
		return this.image;
	}

	/**
	 * This is the setter method for vehicle image
	 * @param image
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * This is the getter method for vehicle active status
	 * @return int
	 */
	public int getActive() {
		return this.active;
	}

	/**
	 * This is the setter method for vehicle active status
	 * @param active
	 */
	public void setActive(int active) {
		this.active = active;
	}
}