package HandItIn;
import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import dbAccessLayer.DbConnector;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

public class User {
	private boolean auth = false;
	private int uid=-1;
	private String upass=""; 
	private String uname="";
//	private Profile;
//  private string Role;
	private String uemail;
	private int token=-1;
	public static String StepUrlArg[]={""};
	
	public User()
	{
		auth = false;
		uid=-1;
	}
	
	public User(int uid) throws SQLException
	{
		ResultSet rs = DbConnector.exeQuerySQL("select * from `WineGuy`.`User` where uid="+uid);
		rs.last();
		if(rs!=null)
		{
		this.uid=uid;
		uname=rs.getString("username");
		uemail=rs.getString("email");
		}
	}
    public ArrayList<Submission> hisSubmission() throws SQLException
    {
    	ArrayList<Submission> allSub = new ArrayList<Submission>();
    	DbConnector.getConn();
		String QueryGetMyProduct = "select * from `Wineguy`.`Submission` where creator="+this.uid+";";
		ResultSet rs = DbConnector.exeQuerySQL(QueryGetMyProduct);
		while(rs.next())
		{
			int isid=rs.getInt(1);
			String ititle =rs.getString(2);
			String iurl=new String(rs.getString(3));
			int itype = rs.getInt(4);
			//int icreator = rs.getInt(5);
			Date idate = rs.getTimestamp(6);
			allSub.add(new Submission(isid,this.uid, ititle,iurl, itype, idate));
		}
    	return allSub;
    }
    
    public ArrayList<Submission> allSubmission() throws SQLException
    {
    	ArrayList<Submission> allSub = new ArrayList<Submission>();
    	DbConnector.getConn();
		String QueryGetMyProduct = "select * from `Wineguy`.`Submission`;";
		ResultSet rs = DbConnector.exeQuerySQL(QueryGetMyProduct);
		while(rs.next())
		{
			int isid=rs.getInt(1);
			String ititle =rs.getString(2);
			String iurl=new String(rs.getString(3));
			int itype = rs.getInt(4);
			int icreator = rs.getInt(5);
			Date idate = rs.getTimestamp(6);
			allSub.add(new Submission(isid));
		}
    	return allSub;
    }

    
    

    /**
     * 
     * @param title
     * @param url
     * @param type
     */
	
	public void CreateSubmission(String title,String url,int type)
	{
		Submission sub= new Submission(this.uid,title ,url, type);
		sub.Save();
	}
	
	
	
	public void DelSubmission(int sub_id)
	{
			String sqlStr1 = "delete from `wineguy`.`submission` where sub_id="+sub_id;
			String sqlStr2 = "delete from `wineguy`.`comment` where sub_id="+sub_id;
			DbConnector.getConn();
			DbConnector.exeSQL(sqlStr1);
			DbConnector.exeSQL(sqlStr2);
	}
	
	public void CommentSubmission(String comment,int sub_id)
	{
		String sqlStr = "insert into `comment`(comment,sub_id) values ('"+comment+"',"+sub_id+")";
		DbConnector.getConn();
		DbConnector.exeSQL(sqlStr);
	}
	
	
	public void UsrReset()
	{
		auth=false;
		token=-1;
	}


	
	public User usrReg(String un,String up,String ue) throws NumberFormatException, SQLException
	{
		DbConnector.getConn();
		String QueryGetUsrCount="select * from `WineGuy`.`User` where username='"+un+"';";
		String QueryInsertUsr="Insert into `WineGuy`.`User` (username,userpass,email) values ('"+un+"','"+up+"','"+ue+"');";
		ResultSet rs = DbConnector.exeQuerySQL(QueryGetUsrCount);
		rs.last();
		if(rs.getRow()==0)
		{
			auth=true;
			upass=up;
			uname=un;
			uemail=ue;
			DbConnector.exeSQL(QueryInsertUsr);
			rs = DbConnector.exeQuerySQL(QueryGetUsrCount);
			rs.last();
			uid=rs.getInt(1);//the uid column
			return this;
		}
		else
			return null;
	}
	//•Œ§·≈Á√“
	
	public void UsrAuth(String un,String up) throws SQLException
	{
		DbConnector.getConn();
		ResultSet rs = DbConnector.exeQuerySQL("select * from `WineGuy`.`User` where username='"+un+"' and userpass='"+up+"'");
		rs.last();
		
		if(rs.getRow()!=0)
		{
			auth=true;
			upass=up;
			uname=un;
			//rs.last();
			uid=rs.getInt(1);

		}
		else
		{
			auth=false;
		}
	}
 
	
	public int getUid()
	{
		return uid;
	}
	
	public boolean getAuth()
	{
		return auth;
	}

	public String getUname()
	{
		return uname;
	}
	
	public String getUemail()
	{
		return uemail;
	}
 
	
	public static void myprintln(JspWriter out,String s) throws IOException{
		out.print(s);
		}
	
}
