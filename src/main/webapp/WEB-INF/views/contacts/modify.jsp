<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>

body {
   margin:0;
   padding:0;
}

.navbar-box {
	background-color: #153A66;
}
.navbar-content {
	width: 100%; 
	padding: 0px; 
	min-height: 1rem; 
	height: 50px; 
	line-height:50px;
} 

.navbar-logo {
	color:#ffffff;
	font-weight: bold;
	font-size: 1.5rem;
	padding-left:20px;
}

.main {
	height : 768px;
	border : 4.5px solid #153A66;
}
.main-box {
	width: 80%;
	margin: 0 auto;
	height : 763px;
}
.main-title {
	padding-top : 5px;
	padding-bottom : 10px;
	text-align : center;
	font-weight: bold;
	font-size: 1.5rem;
	
}

.input-group {
	margin :5px 0px;
	height:30px;
}


.input-group-prepend {
	width: 100%;
}
.input-group-prepend2 {
	width:49%;
	margin-right:30px;
}

.input-group-prepend3 {
	width:49%;
}
.input-bordered {
	width: 100%;
	height:30px;
	border : 1px solid #aaaaaa;
}

.select-bordered {
	height:30px;
	min-height:1rem;
	border : 1px solid #aaaaaa;
}
.form-group {
	width:100%;
}
.btn-se {
	width : 130px;
	min-height:1rem;
	border:none;
	color:#ffffff;
  	background-color:#153A66;
  	height:30px;
}
.btn-se:hover {
	background-color:#016FA0;
}

.form-group, .form-box {
	margin :5px 0px;
}
.card-footer {
	padding-top : 35px;
}

</style>
<body>
	<div class="regist_content">
		<div class="navbar-box">
			<div class="navbar-content">
				<div class="navbar-logo">DEMYS PMS</div>
			</div>	
		</div>
	<div class="main">	
		<div class="main-box">	
		<form class="table-box-type-1" method="post" action="/contacts/modify" >
			<div class="main-title">업체 정보 수정</div>
				<div class="form-group">
      				<label style="font-weight: bold;">업체명</label>
      			<div class="input-group">
        			<div class="input-group-prepend">
        				<input type="text" class="input input-bordered w-full"  id="CT_NAME" name="CT_NAME" style="background-color:#e7e7e7;" readonly value="${contacts.CT_NAME }"/>
 					</div>     			
      			</div>
      			<div class="flex justify-between">
      			<label style="font-weight: bold;">대표자명</label>
 				<label style="font-weight: bold; margin-right:170px;">구분</label>
 				</div>     			
      			<div class="input-group">
        			<div class="input-group-prepend2">
        				<input type="text"  placeholder="대표자명을 입력하세요." class="input input-bordered w-full"  id="CT_CEO" name="CT_CEO" value="${contacts.CT_CEO }"/>
 					</div>
 					<div class="input-group-prepend3">
        				<select class="select select-bordered w-full" name="CT_TYPE">
							<option value=1>협력업체</option>
							<option value=2>거래처</option>
							<option value=3>클라이언트</option>
						 </select>
      				</div>
      			</div>
      			<div class="form-group row">
					<label style="font-weight: bold;">전화번호</label>
						<div class="form-box" style="display:flex;">
							<div class="input-group-sm">
								<select style="width: 22%;" name="ctTel1" id="ctTel1" class="select select-bordered float-left" >
										<option value="">-선택-</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="010">070</option>
								</select> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:34%;" name="ctTel2" id="ctTel2" type="text" class="input input-bordered float-left"/> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:34%;" name="ctTel3" id="ctTel3" type="text" class="input input-bordered float-right" />
								</div>
							</div>
						</div>
				<div class="form-group row">
					<label style="font-weight: bold;">이메일</label>
						<div class="form-box" style="display:flex;">
							<div class="input-group-sm w-full flex">
								<input name="CT_EMAIL" type="text" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" class="input input-bordered w-full" id="inputEmail" value="${contacts.CT_EMAIL }" onchange="email_check()">
							</div>
						</div>
					</div>
				<div class="form-group row">
					<label style="font-weight: bold;">팩스번호</label>
						<div class="form-box" style="display:flex;">
							<div class="input-group-sm">
								<input style="width:30%;" name="CT_FAX" type="text" class="input input-bordered float-left" value="${CT_FAX }"/> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:30%;" name="CT_FAX" type="text" class="input input-bordered float-left" value="${CT_FAX }"/> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:30%;" name="CT_FAX" type="text" class="input input-bordered float-right" value="${CT_FAX }" />
								</div>
							</div>
						</div>
						<div class="flex justify-between">
			      			<label style="font-weight: bold;">주소</label>
			 			</div>     			
			      			<div class="input-group">
			        			<div class="input-group-prepend2">
			        				<input type="text" id="sample6_postcode" class="input input-bordered w-full" name="CT_ADDR" value="${CT_ADDR }"/>
			 					</div>
			 					<div class="input-group-prepend3">
			        				<button type="button" class="btn btn-se" onclick="sample6_execDaumPostcode();">우편번호 찾기</button>
      							</div>
      						</div>
      					<div class="input-group">
        					<div class="input-group-prepend">
        						<input type="text"  id="sample6_address" class="input input-bordered w-full"  name="CT_ADDR" value="${CT_ADDR }"/>
 							</div>     			
      					</div>
      					<div class="input-group">
        					<div class="input-group-prepend">
        						<input type="text"  id="sample6_detailAddress"  class="input input-bordered w-full"  name="CT_ADDR" value="${CT_ADDR }"/>
 							</div>
 							<div class="input-group-prepend">
        						<input type="text" id="sample6_extraAddress" class="input input-bordered w-full"  name="CT_ADDR" value="${CT_ADDR }"/>
 							</div>        			
      					</div>
      					<label style="font-weight: bold;">담당자명</label>
      					<div class="input-group">
        					<div class="input-group-prepend">
        						<input type="text" class="input input-bordered w-full" name="CT_MANAGER" value="${CT_MANAGERR }"/>
 							</div>     			
      					</div>
      					<div class="form-group row">
						<label style="font-weight: bold;">전화번호</label>
						<div class="form-box" style="display:flex;">
							<div class="input-group-sm">
								<select style="width:22%;" name="CT_MG_TEL" id="CT_MG_TEL" class="select select-bordered float-left">
										<option value="">-선택-</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="010">070</option>
								</select> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:34%;" name="CT_MG_TEL" type="text" class="input input-bordered float-left" value="${CT_MG_TEL }" /> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:34%;" name="CT_MG_TEL" type="text" class="input input-bordered float-right" value="${CT_MG_TEL}" />
								</div>
							</div>
						</div>
		<div class="card-footer row" style="margin-top: 0; border-top: none;display:flex;flex-direction:row;justify-content:center;">						
			<button type="button" id="registBtn"  onclick="modify_go();" class="btn btn-se" style="margin-right: 10px;">수 정</button>
			<div class="col-sm-4"></div>
			<button type="button" id="cancelBtn" onclick="CloseWindow();" class="btn btn-se"  style="margin-left: 10px;">취 소</button>
		</div>	
				</div>
			</form>
		</div>
	</div>
