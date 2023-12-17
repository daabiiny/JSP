package youtube;

import java.sql.*;
import java.util.*;

import oracle.jdbc.driver.OracleDriver;

public class YoutubeDAO {
	
	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// getConnection
	private Connection getConnection() throws Exception {
		Class.forName(OracleDriver.class.getName());
		return DriverManager.getConnection(url, user, password);
	}
	
	// close
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (Exception e) {}
	}
	
	// mapping
	private YoutubeDTO mapping(ResultSet rs) throws SQLException {
		YoutubeDTO dto = new YoutubeDTO();
		dto.setCategory(rs.getString("category"));
		dto.setChName(rs.getString("chName"));
		dto.setIdx(rs.getInt("idx"));
		dto.setTag(rs.getString("tag"));
		dto.setThumbNail(rs.getString("thumbNail"));
		dto.setTitle(rs.getString("title"));
		return dto;
	}
		
	// 전체목록 (select * from youtube)
	public List<YoutubeDTO> selectList() {
		ArrayList<YoutubeDTO> list = new ArrayList<>();
		String sql = "select * from youtube";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 카테고리별 목록 (select * from youtube where category = ? )
	public List<YoutubeDTO> selectListByCategory(String category) {
		ArrayList<YoutubeDTO> list = new ArrayList<>();
		String sql = "select * from youtube where category = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	// 단일조회 (select * from youtube where idx = ? )
	public YoutubeDTO selectOne(int idx) {
		String sql = "select * from youtube where idx = ?";
		YoutubeDTO dto = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close(); }
		return dto;
	}
	
	// 추가 (insert into youtube (category, title, chName, thumbNail, tag) values (?, ?, ?, ?, ?)
	public int insert(YoutubeDTO dto) {
		int row = 0;
		String sql = "insert into youtube (category, title, chName, thumbNail, tag) values (?, ?, ?, ?, ?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getChName());
			pstmt.setString(4, dto.getThumbNail());
			pstmt.setString(5, dto.getTag());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally { close(); }
		
		return row;
	}
	
	// 삭제 (delete youtube where idx = ?)
	public int delete(int idx) {
		int row = 0;
		String sql = "delete youtube where idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	// 수정 (update...)
	public int update(YoutubeDTO dto) {
		int row = 0;
		String sql = "update youtube"
				+ " set"
				+ "		title = ?,"
				+ "		chName = ?,"
				+ "		thumbNail = ?,"
				+ "		tag = ?,"
				+ "		category = ?,"
				+ " where"
				+ "		idx = ?";
	try {
		conn = getConnection();
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dto.getTitle());
		pstmt.setString(2, dto.getChName());
		pstmt.setString(3, dto.getThumbNail());
		pstmt.setString(4, dto.getTag());
		pstmt.setString(5, dto.getTag());
		pstmt.setInt(6, dto.getIdx());
		row = pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		close();
	}
	return row;
	}
	
	 
	public int selectCurrSeq() {
		int idx = 0;
		String sql = "select max(idx) from youtube";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				idx = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally { close(); }
		
		return idx;
	}
	
	
}
