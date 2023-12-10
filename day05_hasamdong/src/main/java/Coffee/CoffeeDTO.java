package Coffee;

public class CoffeeDTO {

	private int idx;
	private String category;
	private String hotIce;
	private String menuName;
	private String menuPrice;
	private String cal;
	
	private static int seq;
	
	public static int getSeq() {
		return seq;
	}
	
	public CoffeeDTO() {
		this.idx = ++seq;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getHotIce() {
		return hotIce;
	}
	public void setHotIce(String hotIce) {
		this.hotIce = hotIce;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getCal() {
		return cal;
	}
	public void setCal(String cal) {
		this.cal = cal;
	}
	
	

}
