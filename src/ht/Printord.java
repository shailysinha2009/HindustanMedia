package ht;
import java.sql.Date;
public class Printord {
	private String ac;
	  public String getAc() {
		return ac;
	}
	public void setAc(String ac) {
		this.ac = ac;
	}
	public String getEdi() {
		return edi;
	}
	public void setEdi(String edi) {
		this.edi = edi;
	}
	public String getDispadate() {
		return dispadate;
	}
	public void setDispadate(String dispadate) {
		this.dispadate = dispadate;
	}
	public float getRatee() {
		return ratee;
	}
	public void setRatee(float ratee) {
		this.ratee = ratee;
	}
	public String getIssuedaat() {
		return issuedaat;
	}
	public void setIssuedaat(String issuedaat) {
		this.issuedaat = issuedaat;
	}
	public float getTotalmon() {
		return totalmon;
	}
	public void setTotalmon(float totalmon) {
		this.totalmon = totalmon;
	}
	public float getMoneyreturn() {
		return moneyreturn;
	}
	public void setMoneyreturn(float moneyreturn) {
		this.moneyreturn = moneyreturn;
	}
	private String edi;
	  private String dispadate;
	  private float ratee;
	  private float moneyreturn;
	  private String issuedaat;
	  private float totalmon;
}
