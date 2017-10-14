<?php
session_start();
$userName = isset($_SESSION['name']) ? $_SESSION['name'] : 'noUserName';
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Chat application</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    </head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-6">
            <h1 class="text-center">Messages</h1>
            <div class="messages">
                    <div id="startMessage"></div>
            </div>
        </div>
        <div class="col-md-3">
            <h1 class="text-center">Online users</h1>
            <div class="usersOnline">
                <div id="users"></div>
            </div>
        </div>


        <div class="col-md-3">
            <h1 class="text-center">Description</h1>
            <div class="descript">
                <ul>
                    <li><h4>Write your Name and message</h4></li>
                    <li><h4>You can send message by click "SEND" button or "Enter" key</h4></li>
                    <li><h4>If you out or close your browser, you will not be online in 2 minutes</h4></li>
                    <li><h4>Highlighting your name and messages</h4></li>
                </ul>
            </div>
        </div>


    </div>

    <div class="row">
            <div class="col-md-2">
                <input class="form-control" id="username" value="<?php echo $_POST[username]; ?>" placeholder="Your name" required></input>
            </div>
            <div class="col-md-8">
                <input class="form-control" id="message" placeholder="Type message here" required></input>
            </div>
            <div class="col-md-2 ">
                <input class="btn send" id="send" type="submit" value="SEND">
            </div>
    </div>

    <div class="row">
        <div class="col-md-12 errors text-center">
            <div id="errorMessage"></div>
        </div>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/script.js"></script>
</body>
</html>