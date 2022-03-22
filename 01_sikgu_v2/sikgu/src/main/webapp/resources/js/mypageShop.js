var sikgu_id = $('#sikgu_id_s').val();
console.log(sikgu_id)
readonly();
getMenu(sikgu_id);



function readonly(){
	$(':input').prop('readonly',true);   
	$('#category_id').prop('disabled',true);
}

function getMenu(sikgu_id) {
	var clonename;
	var cloneprice;
	var searchKeys = {menu_id: sikgu_id}

	$.ajax({
		url: 'getMenu.do', type: 'post', dataType: 'json', contentType:'application/json', async: false,
		data : JSON.stringify(searchKeys),
		success : function(data){
			console.log(data);
					if (data != null) {
							 for (i = 0; i < data.length; i++) {
								 console.log(data[i]);
								 
								 
								 clonename = $('#menu_name_div').clone(true).removeClass('originalHide');
								 cloneprice = $('#menu_price_div').clone(true).removeClass('originalHide');
								 clonename.find('#menu_name').val(data[i].menu_name);
								 cloneprice.find('#menu_price').val(data[i].menu_price);
								 
								 clonename.appendTo('#menuinput');
								 cloneprice.appendTo('#menuinput');
						    }			 
			}			
		},error : function() {console.log("fail to load menuboard")}
	})
}
