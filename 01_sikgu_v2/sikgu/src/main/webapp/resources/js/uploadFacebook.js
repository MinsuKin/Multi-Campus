  window.fbAsyncInit = function() {
    FB.init({
      appId      : '2406600329581406',
      cookie     : false,                     // Enable cookies to allow the server to access the session.
      xfbml      : true,                     // Parse social plugins on this webpage.
      version    : 'v5.0'           // Use this Graph API version for this call.
    });


    FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
      statusChangeCallback(response);        // Returns the login status.
    });
  };
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) {
		return;
	}
	js = d.createElement(s);
	js.id = id;
	js.src = "https://connect.facebook.net/en_US/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));


function statusChangeCallback(response) { // Called with the results from FB.getLoginStatus().
	if (response.status === 'connected') { // Logged into your webpage and Facebook.
		testAPI();
	} else { // Not logged into your webpage or we are unable to tell.
		
	}
}

function checkLoginState() { // Called when a person is finished with the Login Button.
	FB.getLoginStatus(function(response) { // See the onlogin handler
		statusChangeCallback(response);
	});
}

function testAPI() { // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
	console.log('Welcome!  Fetching your information.... ');
	FB.api('/me', function(response) {
		console.log('Successful login for: ' + response.name);
		document.getElementById('status').innerHTML = 'Thanks for logging in, '
				+ response.name + '!';
	});
}

$("#faceCheck").change(function() {
	if ($("#faceCheck").is(":checked")) {

		FB.login(function(response) {  //로그인 연결
		    if (response.authResponse) {
		     FB.api('/me', function(response) {
		        alert('로그인 되었습니다. ' + response.name + '님');
		       });
		    } else {
		     console.log('User cancelled login or did not fully authorize.');
		    }
		});
		$("#btnSubmit").on("click", FaceimgUpload);
	} else {
		console.log("cdsc");
		FB.logout(function(response) {	});//로그아웃 후 세션 유지

	}
});


function FaceimgUpload(){

    FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				console.log(response.status);
				
				var access_token = "EAAiMyk3C014BAKYKzwZA8RbsrjdDYqM4RX0EFEXIXHxIaMvrrjgPwLWmCzwwejZAmOsOe8AZBLClh76fiOqxJ7kw4sQZA5JyyEWx7UF4LZC1EEoNj4XHtH8G0renjp33Y8vsU1OOXrMhxCX7pRq7fuXmWnZApu8zsePLl7EyPZBIvT3ev7iPqdsNH37tojUjb8ZD";
			    var file = $('#input_imgs')[0].files[0];
			    
			    // If file is selected
			    if (file) {
			        // We will use FileReader
			        var reader = new FileReader();
			        // And and onload callback when file data loaded
			        reader.onload = function (e) {
			            // This is array buffer of the file
			            var arrayBuffer = e.target.result;
			            // And blob object of the file
			            var blob = new Blob([arrayBuffer], { type: file.type });
			 
			            // We will use FormData object to create multipart/form request
			            var data = new FormData();
			            data.append('access_token',access_token);
			            data.append('source', blob);
			            data.append('message', $('#content_description').val());
			            console.log(blob);
			            // Send the request manually with jQeury
			            $.ajax({
			                url: 'https://graph.facebook.com/me/photos?access_token=' + access_token,
			                type: 'POST',
			                data: data,
			                processData: false,
			                contentType: false,
			                cache: false,
			                success:function (data) {
			                    $('#status').append('<p>Photo was successfully uploaded, object id is: ' + data.id + '</p>');
			                    console.log(data)
			                },
			                error:function (data) {
			                    console.log(data);
			                },
			                complete: function () {
			                    $('#uploading').hide();
			                }
			            });
			 
			        };
			        // Read file as array buffer to create blob object
			        reader.readAsArrayBuffer(file);
			    }

			} else {
				alert('로그인후 사용해주세요.');
			}
		});
}
$("#faceCheck2").change(function() {
	if ($("#faceCheck2").is(":checked")) {

		FB.login(function(response) {  //로그인 연결
		    if (response.authResponse) {
		     FB.api('/me', function(response) {
		        alert('로그인 되었습니다. ' + response.name + '님');
		       });
		    } else {
		     console.log('User cancelled login or did not fully authorize.');
		    }
		});
		$("#btnSubmit").on("click", FacevidUpload);
	} else {
		console.log("cdsc");
		FB.logout(function(response) {	});//로그아웃 후 세션 유지

	}
});
function FacevidUpload(){
	
	 FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				console.log(response.id);
				var uid = response.authResponse.userID;
				var access_token = "EAAiMyk3C014BAKYKzwZA8RbsrjdDYqM4RX0EFEXIXHxIaMvrrjgPwLWmCzwwejZAmOsOe8AZBLClh76fiOqxJ7kw4sQZA5JyyEWx7UF4LZC1EEoNj4XHtH8G0renjp33Y8vsU1OOXrMhxCX7pRq7fuXmWnZApu8zsePLl7EyPZBIvT3ev7iPqdsNH37tojUjb8ZD";
				
				var file = new File([blob], fileName, { type: "video/mp4", lastModified: Date.now() }); 
				 
				
				var form = new FormData();
				form.append("source", file);
				form.append("title", $("#content_description").val());
				form.append("description", $("#content_description").val());
				form.append("no_story", "false");
				form.append("access_token", access_token);
				var settings = {
				"async": true,
				"crossDomain": true,
				"url": "https://graph-video.facebook.com/v2.12/{page-id}/videos",
				"method": "POST",
				"headers": {
				"cache-control": "no-cache"
				},
				"processData": false,
				"contentType": false,
				"mimeType": "multipart/form-data",
				"data": form
				}
				$.ajax(settings).done(function (response) {
				OnSuccess(response);
				});
				

				
			} else {
				alert('로그인후 사용해주세요.');
			}
		});
}
