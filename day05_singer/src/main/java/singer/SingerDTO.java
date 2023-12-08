package singer;

public class SingerDTO {

	private int idx;
	private String name;
	private String entertainment;
	private String titleSong;
	private String debutDate;
	
	private static int seq;
	
	public static int getSeq() {
		return seq;
	}
	
	public SingerDTO() {
		this.idx = ++seq;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEntertainment() {
		return entertainment;
	}
	public void setEntertainment(String entertainment) {
		this.entertainment = entertainment;
	}
	public String getTitleSong() {
		return titleSong;
	}
	public void setTitleSong(String titleSong) {
		this.titleSong = titleSong;
	}
	public String getDebutDate() {
		return debutDate;
	}
	public void setDebutDate(String debutDate) {
		this.debutDate = debutDate;
	}
	
	
	
	
	
	
	
}
