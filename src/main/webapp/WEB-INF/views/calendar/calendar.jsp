<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@page import="com.ducks.demys.boot.vo.Calendar"%>
<c:set var="Calendar" value="${Calendar}" />
<%@include file="../common/mainhead.jsp"%>
<!-- fullcalendar 설정관련 script -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" ></script> -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.7/index.global.min.js'></script>

<!-- fullcalendar 언어 설정관련 script -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<link rel="stylesheet" href="../resource/css/calendar/caln.css" />

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<!-- //html 하단에 순서로 로드 -->
<script src="js/flatpickr.js"></script>
 
<!-- //언어설정을 위한 로드 -->
<script src="https://npmcdn.com/flatpickr/dist/flatpickr.min.js"></script>
<script src="https://npmcdn.com/flatpickr/dist/l10n/ko.js"></script>

<link rel="stylesheet" href="../resource/css/calendar/calendar.css">





<div id='external-events' style="margin-top: 50px; float: left; width: 20%; padding-right: 30px; padding-left: 20px;">
		<p>
				<strong>드래그로 달력에 표시</strong>
		</p>

		<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>프로젝트</div>
		</div>
		<div class='fc-event fc-h-event fc-daygrid-event fc-daygrid-block-event'>
				<div class='fc-event-main'>개인업무</div>
		</div>


		<p>
				<input type='checkbox' id='drop-remove' />
				<label for='drop-remove'>드래그 앤 드롭후 제거</label>
		</p>


		<div class="button_all">
		<div>
				<button onclick="openModal();" 
						style="cursor: pointer; font-size: 15px; width: 100px; height: 40px; background-color: #153A66; color: white; border-radius: 8px;">
						일정추가</button>
		</div>
</div>
</div>







