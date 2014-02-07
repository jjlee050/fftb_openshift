<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.io.*,org.apache.poi.ss.usermodel.*"%>
<%@page import="java.util.*,java.util.regex.*,java.nio.file.*"%>
<%@page import="org.apache.poi.xssf.usermodel.*,org.apache.commons.io.*"%>
<%@page import="org.apache.commons.fileupload.FileItem,org.apache.commons.fileupload.FileItemFactory,org.apache.commons.fileupload.FileUploadException,org.apache.commons.fileupload.disk.DiskFileItemFactory,org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%
		String fileName = "";
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		System.out.println("request: " + request);
		if (!isMultipart) {
		    System.out.println("File Not Uploaded");
		    return;
		} 
		else {
		    FileItemFactory factory = new DiskFileItemFactory();
		    ServletFileUpload upload = new ServletFileUpload(factory);
		    List items = null;
		    try {
		        items = upload.parseRequest(request);
		    } catch (FileUploadException ex) {
		        ex.printStackTrace();
		    }
		    System.out.println("items: " + items);
		    Iterator itr = items.iterator();
		    while (itr.hasNext()) {
		        FileItem item = (FileItem) itr.next();
		        if (item.isFormField()) {
                    String name = item.getFieldName();
                    System.out.println("name: " + name);
                    String value = item.getString();
                    System.out.println("value: " + value);
                } else {
                    try {
                    	fileName = item.getName();
                        File savedFile = new File(fileName);
                    } catch (Exception e) {
                    }
                }
		    }
		}
		Vector cellVectorHolder = new Vector();  
		Workbook workBook = null;
		 try {
	            workBook = WorkbookFactory.create(new File("C:/Users/Lee Zhuo Xun/Documents/Book2.xlsx"));
	     } 
	   	 catch (Exception e) {
	            e.printStackTrace();
	     }
		Sheet sheet = workBook.getSheetAt(0);
		Iterator rowIter = sheet.rowIterator();  
		while(rowIter.hasNext())  {  
		    Row myRow = (Row) rowIter.next();  
		    Iterator cellIter = myRow.cellIterator();  
		    Vector cellStoreVector=new Vector();  
		    while(cellIter.hasNext()){  
		    	Cell myCell = (Cell) cellIter.next();  
		    	cellStoreVector.addElement(myCell);
		    }
			cellVectorHolder.addElement(cellStoreVector);
		}    
%> 
<p> Please wait for a while. </p>
<% for(int i=0;i<cellVectorHolder.size();i++){ %>
<p> <%= cellVectorHolder.get(i).toString() %></p>
<% } %>
</body>
</html>