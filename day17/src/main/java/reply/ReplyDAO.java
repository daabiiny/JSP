package reply;

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

public class ReplyDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static ReplyDAO instance = new ReplyDAO();
	public static ReplyDAO getInstance() {
		return instance;
	}
	private ReplyDAO() {
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
		} catch (Exception e) {}
	}
	public ReplyDTO mapping(ResultSet rs) throws SQLException {
		ReplyDTO dto = new ReplyDTO();
		dto.setBoard_idx(rs.getInt("idx"));
		dto.setContent(rs.getString("content"));
		dto.setIdx(rs.getInt("idx"));
		dto.setWriteDate(rs.getDate("writeDate"));
		dto.setWriter(rs.getString("writer"));
		return dto;
	}
	// 댓글목록 (selectList)
	public List<ReplyDTO> selectList(int board_idx) {
		ArrayList<ReplyDTO> list = new ArrayList<>();
		String sql = "select * from reply where board_idx = ? order by idx";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
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
	// 댓글작성 (insert)
	// 댓글삭제 (delete)
}
