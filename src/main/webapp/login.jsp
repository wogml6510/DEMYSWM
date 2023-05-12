<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리까지 한번에 해결 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />

<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.5/dist/full.css" rel="stylesheet" type="text/css" />

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
</head>
<style>
html,body{
   margin:0;
   padding:0;
   font-family: 'GmarketSansMedium';
}
/*  .img {
    display: block;
    margin : 0 auto;
    } */

  .item-box{
    position: relative;
    display: flex;
    justify-content: center;
    align-items: center;
  }
    
  .content-box{
    position: absolute;
    width: 30%;
    height: 40%;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 10px;
    z-index: 1;
  }
  .demys {
     padding-top:20px;
     padding-left:20px;
     font-size:4rem;
     font-weight:bold;
     color:#153A66;
  }
  .user-box {
     padding-left:25px;
     font-size:1rem;
     font-weight:bold;
     color:#ffffff;

     }

     .login-card {
     display:flex;
     justify-content: center; 
     align-items: center;
     margin-top: 10px;
     }
     
     .loginbox-btn {
     display:flex;
     align-items: center;
     height: 80px;
     margin-top: 10px;
     }
     
     .btn-primary {
     color:#ffffff;
     background-color:#153A66;
     border : none;
     margin : 0 auto;
     }
     .btn-primary:hover {
     background-color:#016FA0 ;
     }

   .mt-5 {
   text-align: center;
   }
   .font-demys {
   color : #000000;
   }
   
   .form-control {
   border-bottom:1px solid #000000;
   }
   
   .input-card {
   background: rgba(255, 255, 255, 0);
   width: 100px;
   color : #000000;
   font-weight: bold;
   }
   
   .id-box {
   line-height:48px;
   outline:none;
   background: rgba(255, 255, 255, 0);
   }

#modal_layer {
   display: none;
   position: fixed;
   top: 0;
   left: 0;
   width:190vh;
   height:1067px;
   background: rgba(255, 255, 255, 0.5);
}
#modal {
   position: fixed;
   left:40%;
   top:40%;
}

#modal .modal_content {
   width: 600px;
   height: 400px; 
   top: 50%; 
   background: #fff;
   border: 2px solid #666;
   left: 50%;
   transform: translate(-50%, -50%);
   
}

</style>


<body>
<div class="item-box">
   <div class="img">
       <img src="/resource/img/back.png" style="width:190vh;height:1067px;"/>
   </div>
   <div class="content-box" style="border:5px solid #153A66;">
   
   

<!-- 모달창  -->

<div id="modal_layer" class="flex justify-center items-center">
   <div id="modal" style="width: 300px; height: 300px; background-color:white;">
     <div id="modal_content" class="login-box">
     <div class="flex" style="background-color: #153A66;">
         <div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 50px;">
            <div class="text-white" style="font-weight: bold; font-size: 1rem; margin-right: auto;">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
         </div>
     </div>
      <div class="flex flex-col gap-2 items-center" style="border:1px solid black;" >
         <div class="form-control">
           <label class="input-group input-group-sm">
             <span class="input-card">ID :</span>
             <input type="text" class="id-box" value="" />
           </label>
         </div>
         <div class="form-control">
           <label class="input-group input-group-sm">
             <span class="input-card">PW :</span>
             <input type="password" class="id-box" value="" />
           </label>
         </div>
      </div>
      <br/>
      <div class="flex justify-center">
         <button style="font-size: 20px; width: 100px; height: 40px; background-color: #153A66; color: white; border-radius: 8px; margin-right: 50px;">확인</button>
         <button id="modal_close_btn" style="font-size: 20px; width: 100px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;">취소</button>
      </div>
     </div>
 </div>
</div> 
 
 
      <div class="demys">
         <span>DEMYS PMS</span>
      </div>
      <div class="user-box">
         <span>USER LOGIN</span>
      </div>
     <div class="login-card">
         <div class="login-box">
            <div class="flex flex-col gap-2 items-center" >
               <div class="form-control">
                    <label class="input-group input-group-sm">
                      <span class="input-card">ID :</span>
                      <input type="text" class="id-box" value="" />
                    </label>
               </div>
               <div class="form-control">
                 <label class="input-group input-group-sm">
                   <span class="input-card">PW :</span>
                   <input type="password" class="id-box" value="" />
                 </label>
               </div>
            </div>
       </div>
         </div>
      <div class="loginbox-btn">
         <input type="submit" class="btn btn-primary" value="LOGIN" />
      </div>
      <div>
         <div id="root" class="mt-5">
           <!--  <button id="registBtn" class="font-demys" onclick="OpenWindow('regist.jsp','계정등록',500,670);">계정등록</button>&nbsp;&nbsp; -->
           <!--  <button id="registBtn" class="font-demys" onclick="OpenWindow('sendCode.jsp','인증코드',400,350);">계정등록</button>&nbsp;&nbsp; -->
          <button id="registBtn" class="font-demys" onclick="OpenWindow('newPw.jsp','새 비밀번호',400,350);">계정등록</button>&nbsp;&nbsp;
            <button id="findPwBtn" class="font-demys" onclick="OpenWindow('findPw.jsp','비밀번호 찾기',400,350);">비밀번호 찾기</button>
         </div>
      </div>
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