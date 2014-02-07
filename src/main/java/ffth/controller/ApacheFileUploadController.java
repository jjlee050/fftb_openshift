package ffth.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import ffth.servlet.createVehicleServlet;

/**
 * This is the controller class to executes form(s) with enctype="multipart/form-data"
 * @author Lee Zhuo Xun
 *
 */
public class ApacheFileUploadController {
	private String saveFile;
	
	/**
	 * Default Constructor
	 */
	public ApacheFileUploadController(){
		
	}
	
	/**
	 * This is the getter method for save file
	 * @return String
	 */
	public String getSaveFile() {
		return saveFile;
	}

	/**
	 * This is the setter method for save file
	 * @param saveFile
	 */
	public void setSaveFile(String saveFile) {
		this.saveFile = saveFile;
	}
	
	/**
	 * This method is to read values related to beneficiary
	 * @param request
	 * @return ArrayList<String>
	 */
	public ArrayList<String> readValuesfromBeneficiaryForm(HttpServletRequest request){
		ArrayList<String> values = new ArrayList<String>();
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        System.out.println("request: " + request);
        if (!isMultipart) {
            System.out.println("File Not Uploaded");
            return null;
        } 
        else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException ex) {
                Logger.getLogger(createVehicleServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("items: " + items);
            Iterator<FileItem> itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    System.out.println("name: " + name);
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
                        
                        if(finalimage.equals(null) || (finalimage.equals(""))){
                        	saveFile = "";
                        }
                        else{
                        	saveFile = finalimage;
                        }
                        File savedFile = new File("E:/J2EE practice files/" + "IT2299_Project/WebContent/image/beneficiaryProfileImage/" + finalimage);
                        System.out.println(saveFile);
                        item.write(savedFile);
                    } catch (Exception e) {
                    }
                }
            }
        }
        return values;
	}
	
	/**
	 * This method is to read values related to vehicle 
	 * @param request
	 * @return ArrayList<String>
	 */
	public ArrayList<String> readValuesfromVehicleForm(HttpServletRequest request){
		ArrayList<String> values = new ArrayList<String>();
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        System.out.println("request: " + request);
        if (!isMultipart) {
            System.out.println("File Not Uploaded");
            return null;
        } 
        else {
            FileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List<FileItem> items = null;
            try {
                items = upload.parseRequest(request);
            } catch (FileUploadException ex) {
                Logger.getLogger(createVehicleServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            System.out.println("items: " + items);
            Iterator<FileItem> itr = items.iterator();
            while (itr.hasNext()) {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    System.out.println("name: " + name);
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
                        
                        if(finalimage.equals(null) || (finalimage.equals(""))){
                        	saveFile = "";
                        }
                        else{
                        	saveFile = finalimage;
                        }
                        File savedFile = new File("E:/J2EE practice files/" + "IT2299_Project/WebContent/image/vehicleImage/" + finalimage);
                        item.write(savedFile);
                    } catch (Exception e) {
                    }
                }
            }
        }
        return values;
	}
	
	/**
	 * This method is to read the excel file from create delivery schedule form
	 * @param request
	 * @return String
	 */
	public String readExcelFile(HttpServletRequest request){
		String encodedStr = "";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		System.out.println("request: " + request);
		if (!isMultipart) {
		    System.out.println("File Not Uploaded");
		    return null;
		} 
		else {
		    FileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
		    List<FileItem> items = null;
		    try {
		        items = upload.parseRequest(request);
		    } catch (FileUploadException ex) {
		        ex.printStackTrace();
		    }
		    System.out.println("items: " + items);
		    Iterator<FileItem> itr = items.iterator();
		    while (itr.hasNext()) {
		        FileItem item = (FileItem) itr.next();
		        if (item.isFormField()) {
                    String name = item.getFieldName();
                    System.out.println("name: " + name);
                    String value = item.getString();
                    encodedStr = value;
                    System.out.println("value: " + value);
                } else {
                    try {                  
                    } catch (Exception e) {
                    }
                }
		    }
		}
		return encodedStr;
	}
}
