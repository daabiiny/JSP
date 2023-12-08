<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%-- 삭제하고나면 전체목록으로 돌리기 --%>

<%--파라미터의 idx를 dao로 전달받아 삭제 --%>
${dao.delete(param.idx) }

<%
	response.sendRedirect("list.jsp");
	
%>

</body>
</html>