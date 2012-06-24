package HandItIn;
import javax.mail.*;
import HandItIn.User;
public class EventInformer {
	static String smtp="";
	static String Username="";
	static String maito="";

	static void Inform(User u){
		 	
	}
	

	
	static String ContentPicker(int Action)
	{
		String[] contentStr = new String[]{
			"Message1","Message2"
		};
		return contentStr[Action];
	}
	

}
