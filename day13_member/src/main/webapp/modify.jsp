<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify.jsp</title>
</head>
<body>

<jsp:useBean id="dao" class="member.MemberDAO"/>
<c:set var="dto" value="${dao.selectOne(param.userid) }"/>

<section class="frame">
	<form action="modify-action.jsp">
	<input type="hidden" name="userid" value="${dto.userid }">
	<p>이름 : <input type="text" name="username" value="${dto.username }"></p>
	<p>비밀번호 : <input type="password" name="userpw" value="${dto.userpw }"></p>
	<p>
		<label><input type="radio" name="gender" value="남성" >남성</label>
		<label><input type="radio" name="gender" value="여성" >여성</label>
	</p> 
	<p>이메일 : <input type="text" name="email" value="${dto.email }"></p> 
	<p><input type="submit" value="수정"></p>
</form>


</section>


</body>
</html>