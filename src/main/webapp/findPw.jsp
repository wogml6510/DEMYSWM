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
	height : 318px;
	border : 4.5px solid #153A66;
}
.main-box {
	width: 80%;
	margin: 0 auto;
	height : 313px;
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
	height:40px;
}

.input-group-prepend {
	width: 100%;
}

.input-bordered {
	width: 100%;
	height:40px;
	border : 1px solid #aaaaaa;
}

.btn-se {
	width : 130px;
	min-height:1rem;
	border:none;
	color:#ffffff;
  	background-color:#153A66;
  	height:40px;
}
.btn-se:hover {
	background-color:#016FA0;
}

.form-group {
	width:100%;
	margin :5px 0px;
	display:flex;
	align-items: center;
}
.card-footer {
	padding-top : 35px;
	margin-top: 0; 
	border-top: none;
	display:flex;
	flex-direction:row;
	justify-content:center;
}

.findPw-name {
	font-weight: bold;
	width:20%;
	height:40px;    
	display: flex;
    align-items: center;
    margin-right:10px;
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
			<div class="main-title">비밀번호 찾기</div>
				<div class="form-group">
      				<label class="findPw-name">이름</label>
      			<div class="input-group">
        			<div class="input-group-prepend">
        				<input type="text" placeholder="Type here" class="input input-bordered"  id="" name="" />
 					</div>     			
      			</div>
      			</div>
      			<div class="form-group">
      			<label class="findPw-name">아이디</label>
      			<div class="input-group">
        			<div class="input-group-prepend">
        				<input type="text" placeholder="Type here" class="input input-bordered"  id="" name="" />
 					</div>     			
      			</div>
      			</div>
      			<div class="form-group">
      			<label class="findPw-name">이메일</label>
      			<div class="input-group">
        			<div class="input-group-prepend">
        				<input type="text" placeholder="Type here" class="input input-bordered"  id="" name="" />
 					</div>     			
      			</div>
				</div>
		<div class="card-footer row">						
			<button type="button" id="findBtn"  onclick="find_go();" class="btn btn-se" style="margin-right: 10px;">확 인</button>
			<div class="col-sm-4"></div>
			<button type="button" id="cancelBtn" onclick="CloseWindow();" class="btn btn-se"  style="margin-left: 10px;">취 소</button>
		</div>	
		</div>
					</div>
				</div>


<script>

function find_go(){
	var form = $('form[role="form"]');		
	form.submit();

}

function CloseWindow(parentURL){
	
	window.opener.location.reload(true);		
	window.close();
}
   </script>
</body>








