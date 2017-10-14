$("document").ready(function(){
    $("#send").click(function(){
        sendMessage();
     });

    $('html').keydown(function(eventObject){ //отлавливаем нажатие клавиш
        if (event.keyCode == 13) { //если нажали Enter, то true
            sendMessage();
        }
    });

    function sendMessage() {

        var username = $("#username").val();
        var message = $("#message").val();

        if($("#username").val() == ''){
            $("#emptyFields").remove();
            $("#errorMessage").append('<div id="emptyFields" class="alert alert-danger ">Write your name and message, please.</div>');
        }
        else if($("#message").val() == ''){
            $("#emptyFields").remove();
            $("#errorMessage").append('<div id="emptyFields" class="alert alert-danger ">Write your name and message, please.</div>');
        }

        else {
            $.ajax({
                url: "../ajax/sendMessage.php",
                type: "POST",
                data: {username:username, message:message},
                success: function (html){
                    var obj = $.parseJSON(html);

                    if (obj.username == username){
                        $("#startMessage").append('<div class="messageMe">' +
                            '<strong>'+ obj.username+'</strong>: '+
                            obj.message +
                            '<span class="time-left">'+obj.timestamp.substr(11)+'</span>' +
                            '</div>');
                    }
                    else {
                        $("#startMessage").append('<div class="message">' +
                            '<strong>'+ obj.username+'</strong>: '+
                            obj.message +
                            '<span class="time-left">'+obj.timestamp.substr(11)+'</span>' +
                            '</div>');
                    }
                }
            });

            $('#message').val('');
            setUserOnline();
        }
    }

    function showMessage() {
        var username = $("#username").val();
        $.ajax({
            url: "../ajax/getMessages.php",
            type: "POST",
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
                        $("#users").append('<div id="onlineUsersFromBase" class="messageMe">'+ obj[i] +'</div>');

                    }
                    else {
                        $("#users").append('<div id="onlineUsersFromBase" class="message">'+ obj[i] +'</div>');
                    }
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

    getOnlineUsers();
    showMessage();
    throwOfflineUsers();
    setInterval(showMessage, 3000);
    setInterval(getOnlineUsers, 3000);
    setInterval(setUserOnline,10000);
    setInterval(throwOfflineUsers, minute);

});