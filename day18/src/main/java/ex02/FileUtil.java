package ex02;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class FileUtil {
	
	// 싱글톤
	private static FileUtil instance = new FileUtil();
	public static FileUtil getInstance() {
		return instance;
	}
	private FileUtil() {}
	
	// 파일처리에 관련된 필드
	// 1은 미리 값을 지정할 수 없음 (그래서 null)
	private String saveDirectory = null;
	private int maxPostSize = 1024 * 1024 * 20;
	private String encoding = "UTF-8";
	private FileRenamePolicy policy = new DefaultFileRenamePolicy();
	
	// request를 전달받아서, 파일 및 다른 데이터를 DTO에 담아서 반환하는 함수
	public Ex02DTO getDTO(HttpServletRequest request) throws IOException, ParseException {
		Ex02DTO dto = null;
		
		// 1) 지정할 디렉토리가 없으면 새로 생성해야 한다
		if(saveDirectory == null) {
			ServletContext application = request.getServletContext();
			saveDirectory = application.getRealPath("/upload");
			File dir = new File(saveDirectory);
			dir.mkdirs();
			
			System.out.println(saveDirectory);	// 확인용
			// 절대경로 : 이 주소로 컴퓨터 어디에서든 같은 곳을 가리킨다
			// 우리 프로젝트 외부의 경로도 가능
		}
		
		// 2) request를 이용하여 MultipartRequest 객체를 생성한다
		// 이때, 첨부파일은 saveDirectory 위치에 자동으로 생성된다 (업로드된다)
		MultipartRequest mpRequest = new MultipartRequest(
				request, saveDirectory, maxPostSize, encoding, policy);
		
		// 갈색 : 매개변수(매번 바뀜) 요청이 들어올때마다 바뀌기 때문 -> 필드로 안 올려놓음
		// 파랑색 : 멤버필드(saveDirectory는 반고정, 나머지는 고정)
		
		// 3) 일반 문자열 파라미터는 getParameter(String name)으로 받는다
		String title = mpRequest.getParameter("title");
		
		// 4) 첨부파일은 getFile(String name)으로 받는다
		File image = mpRequest.getFile("image");	// <input type="file" name="image">
		System.out.println("상대경로 : " + image.getName());
		System.out.println("절대경로 : " + image.getAbsolutePath());
		
		
		// 5) java.sql.Date는 new java.sql.Date(new java.util.Date().getTime())로 받는다
		// String -> java.util.Date -> long -> java.sql.Date
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");	// 문자열로 받은 다음
		String inputDate = mpRequest.getParameter("eventDate");		// util 데이터로 변환
		java.util.Date d1 = sdf.parse(inputDate);
		long time = d1.getTime();									// long값으로 변환
		java.sql.Date d2 = new java.sql.Date(time);					// DB에 날짜를 저장하는 것
		
		// 6) 준비된 값을 dto에 모두 세팅한다
		dto = new Ex02DTO();
		dto.setTitle(title);
		dto.setImage(image.getName());	// 파일의 이름만 문자열 형식으로 저장한다
										// 우리가 매번 <img src="a.png"> 이런식으로 쓰니 문자열이 필요하다
		dto.setEventDate(d2);
		
		return dto;
	}

	// saveDirectory 내부의 파일이름을 문자열의 배열형태로 반환하는 함수
	public String[] getFileNames() {
		String[] arr = null;
		if(saveDirectory != null) {
			File dir = new File(saveDirectory);
			arr = dir.list();
		}
		return arr;
	}
}