<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>





<%@ include file="../../../mainhead.jsp"%>



<style>
#modal {
	display: none;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
}

#modal h2 {
	margin: 0;
}

#modal .modal_content {
	width: 600px;
	height: 400px; 
	top: 50%; 
	background: #fff;
	border: 2px solid #666;
	left: 50%;
	transform: translate(-50%, -50%);
	position: fixed;
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
</style>




<!-- 모달창  -->



<div id="modal">

		<div class="modal_content">
				<div class="flex" style="background-color: #153A66;">
						<div class="navbar text-neutral-content" style="width: 100%; padding: 0px; min-height: 1rem; height: 50px;">
								<div class="text-white" style="font-weight: bold; font-size: 1rem; margin-right: auto;">
										&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
						</div>
				</div>

				<div style="position: absolute; top: 35%; left: 50%; transform: translate(-50%, -50%);">
					<i class="fa-solid fa-circle-check" style="font-size: 5.5rem;"></i>
				</div>

				<div style="line-height:60px;text-align:center;font-size:30px;font-weight:bold;color:#153A66; width:400px;height:50px;position: absolute; top: 58%; left: 50%; transform: translate(-50%, -50%);">		
					수정이 완료되었습니다.
				</div>

				<div style="display: flex; position: absolute; top: 80%; left: 50%; transform: translate(-50%, -50%);">
					
						<button id="modal_close_btn"
								style="font-size: 20px; width: 100px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;">확인</button>
				</div>


		</div>

		<div class="modal_layer"></div>
</div>





<div style="margin:0 auto; height: 955px; width:70%;">
	
	<div style="display:flex; border-bottom:2px solid black;">
		<div style="font-size: 1.5rem; font-weight: bold;width:160px;height:70px;line-height: 70px;"> 마이페이지</div>
		<div style="color:#E7E7E7;font-size:1.5rem;height:70px;line-height:70px;">|&nbsp;</div>
		<div style="font-size:20px; font-weight: bold; width:200px;height:70px;line-height: 70px; ">계정수정</div>
		
		<div style="display:flex;justify-content:flex-end;margin-left:20px;width:87%;height:70px;padding-top:20px;">	
				<button id="modal_opne_btn"   style="font-size: 15px; width: 110px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;margin-right:10px;">수정</button>
				<button style="font-size: 15px; width: 110px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;">취소</button>
		</div>
	</div>


