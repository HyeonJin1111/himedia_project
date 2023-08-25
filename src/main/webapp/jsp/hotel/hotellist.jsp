<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<title>호텔</title>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">
<meta name="csrf-name" content="yeogi_token">

<link rel="shortcut icon" href="../../resource/img/favicon_170822.ico"
	type="image/x-icon">
<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin="">

<!-- CSS -->
<title>여행할때 여기어때</title>
<link rel="stylesheet" href="../../resource/css/common.css">


<!-- 달력 외부 css -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="../../resource/js/hotel.js"></script>
</head>

<!-- 파라미터에 넣을 현재 날짜 -->
	<c:set var="currentDate" value="<%= new java.util.Date() %>" />
    <c:set var="dateFormat" value="yyyy-MM-dd" />
    <fmt:formatDate var="formattedDate" pattern="yyyy-MM-dd" value="${currentDate}" />

<body class="pc">


	<!-- Wrap -->
	<div class="wrap main_wrap show">

		<!-- Header -->
		<c:import url="/header" /> 
		<c:import url="/map" />
		<!-- CSS -->
		<link rel="stylesheet" href="../../resource/css/reset.css">
		<link rel="stylesheet" href="../../resource/css/hotel.css">

	</div>

	<!-- //Wrap   여기에서 검색버튼빼고 지우는게 좋겠지?  -->

	<!-- Script -->
	<!-- Library -->
	<script type="text/javascript" src="../../resource/js/jquery.cookie.js"></script>
	<script type="text/javascript"
		src="../../resource/js/jquery.lazyload.js"></script>
	<script type="text/javascript" src="../../resource/js/iscroll.js"></script>

	<!-- Service -->
	<script type="text/javascript" src="../../resource/js/common.js"></script>
	<script type="text/javascript" src="../../resource/js/geolocation.js"></script>

	<!-- Module -->
	<!-- <script type="text/javascript" src="./여행할때 여기어때_files/dialogPopup.js"></script> -->

	<!-- Page Script -->
	<script type="text/javascript"
		src="../../resource/js/owl.carousel.min.js"></script>
	<script type="text/javascript" src="../../resource/js/swiper.min.js"></script>
	<script type="text/javascript" src="../../resource/js/iscroll.js"></script>
	<script type="text/javascript" src="../../resource/js/main.js"></script>
	<script type="text/javascript" src="../../resource/js/reservation.js"></script>




	<main id="product">


		<!-- Area -->
		<!-- hotelheader -->

		<div class="Hheader">
			<div class="area_wrap ">
				<h3>호텔·리조트</h3>

				<!-- 지역필터 / 메인지역 -->

				<div class="menu-wrapper">

					<select id="mainMenu" name="mainMenu" onchange="showSubMenu()">
						<!-- <option value="">지역을 선택하세요</option> -->
						<option value="Main1">서울</option>
						<option value="Main2">경기/인천</option>
						<option value="Main3">충청/강원/제주</option>
						<option value="Main4">경남/경북</option>
						<option value="Main5">전남/전북</option>
					</select>

					<!-- 지역필터 / 서브지역 -->

					<select id="subMenu" name="subMenu" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main1_3" name="강남">강남</option>
						<option value="Main1_1" name="강동">강동</option>
						<option value="Main1_2" name="강서">강서</option>
						<option value="Main1_4" name="강북">강북</option>
					</select> <select id="subMenu2" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main2_1" name="경기">경기</option>
						<option value="Main2_2" name="인천">인천</option>
					</select> <select id="subMenu3" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main3_1" name="충청">충청</option>
						<option value="Main3_2" name="강원">강원</option>
						<option value="Main3_3" name="제주">제주</option>
					</select> <select id="subMenu4" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main4_1" name="경남">경남</option>
						<option value="Main4_2" name="경북">경북</option>
					</select> <select id="subMenu5" class="subMenu right-menu"
						onchange="getSelectedOption(this.id)" style="display: none;">
						<option value="">상세지역을 선택하세요</option>
						<option value="Main5_1" name="전남">전남</option>
						<option value="Main5_2" name="전북">전북</option>
					</select>
				</div>

			</div>
		</div>

		<script type="text/javascript">
		showSubMenu();
		 		var selectedText = "";
		 		
		
				function getSelectedOption(selectId) {
					var subMenu = document.getElementById(selectId);
					var selectedValue = subMenu.value;
					subMenuSelectId = selectId;
					
					var mainMenu = document.getElementById("mainMenu");
					 sessionStorage.setItem('subMenuId', selectId);
					 sessionStorage.setItem('mainMenuValue', mainMenu.value);
					 sessionStorage.setItem('subMenuValue', subMenu.value);
					 
					selectedText = subMenu.options[subMenu.selectedIndex].text;
					
					/* alert(selectId);
					alert(selectedText); */
					 localStorage.setItem("checkindate", "${formattedDate}");
				     localStorage.setItem("checkoutdate", "${formattedDate}");
					 localStorage.setItem("selectedText", selectedText); //selectedText 값 저장해서 넘겨줌 
					
					selectedTextUrl = "http://localhost/Main?hdetailregion=" + encodeURIComponent(selectedText)+ "&checkindate=${formattedDate}&checkoutdate=${formattedDate}" + encodeURIComponent("");
					window.location.href = selectedTextUrl;
				}
				// 페이지 로드 시 세션 스토리지에서 값을 가져와 선택합니다.
				window.onload = function() {
					
				
					var subMenuId = sessionStorage.getItem('subMenuId');
				    var mainMenuValue = sessionStorage.getItem('mainMenuValue');
				    var subMenuValue = sessionStorage.getItem('subMenuValue');
				    
		/* 		 // 현재 URL에서 쿼리 문자열 가져오기
				    var queryString = window.location.search; */

				    // URLSearchParams 객체 생성
				    var urlParams = new URLSearchParams(window.location.search);
				    var hdetailregionV = urlParams.get('hdetailregion');
				    
				if(hdetailregionV === '강남'){
					
					 document.getElementById('mainMenu').value = "Main1";
					 showSubMenu();
					 document.getElementById('subMenu').value = "Main1_3";
					 sessionStorage.setItem('subMenuId', 'subMenu');
					 sessionStorage.setItem('mainMenuValue', 'Main1');
					 sessionStorage.setItem('subMenuValue', 'Main1_3');
				}else{
					 if (mainMenuValue && subMenuValue) {
					        document.getElementById('mainMenu').value = mainMenuValue;
					        showSubMenu();
					    }
					    if (subMenuValue) {
					        document.getElementById(subMenuId).value = subMenuValue;
					    }
				}
				   
				};
			
		</script>


		<!-- //Area -->
		<!-- //hotelheader -->

		<div class=body_wrap>
			<aside>
				<!--   Filter -->

				<div class="filter_wrap">
					<div class="filter_box">
						<section class="date_wrap">
							<h3>날짜</h3>
							<br>
							<div class="btn_date">


								<input type="text" id="calendars" name="calendars" value="" />

								<script>
				
				var checkindate ;
			    var checkoutdate ;	
				
					$(function () {
						
			 var storedStartDate = localStorage.getItem("storedStartDate");
		     var storedEndDate = localStorage.getItem("storedEndDate");

	         var checkindate = storedStartDate || new Date().toISOString().split('T')[0];
		     var checkoutdate = storedEndDate || moment().add(7, 'days').toISOString().split('T')[0];
		     
		     var urlParams = new URLSearchParams(window.location.search);
			    var checkindateV = urlParams.get('checkindate');
			    var checkoutdateV = urlParams.get('checkoutdate');
		     
	         	   $('#calendars').daterangepicker({
	         		  "maxSpan": {"days": 6 },
	                "locale": {
	                    "format": "YYYY-MM-DD",
	                    "separator": " ~ ",
	                    "applyLabel": "확인",
	                    "cancelLabel": "취소",
	                    "fromLabel": "From",
	                    "toLabel": "To",
	                    "customRangeLabel": "Custom",
	                    "weekLabel": "W",
	                    "daysOfWeek": ["일","월", "화", "수", "목", "금", "토" ],
	                    "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	                    "firstDay": 1
		                },
		               	"minDate":  new Date(),
		                "maxDate": moment().add(3, 'months').toDate(), 
		                "startDate": checkindateV,
		                "endDate":checkoutdateV,
		                "drops": "down"
			            }, function (start, end, label) {
			                console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
			                
			                checkindate = start.format('YYYY-MM-DD');
			                checkoutdate = end.format('YYYY-MM-DD');
			                
			               /* 선택한 날짜 값을 로컬 스토리지에 저장 */
			                localStorage.setItem("storedStartDate", checkindate);
			                localStorage.setItem("storedEndDate", checkoutdate);
			                
				            
				          /* 선택한 날짜 값을 URL 파라미터로 추가하고 페이지 새로고침 */
				            addDatesToURL(checkindate, checkoutdate);
			            
			            });
	         	   
	         	   // css 변경가능 
	         	  $("#calendars").on('show.daterangepicker', function (ev, picker) {
	         		   /*  $(".cancelBtn").css("float", "right"); */
	         		   
	         		});

	       		 });
				
					<!--  선택한 날짜 값을 URL 파라미터로 추가하고 페이지 새로고침하는 함수 -->
				    function addDatesToURL(checkindate, checkoutdate) {
				        // 현재 페이지 URL 가져오기
				        var currentURL = window.location.href;
				
				        // URL에 시작 날짜와 끝 날짜를 파라미터로 추가
				        
				        localStorage.setItem("checkindate", checkindate);
				        localStorage.setItem("checkoutdate", checkoutdate);
				   var selectedText = localStorage.getItem("selectedText"); // selectedText  지역 값을 가져옴
				        
				   
				   	 var urlParams = new URLSearchParams(window.location.search);
					 var hdetailregionV = urlParams.get('hdetailregion');
				        
				         var updatedURL = "http://localhost/Main?hdetailregion=" + encodeURIComponent(hdetailregionV) + "&checkindate=" + encodeURIComponent(checkindate) + "&checkoutdate=" + encodeURIComponent(checkoutdate); 
				        // 페이지 새로고침
				        window.location.href = updatedURL;
				    }

		</script>

							</div>
						</section>
						<br>


						<h3>상세조건</h3>
						<br>

						<!-- 초기화, 적용 버튼  -->
						<div class="btn_wrap">
							<button type="button" onclick="location.href='/Main?hdetailregion=강남&checkindate=${formattedDate}&checkoutdate=${formattedDate}'">초기화</button>
							<button type="button" onclick="comfort()">적용</button>
						</div>
						<br>

						<section>
							<br> <strong>호텔·리조트 유형</strong><br> <br>
							<ul>
								<li><input type="checkbox" id="grade_0" name="grade[]"
									class="inp_chk" value="5성급" /> <label for="grade_0"
									class="label_chk">5성급</label></li>
								<li><input type="checkbox" id="grade_1" name="grade[]"
									class="inp_chk" value="특1급" /> <label for="grade_1"
									class="label_chk">특1급</label></li>
								<li><input type="checkbox" id="grade_2" name="grade[]"
									class="inp_chk" value="특급" /> <label for="grade_2"
									class="label_chk">특급</label></li>
							</ul>
						</section>
						<br>




						<!-- 인원 버튼 증가,감소  -->
						<section>
							<input type="hidden" id="persons" name="persons" value="">
							<strong>인원</strong><br> <br>
							<div class="cnt_people" data-min="2" data-max="10" data-def="2">
								<button type="button" class="down" onclick="btndown()">-</button>
								<span>2</span>
								<button type="button" class=" up" onclick="btnup()">+</button>
							</div>
						</section>
						<br>

						<script>
			        function btndown() {
			            var span = document.querySelector('.cnt_people span'); // span 요소 선택
			            var currentValue = parseInt(span.textContent); // 현재 값 가져오기
			            var minValue = parseInt(span.parentElement.getAttribute('data-min')); // 최소 값 가져오기
			
			            if (currentValue > minValue) {
			                span.textContent = currentValue - 1; // 값 1 감소
			            }
			        }
			
			        function btnup() {
			            var span = document.querySelector('.cnt_people span'); // span 요소 선택
			            var currentValue = parseInt(span.textContent); // 현재 값 가져오기
			            var maxValue = parseInt(span.parentElement.getAttribute('data-max')); // 최대 값 가져오기
			
			            if (currentValue < maxValue) {
			                span.textContent = currentValue + 1; // 값 1 증가
			            }
			        }
			    </script>




						<section>
							<strong>베드 타입</strong><br> <br>
							<div class="room_type">
								<p>
									<input type="checkbox" class="inp_room_01" name="bedtype[]"
										id="bed_type_S" value="싱글" /> <label for="bed_type_S"
										class="label_room_01">싱글</label>
								</p>
								<p>
									<input type="checkbox" class="inp_room_02" name="bedtype[]"
										id="bed_type_D" value="더블" /> <label for="bed_type_D"
										class="label_room_02">더블</label>
								</p>
								<p>
									<input type="checkbox" class="inp_room_03" name="bedtype[]"
										id="bed_type_T" value="트윈" /> <label for="bed_type_T"
										class="label_room_03">트윈</label>
								</p>
								<p>
									<input type="checkbox" class="inp_room_04" name="bedtype[]"
										id="bed_type_O" value="온돌" /> <label for="bed_type_O"
										class="label_room_04">온돌</label>
								</p>
							</div>


						</section>
						<br>

						<section>
							<strong>공용시설</strong><br> <br>
							<ul class="hide_type half">
								<li><input type="checkbox" id="tmino_0" name="tmino[]"
									class="inp_chk" value="피트니스" /> <label for="tmino_0"
									class="label_chk">피트니스</label></li>
								<li><input type="checkbox" id="tmino_1" name="tmino[]"
									class="inp_chk" value="수영장" /> <label for="tmino_1"
									class="label_chk">수영장</label></li>
								<li><input type="checkbox" id="tmino_2" name="tmino[]"
									class="inp_chk" value="사우나" /> <label for="tmino_2"
									class="label_chk">사우나</label></li>
								<li><input type="checkbox" id="tmino_3" name="tmino[]"
									class="inp_chk" value="골프장" /> <label for="tmino_3"
									class="label_chk">골프장</label></li>
							</ul>
						</section>
						<br>

						<section>
							<strong>객실 내 시설</strong><br> <br>
							<ul class="hide_type half">
								<li><input type="checkbox" id="tmino_24" name="tmino[]"
									class="inp_chk" value="객실스파" /> <label for="tmino_24"
									class="label_chk">객실스파</label></li>
								<li><input type="checkbox" id="tmino_25" name="tmino[]"
									class="inp_chk" value="미니바" /> <label for="tmino_25"
									class="label_chk">미니바</label></li>
								<li><input type="checkbox" id="tmino_26" name="tmino[]"
									class="inp_chk" value="와이파이" /> <label for="tmino_26"
									class="label_chk">와이파이</label></li>
								<li><input type="checkbox" id="tmino_27" name="tmino[]"
									class="inp_chk" value="욕실용품" /> <label for="tmino_27"
									class="label_chk">욕실용품</label></li>
							</ul>
						</section>
						<br>

						<section>
							<strong>기타</strong><br> <br>
							<ul class="hide_type half">
								<li><input type="checkbox" id="tmino_36" name="tmino[]"
									class="inp_chk" value="반려견동반" /> <label for="tmino_36"
									class="label_chk">반려견동반</label></li>
								<li><input type="checkbox" id="tmino_37" name="tmino[]"
									class="inp_chk" value="조식포함" /> <label for="tmino_37"
									class="label_chk">조식포함</label></li>
								<li><input type="checkbox" id="tmino_38" name="tmino[]"
									class="inp_chk" value="객실내흡연" /> <label for="tmino_38"
									class="label_chk">객실내흡연</label></li>
								<li><input type="checkbox" id="tmino_39" name="tmino[]"
									class="inp_chk" value="발렛파킹" /> <label for="tmino_39"
									class="label_chk">발렛파킹</label></li>
							</ul>
						</section>
						<br> <br>


						<script type="text/javascript">
   					  		
   					  // 중복파라미터를 자동으로 제거 
	   					 function removeDuplicateParams(url) {
	   				        var urlParts = url.split('?');
	   				        if (urlParts.length > 1) {
	   				            var baseUrl = urlParts[0];
	   				            var queryParams = urlParts[1].split('&');
	   				            var filteredParams = [];
	   				            var paramNames = [];
	
	   				            queryParams.forEach(function(param) {
	   				                var paramName = param.split('=')[0];
	   				                if (!paramNames.includes(paramName)) {
	   				                    filteredParams.push(param);
	   				                    paramNames.push(paramName);
	   				                }
	   				            });
	
	   				            return baseUrl + '?' + filteredParams.join('&');
	   				        }
	   				        
	   				        return url;
	   				    }
   					  	
   					  
   					  
						    function comfort() {
						    	
						    	
						        var values1 = document.getElementsByName("grade[]");
						        var htype = [];        
						        for (var i = 0; i < values1.length; i++) {
						            if (values1[i].checked) {
						            	htype.push(values1[i].value);
						            }
						        }
						        
						        var values2 = document.getElementsByName("bedtype[]");
						        var hbedtype = [];        
						        for (var i = 0; i < values2.length; i++) {
						            if (values2[i].checked) {
						            	hbedtype.push(values2[i].value);
						            }
						        }
	
						        var values3 = document.getElementsByName("tmino[]");
						        var hcomfort = [];
						        
						        for (var i = 0; i < values3.length; i++) {
						            if (values3[i].checked) {
						            	hcomfort.push(values3[i].value);
						            }
						        }

						        
						         /* 선택한 날짜 값을 URL 파라미터로 추가하고 페이지 새로고침 */
						            addDataToURL(htype, hbedtype, hcomfort, hpeople);
						         
							       
						          var hpeople = document.querySelector('.cnt_people span').textContent; // 인원 수 값을 가져옴    
						     	  var selectedText = localStorage.getItem("selectedText"); // selectedText  지역 값을 가져옴
						     	  var checkindate = localStorage.getItem("checkindate"); // checkindate  체크인 값을 가져옴 
					     		  var checkoutdate = localStorage.getItem("checkoutdate"); // checkoutdate  체크아웃 값을 가져옴 
						     	  
						    }  
 
						   	<!--  선택한 날짜 값을 URL 파라미터로 추가하고 페이지 새로고침하는 함수 -->
						     	    function addDataToURL(htype, hbedtype, hcomfort, hpeople) {
						     	    	
						     	    	 var urlParams = new URLSearchParams(window.location.search);
										 var hdetailregionV = urlParams.get('hdetailregion');
						     		   
						     		  var hpeople = document.querySelector('.cnt_people span').textContent; // 인원 수 값을 가져옴    
						     		  var checkindate = localStorage.getItem("checkindate"); // checkindate  체크인 값을 가져옴 
						     		  var checkoutdate = localStorage.getItem("checkoutdate"); // checkoutdate  체크아웃 값을 가져옴 
						       
							   
						     		  // 현재 페이지 URL 가져오기
								        var currentURL = window.location.href;
									   
								  	   
								        var updatedURL = removeDuplicateParams(currentURL);
								        
								        
								        
							 	        var updatedURL = "http://localhost/Main?hdetailregion=" + encodeURIComponent(hdetailregionV) +"&checkindate=" + encodeURIComponent(checkindate) + "&checkoutdate=" + encodeURIComponent(checkoutdate);
							 	      
							 	        
							 	        
							 	       htype = htype.map(function(value) {
							 	            return value.trim();
							 	        });

							 	        hbedtype = hbedtype.map(function(value) {
							 	            return value.trim();
							 	        });

							 	        hcomfort = hcomfort.map(function(value) {
							 	            return value.trim();
							 	        });
							 	        
							 	       // 각 변수가 빈 문자열이 아니면 encodeURIComponent 적용
							 	        var htypeParam = htype.length > 0 ? encodeURIComponent(htype.join(',')) : "";
							 	        var hbedtypeParam = hbedtype.length > 0 ? encodeURIComponent(hbedtype.join(',')) : "";
							 	        var hcomfortParam = hcomfort.length > 0 ? encodeURIComponent(hcomfort.join(',')) : "";
							 	        var hpeopleParam = hpeople !== null && hpeople !== "" ? encodeURIComponent(hpeople) : "";

							 	        // 각 파라미터에 대한 값을 할당하여 URL에 추가
							 	        updatedURL += "&htype=" + htypeParam;
							 	        updatedURL += "&hbedtype=" + hbedtypeParam;
							 	        updatedURL += "&hcomfort=" + hcomfortParam;
							 	        updatedURL += "&hpeople=" + hpeopleParam;

							 	        // 페이지 새로고침
							 	        window.location.href = updatedURL;
							 	    }
							 	
							 	        
								/*         // 각 파라미터에 대한 값을 할당하여 URL에 추가
								        if (htype.length > 0 ) {
								            updatedURL +="&htype=" + encodeURIComponent(htype.join(','));
								        }
								        if (hbedtype.length > 0 ) {
								            updatedURL +="&hbedtype=" + encodeURIComponent(hbedtype.join(','));
								        }
								        if (hcomfort.length > 0 ) {
								            updatedURL += "&hcomfort=" + encodeURIComponent(hcomfort.join(','));
								        }
								        if (hpeople.length > 0 ) {
								            updatedURL += "&hpeople=" + encodeURIComponent(hpeople);
								        }  
								        // 페이지 새로고침
								        window.location.href = updatedURL;
								    
								    }  */
		     	  </script>

					</div>
				</div>
				<!-- //Filter -->
			</aside>




			<div class="right">
				<ul class="sort">

					<!-- <li><a href="#">낮은 가격 순</a></li>
					<li><a href="#">높은 가격 순</a></li> -->
					<li><a href="#" onclick="openMap()">지도</a></li>

				</ul>
				<c:choose>
					<c:when test="${not empty hotels}">

						<c:forEach var="hotel" items="${ hotels}">

							<a href="/hotelpage?no=${hotel.no}&checkindate=${param.checkindate}&checkoutdate=${param.checkoutdate} " class="thumb">
								<table>
									<tr>
										<td width="300px" height="250px"><img
											src="${hotel.himage} " alt="호텔이미지" width="250px"
											height="230px"></td>

										<td>
											<h2 class="name">${hotel.hname}</h2>
											<p>${hotel.hdetailregion }</p> 
											<!-- <br> <span>*****</span> -->

										</td>
										<td>
											<ul>
												<li class="dis-price">${hotel.minprice }</li>
											</ul>
										</td>
									</tr>
								</table>
							</a>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<!-- hotels 변수가 비어있을 때의 처리 -->
						<p>No hotel information available.</p>
					</c:otherwise>
				</c:choose>

			</div>
		</div>

	</main>
	
<%-- 	<c:import url="/footer" /> --%>
</body>
</html>
