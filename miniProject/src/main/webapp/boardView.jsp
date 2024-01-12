<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="row" value="${boardDAO.updateViewCount(param.idx) }"/>

<c:set var="dto" value="${boardDAO.selectOneBoard(param.idx) }"/>

<div class="sb">
	<div>${dto.idx }. ${dto.title }</div>
	<div>작성자 : ${dto.writer }</div>
</div>
<div class="flex frame">
	<div class="frame" id="viewImg"><img src="${cpath }/reviewImage/${dto.img }"></div>
	<div>조회수 ${dto.viewCount }</div>
</div>
<div class="frame">${dto.content }</div>
<div class="frame" id="date"><fmt:formatDate value="${dto.date }" 
			pattern="yyyy년 MM월 dd일 a hh시 mm분" /></div>


</body>
</html>