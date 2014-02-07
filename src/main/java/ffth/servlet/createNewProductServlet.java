package ffth.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ffth.data.newProductManager;
import ffth.model.Food;

/**
 * Servlet implementation class createNewProductServlet
 */
@WebServlet("/createNewProductServlet")
public class createNewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public createNewProductServlet() {
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
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		newProductManager newProductManager = new newProductManager();
		RequestDispatcher rd = null;
		String name = request.getParameter("name");
		String weight = request.getParameter("weight");
		String type = request.getParameter("type");
		String date = request.getParameter("date");
		String vegetarian = request.getParameter("vegetarian");
		String halal = request.getParameter("halal");
		String allergies = request.getParameter("allergies");
		String finalAllergies;
		if(allergies.equals("other")){
			finalAllergies = request.getParameter("allergiesText");
		}else{
			finalAllergies = allergies;
		}
		int location = Integer.parseInt(request.getParameter("location"));

		SimpleDateFormat formatter = new SimpleDateFormat("dd/M/yyyy");

		Date dateOfExpiration = new Date();
		Date dateOfDonation = new Date();
		Date currentTime = new Date();

		if(name==null||weight==null||type==null||date==null||vegetarian==null||halal==null||finalAllergies==null){
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Please check for empty fields');");  
			out.println("history.back();");
			out.println("</script>"); 			
		}else{

			try {
				dateOfExpiration = formatter.parse(date);
				dateOfDonation = formatter.parse(date);

				Calendar calendarB = Calendar.getInstance();
				calendarB.setTime(currentTime);
				Calendar addMonth = Calendar.getInstance();
				addMonth.setTime(dateOfExpiration);
				addMonth.add(Calendar.DATE, 90);
				addMonth.set(Calendar.HOUR_OF_DAY, calendarB.get(Calendar.HOUR_OF_DAY));
				addMonth.set(Calendar.MINUTE, calendarB.get(Calendar.MINUTE));
				addMonth.set(Calendar.SECOND, calendarB.get(Calendar.SECOND));
				addMonth.set(Calendar.MILLISECOND, calendarB.get(Calendar.MILLISECOND));
				dateOfExpiration = addMonth.getTime();

			} catch (ParseException e) {
				e.printStackTrace();
			}

			java.sql.Date sqlDate = new java.sql.Date(dateOfExpiration.getTime());
			java.sql.Date sqlDateOfDonation = new java.sql.Date(dateOfDonation.getTime());

			float weightValue = 1;
			switch (weight) {
			case "0to99": 	 weightValue = 1;
			break;
			case "100to199": weightValue = 2;
			break;
			case "200to299": weightValue = 3;
			break;
			case "300to399": weightValue = 4;
			break;
			case "400to499": weightValue = 5;
			break;

			}



			int option = 0;
			switch (vegetarian) {
			case "Yes": 	 option = 1;
			break;
			case "No": option = 0;
			break;                    
			}

			int option1 = 0;
			switch (halal) {
			case "Yes": option1 = 1;
			break;
			case "No": option1 = 0;
			break;                    
			}


			PrintWriter out = response.getWriter();
			Food food = new Food(name,weightValue,type,sqlDate,option,option1,sqlDateOfDonation,location);

			try{
				boolean successForFood = newProductManager.insertFood(food);
				if(successForFood){
					int numberOfFoodRow = newProductManager.getRows("food_allergies");
					Food allergy = new Food(finalAllergies, numberOfFoodRow);
					boolean successForAllergy = newProductManager.insertAllergies(allergy);
					if(successForAllergy){
						out.println("<script type=\"text/javascript\">");  
						out.println("alert('Success');");  
						out.println("window.location.href = 'foodAllocation.jsp';");
						out.println("</script>"); 	
					}
				}
			}
			catch (Exception ex){
				throw new ServletException(ex);
			}
		}
	}

}
