<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="food.FoodDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex05.jsp</title>
</head>
<body>

<h1>ex05.jsp - attribute</h1>
<hr>

<%--공통점 : 둘다 서버에서 씀 --%>
<%--parameter는 요청에 담겨 있기 때문에 매번 다른 요청이 오는 반면 --%> 
<%--attribute는 서버 안에 쟁여놓고 쓰는 클라우드 저장소 같은 느낌 (서버 안에서만 씀) --%> 

<h2>parameter vs attribute</h2>
<h4>parameter</h4>
<ul>
	<li>파라미터는 사용자의 입력값을 말한다</li>
	<li>쿼리스트링 형태로 있을 수 있으며, 문자열로 구성된다</li>
	<li>HTTP Method가 POST인 경우, 문자열 혹은 파일객체로 구성될 수 있다</li>
	<li>사용자의 입력값이므로, 서버 개발자가 값을 강제로 넣을 수는 없다 (setParameter는 없다)</li>
</ul>

<h4>attribute</h4>
<ul>
	<li>프로그램에서 활용되는 객체를 말한다</li>
	<li>Object타입으로 정의되어 있어서, 자바의 모든 객체를 사용할 수 있다</li>
	<li>JSP 내장 객체에 저장해둘 수 있고, 내장객체에 따라 유효범위가 다르다</li>
	<li>서로 다른 JSP 페이지가 attribute를 공유할 수 있다</li>
	<li>서버 개발자가 값을 set 혹은 get 할 수 있다</li>
	<li>Object타입을 원하는 형태로 바꾸려면, 형변환(down-casting)을 해야 한다</li>
	<%--FoodDTO ob = (FoodDTO) request.getAttribute(category) 같이! --%>
</ul>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<td>request.setAttribute(String name, Object 0)</td>
		<td>name이름으로 객체를 request에 저장한다</td>
	</tr>
	<tr>
		<td>request.getAttribute(String name)</td>
		<td>name이름으로 request에 저장된 객체를 (복사하여) 꺼낸다</td>
	</tr>
	<tr>
		<td>request.removeAttribute(String name)</td>
		<td>name이름으로 request에 저장된 객체를 제거한다</td>
	</tr>
</table>

<%
	String test1 = "Hello";
	FoodDTO test2 = new FoodDTO();
	Integer[] test3 = { 2, 7, 8, 4, 6 };
	List<Integer> test4 = Arrays.asList(test3);
	
	test2.setCategory("치킨");
	test2.setMenuName("굽네순살");
	test2.setMenuPrice(16900);
	test2.setStoreName("굽네치킨 광안점");
	
	test4.sort(null);
	
	// "test1" 꺼내거나 지우고 싶은 이름
	request.setAttribute("test1", test1);
	request.setAttribute("test2", test2);
	request.setAttribute("test3", test3);
	request.setAttribute("test4", test4);
	
	// Attribute는 개발자가 직접 넣는 형태
	String ob1 = (String) request.getAttribute("test1");
	FoodDTO ob2 = (FoodDTO) request.getAttribute("test2");
	Integer[] ob3 = (Integer[]) request.getAttribute("test3");
	List<Integer> ob4 = (List<Integer>) request.getAttribute("test4");
	
	request.removeAttribute("test3");
	
	// ob는 복사본같은 느낌
	// remove, set, get은 한번에 쓰는 경우가 잘 없다
	out.print("<p>ob1 : " + ob1 + "</p>");
	out.print("<p>ob2 : " + ob2 + "</p>");
	out.print("<p>ob3 : " + ob3 + "</p>");
	out.print("<p>ob4 : " + ob4 + "</p>");
	
	out.print("<br>");
	
	out.print("<p>test1 : " + request.getAttribute("test1") + "</p>");
	out.print("<p>test2 : " + request.getAttribute("test2") + "</p>");
	out.print("<p>test3 : " + request.getAttribute("test3") + "</p>");
	out.print("<p>test4 : " + request.getAttribute("test4") + "</p>");
%>

<table border="1" cellpadding="10" cellspacing="0">
	<tr>
		<th>내장객체</th>
		<th>유효범위</th>
	</tr>	
	<tr>
		<%--공유라는 개념보다는 현재 페이지 저장용도 --%>
		<td>pageContext</td>
		<td>현재 페이지에서만 사용할 attribute를 저장한다</td>
	</tr>	
	<tr>
		<%--한번 연장 가능! 토스 느낌적인 느낌 --%>
		<td>request</td>
		<td>
			현재 요청에 대해서만 사용할 attribute를 저장한다<br>
			forward를 이용하면, forward 대상 페이지에서도 attribute를 참조할 수 있다
		</td>
	</tr>
	<tr>
		<%--일정 시간이 지나면 만료되게 자동 설정, 강제 완료 시킬 수 있음(logout)%>
		<%--client 수만큼 만들어짐 --%>
		<td>session</td>
		<td>현재 사용자가 요청하는 모든 페이지에 대해 공유할 수 있는 attribute 저장소</td>
	</tr>	
	<tr>
		<%--client 수(X) only 하나만 만듬 --%>
		<td>application</td>
		<td>모든 사용자가 요청하는 모든 페이지에 대해 공유할 수 있는 attribute 저장소</td>
	</tr>
</table>


</body>
</html>