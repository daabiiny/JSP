package movie;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MovieDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static MovieDAO instance = new MovieDAO();
	public static MovieDAO getInstance() {
		return instance;
	}
	private MovieDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (SQLException e) {}
	}
	private MovieDTO mapping(ResultSet rs) throws SQLException {
		MovieDTO dto = new MovieDTO();
		dto.setActor(rs.getString("actor"));
		dto.setContent(rs.getString("content"));
		dto.setGenre(rs.getString("genre"));
		dto.setIdx(rs.getInt("idx"));
		dto.setPoster(rs.getString("poster"));
		dto.setReleaseDate(rs.getString("releaseDate"));
		dto.setTitle(rs.getString("title"));
		return dto;
	}
	// 최신 영화 목록 (selectListMovie)
	// select * from movie0;
	public List<MovieDTO> selectListMovie() {
		ArrayList<MovieDTO> list = new ArrayList<>();
		String sql = "select * from movie0 order by idx";
		try {
			conn = ds.getConnection();
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
	// 영화별 상세정보 (selectOneList)
	
}
