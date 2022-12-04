<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 만들기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<h1>게시판 화면</h1>
<a id=input href="inputcontent.do"> [입력] </a>
<table class="table">
    <thead class="table-dark"></thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>등록일</th>
        </tr>
    </thead>
    <c:forEach var = "bd_n" items="${bd_cmd}">
        <tr>
            <td><a href="board.do?seq=${bd_n.seq}">${bd_n.seq}</a></td>
            <td>${bd_n.title}</td>
            <td>${bd_n.name}</td>
            <td>${bd_n.writetime}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>