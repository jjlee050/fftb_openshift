package ffth.data;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ffth.controller.DBController;
import ffth.model.Beneficiary;
import ffth.model.School;
import ffth.model.Self_Collection_Centre;

/**
 * This is the data access class to retrieve table from the parent class Beneficiary and child class (School and Self-Collection Centre)
 * @author Lee Zhuo Xun
 *
 */
public class BeneficiaryManager {
	private DBController dbController = new DBController();

	/**
	 * This method is to insert beneficiary into database
	 * @param beneficiary
	 * @return boolean
	 */
	public boolean insertBeneficiary(Beneficiary beneficiary) {
		String sql = "INSERT INTO beneficiary ";
		sql += "VALUES( null , ? , ? , ? , ? , ? , ? , ? )";
		String sql1 = "INSERT INTO school ";
		sql1 += "VALUES( ? , ? )";
		String sql2 = "INSERT INTO self_collection_centre ";
		sql2 += "VALUES( ? , ? , ? , ? )";
		String sql3 = "SELECT beneficiaryID + 1 FROM beneficiary ORDER BY beneficiaryID DESC ";
		sql3 += "LIMIT 1";
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps3 = conn.prepareStatement(sql3);
			ResultSet rs = ps3.executeQuery();
			if (beneficiary instanceof School) {
				PreparedStatement ps = conn.prepareStatement(sql1);
				PreparedStatement ps1 = conn.prepareStatement(sql);
				ps1.setString(1, beneficiary.getName());
				ps1.setString(2, beneficiary.getType());
				ps1.setString(3, beneficiary.getAddress());
				ps1.setInt(4, beneficiary.getNumberOfBeneficiary());
				ps1.setTimestamp(5, beneficiary.getDateOfRegistration());
				ps1.setString(6, beneficiary.getImage());
				ps1.setInt(7, beneficiary.getActive());
				System.out.println(ps1);
				ps1.executeUpdate();
				if(rs.next()){
					ps.setInt(1, rs.getInt("beneficiaryID + 1"));
				}
				ps.setString(2, ((School) beneficiary).getDescription());
				System.out.println(ps);
				ps.executeUpdate();
			}
			else if (beneficiary instanceof Self_Collection_Centre) {
				PreparedStatement ps = conn.prepareStatement(sql2);
				PreparedStatement ps1 = conn.prepareStatement(sql);
				ps1.setString(1, beneficiary.getName());
				ps1.setString(2, beneficiary.getType());
				ps1.setString(3, beneficiary.getAddress());
				ps1.setInt(4, beneficiary.getNumberOfBeneficiary());
				ps1.setTimestamp(5, beneficiary.getDateOfRegistration());
				ps1.setString(6, beneficiary.getImage());
				ps1.setInt(7, beneficiary.getActive());
				System.out.println(ps1);
				ps1.executeUpdate();
				if(rs.next()){
					ps.setInt(1, rs.getInt("beneficiaryID + 1"));
				}
				ps.setString(2,((Self_Collection_Centre) beneficiary).getContactName());
				ps.setString(3, ((Self_Collection_Centre) beneficiary).getContactEmail());
				ps.setString(4, ((Self_Collection_Centre) beneficiary).getContactPhone());
				System.out.println(ps);
				ps.executeUpdate();
			} 
			else {
				success = false;
			}
			conn.setAutoCommit(true);
			conn.close();
			success = true;
		} 
		catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}

	/**
	 * This method is to retrieve all beneficiary from the database.
	 * @return ArrayList<Beneficiary>
	 */
	public ArrayList<Beneficiary> getAllBeneficiarys() {
		String sql = "SELECT * FROM beneficiary";
		ArrayList<Beneficiary> beneficiaryArrList = new ArrayList<Beneficiary>();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Beneficiary beneficiary = new Beneficiary();
				beneficiary.setBeneficiaryID(rs.getInt("beneficiaryID"));
				beneficiary.setName(rs.getString("name"));
				beneficiary.setType(rs.getString("type"));
				beneficiary.setAddress(rs.getString("address"));
				beneficiary.setNumberOfBeneficiary(rs.getInt("numberOfBeneficiary"));
				beneficiary.setDateOfRegistration(rs.getTimestamp("dateOfRegistration"));
				beneficiary.setImage(rs.getString("image"));
				beneficiary.setActive(rs.getInt("active"));
				if(rs.getInt("active") == 1){
					beneficiaryArrList.add(beneficiary);
				}
			}
			conn.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
			beneficiaryArrList = null;
		}
		return beneficiaryArrList;
	}

	/**
	 * This method is to retrieve a particular beneficiary from the database
	 * @param beneficiaryID
	 * @return Beneficiary
	 */
	public Beneficiary getBeneficiary(int beneficiaryID) {
		String sql = "SELECT * FROM beneficiary b LEFT JOIN school s on b.beneficiaryID = s.beneficiaryID LEFT JOIN self_collection_centre scc ON b.beneficiaryID = scc.beneficiaryID WHERE b.beneficiaryID=? AND active = ?";
		Beneficiary beneficiary = null;
		School school = new School();
		Self_Collection_Centre selfCollectionCentre = new Self_Collection_Centre();
		try {
			Connection conn = dbController.getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, beneficiaryID);
			ps.setInt(2, 1);
			System.out.println(ps);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				if (rs.getString("type").equals("School")) {
					school.setBeneficiaryID(rs.getInt("b.beneficiaryID"));
					school.setName(rs.getString("b.name"));
					school.setType(rs.getString("b.type"));
					school.setAddress(rs.getString("b.address"));
					school.setNumberOfBeneficiary(rs.getInt("b.numberOfBeneficiary"));
					school.setDateOfRegistration(rs.getTimestamp("b.dateOfRegistration"));
					school.setImage(rs.getString("b.image"));
					school.setActive(rs.getInt("b.active"));
					school.setDescription(rs.getString("s.description"));
					beneficiary = school;
				} 
				else if (rs.getString("type").equals("Self Collection Centre")) {
					selfCollectionCentre.setBeneficiaryID(rs.getInt("b.beneficiaryID"));
					selfCollectionCentre.setName(rs.getString("b.name"));
					selfCollectionCentre.setType(rs.getString("b.type"));
					selfCollectionCentre.setAddress(rs.getString("b.address"));
					selfCollectionCentre.setNumberOfBeneficiary(rs.getInt("b.numberOfBeneficiary"));
					selfCollectionCentre.setDateOfRegistration(rs.getTimestamp("b.dateOfRegistration"));
					selfCollectionCentre.setImage(rs.getString("b.image"));
					selfCollectionCentre.setActive(rs.getInt("b.active"));
					selfCollectionCentre.setContactName(rs.getString("scc.name"));
					selfCollectionCentre.setContactEmail(rs.getString("scc.email"));
					selfCollectionCentre.setContactPhone(rs.getString("scc.phone"));
					beneficiary = selfCollectionCentre;
				} 
				else {
					beneficiary = null;
				}
			}
			conn.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
			beneficiary = null;
		}
		return beneficiary;
	}

	/**
	 * This method is to update a particular beneficiary in the database
	 * @param beneficiary
	 * @return boolean
	 */
	public boolean updateBeneficiary(Beneficiary beneficiary) {
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			if (beneficiary.getImage() != null ) {
				String sql = "UPDATE beneficiary ";
				sql += "SET name=? , address=? , numberOfBeneficiary=? , image = ? WHERE beneficiaryID = ? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, beneficiary.getName());
				ps.setString(2, beneficiary.getAddress());
				ps.setInt(3, beneficiary.getNumberOfBeneficiary());
				ps.setString(4, beneficiary.getImage());
				ps.setInt(5, beneficiary.getBeneficiaryID());
				System.out.println(ps);
				ps.executeUpdate();
				if (beneficiary instanceof School) {
					String sql1 = "UPDATE school ";
					sql1 += "SET description=? WHERE beneficiaryID = ? ";
					PreparedStatement ps1 = conn.prepareStatement(sql1);
					ps1.setString(1, ((School) beneficiary).getDescription());
					ps1.setInt(2, beneficiary.getBeneficiaryID());
					System.out.println(ps1);
					ps1.executeUpdate();
				} 
				else if (beneficiary instanceof Self_Collection_Centre) {
					String sql1 = "UPDATE self_collection_centre ";
					sql1 += "SET name=? , email=? , phone=? WHERE beneficiaryID = ? ";
					PreparedStatement ps1 = conn.prepareStatement(sql1);
					ps1.setString(1, ((Self_Collection_Centre) beneficiary).getContactName());
					ps1.setString(2, ((Self_Collection_Centre) beneficiary).getContactEmail());
					ps1.setString(3, ((Self_Collection_Centre) beneficiary).getContactPhone());
					ps1.setInt(4, beneficiary.getBeneficiaryID());
					System.out.println(ps1);
					ps1.executeUpdate();
				} 
				else {
					success = false;
				}
			} 
			else {
				String sql = "UPDATE beneficiary ";
				sql += "SET name=? , address=? , numberOfBeneficiary=? WHERE beneficiaryID = ? ";
				PreparedStatement ps = conn.prepareStatement(sql);
				ps.setString(1, beneficiary.getName());
				ps.setString(2, beneficiary.getAddress());
				ps.setInt(3, beneficiary.getNumberOfBeneficiary());
				ps.setInt(4, beneficiary.getBeneficiaryID());
				System.out.println(ps);
				ps.executeUpdate();
				if (beneficiary instanceof School) {
					String sql1 = "UPDATE school ";
					sql1 += "SET description=? WHERE beneficiaryID = ? ";
					PreparedStatement ps1 = conn.prepareStatement(sql1);
					ps1.setString(1, ((School) beneficiary).getDescription());
					ps1.setInt(2, beneficiary.getBeneficiaryID());
					System.out.println(ps1);
					ps1.executeUpdate();
				}
				else if (beneficiary instanceof Self_Collection_Centre) {
					String sql1 = "UPDATE self_collection_centre ";
					sql1 += "SET name=? , email=? , phone=? WHERE beneficiaryID = ? ";
					PreparedStatement ps1 = conn.prepareStatement(sql1);
					ps1.setString(1, ((Self_Collection_Centre) beneficiary).getContactName());
					ps1.setString(2, ((Self_Collection_Centre) beneficiary).getContactEmail());
					ps1.setString(3, ((Self_Collection_Centre) beneficiary).getContactPhone());
					ps1.setInt(4, beneficiary.getBeneficiaryID());
					System.out.println(ps1);
					ps1.executeUpdate();
				} 
				else {
					success = false;
				}
			}
			conn.setAutoCommit(true);
			conn.close();
			success = true;
		} catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}
	
	/**
	 * This method is to obsolete a particular beneficiary in the database
	 * @param beneficiaryID
	 * @return boolean
	 */
	public boolean obsoleteBeneficiary(int beneficiaryID) {
		String sql = "UPDATE beneficiary ";
		sql += "SET active=? WHERE beneficiaryID = ? ";
		boolean success = false;
		try {
			Connection conn = dbController.getConnection();
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, 0);
			ps.setInt(2, beneficiaryID);
			System.out.println(ps);
			ps.executeUpdate();
			conn.setAutoCommit(true);
			conn.close();
			success = true;
		}
		catch (Exception e) {
			e.printStackTrace();
			success = false;
		}
		return success;
	}
}
