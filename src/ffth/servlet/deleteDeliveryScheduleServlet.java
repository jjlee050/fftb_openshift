package ffth.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ffth.data.DeliveryScheduleManager;

/**
 * Servlet implementation class deleteDeliveryScheduleServlet
 */
@WebServlet("/deleteDeliveryScheduleServlet")
public class deleteDeliveryScheduleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteDeliveryScheduleServlet() {
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
		int scheduleID = Integer.parseInt(request.getParameter("scheduleID"));
		RequestDispatcher rd = null;
		try{
			boolean success = deliveryScheduleManager.obsoleteDeliverySchedule(scheduleID);
			if(success){
				rd = request.getRequestDispatcher("deleteDeliveryScheduleDone.jsp");
			}
		}
		catch (Exception ex){
			throw new ServletException(ex);
		}
		rd.forward(request, response);
	}

}
