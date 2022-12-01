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
            boder: none;
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
        input:focus{
            outline: none;
        }

    </style>
</head>
<body>
<h1>내용 등록 화면</h1>
<form method="post" action="bd_update_exec.do">
<input type="hidden" name="seq" value="${msg.seq}">
<input type="hidden" name="writetime" value="${msg.writetime}">
    <table>
        <tr><td style="max-height: 50px; min-width: 70px;">제목</td><td><input type="text" value="${msg.name}" name="name" id="name"></td></tr>
        <tr><td style="max-height: 50px; min-width: 70px;">작성자</td><td><input type="text" value="${msg.title}" name="title" id="title"></td></tr>
        <tr><td style="min-height: 80px; min-width: 70px; line-height: 80px">내용</td><td><input type="text" value="${msg.content}" name="content" id="content"></td></tr>
        <tr><td style="max-height: 30px; min-width: 70px; line-height: 30px">비밀번호</td><td><input type="password" name="password" id="password" value="" style="border:none"></td></tr>
        <tr class="bu">
            <td><a href="board.do" style= "padding:1px 6px; font-weight: bold; font-size: 16px">[목록]</a></td>
            <td><input type="button" id="fix" value="[수정]" onClick="update_click(this.form, this.id);"></td>
            <td><input type="button" id="delete" value="[삭제]" onClick="update_click(this.form, this.id);"></td>
        <tr>
    </table>
</form>
<script>
    function update_click(frm,id){
        let pw = "${msg.password}";
        let input = document.getElementById("password").value;
        if(id === "fix"){
            let conf = confirm("본내용을 수정 하시겠습니까?");
            if(conf === true){
                frm.action="bd_update_exec.do"
            };
            if(conf === false){return;}
        }
        if(id === "delete"){
            let conf = confirm("본내용을 삭제 하시겠습니까?");
            if(conf === true){
                frm.action="bd_delete_exec.do"
            };
            if(conf === false){return;}
        }
        if(pw !== input){
            alert("잘못된 비밀번호 입니다.")
            return;
        }
        if(pw === input){
            frm.submit();
        }
    }
</script>
</body>
</html>
