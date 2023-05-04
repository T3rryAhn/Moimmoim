<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Simple Profile</title>
</head>
<body>
    <h1>User Simple Profile</h1>
    <p>Name: ${userSimpleProfileDto.name}</p>
    <p>Nickname: ${userSimpleProfileDto.nickName}</p>
    <img src="${userSimpleProfileDto.profileImage}" alt="User Profile Image" width="200px" height="200px">
</body>
</html>