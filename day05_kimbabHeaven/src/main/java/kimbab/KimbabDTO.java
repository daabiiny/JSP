package kimbab;

public class KimbabDTO {

	private int idx;
	private String category;
	private String menuName;
	private String menuPrice;
	
	private static int seq;
	
	public static int getSeq() {
		return seq;
	}
	
	public KimbabDTO() {
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
	
	
	
}
