package Wine;

public enum WineType {
	Cab(1),
	Mer(2),
	Kra(3),
	Vra(4),
	Varsmi(5);
	
	private int value;
	private WineType(int i)
	{
		value=i;
	}
	public int getValue()
	{
		return value;
	}
}