</div>
	<!-- /.content-wrapper -->
<script>

function sample6_execDaumPostcode() {
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
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}

function regist_go() {

    // 대표자명
    var ctCeo = document.getElementById("CT_CEO").value;

    // 구분
    var ctType = document.querySelector("#sample6 > div:nth-child(3) > div.input-group > div.input-group-prepend3 > select").value;

    // 전화번호
    var ctTel1 = document.querySelector("#sample6 > div:nth-child(5) > div > div > select").value;
    var ctTel2 = document.querySelector("#sample6 > div:nth-child(5) > div > div > input:nth-child(3)").value;
    var ctTel3 = document.querySelector("#sample6 > div:nth-child(5) > div > div > input:nth-child(5)").value;
    var ctTel = ctTel1 + "-" + ctTel2 + "-" + ctTel3;

    // 이메일
    var ctEmail = document.getElementById("inputEmail").value;

    // 팩스번호
    var ctFax1 = document.querySelector("#sample6 > div:nth-child(7) > div > div > input:nth-child(1)").value;
    var ctFax2 = document.querySelector("#sample6 > div:nth-child(7) > div > div > input:nth-child(3)").value;
    var ctFax3 = document.querySelector("#sample6 > div:nth-child(7) > div > div > input:nth-child(5)").value;
    var ctFax = ctFax1 + "-" + ctFax2 + "-" + ctFax3;

    // 주소
    var ctPostcode = document.getElementById("sample6_postcode").value;
    var ctAddress = document.getElementById("sample6_address").value;
    var ctDetailAddress = document.getElementById("sample6_detailAddress").value;
    var ctExtraAddress = document.getElementById("sample6_extraAddress").value;
    var fullAddress = ctAddress + ctDetailAddress;

    // 담당자명
    var ctManager = document.getElementById("CT_MANAGER").value;

    // 담당자 전화번호
    var ctManagerTel1 = document.querySelector("#sample6 > div:nth-child(12) > div > div > select").value;
    var ctManagerTel2 = document.querySelector("#sample6 > div:nth-child(12) > div > div > input:nth-child(3)").value;
    var ctManagerTel3 = document.querySelector("#sample6 > div:nth-child(12) > div > div > input:nth-child(5)").value;
    var ctManagerTel = ctManagerTel1 + "-" + ctManagerTel2 + "-" + ctManagerTel3;

    // 서버로 데이터 전송
    var formData = new FormData();
    formData.append("CT_CEO", ctCeo);
    formData.append("CT_TYPE", ctType);
    formData.append("CT_TEL", ctTel);
    formData.append("CT_EMAIL", ctEmail);
    formData.append("CT_FAX", ctFax);
    formData.append("CT_ADDRESS", fullAddress);
    formData.append("CT_MANAGER", ctManager);
    formData.append("CT_MANAGER_TEL", ctManagerTel);

    // AJAX 요청 보내기
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/contacts/modify", true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // 요청 완료 후 처리할 코드 작성
            console.log(xhr.responseText);
        }
    };
    xhr.send(formData);
}

function CloseWindow() {
    // 창 닫기 코드 작성
}

function CloseWindow(parentURL){
	
	window.opener.location.reload(true);		
	window.close();
}
   </script>
</body>