<div class="container" style="margin:0 auto; margin-top:10px;">
	<form action="" method="post">
				<!-- 프로필 -->
				<div style="border:2px solid #E7E7E7;height:50px;line-height:50px;font-size:20px;font-weight:bold;border-radius:15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;프로필</div>
				
				<div style="margin-top:2px; border-radius:0 0 15px 15px;height:130px;border: 2px solid #E7E7E7; background-color:#E7E7E7;" >
					
					<div class="row" style="display:flex;">
					
						<!-- 프로필 사진 -->
						<div class="col-sm-6 grid-rows-1">
							<img src="/resource/img/a.jpg" style="border:5px solid #153A66; width:110px; height:100px; border-radius:50%;margin:10px;margin-left:100px;"/>
						</div>
						<div style="position:relative; top:85px; right:50px;">
							<i class="fa-solid fa-pencil" style="text-align:center;font-size:15px; border:5px solid #153A66; width:35px; height:35px; line-height:30px; border-radius:50%;background-color:white; "></i>
						</div>
							<div style="margin:10px;">
							
								<!-- 이메일 -->
								<div class="col-sm-6 grid-rows-2"  style="font-size:20px; text-align:center; line-height:50px;  height:50px; width:520px;">
									<%-- ${member.member_email } --%>
									dhtkd4900@naver.com
								</div>
									<div class="flex">
										<!-- 이름 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:2rem; text-align:right; line-height:50px; font-weight:bold; height:50px;width:250px;">
											<%-- ${member.member_name } --%>
											김미영
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 직급 -->
										<div class="col-sm-6 grid-rows-6"  style="font-size:2rem; line-height:50px; font-weight:bold; height:50px;width:500px;">
											<%-- ( ${member.member_position } ) --%>
											( 팀장 )
										</div>
									</div>	
							</div>
					</div>
				</div>
				
				<!-- 계정정보 -->
				<div style="margin-top:10px;">
					<div style="border:2px solid #E7E7E7;height:50px;line-height:50px;font-size:20px;font-weight:bold;border-radius:15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;계정정보</div>
				<div class="" style="margin-top:2px; border-radius:0 0 15px 15px;border: 2px solid #E7E7E7;" >
					
					<div class="row" style="display:flex;">
					
							<div style="margin-left:10px;">
							
								
									<div class="flex" style="margin-left:20px;margin-top:10px;margin-bottom:5px;">
										<!-- 아이디 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:15px; text-align:left; line-height:50px; font-weight:bold;height:50px;width:400px;">
											아이디
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 아이디 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #E7E7E7;" />
										
									</div>
									
									<div class="flex" style="margin-left:20px;margin-top:10px;margin-bottom:5px;">
										<!-- 비밀번호 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:50px;width:400px;">
											비밀번호
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 비밀번호 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #E7E7E7;" />
										
									</div>
									
									<div class="flex" style="margin-left:20px;margin-top:10px;margin-bottom:5px;">
										<!-- 비밀번호 확인 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:50px;width:400px;">
											비밀번호 확인
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 비밀번호 확인 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #E7E7E7;" />
										
									</div>
								</div>
							</div>
						</div>
					</div>
				
				<!-- 개인정보  -->
				<div style="margin-top:10px;">
					<div style="border:2px solid #E7E7E7;height:50px;line-height:50px;font-size:20px;font-weight:bold;border-radius:15px 15px 2px 2px;">&nbsp;&nbsp;&nbsp;&nbsp;개인정보</div>
				<div class="" style="margin-top:2px; border-radius:0 0 15px 15px;border: 2px solid #E7E7E7;" >
					
					<div class="row" style="display:flex;">
					
							<div style="margin:10px;">
							
								
									<div class="flex" style="margin-left:20px;margin-top:15px;margin-bottom:5px;">
										<!-- 이름 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:50px;width:400px;">
											이름
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 아이디 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #E7E7E7;" />
										
									</div>	
									
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 휴대폰번호 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold; height:50px;width:400px;">
											휴대폰 번호
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 휴대폰번호 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #E7E7E7;" />
										
									</div>	
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 이메일 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:50px;width:400px;">
											이메일
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 이메일 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #E7E7E7;" />
										
									</div>	
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 담당부서 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold;height:50px;width:400px;">
											담당부서
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 담당부서 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #E7E7E7;" />
										
									</div>	
									
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 직책 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold; height:50px;width:400px;">
											직책
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 직책 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #E7E7E7;" />
										
									</div>	
									
										<div class="flex" style="margin-top:5px;margin-left:20px;">
										<!-- 직급 -->
										<div class="col-sm-6 grid-rows-5"  style="font-size:20px; text-align:left; line-height:50px; font-weight:bold; height:50px;width:400px;">
											직급
										</div>
										&nbsp;&nbsp;&nbsp;
										<!-- 직급 정보칸 -->
										<input type="text" class=" input input-bordered w-full max-w-xs" style="pointer-events:none;width:100%; background-color: #E7E7E7;" />
										

							</div>
					</div>
				</div>
			</div>
		</div>
	</form>	
				
				
				
</div>

</div>

<script>
			document.getElementById("modal_opne_btn").onclick = function() {
				document.getElementById("modal").style.display = "block";
			}

			document.getElementById("modal_close_btn").onclick = function() {
				document.getElementById("modal").style.display = "none";
			}
		</script>


</body>
</html>