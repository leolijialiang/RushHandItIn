package LjlHtmlRender;
import java.io.IOException;
import javax.servlet.jsp.JspWriter;
import java.util.*;

public class basicRender {
	
	static JspWriter out;
	static ArrayList<String> html;
	
	public basicRender(JspWriter out)
	{
		basicRender.out = out;
	}
	
	public static void FormBegin(String form_id,String method,String location) throws IOException
	{
		out.println("<form name='"+form_id+"' method='"+method+"' action='"+location+"'>");
	}
	
	public static void TextBox() throws IOException
	{
		Random Guid = new Random();
		out.println("<input type='text' name='ctl01"+Guid.nextInt()+"'"+" value=''/>");
	}

	public static void TextBox(String name) throws IOException
	{
		
		out.println("<input type='text' name='"+name+"'"+" value=''/>");
	}
	
	public static void TextBox(String name, String defaultValue) throws IOException
	{
		
		out.println("<input type='text' name='"+name+"'"+" value='"+defaultValue+"' onfocus='if(this.value == this.defaultValue) this.value ='' '/>");
	}
	
	
	public static void PasswordBox() throws IOException
	{
		out.println("");
	}
	public static void BtnSubmit(String btnName) throws IOException
	{
		out.println("<input type='submit' value='"+btnName+"'/>");	
	}
	
	public static void FormEnd() throws IOException
	{
		out.println("</form>");
	}
}
 