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
      display: flex;
      border: black solid 2px;
      border-bottom: none;
    }
    tr:nth-child(-n+4)>td{
      display: flex;
      width: 100%;
      align-items: center;
    }
    tr:nth-child(-n+4)>td:nth-child(1){
      border-right: black solid 2px;
      width: 5%;
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

<form method="post" action="inputresult.do">
  <table>
    <tr><td>작성자</td><td><input type="text" name="name" id="name" value="" style="border:none"></td></tr>
    <tr><td>제목</td><td><input type="text" name="title" id="title" value="" style="border:none"></td></tr>
    <tr><td>내용</td><td><textarea name="content"></textarea></td></tr>
    <tr><td>비밀번호</td><td><input type="password" name="password" id="password" value="" style="border:none"></td></tr>
    <tr class="bu">
      <td><a href="board.do">[목록]</a></td>
      <td><input type="submit" value="[전송]" style="border: none"></td>
      <td><input type="reset" value="[취소]" style="border: none"></td>
    <tr>
  </table>
</form>
</body>
</html>