<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../common/mainhead.jsp"%>

<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

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

.btn-hover {
	border:none;
	background-color:#016FA0;
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
    	<button type="button" class="btn btn-se" onclick="OpenWindow('regist','신규업체 등록',550,800);" >등 록</button>
    </div>
    </div>
 </div>
 <div class="list-body">
 		<table class="table table-bordered text-center" style="text-align:center;width:100%" >
        <thead>
			<tr>
				<th>업체번호</th>
				<th style="width:100px;">업체명</th>
				<th>대표자명</th>
				<th>대표번호</th>
				<th style="width:140px;">팩스번호</th>
				<th style="width:140px;">대표주소</th>
				<th>담당자명</th>
				<th>담당자연락처</th>
			</tr>
		</thead>
		<tbody style="">
		  <c:forEach items="${contactsList }" var="contacts" >
			<tr class="hover">
				<td>${contacts.CT_NUM }</td>
				<td><a href="javascript:OpenWindow('detail?CT_NUM=${contacts.CT_NUM}', '업체 상세', 550, 800);">${contacts.CT_NAME}</a></td>
				<td>${contacts.CT_CEO }</td>
				<td>${contacts.CT_TEL }</td>
				<td>${contacts.CT_FAX }</td>
				<td>${contacts.CT_ADDR }</td>
				<td>${contacts.CT_MANAGER }</td>
				<td>${contacts.CT_MG_TEL }</td>
			</tr>
		  </c:forEach>
		</tbody>	 
	</table>
</div>
<div class="page-menu mt-5 flex justify-center">
  <div class="pagination d-inline flex" style="font-size:2rem;height:20px;">
    <div class="page-item d-inline-flex">
      <a class="btn btn-md btn-se" href="?page=${currentPage - 1}" aria-label="Previous" id="previousBtn">
        <span aria-hidden="true">&laquo;</span>
        <span class="sr-only">Previous</span>
      </a>
    </div>

    <c:forEach begin="1" end="${totalPages}" var="pageNumber">
      <c:choose>
        <c:when test="${pageNumber == currentPage}">
          <div class="page-item active d-inline-flex" aria-current="page">
            <a class="btn btn-md btn-hover">${pageNumber}</a>
          </div>
        </c:when>
        <c:otherwise>
          <div class="page-item d-inline-flex">
            <a class="btn btn-md btn-se" href="?page=${pageNumber}">${pageNumber}</a>
          </div>
        </c:otherwise>
      </c:choose>
    </c:forEach>

    <div class="page-item d-inline-flex">
      <a class="btn btn-md btn-se" href="?page=${currentPage + 1}" aria-label="Next" id="nextBtn">
        <span aria-hidden="true">&raquo;</span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </div>
</div>
</div>

	<script>
		function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
			winleft = (screen.width - WinWidth) / 2;
			wintop = (screen.height - WinHeight) / 2;
			var win = window.open(UrlStr, WinTitle, "scrollbars=yes, location=no, width="+ WinWidth +", height="+ WinHeight +", top="+ wintop +", left="+ winleft +", resizable=yes");
			win.focus() ; 
	}

	//팝업창 닫기
	function CloseWindow(parentURL){
		
		window.opener.location.reload(true);		
		window.close();
	}
	
	 document.addEventListener("DOMContentLoaded", function() {
		    const paginationButtons = document.querySelectorAll(".pagination .page-item");

		    paginationButtons.forEach(function(button) {
		      button.addEventListener("click", function() {
		        paginationButtons.forEach(function(btn) {
		          btn.classList.remove("active");
		        });
		        this.classList.add("active");
		      });
		    });
		  });
	 
	 window.onload = function() {
		    var previousBtn = document.getElementById('previousBtn');
		    var currentPage = ${currentPage};

		    if (currentPage === 1) {
		      previousBtn.classList.add('disabled');
		      previousBtn.removeAttribute('href');
		    }
		  };
 </script>
		</body>
		</html>