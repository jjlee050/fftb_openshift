package ffth.model;

import java.sql.Timestamp;

/**
 * This is the model class for School
 * @author Lee Zhuo Xun
 *
 */
public class School extends Beneficiary {
	private String description;

	/**
	 * This is the default constructor
	 */
	public School() {
	}
	
	/**
	 * This is the constructor to get all the data in School
	 * @param beneficiaryID
	 * @param name
	 * @param type
	 * @param address
	 * @param numberOfBeneficiary
	 * @param dateOfRegistration
	 * @param imageFile
	 * @param active
	 * @param description
	 */
	public School(int beneficiaryID, String name, String type, String address, int numberOfBeneficiary, Timestamp dateOfRegistration, String imageFile, int active, String description) {
		super(beneficiaryID, name, type, address, numberOfBeneficiary,dateOfRegistration, imageFile, active);
		this.description = description;
	}

	/**
	 * This is the getter method for description
	 * @return String
	 */
	public String getDescription() {
		return this.description;
	}

	/**
	 * This is the setter method for description
	 * @param description
	 */
	public void setDescription(String description) {
		this.description = description;
	}
}