package HandItIn;
import java.io.IOException;
import java.lang.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.jsp.JspWriter;

import dbAccessLayer.DbConnector;
public class Submission {
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    private Date date=new Date();
	private int creatorId;
    private String url;
    private int type;
    private String title;
    private int sub_id=-1;
    
    
    public Submission()
    {
    }
  
    public Submission(int usrid,String title, String url, int type)
    {
    	this.creatorId = usrid;
    	this.url = url;
    	this.type = type;
    	this.title = title;
    }
    
    //overloading
    public Submission(int usrid, String title,String url, int type,Date date)
    {
        	this.creatorId = usrid;
        	this.url = url;
        	this.type = type;
        	this.date = date; 
        	this.title= title;
    }
    
    public Submission(int sid,int usrid, String title,String url, int type,Date date)
    {
    		this.sub_id = sid;
        	this.creatorId = usrid;
        	this.url = url;
        	this.type = type;
        	this.date = date; 
        	this.title= title;
    }
    
    public Submission(int sid) throws SQLException
    {
    	DbConnector.getConn();
		String QueryGetMyProduct = "select * from `Wineguy`.`Submission` where sub_id="+sid+";";
		ResultSet rs = DbConnector.exeQuerySQL(QueryGetMyProduct);
		rs.last();
		int isid=rs.getInt(1);
		String ititle =rs.getString(2);
		String iurl=rs.getString(3);
		int itype = rs.getInt(4);
		int icreator = rs.getInt(5);
		Date idate = rs.getTimestamp(6);
		this.sub_id=isid;
		this.title=ititle;
		this.url=iurl;
		this.type=itype;
		this.creatorId=icreator;
		this.date.setTime(idate.getTime()) ;
    }
    
    
    public void dspListView(JspWriter out) throws IOException{
    		String[] typeTeller = new String[]{"Youtube","Flicker"};
    		out.print("<tr>");
    		out.print("<td>");
    		out.print("<a href=Detail.jsp?sid='"+this.sub_id+"'>");
    		out.print(this.title);
    		out.print("</td>");
    		out.print("<td>");
    		out.print("<a href='"+this.url+"'>");
    		out.print(this.url);
    		out.print("</a>");
    		out.print("</td>");
    		out.print("<td>");
    		out.print(typeTeller[this.type]);
    		out.print("</td>");
    		out.print("<td>");
    		out.print(this.date);
    		out.print("</td>");
    		out.print("</tr>");
    }
    

    
    public void dspListViewPickable(JspWriter out) throws IOException{
		String[] typeTeller = new String[]{"Youtube","Flicker"};
		
		out.print("<tr>");
		out.print("<td>");
		out.print("<input type='checkbox' name='SubmissionPicker' value="+this.sub_id +"/>");
		out.print("</td>");
		out.print("<td>");
		out.print(this.title);
		out.print("</td>");
		out.print("<td>");
		out.print("<a href='"+this.url+"'>");
		out.print(this.url);
		out.print("</a>");
		out.print("</td>");
		out.print("<td>");
		out.print(typeTeller[this.type]);
		out.print("</td>");
		out.print("<td>");
		out.print(this.date);
		out.print("</td>");
		out.print("</tr>");

}

    public static ArrayList<Comment> allComment(int id) throws SQLException{
    	ArrayList<Comment> CommentList = new ArrayList<Comment>();
    	DbConnector.getConn();
		String QueryGetMyProduct = "select * from `Wineguy`.`Comment` where sub_id="+id+";";
		ResultSet rs = DbConnector.exeQuerySQL(QueryGetMyProduct);
		while(rs.next())
		{
			String CommentStr =rs.getString(2);
			int sub_id = rs.getInt(3);
			CommentList.add(new Comment(sub_id,CommentStr));
		}
    	return CommentList;     	
    }
    
    public void CommentMe(String cmtstr)
    {
    	Comment cmt = new Comment(this.sub_id,cmtstr);
    	cmt.Save();
    }
    
    public void Save()
    {
    	DbConnector.getConn();
    	String sqlStr = "insert into `WineGuy`.`Submission`(title,url,type,creator) values ('"+this.title+"','"+ this.url+"',"+this.type+","+this.creatorId+");";
    	DbConnector.exeSQL(sqlStr);
    }
    
    public void Del(int subid)
    {
    	DbConnector.getConn();
    	String sqlStr = "delete from `WineGuy`.`Submission` where sub_id="+subid;
    	DbConnector.exeSQL(sqlStr);
    }
    
    
    
    //Getters
	public DateFormat getDateFormat() {
		return dateFormat;
	}

	public Date getDate() {
		return date;
	}

	public int getCreatorId() {
		return creatorId;
	}

	public String getUrl() {
		return url;
	}

	public int getType() {
		return type;
	}

	public String getTitle() {
		return title;
	}

	public int getSub_id() {
		return sub_id;
	}
}
