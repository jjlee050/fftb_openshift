package ffth.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ffth.controller.ApacheFileUploadController;
import ffth.data.VehicleManager;
import ffth.model.Vehicle;

/**
 * Servlet implementation class updateVehicleServlet
 */
@WebServlet("/updateVehicleServlet")
public class updateVehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ApacheFileUploadController apacheFileUploadController = new ApacheFileUploadController();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateVehicleServlet() {
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
		VehicleManager vehicleManager = new VehicleManager();
		Vehicle vehicle = new Vehicle();
		vehicle.setActive(1);
		
		ArrayList<String> values = apacheFileUploadController.readValuesfromVehicleForm(request);
		String saveFile=apacheFileUploadController.getSaveFile();
		
		RequestDispatcher rd = null;
		vehicle.setVehicleNo(values.get(0));
		vehicle.setModel(values.get(1));
		vehicle.setWeight(Float.parseFloat(values.get(2)));
		vehicle.setImage(saveFile);
		vehicle.setStatus(values.get(3));
		vehicle.setType(values.get(4));
		try{
			boolean success = vehicleManager.updateVehicle(vehicle);
			if(success){
				rd = request.getRequestDispatcher("updateVehicleDone.jsp");
			}
		}
		catch (Exception ex){
			throw new ServletException(ex);
		}
		rd.forward(request, response);
	}
}
