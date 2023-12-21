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

<h3>index.jsp</h3>
<jsp:useBean id="dao" class="bugs.BugsDAO" />
<h3>dao : ${dao }</h3>

<c:set var="list" value="${dao.selectAll(param.search) }"/>
<h3>${list }</h3>

</body>
</html>