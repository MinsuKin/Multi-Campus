var sikgu_id = $('#sikgu_id_q').val();
getStoreContent2(sikgu_id);

function getStoreContent2(searchKey) {
	var result;
	var date="";
	var count =0;
	var clone;
	var cloneimg;
	var searchKeys = {store_id: searchKey}
	$.ajax({
		url: 'getStoreContent.do', type: 'post', dataType: 'json', contentType:'application/json', saync: 'false',
		data : JSON.stringify(searchKeys),
		success : function(data){
			if (data != null) {
				
				 for (i = 0; i < data.length; i++) {
					 console.log(data[i]);
					 $("#image").empty();
					
					 if(date != data[i].content_create_date){
						 clone = $('#commit').clone(true).removeClass('originalHide');

						 clone.find('#title').html(data[i].content_id);
						 clone.find('#date').html(data[i].content_create_date);
						 clone.find('#desc').html(data[i].content_description);
						 clone.find('#face_url').html(data[i].face_link);
		                 clone.find('#naver_url').html(data[i].naver_link);
		                 clone.find('#youtube_url').html(data[i].youtube_link);
		                 clone.find('#face_url').attr("href",data[i].face_link);
		                 clone.find('#naver_url').attr("href",data[i].naver_link);
		                 clone.find('#youtube_url').attr("href",data[i].youtube_link);
		               

						 if(data[i].content_type == 'jpg' || data[i].content_type == 'png'){
							 result = data[i].content_url.replace( /c\:/gi, '/external');
							 result = result.replace( /content/gi, 'img');
							
							 clone.find('#image').attr("src",result);
							 console.log(result)
						 }
						 else if(data[i].content_type == 'mp4'){
							 clone.find('#sync1').css('display','none');
							 clone.find('#myvid').css('display','block');
							 
							 result = data[i].content_url.replace( /c\:/gi, '/external');
							 result = result.replace( /content/gi, 'img');
							 clone.find('#my_main_video').attr("href",result);
							 
							 result = result.replace( /vid/gi, 'vid/thumbnail');
							 result = result.replace( /mp4/gi, data[i].thumb_name);
							 clone.find('#my_thumb').attr("src",result);
							 
						 }
						 
						 date = data[i].content_create_date;
						 count += 1;
						 
						clone.appendTo('#page');
					 }//날짜확인 후 새로운 글 만들기
					 else if(date == data[i].content_create_date){
						 cloneimg = $('#item').clone(true);
						
						 result = data[i].content_url.replace( /c\:/gi, '/external');
						 result = result.replace( /content/gi, 'img');
							
						 cloneimg.find("#image").attr("src",result);
						 
						 cloneimg.appendTo(clone.find('#sync1'));
					 }
			    }			 
}
		},error : function() {console.log("fail to load menuboard")}

	})
}
