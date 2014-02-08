package ffth.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
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

import ffth.controller.DBController;
import ffth.data.JobManager;
import ffth.data.UserManager;
import ffth.model.Job;
import ffth.model.User;
import ffth.model.Volunteer;

/**
 * Servlet implementation class createJobServlet
 */
@WebServlet("/createJobServlet")
public class createJobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	String title, date, startTime, endTime, desc;
	String query;
	int id, volunteersNeeded;
	
	Connection conn;
	Statement stmt;
	ResultSet rs;
	DBController dbconn;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createJobServlet() {
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
	
	@SuppressWarnings("finally")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		JobManager jobManager = new JobManager();
		//User user = new User();
		ArrayList<String> names = new ArrayList<String>();
        ArrayList<String> values = new ArrayList<String>();
		
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        System.out.println("request: " + request);
        if (!isMultipart) {
            System.out.println("File Not Uploaded");
            return;
        } else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
           
            List items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException ex) {
                Logger.getLogger(createUserServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("items: " + items);
            
            Iterator itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    System.out.println("name: " + name);
                    names.add(name);
                    String value = item.getString();
                    System.out.println("value: " + value);
                    values.add(value);
                } else {
                    try {
                        String itemName = item.getName();
                        Random generator = new Random();
                        int r = Math.abs(generator.nextInt());

                        String reg = "[.*]";
                        String replacingtext = "";
                        System.out.println("Text before replacing is:-"
                                + itemName);
                        Pattern pattern = Pattern.compile(reg);
                        Matcher matcher = pattern.matcher(itemName);
                        StringBuffer buffer = new StringBuffer();

                        while (matcher.find()) {
                            matcher.appendReplacement(buffer, replacingtext);
                        }
                        int IndexOf = itemName.indexOf(".");
                        String domainName = itemName.substring(IndexOf);
                        System.out.println("domainName: " + domainName);

                        String finalimage = buffer.toString() + "_" + r + domainName;
                        System.out.println("Final Image===" + finalimage);

                        //saveFile = finalimage;
                        
                        //File savedFile = new File("E:/J2EE practice files/" + "IT2299_Project/WebContent/image/userProfileImage/" + finalimage);
                        File savedFile = new File("C:/Users/" + "Joseph/Desktop/Modules/year 2 sem 2/FFTH Project/FFTH/IT2299_Project/WebContent/image/userProfileImage/" + finalimage);
                        
                        
                        item.write(savedFile);
                    } catch (Exception e) {
                    }
                }
            }
        }
        
        RequestDispatcher rd = null;
		Date date= new Date();
		Job job = new Job();
		
		/*int userID = 1;
		if(jobManager.getAllJobs().size() > 0){
			userID = userManager.getAllUsers().get(userManager.getAllUsers().size()-1).getUserID() + 1;
		}*/
		
		//System.out.println(jobID);
		//volunteer.setUserID(userID);
		job.setScheduleID(Integer.parseInt(values.get(0)));
		//jobID is auto incremental
		job.setType(values.get(1)); //type = title
		job.setDate(values.get(2));
		
		job.setStartTime(values.get(3));
		job.setEndTime(values.get(4));
		job.setSlot(Integer.parseInt(values.get(5)));
		job.setDescription(values.get(6));
		
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		String dob = "01/01/1996";
        java.util.Date parsedDate = null;
		try {
			parsedDate = sdf.parse(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		job.setDateOfBirth(new java.sql.Date(parsedDate.getTime()));
		
		//volunteer.setImageFile(saveFile);
		
		try{
			boolean success = false;
			success = jobManager.insertJob(job);
			System.out.println(success);
			if(success){
				rd = request.getRequestDispatcher("createVolunteerDone.jsp");
			}
		}
		catch (Exception ex){
			throw new ServletException(ex);
		}
		rd.forward(request, response);
	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		/*
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try{
			dbconn = new DBController();
			
			id = 0; 
			
			title = request.getParameter("title");
			date = request.getParameter("date");
			
			DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date myDate = formatter.parse(date);
			java.sql.Date sqlDate = new java.sql.Date(myDate.getTime());

			startTime = request.getParameter("startTime");
			endTime = request.getParameter("endTime");
			volunteersNeeded = Integer.parseInt(request.getParameter("volunteersNeeded"));
			desc = request.getParameter("desc");
			
			conn = dbconn.getConnection();
			stmt = conn.createStatement();
			query = "INSERT INTO job VALUES (" + id + ", " + 0 + ", '" + title + "', '" + desc + "', '" + sqlDate + "', '" + startTime + "', '" + endTime + "', " + volunteersNeeded + ")";
			
			System.out.println(query);
				
			int i = stmt.executeUpdate(query);
			System.out.println("i = " + i);
			
		}
		catch(Exception e){
			request.setAttribute("Error", e);
			RequestDispatcher rd = request.getRequestDispatcher("/error.jsp");
			rd.forward(request, response);
			return;
			System.out.println(e);
			
		}
		finally{
			RequestDispatcher rd = request.getRequestDispatcher("createJobDone.jsp");
			rd.forward(request, response);
			out.close();
			return;
		}
		
		
	}*/

}
