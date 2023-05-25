<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />

<!-- 사이트 공통 CSS -->
<link rel="stylesheet" href="/resource/common.css" />
<!-- 사이트 공통 JS -->
<script src="/resource/common.js" defer="defer"></script>

</head>
<style>
.btn-ghost:hover {
   background-color: #016FA0;
}

.alramBoard:hover {
   background-color: #f7f7f7;
}

.btn-top {
   background-color: white;
   border: none;
}

.btn-top:hover {
   background-color: #AAAAAA;
   border: #AAAAAA;
}

.navbar {
   padding: 0px;
   min-height: 1rem;
   height: 55px;
}
.btn-drop:hover{
   background-color:#016FA0;
   color:white;
}
</style>
<body>
      <div class="navbar text-neutral-content bg-white">
         <a href="/main">
            <img style="width:160px; height:55px;" src="/resource/img/logo.jpg" alt="" />
         </a>
            <div class="flex-1"></div>
            <div class="flex-none"><div class="dropdown dropdown-end">
                        <button tabindex="0" class="btn btn-top btn-circle">
                              <div class="indicator">
                                    <svg style="color: black;" xmlns="http://www.w3.org/2000/svg" class="h-6 w6" fill="none" viewBox="0 0 24 24"
                                          stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M15 17h5l-1.405-1.405A2.032 2.032 0 0118 14.158V11a6.002 6.002 0 00-4-5.659V5a2 2 0 10-4 0v.341C7.67 6.165 6 8.388 6 11v3.159c0 .538-.214 1.055-.595 1.436L4 17h5m6 0v1a3 3 0 11-6 0v-1m6 0H9" /></svg>
                                    <span class="badge badge-xs badge-primary indicator-item"></span>
                              </div>
                        </button>
                        <ul tabindex="0" class="flex menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-52"
                              style="color:black; width:505px; height:450px; align-items:center;">
                              <span class="text-center mb-2 text-white" style="margin-right:10px; opacity:70%; font-weight:bold; font-size:1.2rem; width:490px; height:40px; border-radius:13px; background-color:#016FA0; line-height:40px;">Notification</span>
                              <li style="width:480px;">
                                    <div class="alramBoard m-1" style="border-radius:5px;">
                                    <div style="width:50px; height:50px; border-radius:50%; background-color:#adf549; margin-right:8px;">
                                       <i class="fa-regular fa-calendar" style="color:white; line-height:50px; margin-left:13px; font-size:1.7rem;"></i>
                                    </div>
                                    <span>
                                       <h5>캘린더</h5>
                                       <p>캘린더가 등록되었습니다.</p>
                                    </span>
                                    </div>
                              </li>
                                    <div style="width:450px; height:1px; background-color:#e3e3e3;"></div>
                              <li style="width:480px;">
                                    <div class="alramBoard m-1" style="border-radius:5px;">
                                    <div style="width:50px; height:50px; border-radius:50%; background-color:#fc7e7e; margin-right:8px;">
                                       <i class="fa-solid fa-circle-exclamation" style="color:white; line-height:50px; margin-left:12px; font-size:1.7rem;"></i>
                                    </div>
                                    <span>
                                       <h5>이슈</h5>
                                       <p>이슈가 등록되었습니다.</p>
                                    </span>
                                    </div>
                              </li>
                                    <div style="width:450px; height:1px; background-color:#e3e3e3;"></div>
                              <li style="width:480px;">
                                    <div class="alramBoard m-1" style="border-radius:5px;">
                                    <div style="width:50px; height:50px; border-radius:50%; background-color:#66dcff; margin-right:8px;">
                                       <i class="fa-regular fa-comment-dots" style="color:white; line-height:50px; margin-left:12px; font-size:1.7rem;"></i>
                                    </div>
                                    <span>
                                       <h5>이슈댓글</h5>
                                       <p>이슈댓글이 등록되었습니다.</p>
                                    </span>
                                    </div>
                              </li>
                                    <div style="width:450px; height:1px; background-color:#e3e3e3;"></div>
                              
                              <li style="width:480px;">
                                    <div class="alramBoard m-1" style="border-radius:5px;">
                                    <div style="width:50px; height:50px; border-radius:50%; background-color:#adf549; margin-right:8px;">
                                       <i class="fa-regular fa-calendar" style="color:white; line-height:50px; margin-left:13px; font-size:1.7rem;"></i>
                                    </div>
                                    <span>
                                       <h5>캘린더</h5>
                                       <p>캘린더가 등록되었습니다.</p>
                                    </span>
                                    </div>
                              </li>
                                    <div style="width:450px; height:1px; background-color:#e3e3e3;"></div>
                              
                              <li style="width:480px;">
                                    <div class="alramBoard m-1" style="border-radius:5px;">
                                    <div style="width:50px; height:50px; border-radius:50%; background-color:#fc7e7e; margin-right:8px;">
                                       <i class="fa-solid fa-circle-exclamation" style="color:white; line-height:50px; margin-left:12px; font-size:1.7rem;"></i>
                                    </div>
                                    <span>
                                       <h5>이슈</h5>
                                       <p>이슈가 등록되었습니다.</p>
                                    </span>
                                    </div>
                              </li>
                              
                        </ul>
                  </div>
                 <c:if test="${not empty member.MEMBER_ID}">
				  <li style="margin: 0 auto;color:black;list-style-type: none;">
				    <span>
				      ${member.MEMBER_NAME}
				      <c:choose>
				        <c:when test="${member.MEMBER_POSITION eq 1}">
				          사원
				        </c:when>
				        <c:when test="${member.MEMBER_POSITION eq 2}">
				          선임
				        </c:when>
				        <c:when test="${member.MEMBER_POSITION eq 3}">
				          책임
				        </c:when>
				      </c:choose>
				    </span>
				  </li>
				</c:if>
				
				<c:if test="${empty member.MEMBER_ID}">
				  <li>
				    <a href="/member/login" class="text-black text-right ml-2 mr-1">
				      <span>로그인</span>
				    </a>
				  </li>
				</c:if>
				<div class="dropdown dropdown-end">
                        <label tabindex="0" class="btn btn-top btn-circle avatar">
                              <div class="w-10 rounded-full">
                                    <div class="manPicture " data-id="${member.MEMBER_ID }" style="width:40px;height:40px;display:block;margin:0 auto;"></div>
                              </div>
                        </label>
                        <ul tabindex="0" class="menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-52"
                              style="color: black;">
                              <li>
                                    <a href="#" class="justify-between"> MyPage </a>
                              </li>
                              <li>
								    <a href="/member/logout" > Logout </a>
							  </li>
                        </ul>
                  </div>
            </div>
      </div>

      <div class="flex" style="background-color: #153A66;">
            <div class="navbar text-neutral-content" style="width:18%; border-right: 2px solid #f7f7f7;">
                  <a class="btn btn-ghost normal-case text-xl">사이드바</a>
            </div>
            <div class="navbar text-neutral-content"  style="width:82%;">            
            <ul class="text-white" style="margin-left:auto;">
                  <li>
                        <a href="/common/head" class="btn btn-ghost normal-case text-xl"  style="width:130px;">
                        <span>DashBoard</span>
                        </a>
                  </li>
                  <li>
                        <a href="/project/main" class="btn btn-ghost normal-case text-xl" style="width:130px;">
                              <span>Projects</span>
                        </a>
                  </li>
                  <li>
                        <a href="/calendar/calendar" class="btn btn-ghost normal-case text-xl" style="width:130px;">
                              <span>Calendar</span>
                        </a>
                  </li>
                  <li>
                        <a href="/tasks/list" class="btn btn-ghost normal-case text-xl" style="width:130px;">
                              <span>Tasks</span>
                        </a>
                  </li>

                  <li>
                        <a href="/contacts/list" class="btn btn-ghost normal-case text-xl" style="width:130px;">
                              <span>Contacts</span>
                        </a>
                  </li>

            </ul>
            </div>
      </div>

<script>

window.onload=function(){
  	MemberPictureThumb('<%=request.getContextPath()%>');
  }
  
  
function MemberPictureThumb(contextPath){
	   for(var target of document.querySelectorAll('.manPicture')){   
	      var id = target.getAttribute('data-id');
	      
	      target.style.backgroundImage="url('"+contextPath+"/member/getPicture?MEMBER_ID="+id+"')";            
	      target.style.backgroundPosition="center";
	      target.style.backgroundRepeat="no-repeat";
	      target.style.backgroundSize="cover";
	   }
	}
</script> 
      
      
      