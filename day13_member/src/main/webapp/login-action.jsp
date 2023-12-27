<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<section class="frame">

	<jsp:useBean id="dao" class="member.MemberDAO" />
	<c:set var="dto" value="${dao.selectOne(param.userid) }"/>
	
	<h3>${dto.username }의 ID는 ${dto.userid }입니다</h3>

</section>

</body>
</html>