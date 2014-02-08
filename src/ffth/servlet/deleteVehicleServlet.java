package ffth.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ffth.data.VehicleManager;

/**
 * Servlet implementation class deleteVehicleServlet
 */
@WebServlet("/deleteVehicleServlet")
public class deleteVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteVehicleServlet() {
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
		RequestDispatcher rd = null;
		VehicleManager vehicleManager = new VehicleManager();
		String vehicleNo = request.getParameter("vehicleNo");
		try{
			boolean success = vehicleManager.obsoleteVehicle(vehicleNo);
			if(success){
				rd = request.getRequestDispatcher("deleteVehicleDone.jsp");
			}
		}
		catch (Exception ex){
			throw new ServletException(ex);
		}
		rd.forward(request, response);
	}

}
