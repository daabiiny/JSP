<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify-action.jsp</title>
</head>
<body>

<jsp:useBean id="dto" class="member.MemberDTO"/>
<jsp:setProperty property="*" name="dto"/>

<jsp:useBean id="dao" class="member.MemberDAO"/>
<c:set var="row" value="${dao.update(dto) }"/>

<c:if test="${row != 0 }">
	<c:redirect url="list.jsp"/>
</c:if>

<section class="frame">
	<h3>수정실패</h3>
	<a href="modify.jsp?userid=${dto.userid }"><button>수정페이지로 이동</button></a>
</section>


</body>
</html>