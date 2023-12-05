<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex03.jsp</title>
</head>
<body>

<h2>파라미터를 활용한 처리</h2>
<hr>

<form>
	<p><input type="text" name="name" placeholder="이름" required autofocus></p> 
	<p><input type="number" name="age" min="0" max="100" placeholder="나이" required></p>
	<p>
		<input type="submit">
		<a href="<%=request.getRequestURL()%>">
			<input type="button" value="초기화">
		</a>
	</p> 
</form>
	<!-- 새로운 요청을 만드는 태그 a, form -->
	<!-- a태그는 새로운 자원주소만 요청할 떄  -->
	<!-- form태그는 추가적인 데이터가 있을 때 -->
	<!--함수반환형이 String이니까 무조건 String으로 받아야 함 -->
	<!--변수선언은 if문 밖에서 해야함 -->
<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String msg = "";
	
	if(name != null) {
		String adult = Integer.parseInt(age) >= 20 ? "성인" : "미성년자";
		msg = String.format("%s님의 나이는 %s살이고, %s입니다", name, age, adult);
	}
%>

<h3><%=msg %></h3>

</body>
</html>