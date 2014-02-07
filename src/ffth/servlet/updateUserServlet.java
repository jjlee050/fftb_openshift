package ffth.servlet;

import java.io.File;
import java.io.IOException;
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

import sun.awt.SunHints.Value;
import ffth.data.UserManager;
import ffth.model.Volunteer;

/**
 * Servlet implementation class updateUserServlet
 */
@WebServlet("/updateUserServlet")
public class updateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateUserServlet() {
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
		UserManager userManager = new UserManager();
		Volunteer volunteer = new Volunteer();

		ArrayList<String> names = new ArrayList<String>();
        ArrayList<String> values = new ArrayList<String>();
		
        //Write image
		String saveFile="";
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
                Logger.getLogger(createVehicleServlet.class.getName()).log(Level.SEVERE, null, ex);
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

                        saveFile = finalimage;
                        File savedFile = new File("C:/Users/" + "Joseph/Desktop/Modules/year 2 sem 2/FFTH Project/FFTH/IT2299_Project/WebContent/image/userProfileImage/" + finalimage);
                        item.write(savedFile);
                    } catch (Exception e) {
                    }
                }
            }
        }
		RequestDispatcher rd = null;
		
		System.out.println("USER ID:" + values.get(0));

		volunteer.setUserID(Integer.parseInt(values.get(0)));
		//volunteer.setUserName(values.get(1));
		volunteer.setEmail(values.get(1));
		volunteer.setContactNo(values.get(2));
		volunteer.setImageFile(saveFile);
		
		try{
			boolean success = false;
			success = userManager.updateVolunteer(volunteer);
			System.out.println(success);
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
