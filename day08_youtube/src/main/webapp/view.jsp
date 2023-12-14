<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<section class="frame">
	<c:set var="dto" value="${dao.selectOne(param.idx) }"/>
	
	<div class="view">
		<div><pre>${dto.tag }</pre></div>
		<div class="chating"><p>채팅 다시보기 표시</p></div>
		<div class="viewtitle">
			<h3>${dto.title }</h3>
		</div>
		
		<div class="viewsub">
			<div class="subleft">
				<div><h4>${dto.chName }</h4></div>
				<div><h5>🔔 구독중 ∨</h5></div>
			</div>
			<div class="subright">
				<div><h5>  👍🏻1만     👎🏻  </h5></div>
				<div><h5>  🙏🏻공유  </h5></div>
				<div><h5>  ⩡ 오프라인 저장  </h5></div>
				<div><h5>  ✂ 클립  </h5></div>
				<div><h5>  📌 저장  </h5></div>
			</div>

		</div>
	
	</div>
	<div class="sb">
		<div>
			<a href="${cpath }/list.jsp"><button>목록</button></a>
			<a href="${cpath }/modify.jsp?idx=${dto.idx}"><button>수정</button></a>
			<a href="${cpath }/delete.jsp?idx=${dto.idx}"><button>삭제</button></a>
		</div>
	</div>
</section>

</body>
</html>