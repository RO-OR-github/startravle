<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>내용 등록 화면</title>
    <style>
        [type="submit"],[type="reset"]{
            background: none;
            font-size: 16px;
            border: none;
        }
        a:-webkit-any-link {
            color: black;
            cursor: pointer;
            text-decoration: none;
            font-weight:bold;
        }
        table{
            display: flex;
            border-collapse: collapse;
        }
        tbody{
            width: 80%;
            display: flex;
            flex-direction: column;
        }
        tr{
            width: 100%;
            display: flex;
            border: black solid 2px;
            border-bottom: none;
        }
        tr:nth-child(-n+4)>td{
            align-items: center;
            word-break:break-all;
        }
        tr:nth-child(-n+4)>td:nth-child(1){
            border-right: black solid 2px;
            text-align: center;
            line-height:50px;
            width: 8%;
        }
        tr:nth-child(-n+4)>td:nth-child(2)>input{
            width: 90%;
            align-items: center;
        }
        textarea{
            width: 100%;
            height: 200px;
        }
        .bu{
            align-items: center;
        }
        .bu>td>input{
            font-weight:bold;
        }
        input:focus {
            outline: none;
        }

    </style>
</head>
<body>
    <h1>내용 등록 화면</h1>
    <form method="post" action="bd_update.do?seq=${msg.seq}">
        <table>
            <tr><td style="max-height: 50px; min-width: 70px;">제목</td><td>${msg.title}</td></tr>
            <tr><td style="max-height: 50px; min-width: 70px;">작성자</td><td>${msg.name}</td></tr>
            <tr><td style="min-height: 80px; min-width: 70px; line-height: 80px">내용</td><td>${msg.content}</td></tr>
            <tr><td style="max-height: 30px; min-width: 70px; line-height: 30px">작성날짜</td><td style="line-height: 30px;">${msg.writetime}</td></tr>
            <tr class="bu">
                <td><a href="board.do" style= "padding:1px 6px; font-weight: bold; font-size: 16px">[목록]</a></td>
                <td><input type="submit" id="fix" value="[수정]"></td>
                <td><input type="submit" id="delete" value="[삭제]" style= "word-break:break-all;"></td>
            <tr>
        </table>
    </form>
</body>
</html>
