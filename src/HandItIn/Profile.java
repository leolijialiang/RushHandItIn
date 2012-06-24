package HandItIn;
import java.sql.ResultSet;

import dbAccessLayer.DbConnector;
import HandItIn.*;

public class Profile {
	private int pid;
	private String firstname;
	private String email;
	private String lastname;
	private int uid;
	
	public Profile(int uid)
	{
		DbConnector.getConn();
		
	}
	
}
