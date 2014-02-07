package ffth.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import ffth.data.BookingManager;
import ffth.data.UserManager;
import ffth.model.Volunteer;
import ffth.model.Volunteer_Job;

/**
 * Servlet implementation class createBookRecordServlet
 */
@WebServlet("/createBookRecordServlet")
public class createBookRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createBookRecordServlet() {
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
		
		BookingManager bookingManager = new BookingManager();
		Volunteer_Job jobRecord = new Volunteer_Job();
		
		int jobID = Integer.parseInt(request.getParameter("job"));
		int userID = Integer.parseInt(request.getParameter("user"));
		
		RequestDispatcher rd = null;
		
		System.out.println(userID);
		System.out.println(jobID);
		jobRecord.setUserID(userID);
		jobRecord.setJobID(jobID);
		
		try{
			boolean success = false;
			success = bookingManager.insertRecord(jobRecord);
			System.out.println(success);
			if(success){
				rd = request.getRequestDispatcher("bookSuccess.jsp");
			}
		}
		catch (Exception ex){
			throw new ServletException(ex);
		}
		rd.forward(request, response);
	}
				
}

