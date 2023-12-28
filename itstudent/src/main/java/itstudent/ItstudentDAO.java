package itstudent;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	
	
}
