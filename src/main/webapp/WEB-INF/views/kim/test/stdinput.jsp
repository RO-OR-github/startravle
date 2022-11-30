<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 등록 화면</title>
</head>
<body>
<h1>회원 정보 등록 화면</h1>

<form method="post" action="/test/stdinput.do">
<table>
  <tr><td>아이디</td><td><input type="text" value="" name="id" id="id"></td></tr>
  <tr><td>이름</td><td><input type="text" name="name" id="name"></td></tr>
  <tr><td>나이</td><td><input type="text" name="age" id="age" value=0></td></tr>
  <tr><td></td><td><input type="submit" value="전송"></td><tr>
</table>
</form>
</body>
</html>