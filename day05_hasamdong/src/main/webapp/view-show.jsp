<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view-show.jsp</title>

<style>
	div.view {
		width: 900px;
		margin: auto;
	}
	h1 {
		display: flex;
 		justify-content: center;
	}
	table {
		border-collapse: collapse;
        
		display: flex;
 		justify-content: center;
 		padding: 30px;
	}
	
    table th,
    table td {
 	    padding: 10px;
        border: 1px solid grey;
    }
	
	

</style>
</head>
<body>

<div class="view">
<h1>${dto.menuName } (${dto.hotIce })</h1>

<table>
	<tr>
		<th>no</th>
		<td>${dto.idx }</td>
	</tr>
	<tr>
		<th>카테고리</th>
		<td>${dto.category }</td>
	</tr>
	<tr>
		<th>HOT/ICE</th>
		<td>${dto.hotIce }</td>
	</tr>
	<tr>
		<th>메뉴명</th>
		<td>${dto.menuName }</td>
	</tr>
	<tr>
		<th>가격</th>
		<td>${dto.menuPrice }</td>
	</tr>
	<tr>
		<th>칼로리</th>
		<td>${dto.cal }</td>
	</tr>
</table>

<p>
	<a href="list.jsp"><button>목록</button></a>
	<a href="delete.jsp?idx=${dto.idx }"><button>삭제</button></a>
</p>
</div>

</body>
</html>