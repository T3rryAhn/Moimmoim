<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <style>
        .profile-container {
            text-align: left;
        }

        .profile-image {

            width: 50px;
            height: 50px;
            border-radius: 50%; /* 원형으로 만듭니다 */
            //object-fit: cover; /* 이미지가 div 크기에 맞게 조절됩니다 */
            aspect-ratio: 1/1; /* 이미지의 가로 세로 비율을 1:1로 유지합니다 */
        }

        .name-nickname {
            display: flex;
            flex-direction: row;
            margin-top: 10px; /* 이름과 이미지 사이에 여백을 둡니다 */
        }

        .name {
            font-weight: bold; /* 굵게 표시합니다 */
        }

        .separator {
            margin: 0 10px;
        }
        .nickname {

        }
    </style>
    <title>User Simple Profile</title>
</head>
<body>


    <div class="profile-container">
        <img class="profile-image" src="/files/${userSimpleProfileDto.userProfileImage}" alt="User_Profile_Image">
        <div class="name-nickname">
            <div class="name">${userSimpleProfileDto.userName}</div>
            <span class="separator">/</span>
            <div class="nickname">${userSimpleProfileDto.userNickName}</div>
        </div>
    </div>
</body>
</html>