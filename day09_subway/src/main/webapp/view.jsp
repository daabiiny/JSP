<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<c:set var="dto" value="${dao.selectOne(param.idx) }" />
	
	<div class="view">
		<div>${dto.category }</div>
		<div><img src="${dto.imgName }"></div>
		<div>${dto.name }</div>
		<div>${dto.memo }</div>
		<div>${dto.price }</div>
	</div>
	
	<div>
		<a href="${cpath }/add.jsp"><button>메뉴 추가</button></a>
	</div>
	
</section>

</body>
</html>