<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>티켓 구매 완료</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            font-size: 24px;
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
        p {
            font-size: 16px;
            text-align: center;
        }
        button {
            display: block;
            margin: 20px auto;
            background-color: #f44336;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
<script>
        function closeModal() {
            window.parent.postMessage('closeModal', '*');
        }
</script>
</head>
<body>
    <div class="container">
        <h1>티켓 구매 완료</h1>
        <p>${errorMsg}</p>
        <button type="button" onclick="closeModal()">닫기</button>


    </div>
</body>
</html>