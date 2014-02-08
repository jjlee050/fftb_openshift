package ffth.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ffth.data.DeliveryScheduleManager;
import ffth.model.Delivery_Schedule;

/**
 * Servlet implementation class copyFromExistingScheduleServlet
 */
@WebServlet("/copyFromExistingScheduleServlet")
public class copyFromExistingScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public copyFromExistingScheduleServlet() {
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
		ArrayList<Delivery_Schedule> deliveryScheduleArrList = deliveryScheduleManager.getAllDeliverySchedules();
		ArrayList<Delivery_Schedule> acceptedDeliveryScheduleArrList = new ArrayList<Delivery_Schedule>();
		Date todayDate = new Date();
		Calendar todayCalendar = GregorianCalendar.getInstance();
		todayCalendar.setTime(todayDate);
		int currentMonth = todayCalendar.get(Calendar.MONTH) + 1;
		System.out.println("Current Month: " + currentMonth);
		
		for(int i=0;i<deliveryScheduleArrList.size();i++){
			Calendar calendar = GregorianCalendar.getInstance();
			calendar.setTime(deliveryScheduleArrList.get(i).getDate());
			int month = calendar.get(Calendar.MONTH) + 1;
			int date = 1;
			calendar.set(calendar.get(Calendar.YEAR),month,1);
			System.out.println(calendar.get(Calendar.DAY_OF_WEEK));
			if(calendar.get(Calendar.DAY_OF_WEEK) == 7){
				calendar.set(calendar.get(Calendar.YEAR),month,date + 2);
				Delivery_Schedule deliverySchedule = deliveryScheduleArrList.get(i);
				java.util.Date parsedDate = calendar.getTime();
				java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
				deliverySchedule.setDate(sqlDate);
				acceptedDeliveryScheduleArrList.add(deliverySchedule);
			}
			else if(calendar.get(Calendar.DAY_OF_WEEK) == 1){
				calendar.set(calendar.get(Calendar.YEAR),month,date + 1);
				Delivery_Schedule deliverySchedule = deliveryScheduleArrList.get(i);
				java.util.Date parsedDate = calendar.getTime();
				java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
				deliverySchedule.setDate(sqlDate);
				acceptedDeliveryScheduleArrList.add(deliverySchedule);
			}
			else{
				calendar.set(calendar.get(Calendar.YEAR),month,date);
				Delivery_Schedule deliverySchedule = deliveryScheduleArrList.get(i);
				java.util.Date parsedDate = calendar.getTime();
				java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
				deliverySchedule.setDate(sqlDate);
				acceptedDeliveryScheduleArrList.add(deliverySchedule);
			}
		}
		
		for(int i=0;i<acceptedDeliveryScheduleArrList.size();i++){
			System.out.println(acceptedDeliveryScheduleArrList.get(i).getDate());
		}
		
		RequestDispatcher rd = null;
		boolean success = false;
		try{
			success = deliveryScheduleManager.insertDeliverySchedule(acceptedDeliveryScheduleArrList);
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
