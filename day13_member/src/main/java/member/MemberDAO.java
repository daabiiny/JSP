package member;

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

public class MemberDAO {
	
/*
	 DAO는 DB에 접속하기 위해 Connection이 필요하다
	 Connection을 미리 생성하여 관리하는 DataSource 객체는 context.xml에 정의되어 있다
	 미리 준비한 DataSource를 자바 객체로 불러오기 위해서는 Context를 객체화해서 불러와야 한다
	 Connection 이후에는 이전 순서대로 [PreparedStatement], [ResultSet] 등이 필요하다
	 
	 1) context.xml의 내용을 자바 객체로 불러온다. new InitialContext();
	 2) context.xml에 작성한 DataSource 객체를 지정한 이름 "jdbc/oracle"로 불러온다
	 3) context.xml에 정의한 객체는 이름 앞에 접두사를 붙여야 한다. "java:comp/env"
	 4) Object타입을 반환하기 때문에 좌우의 자료형을 맞추기 위해 다운캐스팅 한다(이후 예외 처리)
 */
	
	// dao에서 이 두 친구들이 핵심!
	private Context init;
	private DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static MemberDAO instance = new MemberDAO();	// MemberDAO의 객체는 오직 하나만이다
	
	public static MemberDAO getInstance() {	// 객체를 반환하는 함수 getInstance()는 외부에서 호출가능
		return instance;
	}
	
	public MemberDAO() {	// 생성자 외부 호출 금지
		try {
			init = new InitialContext();								// context.xml 불러오기
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");	// context 내부 DataSource 불러오기
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	
	// close
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (Exception e) {
		}
	}
	
	// mapping
	private MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setUserid(rs.getString("userid"));
		dto.setUserpw(rs.getString("userpw"));
		dto.setUsername(rs.getString("username"));
		dto.setGender(rs.getString("gender"));
		dto.setEmail(rs.getString("email"));
		return dto;
	}
	
	// 회원목록 (select * from member)
	public List<MemberDTO> selectAll() {
		ArrayList<MemberDTO> list = new ArrayList<>();
		String sql = "select * from member";
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
		} return list;
		
	}
	
	// 로그인(단일조회)
	// (select * from member where userid = ?)
	public MemberDTO selectOne(String userid) {
		String sql = "select * from member where userid = ?";
		MemberDTO dto = null;
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
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
	
	// 회원가입
	// (insert into member (userid, userpw, username, gender, email) values (?, ?, ?, ?, ?))
	public int insert(MemberDTO dto) {
		int row = 0;
		String sql = "insert into member (userid, userpw, username, gender, email) values (?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return row;
	}
	// 탈퇴
	// (delete member where userid = ?)
	
	// 정보수정
//	 "update member"
//		+ " set"
//		+ "		userid = ?,"
//		+ "		userpw = ?,"
//		+ "		username = ?,"
//		+ "		gender = ?,"
//		+ "		email = ?,"
//		+ " where"
//		+ "		userid = ?";
	public int update(MemberDTO dto) {
		int row = 0;
		String sql = "update member"
				+ " set"
				+ "		userpw = ?,"
				+ "		username = ?,"
				+ "		gender = ?,"
				+ "		email = ?"
				+ " where"
				+ "		userid = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserpw());
			pstmt.setString(2, dto.getUsername());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getEmail());
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