<!-- The button to open modal -->
 <!-- 일정추가 모달 -->
  <div id="cal_modal" class="modal_calendar">

    <div class="modal_content">
          <div class="flex" style="background-color: #153A66;">
                <div class="navbar text-neutral-content modal-head">
                      <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                </div>
          </div>

      <div class="cts-view">
         <div class="cts-title">
            <span>일정등록</span>
         </div>
         <div class="cts-title-sub">* 일정을 등록하세요.</div>
         
         <form action="post" id="ScheduleForm">
         <div style="margin-top:10px;"> 
         <div class="p-modal-serach regist_calendar">
            	<div class="col-xs-12" style="width:100%;">
								<label class="mo_sc_name" for="mo_sc_name" style="font-weight:bold;float:left;width:30%;">일정명</label>
								<input class="inputModal" style="float:left;width:50%;border:1px solid #ccc;" type="text" name="SC_NAME" id="SC_NAME" required="required" />
						</div>
         </div>
         <div class="p-modal-serach regist_calendar">
            	<div class="time" style="width:100%;">
								<div>
										<label class="mo_sc_stdate" for="mo_sc_stdate" style="font-weight:bold;float:left;width:30%;">시작일자</label>
										<input  style="float:left;width:50%;border:1px solid #ccc;" id="START" name="START" placeholder="시작일을 선택하세요" class="timeSelector" />
								</div>
						</div>
         </div>
         <div class="p-modal-serach regist_calendar">
            	<div class="time" style="width:100%;">
								<div>
										<label class="mo_sc_stdate" for="mo_sc_stdate" style="font-weight:bold;float:left;width:30%;">종료일자</label>
										<input style="float:left;width:50%;border:1px solid #ccc;" id="END" name="END"placeholder="종료일을 선택하세요" class="timeSelector" />
								</div>
						</div>
         </div>
         <div class="p-modal-serach regist_calendar">
            	<div class="col-xs-12" style="width:100%;">
								<label class="col-xs-4" for="sc_STATUS" style="font-weight:bold;float:left;width:30%;">구분</label>
								<select class="sc_STATUS" name="SC_STATUS" id="SC_STATUS" style="float:left;width:50%;border:1px solid #ccc;">
										<option value="" style="color: #D25565;">선택</option>
										<option value="1" style="color: #D25565;" ${calendar.SC_STATUS == '1' ? "selected":""}>프로젝트</option>
										<option value="2" style="color: #9775fa;" ${calendar.SC_STATUS == '2' ? "selected":""}>개인업무</option>
								</select>
						</div>
         </div>
              <!-- 프로젝트 선택 시 프로젝트 조회 버튼 -->
		<div class="p-modal-search regist_calendar" style="display: none;">
			<div class="col-xs-12" style="width:100%;margin-left:40px;">
				<label class="col-xs-4" for="mo_project-name" style="font-weight:bold;float:left;width:30%;">프로젝트명</label>
				<input class="inputModal" type="text" name="mo_project-name" id="mo_project-name" style="float:left;width:40%;border:1px solid #ccc;">
				<button onclick="javascript:searchPJ();" id="project-search-button" style="border:1px solid #ccc;width:10%;">선택</button>
			</div>
		</div>
         
         <div class="p-modal-serach regist_calendar">
            	<div class="col-xs-12" style="width:100%;">
								<label class="col-xs-4" for="sc_TYPE" style="font-weight:bold;float:left;width:30%;">일정구분</label>
								<select class="inputModal" name="SC_TYPE" id="SC_TYPE" style="float:left;width:50%;border:1px solid #ccc;">
										<option value="내부회의" ${calendar.SC_TYPE == '내부회의' ? "selected":""}>내부회의</option>
										<option value="외부회의" ${calendar.SC_TYPE == '외부회의' ? "selected":""}>외부회의</option>
										<option value="출장" ${calendar.SC_TYPE == '출장' ? "selected":""}>출장</option>
										<option value="휴가" ${calendar.SC_TYPE == '휴가' ? "selected":""}>휴가</option>
										<option value="기타" ${calendar.SC_TYPE == '기타' ? "selected":""}>기타</option>
								</select>
						</div>
         </div>
         <div class="p-modal-serach regist_calendar">
            	<div class="col-xs-12" style="width:100%;">
								<label class="col-xs-4" for="sc_IMP" style="font-weight:bold;float:left;width:30%;">중요도</label>
								<select class="inputModal" name="SC_IMP" id="SC_IMP" style="float:left;width:50%;border:1px solid #ccc;">
										<option value="">선택</option>
										<option value="1" ${calendar.SC_IMP == '1' ? "selected":""}>낮음</option>
										<option value="2" ${calendar.SC_IMP == '2' ? "selected":""}>보통</option>
										<option value="3" ${calendar.SC_IMP == '3' ? "selected":""}>높음</option>
								</select>
						</div>
         </div>
            <div class="p-modal-serach regist_calendar">
            	<div class="col-xs-12" style="width:100%;">
								<label class="col-xs-4" for="sc_PLACE" style="font-weight:bold;float:left;width:30%;">장소</label>
								<input class="inputModal" type="text" name="SC_PLACE" id="SC_PLACE" style="float:left;width:50%;border:1px solid #ccc;" />
						</div>
         </div>
         <div class="p-modal-serach regist_calendar">
            	<div class="col-xs-12" style="width:100%;">
								<label class="col-xs-4" for="SC_CONTENT" style="font-weight:bold;float:left;width:30%;">내용</label>
								<textarea rows="4" cols="50" class="textarea textarea-bordered" name="SC_CONTENT" id="SC_CONTENT" style="float:left;width:50%;border:1px solid #ccc;"></textarea>
						</div>
         </div>
      </div>
         
         <div class="p-regi-modal-bts">
                  <button class="p-regi-modal-bt" onclick="javascript:addSchedule();">등록</button>
                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="CLOSE_MODAL();">취소</button>
                  <!-- MEMBER NUM, NAME값 받을 공간 -->
                  <div class="add_member_id" ></div>
            </div>
            </form>
      </div>
    </div>

    <div class="modal_layer"></div>
