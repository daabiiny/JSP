<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex01.jsp</title>
</head>
<body>

<h1>파라미터 입력을 활용한 업다운 게임 구현하기</h1>
<hr>
<%@ page import="java.util.Random" %>
<%!
	private Random ran = new Random();	// 매번 새로 생성할 수 없기 때문에 선언부
	private int count = 0;				// 진행하는 동안 횟수가 유지되어야 하기 때문에
	private int cpu;					// 입력마다 값이 바뀌면 안되니까(유지되어야 한다)
	
	// String test = request;	// 선언부에서는 request 및 response에 접근 불가 
	
%>
	<%--request 함수는 선언부에서는 적용이 안됨 --%>
	<%--request와 response는 매개변수이기 때문에 스크립틀릿 안에서만 적용가능 --%>
	
	<%--입력할 때마다 매번 프로그램이 새로 실행되는 창이기 때문에 while문을 쓰지 않고, if문을 씀 --%>
<%

	if(request.getParameter("reset") != null) {
		count = 0;
	}

	String input = request.getParameter("user");	// 입력값은 매번 새로 바뀐다
	int user;			// 사용자 입력값은 매번 변경되기도 하고, request로 받아와야 한다
	String msg = "";
	
	if(count == 0){					// 횟수가 0이면 (시작하는 단계이면)
		cpu = ran.nextInt(100) + 1;	// cpu의 값이 랜덤으로 할당한다
	}
	if(input != null) {
		count++;
		user = Integer.parseInt(input);
		if(user == cpu) {
			msg = String.format("정답. %d회만에 정답을 맞춤", count);
		}
		else if (user < cpu) {
			msg = String.format("UP (%d회 도전 중)", count);
		}
		else {	// if(user > cpu)
			msg = String.format("DOWN (%d회 도전 중)", count);
		}
	}

%>
<form>
	<p>
		<input type="number" name="user" min="1" max="100" required autofocus>
		<input type="submit">
		<a href="ex01.jsp?reset=true"><input type="button" value="다시"></a>
	</p>

</form>

<h3><%=msg %></h3>

</body>
</html>