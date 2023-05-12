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

.register-card-body {
	height : 668px;
	border : 4.5px solid #153A66;
}
.input-group {
	width: 100%;
    display: flex;
    justify-content: center;
    margin : 10px auto;
}
.input-group2 {
	 display: flex;
	 float:left;
}
.btn-se {
	min-height:1rem;
	border:none;
	color:#ffffff;
  	background-color:#153A66;
  	height:30px;
}
.btn-se:hover {
	background-color:#016FA0;
}
.mailbox-attachment-icon {
	border: 1px solid pink; 
	height: 150px; 
	width: 150px; 
	margin: 0 auto;
	border-radius: 70%;
}
.form-horizontal {
	width: 80%;
	margin: 0 auto;
	border : 1px solid green;
}
option{
	padding-top:10px;
	margin-top:20px;
}
</style>
<body>
	<div class="regist_content">
		<div class="navbar-box">
			<div class="navbar-content">
				<div class="navbar-logo">DEMYS PMS</div>
			</div>	
		</div>
	<!-- form start -->
			<div class="card">
				<div class="register-card-body">
					<form role="form" class="form-horizontal" action="regist" method="post">
						<input type="hidden" name="picture" value="noImage.jpg" />
						<div class="input-group mb-3">
							<div class="mailbox-attachments clearfix" style="text-align: center;">
								<div class="mailbox-attachment-icon has-img" id="pictureView"></div>
								<div class="mailbox-attachment-info">
									<div class="input-group input-group-sm">
										<label for="inputFile" class=" btn btn-se btn-sm btn-flat input-group-addon">파일선택</label>
										<input id="inputFileName" class="form-control" type="text" name="tempPicture" disabled /> 
										<span class="btn btn-se btn-sm btn-append input-group-append-sm">
											<button type="button" class="btn btn-se btn-sm btn-append" onclick="upload_go();">업로드</button>
										</span>
									</div>
								</div>
							</div>
							<br />
						</div>
						<div class="form-group" style="display:flex;border:1px solid red;">
      						<label style="font-weight:bold;font-size:0.9rem;width:25%;margin:auto;">아이디</label>
							<div class="input-group2 input-group-sm" style="width:75%;border:1px solid purple;">
								<input name="id" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" type="text" class="form-control" id="id"
									placeholder="13글자 영문자,숫자 조합" style="width:73%;margin-left:auto;"> 
									<span class="input-group-append-sm">
									<button type="button" onclick="idCheck_go();" class="btn btn-se btn-sm btn-append">중복확인</button>
								</span>
							</div>
						</div>
						<div class="form-group" style="display:flex;border:1px solid red;">
      						<label style="font-weight:bold;font-size:0.9rem;width:25%;margin:auto;">비밀번호</label>
							<div class="input-group2 input-group-sm" style="width:75%;border:1px solid purple;">
								<input name="pw"  type="password" class="form-control" id="pw"
									 placeholder="20글자 영문자,숫자,특수문자 조합" style="width:100%;"> 
							</div>
						</div>
						<div class="form-group" style="display:flex;border:1px solid red;">
      						<label style="font-weight:bold;font-size:0.9rem;width:25%;margin:auto;">비밀번호 확인</label>
							<div class="input-group2 input-group-sm" style="width:75%;border:1px solid purple;">
								<input name="pw"  type="password" class="form-control" id="pw"
									 placeholder="비밀번호 확인" style="width:100%;"> 
							</div>
						</div>
						<div class="form-group" style="display:flex;border:1px solid red;">
      						<label style="font-weight:bold;font-size:0.9rem;width:25%;margin:auto;">이름</label>
							<div class="input-group2 input-group-sm" style="width:75%;border:1px solid purple;">
								<input name="name"  type="text" class="form-control" id="name"
									 placeholder="이름" style="width:100%;"> 
							</div>
						</div>
						<div class="form-group" style="display:flex;border:1px solid red;">
      						<label style="font-weight:bold;font-size:0.9rem;width:25%;margin:auto;">휴대폰 번호</label>
							<div class="input-group2 input-group-sm" style="width:75%;border:1px solid purple;">
								<input name="phone"  type="text" class="form-control" id="phone"
									 placeholder="'-'없이 입력해주세요." style="width:100%;"> 
							</div>
						</div>
						<div class="form-group" style="display:flex;border:1px solid red;">
      						<label style="font-weight:bold;font-size:0.9rem;width:25%;margin:auto;">이메일</label>
							<div class="input-group2 input-group-sm" style="width:75%;border:1px solid purple;">
								<input name="email"  type="text" class="form-control" id="email"
									 placeholder="이메일을 입력해주세요." style="width:100%;"> 
							</div>
						</div>
						<div class="form-group" style="display:flex;border:1px solid red;">
      						<label style="font-weight:bold;font-size:0.9rem;width:25%;margin:auto;">소속부서</label>
							<div class="input-group2 input-group-sm" style="width:75%;border:1px solid purple;">
								<select class="form-control w-full" style="height:32px;">
									<option disabled selected>전체</option>
									<option>개발1팀</option>
									<option>개발2팀</option>
									<option>인사팀</option>
								 </select>
							</div>
						</div>
						

						<div class="card-footer">
							<div class="row">
								<div class="col-sm-6">
									<button type="button" id="registBtn" onclick="regist_go();" class="btn btn-info">등&nbsp;&nbsp;록</button>
								</div>

								<div class="col-sm-6">
									<button type="button" id="cancelBtn" onclick="CloseWindow();" class="btn btn-default float-right">&nbsp;&nbsp;&nbsp;취
										&nbsp;&nbsp;소&nbsp;&nbsp;&nbsp;</button>
								</div>
							</div>
						</div>
					</form>
				</div>
				<!-- register-card-body -->
			</div>
		</div>

	<!-- /.content -->

