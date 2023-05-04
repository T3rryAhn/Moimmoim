<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ProfilePage</title>
</head>
<body>
    <h1>ProfilePage</h1>
    <hr>
    <div>
        <p>Name: ${profilePageDto.userProfileDto.userName}</p>
        <p>Nickname: ${profilePageDto.userProfileDto.userNickName}</p>
        <img src="${profilePageDto.userProfileDto.userProfileImage}" alt="User Profile Image" width="200px" height="200px">
        <p>MoimReviewScore: ${profilePageDto.userProfileDto.userMoimReviewScoreAvg}</p>
        <p>HostingCount: ${profilePageDto.userProfileDto.userHostingCount}</p>
        <p>Birth: ${profilePageDto.userProfileDto.userBirth}</p>
        <p>Email: ${profilePageDto.userProfileDto.userEmail}</p>
        <p>CreateDate: &{profilePageDto.userProfileDto.userCreateDate}</p>
        <p>PhoneNumber: &{profilePageDto.userProfileDto.phoneNum}</p>
    </div>
</body>
</html>