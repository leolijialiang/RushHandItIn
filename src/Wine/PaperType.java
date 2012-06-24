package Wine;

public enum PaperType {
	Dimetric(1),
	Oblique(2);
	
	private int value;
	private PaperType(int i)
	{
		value = i;
	}
	public int getValue()
	{
		return value;
	}
}