<!-- /.content-wrapper -->
<!-- picture upload form  -->
<form role="imageForm" action="picture.do" method="post" enctype="multipart/form-data">
	<input id="inputFile" name="pictureFile" type="file" class="form-control" style="display:none;" onchange="picture_go();">
	<input id="oldFile" type="hidden" name="oldPicture" value="test" />
	<input type="hidden" name="checkUpload" value="0" />	
</form>

<script>	
	function regist_go(){
		//alert("regist btn");
		
		var uploadCheck = $('input[name="checkUpload"]').val();  	
		if(uploadCheck=='0'){
		    alert("사진업로드는 필수 입니다");      
		    return;
		}
		
		if(!$('input[name="id"]').val()){
		    alert("아이디는 필수입니다.");
		    return;
		}
		if($('input[name="id"]').val()!=checkedID){
		    alert("아이디는 중복 확인이 필요합니다.");
		    return;
		}
		
		var form = $('form[role="form"]');
		form.attr("action","regist.do");
		form.submit();
	}
	
	var checkedID ="";	
	function idCheck_go(){
		//alert("id check");
		var id=$('input[name="id"]');
		//alert(id);
		
		if(!id.val()){
		  alert("아이디를 입력하시오");
		  id.focus();
		  return;
		}
		
		$.ajax({
			url:"idCheck.do",
			method:"get",
			data:"id="+id.val().trim(),
			success:function(data){
			 	if(data.toUpperCase() == "DUPLICATED"){
			 		alert("중복된 아이디 입니다."); 
				}else{
				    alert("사용가능한 아이디 입니다.");
				    checkedID=id.val().trim();
				}
			},
			error:function(error){
				alert(error.status);
			}
		});
	}
	
	function picture_go(){
		//alert("changee file");
		var form = $('form[role="imageForm"]');
		var picture = form.find('[name=pictureFile]')[0];
    	
		var fileFormat = 
			picture.value.substr(picture.value.lastIndexOf(".")+1).toUpperCase();
		//이미지 확장자 jpg 확인
		if(!(fileFormat=="JPG" || fileFormat=="JPEG")){
			alert("이미지는 jpg 형식만 가능합니다.");
			return;
		} 
		//이미지 파일 용량 체크
		if(picture.files[0].size>1024*1024*1){
			alert("사진 용량은 1MB 이하만 가능합니다.");
			return;
		};
		
		if (picture.files && picture.files[0]) {
			var reader = new FileReader();
			
			reader.readAsDataURL(picture.files[0]);
			 
			reader.onload = function (e) {
				var pictureView = $('div#pictureView')[0];
				//이미지 미리보기	        	
			 	pictureView.style.backgroundImage = "url("+e.target.result+")";
			 	pictureView.style.backgroundPosition="center";
			 	pictureView.style.backgroundSize="cover";
			 	pictureView.style.backgroundRepeat="no-repeat";			
			}
		}
		
		form.find('[name="checkUpload"]').val(0);
		$('#inputFileName').val(picture.files[0].name);
	}
	
	function upload_go(){
		//alert("upload btn");
		if(!$('input[name="pictureFile"]').val()){
		    alert("사진을 선택하세요.");
		    $('input[name="pictureFile"]').click();
		    return;
		 }  
		
		if($('input[name="checkUpload"]').val()==1){
			alert("이미 업로드된 사진입니다.");
			return;
		}
		
		 var formData = new FormData($('form[role="imageForm"]')[0]);
		 
		 $.ajax({
				url:"picture.do",
				data:formData,
				type:"post",
			    processData:false,
		        contentType:false,
		        success:function(data){
		        	//업로드 확인변수 세팅
		            $('input[name="checkUpload"]').val(1);
		            //저장된 파일명 저장.
		            $('input#oldFile').val(data); // 변경시 삭제될 파일명	          
		            $('form[role="form"]  input[name="picture"]').val(data);	    	  
		      	 	alert("사진이 업로드 되었습니다.");
		        },
		        error:function(error){
		        	alert("업로드를 실패했습니다.");
		        }
		 });
				
	}
	
	function CloseWindow(parentURL){
		
		window.opener.location.reload(true);		
		window.close();
	}
</script>

</body>








