<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 만들기</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            text-align: center;
        }
        table {
            width: 100%;
        }
        #input{
            float: right;
        }
        tr:nth-child(1)>th:nth-child(1){
            width: 5%;
        }
        tr:nth-child(1)>th:nth-child(2){
            width: 45%;
        }
        tr:nth-child(1)>th:nth-child(3){
            width: 25%;
        }
        tr:nth-child(1)>th:nth-child(4){
            width: 25%;
        }

    </style>
</head>
<body>
<h1>게시판 화면</h1>
<a id=input href="inputcontent.do"> [입력] </a>
<table>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
    </tr>

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