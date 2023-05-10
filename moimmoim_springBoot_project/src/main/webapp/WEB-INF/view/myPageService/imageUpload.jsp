<!DOCTYPE html>
<html lang="en">
<head>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <title>File Upload Form</title>
</head>
<body>
<div class="uploadDiv">
    file : <input type="file" name="uploadFile" /><br />
    userid_num : <input type="text" name="userid_num" id="userid_num" />
</div>

<button id="uploadBtn">Upload</button>

<script src="https://code.jquery.com/jquery-3.6.4.js"
        integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
        crossorigin="anonymous"></script>

<script>
    $(document).ready(function() {

        var regex = new RegExp("(.*?)\.(jpg|png)$");
        var maxSize = 5242880;

        function checkExtension(fileName, fileSize) {
            if(fileSize >= maxSize) {
                alert("파일 사이즈가 초과되었습니다.");
                return false;
            }
            if(!regex.test(fileName)){
                alert("해당 종류의 파일은 업로드할 수 없습니다.");
                return false;
            }
            return true;
        }

        $("#uploadBtn").on("click", function(e) {
            var formData = new FormData();
            var inputFile = $("input[name='uploadFile']");
            var userIdNum = $("input[name='userid_num']").val();
            var files = inputFile[0].files;
            console.log(files);
            console.log(userIdNum.value);
            for(var i = 0; i < files.length; i++) {
                if(!checkExtension(files[i].name, files[i].size)){
                    return false;
                }
                formData.append("uploadFile", files[i]);
            }
            if(!isNaN(userIdNum)) {
                formData.append("userid_num", userIdNum);
            }

            $.ajax({
                url: '/uploadAction',
                processData: false,
                contentType: false,
                data: formData,
                      type: 'POST',
                      success: function(result) {
                          alert("Uploaded");
                      }
            });
        });
    });
</script>
</body>
</html>
