package ffth.model;

import java.sql.Timestamp;

/**
 * This is the model class for the Beneficiary
 * @author Lee Zhuo Xun
 *
 */
public class Beneficiary {
	private int beneficiaryID;
	private String name;
	private String type;
	private String address;
	private int numberOfBeneficiary;
	private Timestamp dateOfRegistration;
	private String image;
	private int active;

	/**
	 * This is the default constructor
	 */
	public Beneficiary() {
	}

	/**
	 * This is the constructor to get all the data in Beneficiary
	 * @param beneficiaryID
	 * @param name
	 * @param type
	 * @param address
	 * @param numberOfBeneficiary
	 * @param dateOfRegistration
	 * @param image
	 * @param active
	 */
	public Beneficiary(int beneficiaryID, String name, String type, String address, int numberOfBeneficiary, Timestamp dateOfRegistration, String image, int active) {
		this.beneficiaryID = beneficiaryID;
		this.name = name;
		this.type = type;
		this.address = address;
		this.numberOfBeneficiary = numberOfBeneficiary;
		this.dateOfRegistration = dateOfRegistration;
		this.image = image;
		this.active = active;
	}

	/**
	 * This is the getter method for beneficiary id
	 * @return int
	 */
	public int getBeneficiaryID() {
		return this.beneficiaryID;
	}

	/**
	 * This is the setter method for beneficiary id
	 * @param beneficiaryID
	 */
	public void setBeneficiaryID(int beneficiaryID) {
		this.beneficiaryID = beneficiaryID;
	}

	/**
	 * This is the getter method for name
	 * @return String
	 */
	public String getName() {
		return this.name;
	}

	/**
	 * This is the setter method for name
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * This is the getter method for type
	 * @return String
	 */
	public String getType() {
		return this.type;
	}

	/**
	 * This is the setter method for type
	 * @param type
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * This is the getter method for address
	 * @return String
	 */
	public String getAddress() {
		return this.address;
	}

	/**
	 * This is the setter method for address
	 * @param address
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * This is the getter method for number of beneficiary
	 * @return int
	 */
	public int getNumberOfBeneficiary() {
		return this.numberOfBeneficiary;
	}

	/**
	 * This is the setter method for number of beneficiary
	 * @param numberOfBeneficiary
	 */
	public void setNumberOfBeneficiary(int numberOfBeneficiary) {
		this.numberOfBeneficiary = numberOfBeneficiary;
	}

	/**
	 * This is the getter method for date of registration
	 * @return Timestamp
	 */
	public Timestamp getDateOfRegistration() {
		return this.dateOfRegistration;
	}

	/**
	 * This is the setter method for date of registration
	 * @param dateOfRegistration
	 */
	public void setDateOfRegistration(Timestamp dateOfRegistration) {
		this.dateOfRegistration = dateOfRegistration;
	}

	/**
	 * This is the getter method for image file
	 * @return String
	 */
	public String getImage() {
		return this.image;
	}

	/**
	 * This is the setter method for image file
	 * @param image
	 */
	public void setImage(String image) {
		this.image = image;
	}

	/**
	 * This is the getter method for active
	 * @return int
	 */
	public int getActive() {
		return this.active;
	}

	/**
	 * This is the setter method for active
	 * @param active
	 */
	public void setActive(int active) {
		this.active = active;
	}
}