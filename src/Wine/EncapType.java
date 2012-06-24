package Wine;

public enum EncapType {
	 type1(1),
	 type2(2);
	 
	 private int value;
	 private EncapType(int i)
	 {
		 value=i;
	 }
	 
	 public int getValue()
	 {
		 return value;
	 }
}
