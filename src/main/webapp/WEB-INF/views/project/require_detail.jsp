<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<html lang="ko" class="light" data-theme="light">
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

<!-- 아이콘 나오게 하기(common.css) -->
<link rel="stylesheet" href="/resource/common.css" />


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
   height : 665px;
}
.main-box {
   width: 80%;
   margin: 0 auto;
   height : 665px;

}
.main-title {
   padding-top : 5px;
   padding-bottom : 10px;
   text-align : center;
   font-weight: bold;
   font-size: 2rem;
   
}

.input-group {
   margin-bottom : 3px;
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
}

.select-bordered {
   height:30px;
   min-height:1rem;
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

.form-group {
   margin-bottom : 5px;
}
.card-footer {
   padding-top : 15px;
}

</style>
<body>
	<div class="regist_content">
		<div class="flex card-body" style="padding-bottom:0px;">
			<div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 30px; border-bottom:3px solid #016fa0;">
				<div class="text-black mb-3" style="font-weight: bold; font-size: 1.5rem; ">
					요구사항
				</div>
			</div>
		</div>
   
   
   		<div class="card-body">
   			<table style="width:100%;">
   					
				<tr class="w-full">
	   				<td style="width:250px; font-weight:bold; display:flex; width:100%; margin-top:10px; white-space: nowrap;">
	   				<div class="flex items-center">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</div>
						<div class="flex w-full items-center justify-between" style="height:48px; border:1px solid #aaa; width:100%;; margin-left:29px;" >&nbsp;&nbsp;${require.REQUIRE_TITLE }
						</div>
	   				
	   				</td>
	   			</tr>
   					
	   					<!-- <tr >
	   						<td style="width:100px; border-radius:0px;">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목
	   							<input type="text" placeholder="제목을 입력하세요." class="input p-reg-input border-2" />
	   						</td>
	   					</tr> -->
	   					
	   			<tr>
	   				<td>
	   					<div class="font-bold" style="padding-top: 20px; padding-bottom:10px;">
	   						중 요 도
		   					<select class="select" style="border-radius:0px; margin-left: 1.5rem; border:1px solid #aaa" disabled>
								<option selected="selected" style="color:#FFD700;">
									<c:forEach begin="${require.REQUIRE_LEVEL }" end="5" step="1" >
										&#xf005;
									</c:forEach>
								</option>
							</select>
	   					</div>
	   				</td>
	   			</tr>
	   					
	   					
	   					<!-- 내용 -->	
				<tr>
					<td class="flex font-bold" >
						내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용&nbsp;
						<span style="height:150px; width:100%; margin-left: 1.5rem; resize:none; border:1px solid #aaa; border-radius:0px; padding:10px;">${require.REQUIRE_DETAIL }</span>
					</td>
				</tr>
	   						<!-- <td>내&nbsp;&nbsp;&nbsp;용</td>
	   						<td><input type="text" placeholder="내용을 입력하세요." class="input input-bordered p-reg-input" /></td> -->
	   				<!-- 첨부파일 -->
	   				<!-- 
	   				<tr>
	   					<td>
							<div class="flex relative">
								<input type="file" placeholder="첨부파일을 등록하세요." style="border:1px solid #aaaaaa; border-radius:0px; width:732px; height:48px; line-height:40px;" class=" file-input-ghost relative"/>
									<span class="absolute" style="right:4%; top:80%;">
										<i class="fa-sharp fa-solid fa-paperclip fa-flip-vertical text-2xl text-black mr-3 " ></i>
									</span>	
							</div>
						</td>
					</tr> 
					-->
					
				<tr>
	   				<td style="width:250px; font-weight:bold; display:flex; width:100%; margin-top:10px; white-space: nowrap;">
	   					<div class="flex items-center">파일첨부</div>
						<div class="flex w-full items-center justify-between" style="height:48px; border:1px solid #aaa; width:100%;; margin-left:26px;" >&nbsp;&nbsp;요구사항정의서_ver.1557.hwp
							<span>
								<i class="fa-sharp fa-solid fa-paperclip text-2xl text-black mr-3 " ></i>
							</span>
						</div>
					</td>
				</tr>
	   					
	   		</table>
   		</div>
 
		<div style="display:flex; justify-content:center; margin-top:-10px;">
			<button class="btn btn-se" onclick="location.href='require_modify?REQUIRE_NUM=${require.REQUIRE_NUM}'" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;">수 정</button>
			<button class="btn btn-se" onclick="location.href='require_delete?REQUIRE_NUM=${require.REQUIRE_NUM}'" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px; margin-right: 10px;">삭 제</button>
			<button type="button" id="cancelBtn" onclick="window.close();" class="btn btn-se" style="font-size: 20px; width: 100px; height: 40px; border-radius: 8px;">닫 기</button>
		</div>
	</div>
	<div class="modal_layer"></div>
   <!-- /.content-wrapper -->
	<script>
	
		$(document).ready(function(){
	  		var fileTarget = $('.filebox .upload-hidden');

	    	fileTarget.on('change', function(){
	        	if(window.FileReader){
	            	var filename = $(this)[0].files[0].name;
	        	} else {
	            	var filename = $(this).val().split('/').pop().split('\\').pop();
	        	}

	        	$(this).siblings('.upload-name').val(filename);
	   	 	});
		}); 

   </script>
</body>







