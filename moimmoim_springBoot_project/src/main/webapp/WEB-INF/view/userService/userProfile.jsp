<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h1>User Profile</h1>
    <p>Name: ${userProfileDto.name}</p>
    <p>Nickname: ${userProfileDto.nickName}</p>
    <img src="${userProfileDto.profileImage}" alt="User Profile Image" width="200px" height="200px">
    <p>MoimReviewScore: ${userProfileDto.userMoimReviewScoreAVg}</p>
    <p>HostingCount: ${userProfileDto.userHostingCount}</p>
    <p>Birth: ${userProfileDto.userBirth}</p>
    <p>Email: ${userProfileDto.userEmail}</p>
    <p>CreateDate: &{userProfileDto.userCreateDate}</p>
    <p>PhoneNumber: &{userProfileDto.phoneNum}</p>
</body>
</html>