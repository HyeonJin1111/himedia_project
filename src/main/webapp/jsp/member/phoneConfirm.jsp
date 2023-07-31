<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Content-Type">

<link rel="stylesheet preload" href="../../resource/css/font.css"
	as="style" type="text/css" crossorigin=""> 
<script src="../../resource/js/dbQuiz.js"></script>
<title>회원가입 어때</title>
<link rel="stylesheet" href="../../resource/css/register.css">
<!-- <link rel="stylesheet" href="../../resource/css/common.css"> -->
</head>
<body>
	<!-- Wrap -->
	<div class="wrap">
		<!-- Header -->
		<header></header>
		<div class="register">
			<section>
				<div class="fix_title">
					<strong>휴대폰 본인 확인</strong>
				</div>
				<p>원활한 서비스 제공을 위해, 휴대폰 번호를 입력해주세요.</p>
				<div class="phone_confirm">
					<div id="sendCode">
						<strong>휴대폰 번호</strong>
						<section>
							<div class="inp_wrap remove">
								<input type="tel" id="phone" name="phone" maxlength="13">
							</div>
							<button type="button" class="btn_send btn_confirm" id="nemButton"
								name="nemButton">인증번호 전송</button>
							<button type="button" class="btn_send btn_confirm dbclicked"
								style="display: none;">재전송</button>
							<!-- 활성화 클래스 'active' -->
						</section>
					</div>
					<div id="verificationCode" style="display: none;">
						<strong>인증번호</strong>
						<section>
							<div class="inp_wrap remove">
								<input type="tel" id="digit" minlength="4" maxlength="4">
								<span class="timer">02:45</span>
							</div>
							<button type="button" class="btn_ok btn_confirm"
								data-verification-type="call"
								data-verification-next="joinTemplate">확인</button>
						</section>
					</div>
					<input type="hidden" id="phone_certification_point" value="SIGINUP"
						style="display: none;">
				</div>
			</section>
		</div>
		<!-- footer -->
		<footer> </footer>
	</div>
	<!-- //Wrap -->
</body>
</html>