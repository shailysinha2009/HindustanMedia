package com.hindustan.servlet;

import java.util.Date;

public class InvoiceBean {
    private String agntcd;
    public String getAgntcd() {
		return agntcd;
	}
	public void setAgntcd(String agntcd) {
		this.agntcd = agntcd;
	}
	public String getEdii() {
		return edii;
	}
	public void setEdii(String edii) {
		this.edii = edii;
	}
	/*public Date getFromdd() {
		return fromdd;
	}
	public void setFromdd(Date fromdd) {
		this.fromdd = fromdd;
	}
	public Date getTilldd() {
		return tilldd;
	}
	public void setTilldd(Date tilldd) {
		this.tilldd = tilldd;
	}*/
	public float getMontotal() {
		return montotal;
	}
	public void setMontotal(float montotal) {
		this.montotal = montotal;
	}
	public float getMonreturn() {
		return monreturn;
	}
	public void setMonreturn(float monreturn) {
		this.monreturn = monreturn;
	}
	public float getMonpay() {
		return monpay;
	}
	public void setMonpay(float monpay) {
		this.monpay = monpay;
	}
	public String getFromdd() {
		return fromdd;
	}
	public void setFromdd(String fromdd) {
		this.fromdd = fromdd;
	}
	public String getTilldd() {
		return tilldd;
	}
	public void setTilldd(String tilldd) {
		this.tilldd = tilldd;
	}
	private String edii;
   /* private Date fromdd;
    private Date tilldd;*/
    private float montotal;
    private float monreturn;
    private float monpay;
    private String fromdd;
    private String tilldd;
    
    
}
