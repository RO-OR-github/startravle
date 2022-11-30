<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 내용</title>
</head>
<body>
  <h1>글쓰기 수정 화면</h1>
  <form action="std_update_exec.do" method="post">
    <input type = "hidden" name = "seq" value="${msg.seq}"> 
      <table border="1">
        <tr><td>아이디</td><td><input type="text" value="${msg.id}" name="id" id="id"></td></tr>
        <tr><td>이름 </td><td><input type="text" value="${msg.name}" name="name" id="name"></td></tr>
        <tr><td>나이 </td><td><input type="text" name="age" id="age" value="${msg.age}"></td></tr>
        <tr><td></td><td><input type=submit value="수정"></td></tr>
      </table>
  </form>
</body>
</html>