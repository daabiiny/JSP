<%@page import="ex06.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex07-show.jsp</title>
</head>
<body>


<h1>ex07-action에서 선택한 값 출력</h1>
<hr>

<img src="<%=((MemberDTO)request.getAttribute("dto")).getImgPath() %>" height="150">

<%-- EL(Expression Language) 태그 --%>
<%-- 내장객체에서 어트리뷰트의 값을 꺼내서 html화면에 출력하고 싶을때 ${} --%>

<img src="${requestScope.dto.imgPath }" height="150">

<img src="${dto.imgPath }" height="150">

<h3>이름 : ${dto.name }</h3>

</body>
</html>