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
			<div class="main-title">업체 정보 상세</div>
			<form role="form" class="form-horizontal" action="modify.do" method="post" enctype="multipart/form-data">	
				<div class="form-group">
      				<label style="font-weight: bold;">업체명</label>
      			<div class="input-group">
        			<div class="input-group-prepend">
        				<input type="text" placeholder="Type here" class="input input-bordered w-full"  id="" name="" readonly value=""/>
 					</div>     			
      			</div>
      			<div class="flex justify-between">
      			<label style="font-weight: bold;">대표자명</label>
 				<label style="font-weight: bold; margin-right:170px;">구분</label>
 				</div>       			
      			<div class="input-group">
        			<div class="input-group-prepend2">
        				<input type="text"  placeholder="Type here" class="input input-bordered w-full"  id="" name="" readonly value=""/>
 					</div>
 					<div class="input-group-prepend3">
        				<input type="text"  placeholder="Type here" class="input input-bordered w-full"  id="" name="" readonly value=""/>
      				</div>
      			</div>
      			<div class="form-group row">
					<label style="font-weight: bold;">전화번호</label>
						<div class="form-box" style="display:flex;">
								<input type="text" style="width:22%;" placeholder="Type here" class="input input-bordered w-full"  id="" name="" readonly value=""/>
							
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:34%;" name="" type="text" class="input input-bordered float-left" id="" name="" readonly value="" /> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:34%;" name="" type="text" class="input input-bordered float-right" id="" name="" readonly value=""/>
							</div>
						</div>
				<div class="form-group row">
					<label style="font-weight: bold;">이메일</label>
						<div class="form-box" style="display:flex;">
							<div class="input-group-sm w-full flex">
								<input style="width:45%;" name="" type="text" class="input input-bordered float-left" id="" name="" readonly value=""/> 
								<label class="float-left" style="padding: 0; text-align: center;width:10%;">&nbsp;@&nbsp;</label> 
									<input style="width:45%;" name="" type="text" class="input input-bordered float-right" id="" name="" readonly value=""/>
							</div>
						</div>
					</div>
				<div class="form-group row">
					<label style="font-weight: bold;">팩스번호</label>
						<div class="form-box" style="display:flex;">
								<input style="width:30%;" name="" type="text" class="input input-bordered float-left" value=""/> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:30%;" name="" type="text" class="input input-bordered float-left" value=""/> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:30%;" name="" type="text" class="input input-bordered float-right" value="" />
							</div>
						</div>
						<div class="flex justify-between">
			      			<label style="font-weight: bold;">주소</label>
			 			</div>     			
			      			<div class="input-group">
			        			<div class="input-group-prepend2">
			        				<input type="text" id="sample6_postcode" placeholder="우편번호가 나오겠지여" class="input input-bordered w-full" name="" value=""/>
			 					</div>
      						</div>
      					<div class="input-group">
        					<div class="input-group-prepend">
        						<input type="text"  id="sample6_address" placeholder="주소가 나오고" class="input input-bordered w-full"  name="address" value=""/>
 							</div>     			
      					</div>
      					<div class="input-group">
        					<div class="input-group-prepend">
        						<input type="text"  id="sample6_detailAddress" placeholder="상세주소가 나오겠지욥" class="input input-bordered w-full"  name="" value=""/>
 							</div>
 							<div class="input-group-prepend">
        						<input type="text" id="sample6_extraAddress" placeholder="상세주소가 나오겠지욥" class="input input-bordered w-full"  name="" value=""/>
 							</div>        			
      					</div>
      					<label style="font-weight: bold;">담당자명</label>
      					<div class="input-group">
        					<div class="input-group-prepend">
        						<input type="text" placeholder="Type here" class="input input-bordered w-full"  name="" value=""/>
 							</div>     			
      					</div>
      					<div class="form-group row">
						<label style="font-weight: bold;">전화번호</label>
						<div class="form-box" style="display:flex;">
								<input type="text" style="width:22%;" placeholder="Type here" class="input input-bordered w-full"  id="" name="" readonly value=""/>
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:34%;" name="" type="text" class="input input-bordered float-left" id="" name="" readonly value="" /> 
									<label class="float-left" style="padding: 0; text-align: center;width:5%;">&nbsp;-&nbsp;</label> 
								<input style="width:34%;" name="" type="text" class="input input-bordered float-right" id="" name="" readonly value=""/>
							</div>
						</div>
						</div>
		<div class="card-footer row" style="margin-top: 0; border-top: none;display:flex;flex-direction:row;justify-content:center;">						
			<button type="button" id="modifyBtn" onclick="location.href='modify.jsp" class="btn btn-se" style="margin-right: 10px;">수 정</button>
			<div class="col-sm-4"></div>
			<button type="button" id="cancelBtn" onclick="CloseWindow();" class="btn btn-se"  style="margin-left: 10px;">취 소</button>
		</div>	
			</form>
					</div>
				</div>
		</div>

<script>

function modify_go(){
	var form = $('form[role="form"]');		
	form.submit();

}

function CloseWindow(parentURL){
	
	window.opener.location.reload(true);		
	window.close();
}
   </script>
</body>








