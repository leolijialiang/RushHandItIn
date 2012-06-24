package Wine;

public enum BottleType {
	 type1(1),
	 type2(2),	
	 type3(3);
	 
	 private int value;
	 
	 private BottleType(int i)
	 {
		 value=i;
	 }
	 
	 public int getValue()
	 {
		 return value;
	 }

	 
	 
}
