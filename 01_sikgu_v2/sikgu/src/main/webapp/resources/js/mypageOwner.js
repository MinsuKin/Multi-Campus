var sikgu_id = $('#sikgu_id_s').val();
console.log(sikgu_id)
readonly();




function readonly(){
	$(':input').prop('readonly',true);   
}

function ownerupdate(){
	$(':input').prop('readonly',false);
	$('input[name=sikgu_id]').prop('readonly',true);
	$('#edit').css('display', 'none');
	$('#save').css('display', 'block');
}
function ownerupdatesave(){
	updateForm = document.getElementById("updateForm");
	updateForm.action = "./updateOwner.do";
	updateForm.method = "post";
	updateForm.submit();
	
}