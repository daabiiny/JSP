package movie;

//	IDX         NOT NULL NUMBER         
//	TITLE       NOT NULL VARCHAR2(500)  
//	POSTER      NOT NULL VARCHAR2(2000) 
//	GENRE       NOT NULL VARCHAR2(50)   
//	RELEASEDATE NOT NULL VARCHAR2(200)  
//	ACTOR       NOT NULL VARCHAR2(500)  
//	CONTENT     NOT NULL VARCHAR2(4000) 

public class MovieDTO {

	private int idx;
	private String title;
	private String poster;
	private String genre;
	private String releaseDate;
	private String actor;
	private String content;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPoster() {
		return poster;
	}
	public void setPoster(String poster) {
		this.poster = poster;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
