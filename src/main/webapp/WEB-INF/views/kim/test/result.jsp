<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 내용</title>
</head>
<body>
  <h1>등록된 내용</h1>

  <table border="1">
    <tr><td>아이디 : </td><td>${msg.id}</td></tr>
    <tr><td>이름 : </td><td>${msg.name}</td></tr>
    <tr><td>나이 : </td><td>${msg.age}</td></tr>
  </table>
  
  <a href="std_list.do"> 목록</a>
  <a href="std_delete.do?seq=${msg.seq}">${msg.name}삭제</a>
  <a href="std_update.do?seq=${msg.seq}">${msg.name}수정</a>

</body>
</html>