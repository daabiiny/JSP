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
<div class="frame" id="date"><fmt:formatDate value="${dto.writeDate }" 
			pattern="yyyy년 MM월 dd일 a hh시 mm분" /></div>

<section>
	<div id="reply">
		<div id="replyWrite">
			<form method="POST" id="replyWriteForm">
				<div>🧑🏻 ${login.userid }</div>
				<textarea name="content" rows="5" cols="80" required></textarea>
				<input type="hidden" name="board_idx" value="${dto.idx}">
				<input type="hidden" name="writer" value="${login.userid }">
				<input type="submit" name="등록">
			</form>
			<c:if test="${pageContext.request.method == 'POST' }">
				<jsp:useBean id="reply" class="reply.ReplyDTO" />
				<jsp:setProperty property="*" name="reply" />
				<c:set var="row" value="${replyDAO.insertReply(reply) }" />
				<c:redirect url="/boardView.jsp?idx=${dto.idx }"/>
			</c:if>
		</div>
		<div id="replyList">
			<c:forEach var="reply" items="${replyDAO.selectListReply(param.idx) }">
				<div class="replyItem" idx="${reply.idx }" >
					<p>${reply.writer }</p>
					<pre>${reply.content }</pre>
				</div>
			</c:forEach>
		</div>
	</div>
</section>


</body>
</html>