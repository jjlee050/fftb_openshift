package ffth.servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ffth.controller.ApacheFileUploadController;
import ffth.data.BeneficiaryManager;
import ffth.model.Beneficiary;
import ffth.model.School;
import ffth.model.Self_Collection_Centre;

/**
 * Servlet implementation class createBeneficiaryServlet
 */
@WebServlet("/createBeneficiaryServlet")
public class createBeneficiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApacheFileUploadController apacheFileUploadController = new ApacheFileUploadController();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createBeneficiaryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BeneficiaryManager beneficiaryManager = new BeneficiaryManager();
		Beneficiary beneficiary = new Beneficiary();		
		
        ArrayList<String> values = apacheFileUploadController.readValuesfromBeneficiaryForm(request);
		String saveFile=apacheFileUploadController.getSaveFile();
        
        System.out.println(saveFile);
		RequestDispatcher rd = null;
		Date date= new Date();
		School school = new School();
		Self_Collection_Centre selfCollectionCentre = new Self_Collection_Centre();
		beneficiary.setName(values.get(1));
		beneficiary.setType(values.get(0));
		beneficiary.setAddress(values.get(2));
		beneficiary.setNumberOfBeneficiary(Integer.parseInt(values.get(3)));
		beneficiary.setImage(saveFile);
		if((values.get(values.size()-2).length() == 0)){
			selfCollectionCentre.setBeneficiaryID(beneficiary.getBeneficiaryID());
			selfCollectionCentre.setName(beneficiary.getName());
			selfCollectionCentre.setType("Self Collection Centre");
			selfCollectionCentre.setAddress(beneficiary.getAddress());
			selfCollectionCentre.setNumberOfBeneficiary(beneficiary.getNumberOfBeneficiary());
			selfCollectionCentre.setDateOfRegistration(new Timestamp(date.getTime()));
			selfCollectionCentre.setImage(beneficiary.getImage());
			selfCollectionCentre.setActive(1);
			selfCollectionCentre.setContactName(values.get(4));
			selfCollectionCentre.setContactEmail(values.get(5));
			selfCollectionCentre.setContactPhone(values.get(6));
			beneficiary = selfCollectionCentre;
		}
		else{
			school.setBeneficiaryID(beneficiary.getBeneficiaryID());
			school.setName(beneficiary.getName());
			school.setType("School");
			school.setAddress(beneficiary.getAddress());
			school.setNumberOfBeneficiary(beneficiary.getNumberOfBeneficiary());
			school.setDateOfRegistration(new Timestamp(date.getTime()));
			school.setImage(beneficiary.getImage());
			school.setActive(1);
			school.setDescription(values.get(7));
			beneficiary = school;
		}
		try{
			boolean success = false;
			System.out.println(beneficiary.getImage());
			if(beneficiary.getType().equals("School")){
				 success = beneficiaryManager.insertBeneficiary(school);
			}
			else if(beneficiary.getType().equals("Self Collection Centre")){
				 success = beneficiaryManager.insertBeneficiary(selfCollectionCentre);
			}
			if(success){
				rd = request.getRequestDispatcher("createBeneficiaryDone.jsp");
			}
		}
		catch (Exception ex){
			throw new ServletException(ex);
		}
		rd.forward(request, response);
	}

}
