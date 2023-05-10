<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.project-part{
   display:flex;
   direction: row;
}
.p-sidbar{
   width:18%;
   height:930px;
   border-right:2px solid #153A66;
   border-bottom:2px solid #153A66;
   padding:5px;
}
.p-body{
   width:82%;
   height:930px;
   border-bottom:2px solid #153A66;
}
.p-bt{
   height:22%;
   /* border:1px solid red; */
}
.p-list{
   height:78%;
   display:flex;
   flex-direction: column;
   padding:5px;
   background-color:#F2F2F2;
}
.p-regist{
   width:100%;
   display:flex;
   flex-direction: column;
}
.p-rg-bt{
   background-color:#153A66;
   color:white;
   width:100%;
   height:50px;
}
.p-inend{
   height:45px;
   padding-top:5px;
   padding-bottom:5px;
   display: flex;
    justify-content: space-between;
}
.p-inpro{
   height:inherit;
   width:49%;
   background-color:#153A66;
   color:white;
}
.p-end{
   height:inherit;
   width:49%;
   border:1px solid #153A66;
}
.p-check{
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    margin-top: 7px;
}

.p-searchbar{
   width:100%;
    display: flex;
}

.p-list-box{
   width:100%;
   height:17%;
   border:2px solid #797979;
   padding:10px;
   margin-bottom:9px;
   background-color:#ffffff;
}
.p-list-title{
   font-size:18px;
   font-weight:bold;
}
.p-list-date{
   margin-left: 30px;
    margin-top: 5px;
    margin-bottom: 5px;
}
.p-list-box-bottom{
   display: flex;
    justify-content: space-between;
    font-weight: bold;
    margin-top: 5px;
}
.p-list-issu{
   background-color:B7DDFF;
   font-size: 13px;
   color:#0000AA;
   width:70px;
   height:24px;
   display: flex;
    padding: 2px;
    justify-content: center;
    align-items: center;
   border-radius: 5px;
}

/* 줄바꿈X ...으로표시 */
.ellipsis {
   overflow: hidden;
   text-overflow: ellipsis;
   white-space:nowrap;
}

</style>

<%@ include file="head.jsp" %>


<div class="project-part">

   <div class="p-sidbar">
      <div class="p-bt">
         <div class="p-regist">
            <button class="p-rg-bt">
               <i class="fa-regular fa-square-plus"></i>
               프로젝트등록
            </button>
            <div class="p-inend">
               <button class="p-inpro">진행중 </button>
               <button class="p-end">완료 </button>
            </div>
            <div class="p-check">
               <div style="padding-top:3px;">
                 <label class="cursor-pointer label">
                   <input type="checkbox" checked="checked" class="checkbox checkbox-info" />
                   <span class="label-text">&nbsp;전체 프로젝트</span>
                 </label>
               </div>
               <div class="w-42">
                  <select class="select w-full max-w-xs">
                       <option disabled selected>프로젝트명</option>
                       <option>프로젝트명</option>
                       <option>업체명</option>
                  </select>
               </div>
            </div>
         </div>
         <div class="p-searchbar">
            <input type="text" placeholder="검색어를 입력하세요." class="input input-bordered" style="width:85%;"/>
            <i class="fa-solid fa-magnifying-glass" style="font-size:30px;width:15%;display:flex;align-items: center;justify-content: space-around;"></i>
         </div>
         
      </div>
      <div class="p-list">
<%--          <c:forEach var="name" items="" varStatus="status">
             
         </c:forEach> --%>
         <div class="p-list-box">
            <div style="border-bottom:1px solid #797979;">
               <div class="ellipsis p-list-title">
                  <span style="color:red;font-size:23px;"><i class="fa-sharp fa-solid fa-flag"></i></span>
                  <span >프로젝트제목들어가야함계속길게적는중</span>
               </div>
               <div class="p-list-date">
                  <span>2023.05.02 ~ </span>
                  <span> 2023.07.02</span>
               </div>
            </div>
            <div class="p-list-box-bottom">
               <span style="font-size:15px;">(주)오싸거</span>
               <span class="p-list-issu">이슈 3</span>
            </div>
         </div>
         <div class="p-list-box">
         </div>
         <div class="p-list-box">
         </div>
         <div class="p-list-box">
         </div>
         <div class="p-list-box">
         </div>
         <div class="">
         pagenation들어가야함
         </div>
         
      </div>
   
   </div>
   
   <div class="p-body">
   
   </div>

</div>



</body>
</html>