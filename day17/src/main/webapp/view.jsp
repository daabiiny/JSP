<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<h2>게시글 상세 보기</h2>

<div class="modify">
	<c:set var="dto" value="${boardDAO.selectOne(param.idx) }"/>
	<div></div>
	<div>
		<a href="${cpath }/modify-form.jsp?idx=${dto.idx}"><button>수정</button></a>
		<a href="${cpath }/delete.jsp?idx=${dto.idx}"><button>삭제</button></a>
	</div>
</div>

<fieldset>
	<h4>${dto.title }</h4>
	<h5>작성자 : ${dto.writer } / 작성일 : ${dto.writeDate }</h5>
	<pre>${dto.content }</pre>
</fieldset>

<form method="POST" action="reply-write.jsp">
	<h2>댓글 작성</h2>
	<c:if test="${empty login }">
		<c:set var="replyComment">로그인 후에 댓글 작성 가능합니다</c:set>
	</c:if>
	<c:if test="${not empty login }">
		<c:set var="replyComment">바르고 고운 말을 사용합시다</c:set>
	</c:if>
	<div class="replyWrite">
		<textarea name="content" rows="4" cols="150"
		 placeholder="${replyComment}" ${empty login ? 'disabled' : '' }></textarea>
		 <input type="submit" value="댓글쓰기"
		 ${empty login ? 'disabled' : ''} >
		 <input type="hidden" name="board_idx" value="${param.idx }">
		 <input type="hidden" name="writer" value="${login.userid }">
	</div>
</form>

<div>
	<c:set var="list" value="${replyDAO.selectList(param.idx) }"/>
	<c:forEach var="reply" items="${list }">
		<div class="replyItem">
			<div class="replyItem2">
				<div>${reply.writer }</div>
				<div>
					<fmt:formatDate value="${reply.writeDate }" pattern="yyyy-MM-dd a hh:mm"/>
					<c:if test="${reply.writer == login.userid }">
						<a href="${cpath }/reply-delete.jsp?idx=${reply.idx}&board_idx=${dto.idx}"></a>
					</c:if>
				</div>
			</div>
			<div><pre>${reply.content }</pre></div>		
		</div>
	</c:forEach>
</div>

<a href="${cpath }/board.jsp"><button>목록으로</button></a>

</body>
</html>