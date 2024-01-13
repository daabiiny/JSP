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

<c:set var="list" value="${boardDAO.selectListBoard(param.search) }" />

<div class="wrap">
	<c:forEach var="dto" items="${list }">
		<div id="oneBoard" class="flex">

			<div id="boardImg">
				<img src="${cpath }/reviewImage/${dto.img }">
			</div>

			<div id="boardInfo">
				<div>${dto.idx }${dto.writer } ${dto.writeDate } ${dto.viewCount }</div>
				<div>
					<a href="${cpath }/boardView.jsp?idx=${dto.idx }"> ${dto.title }</a>
				</div>
				<div id="boardContent">${dto.content }</div>
			</div>
		</div>
	</c:forEach>
</div>


</body>
</html>