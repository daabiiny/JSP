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

<jsp:useBean id="dao" class="bugs.BugsDAO" />
<c:set var="row" value="${dao.delete(param.id) }"/>

<c:if test="${row != 0 }">
	<c:redirect url="list.jsp"/>
</c:if>

<!-- script를 이용하여 경고창을 띄우고 이전 페이지로 돌아간다 -->
<script>
	alert('삭제 실패')
	location.href = 'list.jsp'
</script>


</body>
</html>