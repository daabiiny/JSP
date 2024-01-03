package itstudent;

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

public class ItstudentDAO {
	
	private Context init;
	private DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static ItstudentDAO instance = new ItstudentDAO();
	
	public static ItstudentDAO getInstance() {
		return instance;
	}
	private ItstudentDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	private ItstudentDTO mapping(ResultSet rs) throws SQLException {
		ItstudentDTO dto = new ItstudentDTO();
		dto.setAddress(rs.getString("address"));
		dto.setGender(rs.getString("gender"));
		dto.setUserid(rs.getString("userid"));
		dto.setUsername(rs.getString("username"));
		return dto;
	}
	
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (Exception e) {}
	}
	
	public String getVersion() {
		String version = null;
		String sql = "select banner from v$version";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				version = rs.getString("banner");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			version = e.getMessage();
		} finally {
			close();
		}
		return version;
	}
	// 회원목록 (select * from itstudent order by userid)
	public List<ItstudentDTO> selectList() {
		ArrayList<ItstudentDTO> list = new ArrayList<>();
		String sql = "select * from itstudent order by userid";
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
	// 입력값(id, password)를 전달받아서 일치하는 계정 하나를 반환하는 함수
	// (select * from itstudent where userid = ? and userpw = ?)
	public ItstudentDTO login(ItstudentDTO dto) {
		ItstudentDTO login = null;
		String sql = "select * from itstudent where userid = ? and userpw = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				login = mapping(rs);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return login;
	}
	
	// 회원가입
	// (insert into itstudent (userid, userpw, username, gender, address) values (?, ?, ?, ?, ?))
	public int insert(ItstudentDTO dto) {
		int row = 0;
		String sql = "insert into itstudent (userid, userpw, username, gender, address) values (?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getAddress());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
				e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	// 탈퇴
	// (delete itstudent where userid = ?)
	public int delete(String userid) {
		int row = 0;
		String sql = "delete from itstudent where userid = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	
	// 정보수정
	//	 "update itstudent"
	//		+ " set"
	//		+ "		userid = ?,"
	//		+ "		userpw = ?,"
	//		+ "		username = ?,"
	//		+ "		gender = ?,"
	//		+ "		address = ?"
	//		+ " where"
	//		+ "		userid = ?";
	
	public int update(ItstudentDTO dto) {
		int row = 0;
		String sql = "update itstudent"
						+ " set"
						+ "		userpw = ?,"
						+ "		username = ?,"
						+ "		gender = ?,"
						+ "		address = ?"
						+ "	where"
						+ "		userid = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserpw());
			pstmt.setString(2, dto.getUsername());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getAddress());
			pstmt.setString(5, dto.getUserid());
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
		
	}
	
	
	
	
	
	
	
}