</div>



<!-- 달력 -->
<section class="mt-5">
		<div class="container mx-auto px-3">
				<div id='calendar'></div>
		</div>
</section>



<!-- 프로젝트 리스트 모달 -->

  <div id="pj_modal" class="search_pj">
<input type="hidden" name="MEMBER_NUM" value="2" />
<%-- <input type="hidden" name="PJ_NUM" value="1" />
<input type="hidden" name="PJ_NAME" value="${projects.PJ_NUM }" /> --%>
    <div class="modal_content">
          <div class="flex" style="background-color: #153A66;">
                <div class="navbar text-neutral-content modal-head">
                      <div class="text-white modal-head-0">&nbsp;&nbsp;&nbsp;&nbsp;DEMYS PMS</div>
                </div>
          </div>

      <div class="cts-view">
         <div class="cts-title">
            <span>참여중인 프로젝트</span>
         </div>
         
         <div class="cts-serch-list" style="background-color:#ccc;">
            <table id="calendarList_view" border="1" >
               <!-- memberList나오는 위치 -->

            </table>
         </div>
         <div class="p-regi-modal-bts">
                  <button id="modal_close_btn2" class="p-regi-modal-bt" onclick="CLOSE_mODAL();">닫기</button>
                  <!-- MEMBER NUM, NAME값 받을 공간 -->
                  <div class="add_calendar_id" ></div>
            </div>
      </div>
    </div>

    <div class="modal_layer"></div>
</div>






<script>

//프로젝트 옵션 선택 이벤트 핸들러
document.getElementById("SC_STATUS").addEventListener("change", function() {
  var selectedOption = this.value; // 선택된 옵션 값 가져오기
  var projectSearchContainer = document.querySelector(".p-modal-search.regist_calendar");

  if (selectedOption === "1") {
    // 프로젝트 옵션을 선택한 경우 프로젝트 입력란 표시
    projectSearchContainer.style.display = "block";
  } else {
    // 다른 옵션을 선택한 경우 프로젝트 입력란 숨김
    projectSearchContainer.style.display = "none";
  }
});


//일정추가 모달열기

function openModal() {
	 $(".modal_calendar").css('display',"block");
	}
	function CLOSE_MODAL(){
	   $(".modal_calendar").css('display', "none");
	}




	

// 타임피커 생성
var dateSelector = document.querySelector('.timeSelector');
dateSelector.flatpickr();
//언어설정
flatpickr.localize(flatpickr.l10ns.ko);
flatpickr(dateSelector);
dateSelector.flatpickr({
    local: 'ko'
});
//시간설정
$(".timeSelector").flatpickr({
	  enableTime: true,
	});
</script>


<!-- 달력 -->
<script>


