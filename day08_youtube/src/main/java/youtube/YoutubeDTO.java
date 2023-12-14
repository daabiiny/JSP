package youtube;

//IDX       NOT NULL NUMBER         
//TITLE     NOT NULL VARCHAR2(1000) 
//CATEGORY           VARCHAR2(50)   
//CHNAME    NOT NULL VARCHAR2(200)  
//THUMBNAIL NOT NULL VARCHAR2(2000) 
//TAG       NOT NULL VARCHAR2(2000)

public class YoutubeDTO {

	private int idx;
	private String category;
	private String title;
	private String chName;
	private String thumbNail;
	private String tag;
	
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getChName() {
		return chName;
	}
	public void setChName(String chName) {
		this.chName = chName;
	}
	public String getThumbNail() {
		return thumbNail;
	}
	public void setThumbNail(String thumbNail) {
		this.thumbNail = thumbNail;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	
	
	
	
	
}
