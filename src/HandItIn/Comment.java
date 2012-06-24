package HandItIn;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

import dbAccessLayer.DbConnector;

public class Comment {
 
	int sub_id;
	String comment;
	
	public Comment()
	{
	}
	
	public Comment(int sid, String cmt)
	{
		this.sub_id = sid;
		this.comment= cmt;
	}
	
	public void CommentOn(int sid, String cmt)
	{
		this.sub_id = sid;
		this.comment= cmt;
	}
	
	

	public void dspListView(JspWriter out) throws IOException
	{
		out.print("<tr>");
		out.print("<td>");
		out.print(this.comment);
		out.print("</td>");
		out.print("</tr>");
		
	}
	
	public void Save()
	{
    	DbConnector.getConn();
    	String sqlStr = "insert into `WineGuy`.`comment`(sub_id,comment) values ("+this.sub_id+",'"+ this.comment+"');";
    	DbConnector.exeSQL(sqlStr);
	}
}
