   function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                   // document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
               //document.getElementById('postcode').value = data.zonecode;
                document.getElementById("store_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("store_detailaddress").focus();
            }
        }).open();
    }


function getXYAndSubmitForm() {
   
   if(document.getElementById('store_address').value==null){
      alert("주소를 입력하세요")
      return 0;
   } else {
      var addr = document.getElementById('store_address').value +" "+ document.getElementById('store_detailaddress').value
   }
   
   var geocoder = new kakao.maps.services.Geocoder();
   
   var callback = function(result, status) {
       if (status === kakao.maps.services.Status.OK) {
           document.getElementById('store_x').value=result["0"].address.x;
           document.getElementById('store_y').value=result["0"].address.y;
           submitForm()
       }  
   };
   geocoder.addressSearch(addr, callback);
}




var arrmenu = new Array(0);
var arrmenuValue = new Array(0);
var arrprice = new Array(0);
var arrpriceValue = new Array(0);
arrmenu=arrprice;
function addInput() {
  arrmenu.push(arrmenu.length);
  arrmenuValue.push("");
  display();
}
 
function display() {
  document.getElementById('menuinput').innerHTML="";
  for (intI=0;intI<arrmenu.length;intI++) {
    document.getElementById('menuinput').innerHTML+=createInput(arrmenu[intI], arrmenuValue[intI],arrprice[intI],arrpriceValue[intI]);
  }
}
 
function saveValue(intId,strValue) {
  arrmenuValue[intId]=strValue;
}  
function saveValue2(intId,strValue) {
	  arrpriceValue[intId]=strValue;
	}  
 
function createInput(id,value,id2,value2) {
  return "<div class='form-group col-md-6'><div class='input-icon'><span class='fables-icon fables-input-icon mt-2 font-13'><i class='fas fa-utensils'></i></span><input id='menu_name"+ id +"' name='menu_name' type='text'class='form-control rounded-0 py-3 pl-5 font-13 sign-register-input' placeholder='메뉴 이름'  onChange='javascript:saveValue("+ id +",this.value)' value='"+value +"'></div></div><div class='form-group col-md-6'><div class='input-icon'><span class='fables-iconphone fables-input-icon mt-2 font-13'></span><input id='menu_price"+ id2 +"' name='menu_price' type='number' onChange='javascript:saveValue2("+ id2 +",this.value)' value='"+value2 +"'class='form-control rounded-0 py-3 pl-5 font-13 sign-register-input' placeholder='가격'></div></div></div>";
  }
 
function deleteInput() {
  if (arrmenu.length > 0) { 
     arrmenu.pop(); 
     arrmenuValue.pop();
     arrpriceValue.pop();
  }
 
  display(); 
}
