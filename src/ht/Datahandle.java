package ht;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.util.DBConnection;

public class Datahandle {
  public Agent findAgentByCode(String code)throws SQLException{
	  Connection conn=null;
		Statement stmt = null;
	  Agent selectAgnt=new Agent();
	  try 
	  {
	  conn = DBConnection.getConnection();
	  stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	  String query="select * from agent where a_code="+ code;
	  System.out.println("executing query");
      ResultSet rset=stmt.executeQuery(query);
      while(rset.next()){
    	  selectAgnt.setAgentCode(new String(rset.getString("a_code")));
    	  selectAgnt.setAgentName(new String(rset.getString("a_name")));
    	  selectAgnt.setAddress(new String(rset.getString("address")));
    	  selectAgnt.setPinCode(new String(rset.getString("pincode")));
    	  selectAgnt.setSex(new String(rset.getString("sex")));
    	  selectAgnt.setEdition(new String(rset.getString("edition")));
    	  selectAgnt.setEmailId(new String(rset.getString("emailid")));
    	  selectAgnt.setDob(new String(rset.getString("dob")));
    	  selectAgnt.setMobileNo(new String(rset.getString("contactno")));
    	  selectAgnt.setReturnUnit(new Integer(rset.getInt("ret_unit")));
    	  selectAgnt.setSecureMoney(new Integer(rset.getInt("sec_money")));
      }
        rset.close();
	    stmt.close();
	    conn.close();
	  }
	  catch(Exception e){
    	  System.out.println(e);
      }
      finally{
    	  System.out.println("everything is ok");
      }
	  return selectAgnt;
  }
  public String deleteAgentByCode(String code)throws IOException, SQLException{
	  Connection conn=null;
		Statement stmt = null;
	try
	{
	  conn = DBConnection.getConnection();
	  stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
	  //String sqlString1="delete table printorder where a_code="+code;
	  String sqlString="delete from agent where a_code="+code;
	  //stmt.execute(sqlString1);
	  stmt.execute(sqlString);
	    stmt.close();
	    conn.close();
	}
	  catch(Exception e){
    	  System.out.println(e);
      }
      finally{
    	  System.out.println("everything is ok");
      }
	  return "success";
  }
  public String updateAgent(String a_code, String a_name, String address, String pincode, String sex, String edition, String emailid, String dob, String contactno, int ret_unit, int sec_money)throws SQLException{
	  Connection conn=null;
      Statement stmt = null;
	  Agent oldAgent=findAgentByCode(a_code); 
	  try
		{
		  conn = DBConnection.getConnection();
		  stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
          StringBuffer columns= new StringBuffer(255);
		  if(a_name!=null && !a_name.equals(oldAgent.getAgentName())){
			  columns.append("a_name='"+a_name+"'");
		  }
		  if(address!=null && !address.equals(oldAgent.getAddress())){
			  if(columns.length()>0){
				  columns.append(",");
			  }
			  columns.append("address='"+address+"'");
		  }
		  if(pincode!=null && !pincode.equals(oldAgent.getPinCode())){
			  if(columns.length()>0){
				  columns.append(",");
			  }
			  columns.append("pincode='"+pincode+"'");
		  }
		  if(sex!=null && !sex.equals(oldAgent.getSex())){
			  if(columns.length()>0){
				  columns.append(",");
			  }
			  columns.append("sex='"+sex+"'");
		  }
		  if(edition!=null && !edition.equals(oldAgent.getEdition())){
			  if(columns.length()>0){
				  columns.append(",");
			  }
			  columns.append("edition='"+edition+"'");
		  }
		  if(emailid!=null && !emailid.equals(oldAgent.getEmailId())){
			  if(columns.length()>0){
				  columns.append(",");
			  }
			  columns.append("emailid='"+emailid+"'");
		  }
		  if(dob!=null && !dob.equals(oldAgent.getDob())){
			  if(columns.length()>0){
				  columns.append(",");
			  }
			  columns.append("dob='"+dob+"'");
		  }
		  if(contactno!=null && !contactno.equals(oldAgent.getMobileNo())){
			  if(columns.length()>0){
				  columns.append(",");
			  }
			  columns.append("contactno='"+contactno+"'");
		  }
		  if(ret_unit!=0 && ret_unit!=(oldAgent.getReturnUnit())){
			  if(columns.length()>0){
				  columns.append(",");
			  }
			  columns.append("ret_unit='"+ret_unit+"'");
		  }
		  if(sec_money!=0 && sec_money!=(oldAgent.getSecureMoney())){
			  if(columns.length()>0){
				  columns.append(",");
			  }
			  columns.append("sec_money='"+sec_money+"'");
		  }
		  if(columns.length()>0){
			  String sqlString="UPDATE agent SET "+columns.toString()+"where a_code="+a_code;
			  System.out.println("Executing:"+ sqlString);
			  stmt.execute(sqlString);
		  }
		  else{
			  System.out.println("Nothing to do to update agent code:"+ a_code);
		  }
		  stmt.close();
		    conn.close(); 
		}
	  catch(Exception e){
    	  System.out.println(e);
      }
      finally{
    	  System.out.println("everything is ok");
      }
	  return "success";
  }
}
