<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Simple Profile</title>
</head>
<body>
    <h1>User Simple Profile</h1>
    <hr/>
    <img src=/files/${profilePageDto.userProfileDto.userProfileImage} alt="User_Profile_Image" width="200px" height="200px">
    <p>img src: /files/${profilePageDto.userProfileDto.userProfileImage}</p>
    <p>Name: ${userSimpleProfileDto.userName}</p>
    <p>Nickname: ${userSimpleProfileDto.userNickName}</p>
</body>
</html>