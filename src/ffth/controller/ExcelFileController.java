package ffth.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.Vector;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import sun.misc.BASE64Decoder;

/**
 * This is the controller class to read the excel file (.xlsx only)
 * @author Lee Zhuo Xun
 *
 */
public class ExcelFileController {
	
	/**
	 * This method is to read the file and retrieve every value inside the file 
	 * and put it in an vector.
	 * @param encodedStr
	 * @return Vector<Vector<Cell>>
	 * @throws IOException
	 */
	public Vector<Vector<Cell>> readFile(String encodedStr) throws IOException{
		byte[] buffer = new BASE64Decoder().decodeBuffer(encodedStr);
		Vector<Vector<Cell>> cellVectorHolder = new Vector<Vector<Cell>>();  
		Workbook workBook = null;
		try {
			workBook = WorkbookFactory.create(new ByteArrayInputStream(buffer));
	    } 
	   	catch (Exception e) {
	   		e.printStackTrace();
	    }
		Sheet sheet = workBook.getSheetAt(0);
		Iterator<Row> rowIter = sheet.rowIterator();  
		while(rowIter.hasNext())  {  
		    Row myRow = (Row) rowIter.next();  
		    Iterator<Cell> cellIter = myRow.cellIterator();  
		    Vector<Cell> cellStoreVector=new Vector<Cell>();  
		    while(cellIter.hasNext()){  
		    	Cell myCell = (Cell) cellIter.next();  
		    	cellStoreVector.addElement(myCell);
		    }
			cellVectorHolder.addElement(cellStoreVector);
		}
		return cellVectorHolder;
	}
}
