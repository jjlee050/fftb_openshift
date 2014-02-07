package ffth.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;

import ffth.controller.ApacheFileUploadController;
import ffth.controller.ExcelFileController;
import ffth.data.BeneficiaryManager;
import ffth.data.DeliveryScheduleManager;
import ffth.data.VehicleManager;
import ffth.model.Beneficiary;
import ffth.model.Delivery_Schedule;
import ffth.model.Packing_List;
import ffth.model.Vehicle;

/**
 * Servlet implementation class readExcelFileServlet
 */
@WebServlet("/readingExcelFile")
public class readExcelFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApacheFileUploadController apacheFileUploadController = new ApacheFileUploadController();
    private ExcelFileController excelFileController = new ExcelFileController();
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public readExcelFileServlet() {
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
		DeliveryScheduleManager deliveryScheduleManager = new DeliveryScheduleManager();
		
		String encodedStr = apacheFileUploadController.readExcelFile(request);
		
		Vector<Vector<Cell>> cellVectorHolder = excelFileController.readFile(encodedStr);
		
		Object [] cellDataColumn = {"Name","Vehicle No","Packing List ID","Description","Status","Date","Time"};
		Object [][] cellData = new Object[cellVectorHolder.size()][7];
		cellData[0] = cellDataColumn;
		StringTokenizer stringTokenizer;
		for(int i=1;i<cellVectorHolder.size();i++){
			System.out.println(cellVectorHolder.get(i));
			stringTokenizer = new StringTokenizer(String.valueOf(cellVectorHolder.get(i)).substring(1, String.valueOf(cellVectorHolder.get(i)).length()-1), ",");
			int columnNo = 0;
			while (stringTokenizer.hasMoreElements()) {
				String element = stringTokenizer.nextElement().toString();
				System.out.println(stringTokenizer.countTokens() + ": " + element);
				cellData[i][columnNo] = element;
				columnNo++;
			}
		}
		
		ArrayList<Integer> beneficiaryErrorRowArrList = new ArrayList<Integer>();
		ArrayList<Integer> vehicleErrorRowArrList = new ArrayList<Integer>();
		
		ArrayList<Delivery_Schedule> deliveryScheduleArrList = new ArrayList<Delivery_Schedule>();
		
		BeneficiaryManager beneficiaryManager = new BeneficiaryManager();
		ArrayList<Beneficiary> beneficiaryArr = beneficiaryManager.getAllBeneficiarys();
		
		VehicleManager vehicleManager = new VehicleManager();
		ArrayList<Vehicle> vehicleArr = vehicleManager.getAllVehicles();
		try{
			for(int i=1;i<cellData.length;i++){
				Delivery_Schedule deliverySchedule = new Delivery_Schedule();
				Beneficiary beneficiary = new Beneficiary();
				int beneficiaryID = 0;
				Vehicle vehicle = new Vehicle();
				String vehicleNo = "";
				for(int j=0;j<beneficiaryArr.size();j++){
					if(beneficiaryArr.get(j).getName().equals(cellData[i][0].toString())){
						beneficiaryID = beneficiaryArr.get(j).getBeneficiaryID();
					}
				}
				for(int j=0;j<vehicleArr.size();j++){
					if(vehicleArr.get(j).getVehicleNo().equals(cellData[i][1].toString().substring(1, cellData[i][1].toString().length()))){
						vehicleNo = vehicleArr.get(j).getVehicleNo();
					}
				}
				if((beneficiaryID != 0)){
					beneficiary.setBeneficiaryID(beneficiaryID);
				}
				else{
					beneficiaryErrorRowArrList.add(i + 1);
				}
				if((vehicleNo != null) && (!vehicleNo.equals(""))){
					vehicle.setVehicleNo(vehicleNo);
				}
				else{
					vehicleErrorRowArrList.add(i + 1);
				}
				Packing_List packingList = new Packing_List();
				float packingListID = Float.parseFloat(cellData[i][2].toString());
				packingList.setPackingListID((int) packingListID);
				deliverySchedule.setBeneficiary(beneficiary);
				deliverySchedule.setVehicle(vehicle);
				deliverySchedule.setPackingList(packingList);
				deliverySchedule.setDescription(cellData[i][3].toString());
				deliverySchedule.setStatus(cellData[i][4].toString());
				SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
				SimpleDateFormat stf = new SimpleDateFormat("h:mm a");
		        java.util.Date parsedDate = null;
				java.util.Date parsedTime = null;
				try {
					parsedDate = sdf.parse(cellData[i][5].toString());
					parsedTime = stf.parse(cellData[i][6].toString());
				} 
				catch (ParseException e) {
					e.printStackTrace();
				}
		        java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
				java.sql.Time sqlTime = new java.sql.Time(parsedTime.getTime());
				
				deliverySchedule.setDate(sqlDate);
				deliverySchedule.setTime(sqlTime);
				deliverySchedule.setActive(1);
				deliveryScheduleArrList.add(deliverySchedule);
			}
			if((beneficiaryErrorRowArrList.size() > 0) || (vehicleErrorRowArrList.size() > 0)){
				PrintWriter out = response.getWriter();  
				response.setContentType("text/html");  
				out.println("<html>");
				out.println("<head>");
				out.println("<script>");
				out.println("alert('Invalid Format. Please edit the content.');");
				out.println("window.location.assign('http://localhost:8080/IT2299_Project/createDeliverySchedule.jsp');");
				out.println("</script></head>");
				out.println("<body></body></html>");
			}
			else{
				RequestDispatcher rd = null;
				boolean success = false;
				try{
					success = deliveryScheduleManager.insertDeliverySchedule(deliveryScheduleArrList);
					if(success){
						rd = request.getRequestDispatcher("createDeliveryScheduleDone.jsp");
					}
				}
				catch(Exception ex){
					throw new ServletException(ex);
				}
				rd.forward(request, response);
			}
		}
		catch(Exception ex){
			PrintWriter out = response.getWriter();
			response.setContentType("text/html");
			out.println("<html>");
			out.println("<head>");
			out.println("<script>");
			out.println("alert('Invalid File. Please select another xlsx file.');");
			out.println("window.location.assign('http://localhost:8080/IT2299_Project/createDeliverySchedule.jsp');");
			out.println("</script>");
			out.println("</head>");
			out.println("</html>");
		}
		
	}
}

