<%@page import="com.cafe24.guestbook.vo.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="com.cafe24.guestbook.dao.GuestbookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<GuestbookVO> list = (List<GuestbookVO>)request.getAttribute( "list" );
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form action="/guestbook2/board" method="post">
		<input type="hidden" name="a" value="add" />
		<table border="1" width="510">
			<tr>
				<td>이름</td><td><input type="text" name="name"></td>
				<td>비밀번호</td><td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="content" cols=66 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
			</tr>
		</table>
	</form>
	<br>
<%
	int totalCount = list.size();
	int index = 0;
	if (list != null ) {
    	for ( GuestbookVO vo : list ) { 
%>
	<table width="510" border="1">
		<tr>
			<td>[<%= totalCount - index %>]</td>
			<td><%= vo.getName() %></td>
			<td><%= vo.getRegDate() %></td>
			<td><a href="/guestbook2/board?a=deleteform&no=<%= vo.getNo() %>">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4">
			<%= vo.getContent().replace("\n", "<br />") %>
			</td>
		</tr>
	</table>
	<br />
<%
			index++;
		}
	}
%>
</body>
</html>