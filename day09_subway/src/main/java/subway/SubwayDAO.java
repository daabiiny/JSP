package subway;

import java.sql.*;
import java.util.*;

public class SubwayDAO {

	private String url = "jdbc:oracle:thin:@192.168.1.100:1521:xe";
	private String user = "c##itbank";
	private String password = "it";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// getConnection
	private Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		return DriverManager.getConnection(url, user, password);
	}
	
	// close
	private void close() {
		try {
			if(rs != null)   	rs.close();
			if(pstmt != null) 	pstmt.close();
			if(conn != null)	conn.close();
		} catch (Exception e) {}
		}
	
	// mapping
	private SubwayDTO mapping(ResultSet rs) throws SQLException {
		SubwayDTO dto = new SubwayDTO();
		dto.setCategory(rs.getString("category"));
		dto.setIdx(rs.getInt("idx"));
		dto.setImgName(rs.getString("imgName"));
		dto.setMemo(rs.getString("memo"));
		dto.setName(rs.getString("name"));
		dto.setPrice(rs.getInt("price"));
		return dto;
	}
	
	// 전체목록 (select * from subway)
	public List<SubwayDTO> selectList() {
		ArrayList<SubwayDTO> list = new ArrayList<>();
		String sql = "select * from subway";
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
	
	// 카테고리별 목록 (select * from subway where category = ? )
	public List<SubwayDTO> selectListByCategory(String category) {
		ArrayList<SubwayDTO> list = new ArrayList<>();
		String sql = "select * from subway where category = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				list.add(mapping(rs));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
		
	}
	// 단일조회 (select * from subway where idx = ? )
	public SubwayDTO selectOne(int idx) {
		SubwayDTO dto = null;
		String sql = "select * from subway where idx = ?";
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
		} finally {
			close();
		}
		return dto;
	}
	
	// 추가 (insert into subway (category, name, price, imgName, memo) values (?, ?, ?, ?, ?)
	public int insert(SubwayDTO dto) {
		int row = 0;
		String sql = "insert into subway (category, name, price, imgName, memo) values (?, ?, ?, ?, ?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getImgName());
			pstmt.setString(5, dto.getMemo());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	// 삭제 (delete subway where idx = ?)
	public int delete(int idx) {
		int row = 0;
		String sql = "delete subway where idx = ?";
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
	//	category, name, price, imgName, memo
	public int update(SubwayDTO dto) {
		int row = 0;
		String sql = "update subway "
				+ "set"
				+ "			category = ?,"
				+ "			name = ?,"
				+ "			price = ?,"
				+ "			imgName = ?,"
				+ "			memo = ?"
				+ "where"
				+ "			idx = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCategory());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getPrice());
			pstmt.setString(4, dto.getImgName());
			pstmt.setString(5, dto.getMemo());
			pstmt.setInt(6, dto.getIdx());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	// 마지막으로 사용한 시퀀스 번호를 불러오는 함수
	// select max(idx) from subway;
	public int selectCurrSeq() {
		int idx = 0;
		String sql = "select max(idx) from subway";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				idx = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return idx;
		
	}
}
