$(function() {

    getQuery();
    setInterval(function() {
	getQuery();
    }, 3000);

    $(document).on('click', '#sendBtn', function() {
        var myUrl = "/site/send";
        var msgText = $('#msgText').val();
	var myData = { 'msgText' : msgText };
	
	if (msgText != '') {
	    load(myUrl, myData, "POST", "json", function(response) {
		if (response['msg'] != '') {
		    $('#msgResponse').html(response['msg'] + ". Номер Вашего сообщения: " + response['unique'] + ". По нему вы можете узнать статус.");
		}
		$('#msgText').val('');
		setTimeout(function(){ $('#msgResponse').html('');  }, 10000);
	    });
	}
    	return false;
    });


    $(document).on('click', '#checkBtn', function() {
        var myUrl = "/site/check";
        var unique = $('#checkStatus').val();
	var myData = { 'unique' : unique };
	if (unique != '') {
	    load(myUrl, myData, "GET", "json", function(response) {
		alert (response['statusText']);
	    });
	}
    	return false;
    });


    $(document).on('click', '.answerButton', function() {
	var id = (($(this).attr('id')).split('-'))[1];
        var myUrl = "/site/sendanswer";
	var msgStatus = Number($('#status-' + id).val());
	$('#msgArea' + id).remove();
        var msgAnswer = $('#msg-' + id).val();
	var myData = { 'msgId' : id, 'msgAnswer' : msgAnswer, 'msgStatus' : msgStatus };
	load(myUrl, myData, "GET", "json", function(response) {
	
	    if (msgStatus > 0) {
		$('#msgArea-' + id).remove();
	    }
	    
	});
    	return false;
    });


    function getQuery() {
        var myUrl = "/site/receive";
	var myData = { };
	load(myUrl, myData, "POST", "json", function(response) {
	    $.each(response['feedbackList'], function(indx, val){
		if (!$('div').is('#msgArea-' + val['id'])) {
		    var divArea = '<div id="msgArea-' + val['id'] + '">' + val['msgDate'].substr(0, 16) + '<br><div style="width: 300px; padding: 6px; border: 1px solid #111;">' + val['msgText'] + '</div><br>';
		    divArea += 'Статус: <select id="status-' + val['id'] + '"><option value="0" selected>Новое</option><option value="1">Опубликовать</option><option value="2">Отклонить</option></select><br>';
		    divArea += '<textarea style="width: 300px; height: 100px;" id="msg-' + val['id'] + '"></textarea><br><button id="btn-' + val['id'] + '" class="answerButton">Сохранить</button><hr></div>';
		    $('#requestList').append( divArea );
		}
	    });
    	});
    }
    
    function load(myUrl, myData, myRequest, myType, callback) {
	var myDate = new Date();

	if (typeof myUrl === "undefined") myUrl = "";
	if (typeof myData === "undefined") myData = {};
	if (typeof myType === "undefined") myType = "json";
	if (typeof myRequest === "undefined") myRequest = "POST";
	$.ajax({
	    type       : myRequest,
	    url        : myUrl,
	    crossDomain: true,
	    cache      : false,
	    data       : myData,
	    dataType   : myType,
	    success    : function(response) { callback(response); }
	});
    }
});

