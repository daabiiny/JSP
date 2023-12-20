package bugs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BugsDAO {
	
	// 싱글톤
	// 멤버 필드
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 내부 함수
	// Connection getConnection()
	public Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection(url, user, password);
	}
	// void close()
	public void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (Exception e) {}
	}
	// BugsDTO mapping(ResultSet rs)
	// BugsDTO를 띄워놓고 해라잉!
	public BugsDTO mapping(ResultSet rs) throws SQLException {
		BugsDTO dto = new BugsDTO();
		dto.setId(rs.getInt("id"));
		dto.setArtist_name(rs.getString("artist_name"));
		dto.setArtist_img(rs.getString("artist_img"));
		dto.setAlbum_name(rs.getString("album_name"));
		dto.setAlbum_img(rs.getString("album_img"));
		dto.setName(rs.getString("name"));
		dto.setGenre(rs.getString("genre"));
		dto.setPlayTime(rs.getInt("playTime"));
		dto.setLyrics(rs.getString("lyrics"));
		dto.setIsTitle(rs.getInt("isTitle"));
		return dto;
	}
	
	// 공개 함수
	// 1. List<BugsDTO> selectAll()
	// select * from bugs order by artist_name, id
	public List<BugsDTO> selectAll(String search) {
		ArrayList<BugsDTO> list = new ArrayList<>();
		String sql = "select * from bugs"
				+ "	where"
				+ "	name like '%' || ? || '%'"
				+ "	or"
				+ " artist_name like '%' || ? || '%'"
				+ " order by artist_name, id";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, search);
			pstmt.setString(2, search);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
		} finally {
			close();
		}
		System.out.println("불러온 목록의 개수 : " + list.size());
		return list;
	}
	
	// 2. List<BugsDTO> selectListBySearch(String search)
	// select * from bugs where
	//		name like '%' || ? || '%'
	//		or artist_name like '%' || ? || '%'
	
	// 3. BugsDTO selectOne(int id)
	// select * from bugs where id = ?
	public BugsDTO selectOne(int id) {
		BugsDTO dto = null;
		String sql = "";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	// 4. int insert(BugsDTO dto)
	// insert into bugs (...) values (?, ...)
	
	// 5. int update (BugsDTO dto)
	// update bugs set artist_name, ... where id = ?
	
	
	// 6. int delete(int id)
	// delete from bugs where id = ?
	
}
