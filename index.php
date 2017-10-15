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
            <h1 class="text-center">Rooms</h1>
            <div class="roomList">
                <div id="rooms"></div>

            </div>
        </div>

        <div class="col-md-3">
            <div class="descript">
                <ul>
                    <li><h6>Choose room</h6></li>
                    <li><h6>Set your name and write your message bellow</h6></li>
                    <li><h6>Send message by clicking "SEND" button or by pressing "Enter" key</h6></li>
                    <li><h6>If you leave or close your browser tab, you will not be online in 2 minutes</h6></li>
                    <li><h6>Highlighting your name and messages</h6></li>
                    <li><h6>Click in any online user to block him</h6></li>
                </ul>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="col-md-2">
            <input class="form-control" id="roomInput" value="<?php echo $_POST[room]; ?>" placeholder="Room" required></input>
        </div>
        <div class="col-md-2">
            <input class="form-control" id="username" value="<?php echo $_POST[username]; ?>" placeholder="Your name" required></input>
        </div>
        <div class="col-md-6">
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