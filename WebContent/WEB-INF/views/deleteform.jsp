<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
    String no = (String) request.getAttribute( "no" );
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<form method="POST" action="/guestbook2/board">
		<input type="hidden" name="a" value="delete" />
		<input type="hidden" name="no" value="<%= no %>" />
		<table>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
				<td><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
	<a href="/guestbook2/board">메인으로 돌아가기</a>
</body>
</html>