<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>수정 : ${param.id }</h1>
<hr>

<!-- pk(id)는 해당 사이트의 정체성과 같아서 수정하지 않음 -->
<!-- 칸 크기 다 맞추려면 table 태그 쓰면 됨 -->

<jsp:useBean id="dao" class="bugs.BugsDAO" />
<c:set var="dto" value="${dao.selectOne(param.id) }"/>

<!-- db에서 selectOne으로 하나를 받아와서 밑에 value값에 하나 하나 넣는다! -->

<form action="modify-action.jsp">
	<input type="hidden" name="id" value="${dto.id }"/>
	<p>아티스트 이름 : <input type="text" name="artist_name" value="${dto.artist_name }"></p>
	<p>앨범 이름 : <input type="text" name="album_name" value="${dto.album_name }"></p>
	<p>곡 이름 : <input type="text" name="name" value="${dto.name }"></p>
	<p>장르 : <input type="text" name="genre" value="${dto.genre }"></p>
	<p>플레이시간 : <input type="number" name="playTime" value="${dto.playTime }"></p>
	<p>
		<label><input type="radio" name="isTitle" value="1" ${dto.isTitle == 1 ? 'checked' : '' }>타이틀</label>
		<label><input type="radio" name="isTitle" value="0" ${dto.isTitle == 0 ? 'checked' : '' }>수록곡</label>
	</p>
	<p>
		<span>가사</span><br>
		<textarea name="lyrics" rows="10" cols="80">${dto.lyrics }</textarea>
	</p>
	<p><input type="submit" value="수정하기"></p>

</form>

</body>
</html>