package ffth.servlet;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class updateBeneficiaryServlet
 */
@WebServlet("/updateBeneficiaryServlet")
public class updateBeneficiaryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApacheFileUploadController apacheFileUploadController = new ApacheFileUploadController();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateBeneficiaryServlet() {
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
		
		RequestDispatcher rd = null;
		School school = new School();
		Self_Collection_Centre selfCollectionCentre = new Self_Collection_Centre();
		
		beneficiary.setBeneficiaryID(Integer.parseInt(values.get(0).substring(0,values.get(0).length()-1)));
		beneficiary.setName(values.get(1));
		beneficiary.setType("");
		beneficiary.setAddress(values.get(2));
		beneficiary.setNumberOfBeneficiary(Integer.parseInt(values.get(3)));
		beneficiary.setImage(saveFile);
		if(values.size() != 6){
			selfCollectionCentre.setBeneficiaryID(beneficiary.getBeneficiaryID());
			selfCollectionCentre.setName(beneficiary.getName());
			selfCollectionCentre.setType("Self Collection Centre");
			selfCollectionCentre.setAddress(beneficiary.getAddress());
			selfCollectionCentre.setNumberOfBeneficiary(beneficiary.getNumberOfBeneficiary());
			selfCollectionCentre.setImage(beneficiary.getImage());
			selfCollectionCentre.setContactName(values.get(4));
			selfCollectionCentre.setContactEmail(values.get(5));
			selfCollectionCentre.setContactPhone(values.get(6));
			beneficiary = selfCollectionCentre;
		}
		else{
			System.out.println(values.size());
			school.setBeneficiaryID(beneficiary.getBeneficiaryID());
			school.setName(beneficiary.getName());
			school.setType("School");
			school.setAddress(beneficiary.getAddress());
			school.setNumberOfBeneficiary(beneficiary.getNumberOfBeneficiary());
			school.setImage(beneficiary.getImage());
			school.setDescription(values.get(4));
			beneficiary = school;
		}
		try{
			boolean success = false;
			if(beneficiary.getType().equals("School")){
				 success = beneficiaryManager.updateBeneficiary(school);
			}
			else if(beneficiary.getType().equals("Self Collection Centre")){
				 success = beneficiaryManager.updateBeneficiary(selfCollectionCentre);
			}
			System.out.println(success);
			if(success){
				rd = request.getRequestDispatcher("updateBeneficiaryDone.jsp");
			}
		}
		catch (Exception ex){
			throw new ServletException(ex);
		}
		rd.forward(request, response);
	}
}
