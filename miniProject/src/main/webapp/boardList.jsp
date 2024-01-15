<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<hr>

<div class="sb">
	<div>
		<form>
			<input type="text" name="search" value="${param.search }"
				placeholder="검색어를 입력하세요"> <input type="submit" value="검색">
		</form>
	</div>
	<div>
		<a href="${cpath }/writeBoard.jsp"><button>새 글 작성</button></a>
	</div>
</div>

<c:set var="boardCount" value="${boardDAO.selectCount(param.search) }" />
<c:set var="paramPage" value="${empty param.page ? 1 : param.page }" />
<c:set var="paging" value="${Paging.newInstance(paramPage, boardCount) }" />
<c:set var="list" value="${boardDAO.selectListBoard(param.search, paging) }" />

<div class="wrap">
	<c:forEach var="dto" items="${list }">
		<div id="oneBoard" class="flex">

			<div id="boardImg">
				<a href="${cpath }/boardView.jsp?idx=${dto.idx }">
					<img src="${cpath }/reviewImage/${dto.img }"></a>
			</div>

			<div id="boardInfo">
				<div class="flexSb">
					<div>${dto.idx }</div>
					<div>${dto.writer } 조회수 : ${dto.viewCount }</div>
				</div>
				<div class="boardTitle">
					<a href="${cpath }/boardView.jsp?idx=${dto.idx }"> ${dto.title }</a>
				</div>
				<div id="boardContent">${dto.content }</div>
				 ${dto.writeDate }
			</div>
		</div>
	</c:forEach>
</div>

<div class="frame center">
	<c:if test="${paging.prev }">
		<a href="${cpath }/boardList.jsp?page=${paging.begin - 10}&search=${param.serach }">[이전]</a>
	</c:if>
	
	<c:forEach var="i" begin="${paging.begin }" end="${paging.end }">
		<a class="${paging.page == i ? 'bold' : '' }"
			href="${cpath }/boardList.jsp?page=${i}&search=${param.search }">[${i }]</a>
	</c:forEach>
	
	<c:if test="${paging.next }">
		<a href="${cpath }/boardList.jsp?page=${paging.end + 1}&search=${param.search }">[다음]</a>
	</c:if>
</div>

<%@ include file="footer.jsp" %>