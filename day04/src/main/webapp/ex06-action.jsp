<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<jsp:useBean id="login" class="ex06.MemberDTO" scope="session"/>
<jsp:setProperty property="name" name="login"/>

<!--scope에 따로 저장하지 않으면, page에 저장하는게 기본이다 --> 

<%

	// 세션은 클라이언트 당 하나! response가 여러개여도 세션 하나!
	// 하나의 서버에 세션은 사용자를 전담마크하기 위한 객체!
	// 크롬을 아예 다 닫아버리면 세션도 없어짐 (사용자가 아예 reset!)
	
	// 세션에 객체를 저장하는 것 만으로 이 페이지의 역할은 끝났다.
	// 이제 action페이지에서 할게 끝났다! 넌 이제 ex06으로 이동해라!
	// 다음화면으로 연결시켜주기 위해서 리다이렉트를 사용한다
	// 페이지가 바뀌면서 요청도 새로 들어가지만, 세션은 같은 세션이기 때문에 attribute를 사용할 수 있다
	response.sendRedirect("ex06.jsp");

	// 주로 세션과 많이 연계하는 redirect 
%>

</body>
</html>