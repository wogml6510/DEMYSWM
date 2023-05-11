<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/mainhead.jsp"%>
<!DOCTYPE html>
<html lang="ko" class="light" data-theme="light">
<head>
<meta charset="UTF-8">
<title>DashBoard</title>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font
-awesome/6.1.1/css/all.min.css" />

<!-- 사이트 공통 CSS -->
<link rel="stylesheet" href="/resource/common.css" />
<!-- 사이트 공통 JS -->
<script src="/resource/common.js" defer="defer"></script>

</head>
<style>
.btn-ghost:hover{
   background-color:#016FA0;
}
a:hover{
   background-color:#016FA0;
   color:white;
}
.btn-top{
   background-color:white;
   border:none;
}
.btn-top:hover{
   background-color:#AAAAAA;
   border:#AAAAAA;
}
.navbar{
   padding:0px;
   min-height:1rem;
   height:55px;
}
.main-box {
	width:100%;
	height:955px;
}
.contacts_select2 {
	display:flex;
	margin-top:10px;
	margin-bottom:10px;
	margin-left:20px;
}

.con-se1 {
 	padding-right : 10px;
}
.con-se2 {
	padding-right : 10px;
}

.btn-secondary {
	color:#ffffff;
  	background-color:#153A66;
  	border : none;
}
.input-bordered {
	width: 200px;
}
.btn-se {
	border:none;
	color:#ffffff;
  	background-color:#153A66;
}
.btn-secondary:hover,.btn-se:hover {
	background-color:#016FA0;
}

.list-body {
	margin : 0 20px;
	overflow-y:auto;
  	overflow-x:hidden;
	border-top:2px solid #333333;
   border-bottom:2px solid #333333;
}

.table-bordered > table th, .table-bordered> table td{
	border : 1px solid black;
}

.regist-btn {
	margin-left:auto;
	padding-right:20px;
}

</style>

<body>
  <div class="main-box" style="border:3px solid red;">
  <div class="contacts_select">
  	<div class="contacts_select2">
      <div class="con-se1">
        <select class="select select-bordered w-full max-w-xs">
		<option disabled selected>전체</option>
		<option>협력업체</option>
		<option>클라이언트</option>
		<option>거래처</option>
	  </select>
	</div>
	<div class="con-se2">
 	 <select class="select select-bordered w-full max-w-xs">
		<option disabled selected>업체명</option>
		<option>담당자</option>
		<option>대표번호</option>
	  </select>
	  
    </div>
    	<input class="input input-bordered w-full max-w-xs" type="text" name="keyword" placeholder="검색어를 입력하세요." value=""/>
            <span class="input-group-apspend">
               <button class="btn btn-se" type="button" id="searchBtn" data-card-widget="search" onclick="list_go(1);">
                 <i class="fa fa-fw fa-search"></i>
                   </button>
            </span>
    <div class="regist-btn">
    	<button type="button" class="btn btn-se" onclick="OpenWindow('regist.jsp','신규업체 등록',550,800);" >등 록</button>
    </div>
    </div>
 </div>
 <div class="list-body">
 		<table class="table table-bordered text-center" style="text-align:center;width:100%" >
 		<colgroup>   
          <col width="100"/>
          <col width="100"/>
          <col width="100"/>
          <col width="100"/>
          <col width="150"/>
          <col width="100"/>
          <col width="100"/>
          <col />
        </colgroup>
        <thead>
			<tr>
				<th>업체명</th>
				<th>대표자명</th>
				<th>대표번호</th>
				<th>팩스번호</th>
				<th>대표주소</th>
				<th>담당자명</th>
				<th>담당자연락처</th>
			</tr>
		</thead>
		<tbody style="overflow-y:scroll;overflow-x:hidden;">
			<%-- <c:forEach items="" var=""> --%>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				</tr>
		<%-- 	</c:forEach>   --%>
		</tbody>	 
	</table>
</div>
</div>
	<script>
		function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
			winleft = (screen.width - WinWidth) / 2;
			wintop = (screen.height - WinHeight) / 2;
			var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth  
									+",height="+ WinHeight +",top="+ wintop +",left=" 
									+ winleft +",resizable=yes"  );
			win.focus() ; 
	}

	//팝업창 닫기
	function CloseWindow(parentURL){
		
		window.opener.location.reload(true);		
		window.close();
	}
 </script>
		</body>
		</html>