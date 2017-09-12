var pos = 0;
var images = ['url("includes/images/acoustic.jpg")','url("includes/images/concert1.jpg")',
				'url("includes/images/concert2.jpg")','url("includes/images/concert3.jpg")'];

function nextPhoto(){
	$(".button-album").attr('disabled','disabled');
	if(pos==images.length-1){
			pos = 0;
	} else {
		pos++;
	}
	$("body").css('background-image',images[pos]);
	$("#album").slideUp(750,function(){
		$("#album").css('background-image',images[pos]);
		$("#album").slideDown(0);
		$(".button-album").removeAttr('disabled');
	});
}

function prevPhoto(){
	$(".button-album").attr('disabled','disabled');
	if(pos==0){
		pos = images.length-1;
	} else {
		pos--;
	}
	$("#album").slideUp(0,function(){
		$("#album").css('background-image',images[pos]);
		$("#album").slideDown(750,function(){
			$("body").css('background-image',images[pos]);
			$(".button-album").removeAttr('disabled');
		});
	});
	
}

function hideTracks(button){
	var pos = button.parent().index();
	var list = button.parent().parent().children().eq(pos+1);
	
	if(list.css("visibility") == "hidden"){
		list.css("visibility","visible");
		list.slideDown(500);
		list.find("p").slideDown(500, function(){
			list.find("p").css("position","absolute");
		});
	} else {
		list.find("p").css("position","relative");
		list.find("p").slideUp(500)
		list.slideUp(500, function(){
			list.css("visibility","hidden");
		});
	}
}

function sendEmail(){
	var name = $("#name").val();
	var email = $("#email").val();
	var message = $("#message").val();
	
	var nameText = $("#nameText");
	var emailText = $("#emailText");
	var messageText = $("#messageText");
		
	var validName = false;
	var validEmail = false;
	var validMsg = false;
	
	var emailRegExp = /[A-Za-z0-9._]+@[A-Za-z0-9._]+.[A-Za-z.]{2,}/;
	
	if(name.length > 0){
		validName = true;
		nameText.text('');
	} else {
		nameText.text('You need to provide your name');
		nameText.css("color", "#F60000");
	}
	if(emailRegExp.test(email)){
		validEmail = true;
		emailText.text('');
	} else {
		emailText.text("You need to provide a valid email address");
		emailText.css("color", "#F60000");
	}
	if(message.length > 0){
		validMsg = true;
		messageText.text('');
	} else {
		messageText.text("You need to enter a message to send");
		messageText.css("color", "#F60000");
	}
	if (validName && validEmail && validMsg){
		sendToServer(name, email, message);
		alert("Message Sent")
	}	
}

function sendToServer(name, email, message){}