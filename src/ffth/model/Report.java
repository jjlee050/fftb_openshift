package ffth.model;
import java.util.ArrayList;
import java.util.Date;

public class Report {
	private int reportID;
	private Date reportDate;
	private Date referencedDates;
	private String type;
	private String reportFile;
	public ArrayList<Report_Food> unnamed_Report_Food_ = new ArrayList<Report_Food>();

	public Report() {
		throw new UnsupportedOperationException();
	}

	public int getReportID() {
		return this.reportID;
	}

	public void setReportID(int aReportID) {
		this.reportID = aReportID;
	}

	public Date getReportDate() {
		return this.reportDate;
	}

	public void setReportDate(Date aReportDate) {
		this.reportDate = aReportDate;
	}

	public Date getReferencedDates() {
		return this.referencedDates;
	}

	public void setReferencedDates(Date aReferencedDates) {
		this.referencedDates = aReferencedDates;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String aType) {
		this.type = aType;
	}

	public String getReportFile() {
		return this.reportFile;
	}

	public void setReportFile(String aReportFile) {
		this.reportFile = aReportFile;
	}
}