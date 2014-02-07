package ffth.model;

import java.sql.Timestamp;

/**
 * This is the model class for Self Collection Centre
 * @author Lee Zhuo Xun
 *
 */
public class Self_Collection_Centre extends Beneficiary {
	private String contactName;
	private String contactEmail;
	private String contactPhone;

	/**
	 * This is the default constructor
	 */
	public Self_Collection_Centre() {
	}
	
	/**
	 * This is the constructor to get all the data in Self_Collection_Centre
	 * @param beneficiaryID
	 * @param name
	 * @param type
	 * @param address
	 * @param numberOfBeneficiary
	 * @param dateOfRegistration
	 * @param imageFile
	 * @param active
	 * @param contactName
	 * @param contactEmail
	 * @param contactPhone
	 */
	public Self_Collection_Centre(int beneficiaryID, String name, String type, String address, int numberOfBeneficiary, Timestamp dateOfRegistration, String imageFile, int active, String contactName, String contactEmail, String contactPhone) {
		super(beneficiaryID, name, type, address, numberOfBeneficiary, dateOfRegistration, imageFile, active);
		this.contactName = contactName;
		this.contactEmail = contactEmail;
		this.contactPhone = contactPhone;
	}

	/**
	 * This is the getter method for contact name
	 * @return String
	 */
	public String getContactName() {
		return this.contactName;
	}

	/**
	 * This is the setter method for contact name
	 * @param contactName
	 */
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}

	/**
	 * This is the getter method for contact email
	 * @return String
	 */
	public String getContactEmail() {
		return this.contactEmail;
	}

	/**
	 * This is the setter method for contact email
	 * @param contactEmail
	 */
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	/**
	 * This is the getter method for contact phone
	 * @return String
	 */
	public String getContactPhone() {
		return this.contactPhone;
	}

	/**
	 * This is the setter method for contact phone
	 * @param contactPhone
	 */
	public void setContactPhone(String contactPhone) {
		this.contactPhone = contactPhone;
	}
}