$(function() {
		$('#mo_sc_status').on('change', function() {
			var selectedValue = $(this).val();
			if (selectedValue === '1') {
				$('#projectNameContainer').show();
			} else {
				$('#projectNameContainer').hide();
			}
		});
	});

	$(function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(
				calendarEl,
				{
					headerToolbar : {
						left : 'prev,next today',
						center : 'title',
						right : 'dayGridMonth,timeGridWeek,listWeek'
					},
					businessHours : false,
					navLinks : true,
					editable : true,
					selectable : true,
					locale : 'ko',
					nowIndicator : true,
					dayMaxEvents : true,
					select : function(info) {
						var SC_NAME = prompt('일정을 입력해주세요.'); //날짜선택해서 saveData에 저장후 등록하기
						if (SC_NAME) {
							var event = {
								sc_NAME : SC_NAME,
								start : info.startStr,
								end : info.endStr,
								sc_NUM : info.sc_NUM,
							};
							calendar.addEvent(event);
							saveData(event);
						}
					},
					//타이틀 클릭해서 삭제
					eventClick : function(info) {
						if (confirm('일정을 삭제하시겠습니까?')) {
							var SC_NUM = info.event.extendedProps.sc_NUM;
							//alert(SC_NUM);
							$
									.ajax({
										type : 'POST',
										url : '/calendar/removeCalendar',
										data : {
											sc_NUM : SC_NUM
										},
										dataType : 'json',
										contentType : "application/x-www-form-urlencoded; charset=UTF-8",
										success : function(data) {
											if (data.success) {
												info.event.remove();
												alert(data.msg);
											} else {
												if (data.msg) {
													alert(data.msg);
												}
											}
										},
										error : function(xhr, status, error) {
											alert('삭제가 완료되었습니다. ');
											window.location.reload();
										}
									});
						}
					},
					//달력에 리스트 출력
					events : function(info, successCallback, failureCallback) {
						var url = "/calendar/getCalendar";
						$
								.ajax({
									type : 'GET',
									cache : false,
									url : url,
									dataType : 'json',
									contentType : "application/x-www-form-urlencoded; charset=UTF-8",
									success : function(param) {
										console.log(param);
										var events = [];
										$.each(param, function(index, date) {
											events.push({
												title : date.sc_NAME,
												start : date.sc_STARTDATE,
												end : date.sc_ENDDATE,
												sc_NUM : date.sc_NUM
											});
										});

										successCallback(events);
									},
									error : function(xhr, status, error) {
										failureCallback(xhr, status, error);
									}
								});
					}
				});
		//등록하기
		function saveData(event) {
			var url = "/calendar/registCalendar";
			$.ajax({
				type : "POST",
				url : url,
				data : JSON.stringify(event),
				contentType : "application/json",
				success : function(data) {
					alert("일정이 등록되었습니다.");
				},
				error : function(xhr, status, error) {
					alert("에러 발생: " + error);
				}
			});
		}
		calendar.render();
	});
</script>




<script>
//모달안에서 프로젝트 선택 모달열기
function searchPJ(){
	 $(".search_pj").css('display',"block");
	 var MEMBER_NUM = $('input[name="MEMBER_NUM"]').val();
	/*  var PJ_NUM = $('input[name="PJ_NUM"]').val();
	 var PJ_NAME = $('input[name="PJ_NAME"]').val(); */
	//alert(MEMBER_NUM);
	
 	$.ajax({
	    url: "getModal_PJList",
	    type: "get",
	    dataType: "json",
	    data:{
	    	"member_NUM":MEMBER_NUM,
/* 	    	"pj_NUM":PJ_NUM,
	    	"pj_NAME":PJ_NAME */
	    },
	    success: function(data) {
	    	console.log(data);
	    	alert("리스트 넘어옴");
	        var projectList = data.projectList;
	        var table = $('#calendarList_view');
	        table.empty();
	        alert('포문도나');
			console.log(projectList);
	        for (var i = 0; i < projectList.length; i++) {
	            var calendar = projectList[i];
                var row = '<tr data-calendar-num="' + calendar.PJ_NUM + '"><td>' + calendar.PJ_NAME + '</td></tr>';
                table.append(row);
	        }
 			table.find('tr').click(function(){
				var PJ_NUM = $(this).data('calendar-num');
				var PJ_NAME = $(this).find('td:first-child').text();
				
				var input_pjnum = '<input id="pj_num" type="hidden" value="'+PJ_NUM +'" />';
				var input_pjname = '<input id="pj_name" type="hidden" value="'+PJ_NAME +'" />';

		 		var addCalendarId = $('.add_calendar_id');

				if (addCalendarId.length) {
					addCalendarId.empty();
				}
				addCalendarId.append(input_pjnum);
				addCalendarId.append(input_pjname);
				
				table.find('tr>td:last-child').each(function(){
					if($(this).text() == PJ_NAME){
						$(this).parent('tr').css('background-color', "#e7e7e7e7");
					}else{
						$(this).parent('tr').css('background-color', "#ffffff");
					}
				});
			});
		}
	}); 
	
} 

function CLOSE_mODAL(){
	   $(".search_pj").css('display', "none");
	}

</script>


