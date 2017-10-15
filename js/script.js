$("document").ready(function(){

    //send message
    $("#send").click(function(){
        sendMessage();
    });

    //send message by enter key
    $('html').keydown(function(eventObject){ //отлавливаем нажатие клавиш
        if (event.keyCode == 13) { //если нажали Enter, то true
            sendMessage();
        }
    });

    //room choice
    $(document).on('click', '.eachRoom', function () {
        var text = $(this).text();
        // alert (text);
        $('#roomInput').val(text);
        showMessage();
    });

    //Block user
    $(document).on('click', '.user', function () {
        var user = $(this).text();
        // alert (user);

        $.ajax({
            url: "../ajax/blockUser.php",
            type: "POST",
            data: {user:user},
        });

        $("#emptyFields").remove();
        $("#errorMessage").append('<div id="emptyFields" class="alert alert-danger ">You blocked user: '+ user +'</div>');
    });

    function sendMessage() {
        var room = $("#roomInput").val();
        var username = $("#username").val();
        var message = $("#message").val();

        if($("#username").val() == ''){
            $("#emptyFields").remove();
            $("#errorMessage").append('<div id="emptyFields" class="alert alert-danger ">Set your name.</div>');
        }
        else if($("#roomInput").val() == ''){
            $("#emptyFields").remove();
            $("#errorMessage").append('<div id="emptyFields" class="alert alert-danger ">Choose room.</div>');
        }
        else if($("#message").val() == ''){
            $("#emptyFields").remove();
            $("#errorMessage").append('<div id="emptyFields" class="alert alert-danger ">Write something</div>');
        }

        else {
            $.ajax({
                url: "../ajax/sendMessage.php",
                type: "POST",
                data: {username:username, message:message, room:room},
                success: function (html){
                    var obj = $.parseJSON(html);
                    // alert(obj.username);
                    // alert(obj.message);
                    // alert(obj.room);

                    if (obj.username == 'Blocked'){

                        $("#emptyFields").remove();
                        $("#errorMessage").append('<div id="emptyFields" class="alert alert-danger ">You was blocked!</div>');
                    }

                    else if (obj.username == username){
                        $("#startMessage").append('<div class="messageMe">' +
                            '<strong>'+ obj.username+'</strong>: '+
                            obj.message +
                            '<span class="time-left">'+obj.timestamp.substr(11)+'</span>' +
                            '</div>');
                        $('#message').val('');
                        setUserOnline();
                    }
                    else {
                        $("#startMessage").append('<div class="message">' +
                            '<strong>'+ obj.username+'</strong>: '+
                            obj.message +
                            '<span class="time-left">'+obj.timestamp.substr(11)+'</span>' +
                            '</div>');
                        $('#message').val('');
                        setUserOnline();
                    }
                }
            });
        }
    }

    function showMessage() {

        var room = $("#roomInput").val();
        var username = $("#username").val();

        $.ajax({
            url: "../ajax/getMessages.php",
            type: "POST",
            data: {room:room},
            success: function (html){
                var obj = $.parseJSON(html);
                $("#startMessage").empty();

                for(value in obj ){
                    if (username == obj[value].user){
                        $("#startMessage").append('<div class="messageMe">' +
                            '<strong>'+ obj[value].user+'</strong>: '+
                            obj[value].message +
                            '<span class="time-left">'+obj[value].timestamp.substr(11)+'</span>' +
                            '</div>');
                    }

                    else {
                        $("#startMessage").append('<div class="message">' +
                            '<strong>'+ obj[value].user+'</strong>: '+
                            obj[value].message +
                            '<span class="time-left">'+obj[value].timestamp.substr(11)+'</span>' +
                            '</div>');
                    }
                }
            }
        });
    }

    function getOnlineUsers() {
        var username = $("#username").val();

        $.ajax({
            url: "../ajax/getOnlineUsers.php",
            type: "POST",
            success: function (html){
                var obj = $.parseJSON(html);
                $("#users").empty();

                var i;
                for (i = 0; i < obj.length; ++i) {
                     // alert(obj[i]);

                    if (username ==  obj[i]){
                        $("#users").append('<div class="userMe">'+ obj[i] +'</div>');

                    }
                    else {
                        $("#users").append('<div class="user">'+ obj[i] +'</div>');
                    }
                }
            }
        });
    }

    function getRooms() {
        $.ajax({
            url: "../ajax/getRooms.php",
            type: "POST",
            success: function (html){
                var obj = $.parseJSON(html);

                var i;
                for (i = 0; i < obj.length; ++i) {
                    $("#rooms").append('<div class="eachRoom"><h4>'+ obj[i] +'</h4></div>');
                }
            }
        });

    }

    function setUserOnline(){
        if($("#username").val() != ''){
            var username = $("#username").val();
            $.ajax({
                url: "../ajax/setUserOnline.php",
                type: "POST",
                data: {username:username},
            });
        }
    }

    function throwOfflineUsers(){
        $.ajax({
            url: "../ajax/throwOfflineUsers.php",
        });
    }

    var minute = 60000;

    getRooms();
    getOnlineUsers();
    throwOfflineUsers();
    setInterval(showMessage, 3000);
    setInterval(getOnlineUsers, 3000);
    setInterval(setUserOnline,10000);
    setInterval(throwOfflineUsers, minute);

});