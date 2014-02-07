package ffth.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ffth.data.BeneficiaryManager;
import ffth.data.DeliveryScheduleManager;
import ffth.model.Beneficiary;
import ffth.model.Delivery_Schedule;
import ffth.model.Packing_List;
import ffth.model.Vehicle;

/**
 * Servlet implementation class createDeliveryScheduleServlet
 */
@WebServlet("/createDeliveryScheduleServlet")
public class createDeliveryScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createDeliveryScheduleServlet() {
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
		Delivery_Schedule deliverySchedule = new Delivery_Schedule();
		BeneficiaryManager beneficiaryManager = new BeneficiaryManager();
		DeliveryScheduleManager deliveryScheduleManager = new DeliveryScheduleManager();
		Beneficiary beneficiary = new Beneficiary();
		Vehicle vehicle = new Vehicle();
		Packing_List packingList = new Packing_List();
		SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		//SimpleDateFormat sdfSql = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat stf = new SimpleDateFormat("h:mm a");
		//SimpleDateFormat stfSql = new SimpleDateFormat("hh:mm:ss");
        java.util.Date parsedDate = null;
		java.util.Date parsedTime = null;
		int beneficiaryID = 0;
		for(int i=0;i<beneficiaryManager.getAllBeneficiarys().size();i++){
			if(beneficiaryManager.getAllBeneficiarys().get(i).getName().equals(request.getParameter("beneficiaryName"))){
				beneficiaryID = beneficiaryManager.getAllBeneficiarys().get(i).getBeneficiaryID();
			}
		}
		beneficiary.setBeneficiaryID(beneficiaryID);
		String vehicleNo = request.getParameter("vehicleNo");
		vehicle.setVehicleNo(vehicleNo);
		// Waiting
		int packingListID = Integer.parseInt(request.getParameter("packingListID"));
		packingList.setPackingListID(packingListID);
		String description = request.getParameter("desc");
		String status = request.getParameter("status");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		int active = 1;
		try {
			parsedDate = sdf.parse(date);
			parsedTime = stf.parse(time);
		} 
		catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
		java.sql.Time sqlTime = new java.sql.Time(parsedTime.getTime());
		
		deliverySchedule.setBeneficiary(beneficiary);
		deliverySchedule.setVehicle(vehicle);
		deliverySchedule.setPackingList(packingList);
		deliverySchedule.setDescription(description);
		deliverySchedule.setStatus(status);
		deliverySchedule.setDate(sqlDate);
		deliverySchedule.setTime(sqlTime);
		deliverySchedule.setActive(active);
		
		RequestDispatcher rd = null;
		try{
			boolean success = deliveryScheduleManager.insertDeliverySchedule(deliverySchedule);
			if(success){
				rd = request.getRequestDispatcher("createDeliveryScheduleDone.jsp");
			}
		}
		catch (Exception ex){
			throw new ServletException(ex);
		}
		rd.forward(request, response);
	}

}
