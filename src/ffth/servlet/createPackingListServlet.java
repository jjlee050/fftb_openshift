package ffth.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ffth.data.PackingListManager;
import ffth.model.Food;
import ffth.model.Packing_List;
import ffth.model.Packing_List_Food_Item;

/**
 * Servlet implementation class createPackingListServlet
 */
@WebServlet("/createPackingListServlet")
public class createPackingListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public createPackingListServlet() {
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
		// TODO Auto-generated method stub
		PackingListManager manager=new PackingListManager();
		Packing_List list=new Packing_List();
		
		list.setLocation(request.getParameter("eventLocation"));
		list.setAmountOfBags(Integer.parseInt(request.getParameter("amountOfBags")));
		list.setEventType(request.getParameter("eventType"));
		
		String[] beverageItemName=request.getParameterValues("beveragesName");
		String[] tempBeverageItemWeight=request.getParameterValues("beveragesWeight");
		float[] beverageItemWeight=new float[tempBeverageItemWeight.length];
		for(int i=0;i<tempBeverageItemWeight.length;i++){
			beverageItemWeight[i]=Float.parseFloat(tempBeverageItemWeight[i]);
		}
		String[] tempBeverageItemQuantity=request.getParameterValues("beveragesQuantity");
		int[] beverageItemQuantity=new int[tempBeverageItemQuantity.length];
		for(int i=0;i<tempBeverageItemQuantity.length;i++){
			beverageItemQuantity[i]=Integer.parseInt(tempBeverageItemQuantity[i]);
		}
		for(int i=0;i<beverageItemName.length;i++){
			Food food=new Food();
			food.setName(beverageItemName[i]);
			food.setWeight(beverageItemWeight[i]);
			food.setFoodID(manager.getFoodId(beverageItemName[i], beverageItemWeight[i]));
			Packing_List_Food_Item listItem=new Packing_List_Food_Item();
			listItem.setQuantity(beverageItemQuantity[i]);
			listItem.setUnnamed_Food_(food);
			list.unnamed_Packing_List_Food_Item_.add(listItem);
			}
		
		String[] cannedItemName=request.getParameterValues("cannedFoodName");
		String[] tempCannedItemWeight=request.getParameterValues("cannedFoodWeight");
		float[] cannedItemWeight=new float[tempCannedItemWeight.length];
		for(int i=0;i<tempCannedItemWeight.length;i++){
			cannedItemWeight[i]=Float.parseFloat(tempCannedItemWeight[i]);
		}
		String[] tempCannedItemQuantity=request.getParameterValues("cannedFoodQuantity");
		int[] cannedItemQuantity=new int[tempCannedItemQuantity.length];
		for(int i=0;i<tempCannedItemQuantity.length;i++){
			cannedItemQuantity[i]=Integer.parseInt(tempCannedItemQuantity[i]);
		}
		for(int i=0;i<cannedItemName.length;i++){
			Food food=new Food();
			food.setName(cannedItemName[i]);
			food.setWeight(cannedItemWeight[i]);
			food.setFoodID(manager.getFoodId(cannedItemName[i], cannedItemWeight[i]));
			Packing_List_Food_Item listItem=new Packing_List_Food_Item();
			listItem.setQuantity(cannedItemQuantity[i]);
			listItem.setUnnamed_Food_(food);
			list.unnamed_Packing_List_Food_Item_.add(listItem);
			}
		
		String[] generalItemName=request.getParameterValues("generalFoodName");
		String[] tempGeneralItemWeight=request.getParameterValues("generalFoodWeight");
		float[] generalItemWeight=new float[tempGeneralItemWeight.length];
		for(int i=0;i<tempGeneralItemWeight.length;i++){
			generalItemWeight[i]=Float.parseFloat(tempGeneralItemWeight[i]);
		}
		String[] tempGeneralItemQuantity=request.getParameterValues("generalFoodQuantity");
		int[] generalItemQuantity=new int[tempGeneralItemQuantity.length];
		for(int i=0;i<tempGeneralItemQuantity.length;i++){
			generalItemQuantity[i]=Integer.parseInt(tempGeneralItemQuantity[i]);
		}
		for(int i=0;i<generalItemName.length;i++){
			Food food=new Food();
			food.setName(generalItemName[i]);
			food.setWeight(generalItemWeight[i]);
			food.setFoodID(manager.getFoodId(generalItemName[i], generalItemWeight[i]));
			Packing_List_Food_Item listItem=new Packing_List_Food_Item();
			listItem.setQuantity(generalItemQuantity[i]);
			listItem.setUnnamed_Food_(food);
			list.unnamed_Packing_List_Food_Item_.add(listItem);
			}
		
		/*for(int i=0;i<itemName.length;i++){
			System.out.println(list.unnamed_Packing_List_Food_Item_.get(i).getUnnamed_Food_().getName());
			System.out.println(list.unnamed_Packing_List_Food_Item_.get(i).getUnnamed_Food_().getWeight());
			System.out.println(list.unnamed_Packing_List_Food_Item_.get(i).getQuantity());
		}*/
		boolean check=manager.insertPackingList(list);
		if(check){
			System.out.println(check);
		}
		
	}

}
