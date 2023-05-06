<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>File Upload Form</title>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="/profileImg/upload">
    <div>
        <label for="file">Choose file to upload:</label>
        <input type="file" name="file" id="file">
    </div>
    <div>
        <label for="userid_num">Enter your userid_num:</label>
        <input type="text" name="userid_num" id="userid_num">
    </div>
    <button type="submit">Upload File</button>
</form>
</body>
</html>


