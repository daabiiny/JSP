<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<%--
	댓글을 삭제한다 (삭제하기 위해서는 reply의 PK에 해당하는 idx값이 필요하다
	delete from reply where idx = ?
	
	삭제 프로세스가 끝나면, 게시글 보기 페이지로 이동(이동하기 위해서 board의 idx가 필요하다)
	redirect url="view.jsp?idx=?"
	이게 어렵다면 그냥
	redirect url="board.jsp"
	로 넘겨버려~
	
	삭제할 댓글의 idx, 이동할 게시글의 idx 2개가 필요하다	
--%>

<c:set var="row" value="${replyDAO.delete(param.idx) }"/>

<c:if test="${row != 0 }">
	<c:redirect url="view.jsp?idx=${param.board_idx }"/>
</c:if>

<script>
	alert('삭제가 진행되지 않았습니다')
	history.go(-1)
</script>

</body>
</html>