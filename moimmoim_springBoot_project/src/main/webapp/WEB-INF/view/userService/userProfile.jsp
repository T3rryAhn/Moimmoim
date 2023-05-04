<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Profile</title>
</head>
<body>
    <h1>User Profile</h1>
    <p>Name: ${userProfileDto.userName}</p>
    <p>Nickname: ${userProfileDto.userNickName}</p>
    <img src="${userProfileDto.userProfileImage}" alt="User Profile Image" width="200px" height="200px">
    <p>MoimReviewScore: ${userProfileDto.userMoimReviewScoreAvg}</p>
    <p>HostingCount: ${userProfileDto.userHostingCount}</p>
    <p>Birth: ${userProfileDto.userBirth}</p>
    <p>Email: ${userProfileDto.userEmail}</p>
    <p>CreateDate: &{userProfileDto.userCreateDate}</p>
    <p>PhoneNumber: &{userProfileDto.phoneNum}</p>
</body>
</html>