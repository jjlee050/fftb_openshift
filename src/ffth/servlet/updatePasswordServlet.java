package ffth.servlet;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ffth.data.BeneficiaryManager;
import ffth.data.DeliveryScheduleManager;
import ffth.data.UserManager;
import ffth.model.Beneficiary;
import ffth.model.Delivery_Schedule;
import ffth.model.Packing_List;
import ffth.model.Vehicle;
import ffth.model.Volunteer;

/**
 * Servlet implementation class updatePasswordServlet
 */
@WebServlet("/updatePasswordServlet")
public class updatePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePasswordServlet() {
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
		Volunteer volunteer = new Volunteer();
		UserManager userManager = new UserManager();
		
		String password = request.getParameter("newPass");
		
		volunteer.setPassword(password);
		volunteer.setUserID(2);
		
		RequestDispatcher rd = null;
		try{
			boolean success = userManager.updatePassword(volunteer);
			if(success){
				rd = request.getRequestDispatcher("updateUserDone.jsp");
			}
		}
		catch (Exception ex){
			throw new ServletException(ex);
		}
		rd.forward(request, response);
	}

}
