<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-05-03
  Time: 오전 5:28
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Profile Page</title>
</head>
<body>
<h1>User Profile</h1>
<ul>
    <li><b>User ID:</b> ${userProfileDto.userIdNum}</li>
    <li><b>User Name:</b> ${userProfileDto.userName}</li>
    <li><b>User Nickname:</b> ${userProfileDto.userNickName}</li>
    <li><b>User Profile Image:</b> ${userProfileDto.userProfileImage}</li>
    <li><b>User Moim Review Score Average:</b> ${userProfileDto.userMoimReviewScoreAvg}</li>
    <li><b>User Hosting Count:</b> ${userProfileDto.userHostingCount}</li>
    <li><b>User Birth:</b> ${userProfileDto.userBirth}</li>
    <li><b>User Email:</b> ${userProfileDto.userEmail}</li>
    <li><b>User Create Date:</b> ${userProfileDto.userCreateDate}</li>
    <li><b>User Phone Number:</b> ${userProfileDto.phoneNum}</li>
</ul>
</body>
</html>
