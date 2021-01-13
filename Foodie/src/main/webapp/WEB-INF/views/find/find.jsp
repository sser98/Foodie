<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.net.InetAddress"%>
<%@ page import="java.util.Random" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<%
	String ctxPath = request.getContextPath();
   //      /foodie
%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>

table#tblMemberRegister {
	width: 93%;
	border: hidden;
	margin: 10px;
}

table#tblMemberRegister td {
	/* border: solid 1px gray;  */
	line-height: 30px;
	padding-top: 0px;
	padding-bottom: 8px;
}


div#Container {
	width: 96%;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin-left: 2%;
	margin-right: 2%;
}

div#Container_Frm {
	width: 30%;
	
}

span.error {
	font-size: 8pt;
	color: red;
}

.CheckResult {
	font-size: 8pt;  
}

.requiredInfo {
	width: 100%;
	height: 48px;
	
}

ul {
	padding-inline-start: 0px;
}


button#btnRegister {
	padding-left: 0%;
	padding-right: 0%;
	padding-top: 0%;
	padding-bottom: 0%;
	margin-top: 20pt;
	width: 100%;
}

.subtitle {
	font-weight: bolder;
}

div#Container_Frm {
	background-color: white;
}

body {
	background-image:
		url("<%= ctxPath %>/resources/img/login/background.jpg");
	background-size: cover;
}

button.send {
	width: 20%;
	height: 20pt;
}

li {
	list-style: none;
	padding: 0;
	margin: 0;
}

ul {
	padding: 0, 0, 0, 0;
	margin: 0, 0, 0, 0;
}

button {
	background: #1AAB8A;
	color: #fff;
	border: none;
	position: relative;
	height: 45px;
	font-size: 14pt;
	padding: 0 2em;
	cursor: pointer;
	transition: 800ms ease all;
	outline: none;
	margin-bottom: 30px;
	}

button:hover {
	background: #fff;
	color: #1AAB8A;
}

button:before, button:after {
	content: '';
	position: absolute;
	top: 0;
	right: 0;
	height: 2px;
	width: 0;
	background: #1AAB8A;
	transition: 400ms ease all;
}

button:after {
	right: inherit;
	top: inherit;
	left: 0;
	bottom: 0;
}

button:hover:before, button:hover:after {
	width: 100%;
	transition: 800ms ease all;
}

</style>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	
	
	var flagCertificate = false;
	var flaghp = "";
	var key = "";
	var emailcheck = "";
	var flagname = "";
	var emailList = "";
	$(document).ready(
			function() {

				$(".error").hide();
				$("input#name").focus();

				$("input#name").blur(
						function() {
							var name = $("input#name").val();

							if (name == "") {
								$("input#name").focus();
								$("span#nameCheckResult").html("이름은 필수 사항입니다.")
										.css("color", "red");

							} else {
								$("span#nameCheckResult")
										.html("정상적으로 입력하셨습니다.").css("color",
												"green");
								flagname = "1";
							}

						});

				$("input#hp2").blur(function() {

					var hp2 = $(this).val();

					var regExp = new RegExp(/^[1-9][0-9]{2,3}$/g);
					// 숫자 3자리 또는 4자리만 들어오도록 검사해주는 정규표현식 객체 생성

					var bool = regExp.test(hp2);

					if (!bool) {
						// 국번이 정규표현식에 위배된 경우
						$(":input").prop("disabled", true);
						$(this).prop("disabled", false);

						$(this).parent().find(".error").show();

						$(this).focus();
					} else {
						$(this).parent().find(".error").hide();
						$(":input").prop("disabled", false);

						flagh2 = "2";
					}

				});

				$("input#hp3").blur(function() {

					var hp3 = $(this).val();

					var regExp = new RegExp(/^\d{4}$/g);
					// 숫자 4자리만 들어오도록 검사해주는 정규표현식 객체 생성

					var bool = regExp.test(hp3);

					if (!bool) {
						// 마지막 전화번호 4자리가 정규표현식에 위배된 경우
						$(":input").prop("disabled", true);
						$(this).prop("disabled", false);

						$(this).parent().find(".error").show();

						$(this).focus();
					} else {
						// 마지막 전화번호 4자리가 정규표현식에 맞는 경우
						$(this).parent().find(".error").hide();
						$(":input").prop("disabled", false);

						flagh3 = "3";
					}

				});

				
				//////////////////////////////// 
				$("input#certificateNum").blur(
						function() {

							var certificateNum = $(this).val();

							if ($("input#certificateNum").val().trim() != key) {

								$("span#certificateResult")
										.html("인증번호가 틀렸습니다.").css("color", "red");
								flagCertificate = false;
							} else {
								$("span#certificateResult")
										.html("인증에 성공하였습니다.").css("color", "green");
								flagCertificate = true;
							}
						});
				
			}); // end of $(document).ready()--------------------------------

			
	// 이메일 중복여부 검사하기 
	function isExistEmailCheck() {

		$("span#emailCheckResult").html("");

		$.ajax({
			url : "<%= ctxPath%>/emailDuplicateCheck.food",
    		data:{"email":$("input#email").val()}, // data 는 /foodie/emailDuplicateCheck.food 로 전송해야할 데이터를 말한다. 
    		type:"post",
    		dataType:"json",   // Javascript Standard Object Notation.  dataType은  /foodie/emailDuplicateCheck.food 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다. 
    		success:function(json){
    			if(json.isExists) {
    				// 입력한 email 이 이미 사용중이라면 
    				$("span#emailCheckResult").html("이미 사용중인 이메일 입니다.").css("color","red");
    				$("input#email").val("");
    			}
    			
    			else {
    				// 입력한 email 이 DB 테이블에 존재하지 않는 경우라면 
     				$("span#emailCheckResult").html("사용가능한 이메일 입니다.").css("color","green");
    			}
    			
    		},
    		error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
    	});	
		
	}// end of function isExistEmailCheck()--------------------------
	
	
	
	function sendMsg() {
		
		
		var flag=flagname+flagh2+flagh3;
		
		if(flag != "123") {
			
			return false;
			
		}
		
		
		
		$("tr#certificate").show();
		$.ajax({
    		url:"<%= ctxPath%>/certificate.food",
    		data:{"hp1":$("input#hp1").val(),
  			      "hp2":$("input#hp2").val(),
  			      "hp3":$("input#hp3").val()},  
    		type:"post",
    		dataType:"json",   // Javascript Standard Object Notation.  dataType은  /foodie/emailDuplicateCheck.food 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다. 
    		success:function(json){
    			
    			
    			key=json.key;
				console.log(key);    			
				
    		},
    		error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
    	});	
		
		
		
	};
	

	
	function checkEmail() {
		
	var flag=flagname+flagh2+flagh3;
		
		if(flag != "123") {
			
			return false;
		}
		
		if(!flagCertificate) {
			
			return false;
			
		}
		
		
		$.ajax({
    		url:"<%= ctxPath%>/findEmail.food",
    		data:{"hp1":$("input#hp1").val(),
  			      "hp2":$("input#hp2").val(),
  			      "hp3":$("input#hp3").val(),  
  			      "name":$("input#name").val()},  
    		type:"POST",
    		dataType:"json",    
    		success:function(json){
    			
  			
    			emailList=json.mvolist
    			console.log(emailList);
    			
    			if(emailList.length == 0) {
    				
    				console.log("야");
    				
    				var html ="<ul><li>입력하신 회원정보로 조회한 이메일이 없습니다.<li>";
    				$("td#list").html(html);
    			}
    			
    			else {
    				
    				var html ="<ul>";
        			$.each(json.mvolist, function (index, item) {
        					
        				
        				html += "<li>>"+item.email+"<li>"; 
    				});
        			
        			html += "</ul>";
        			
        			
        			$("td#list").html(html);
    				
        			
        			$("h6#msg").text("입력하신 회원정보로 조회한 이메일 입니다.");	
    			}
    			
    			
    			
    		},
    		error: function(request, status, error){
    			
    			alert("실패");
    			
				/* alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error); */
			}
    	});	
		
	};
	
	function gofindPw() {
		location.href="/foodie/findPw.food";
	};
	
	
	function gohome() {
		location.href="/foodie/index.food";
	};
	
	
</script>

<body>

	<div class="row" id="Container">
		
		<div id="Container_Frm" align="center">
			<h3>이메일 찾기</h3>
			<br>
			<h6 id="msg">회원정보에 등록한 휴대전화 번호와 입력한 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</h6> 
			
			<form name="registerFrm">

				<table id="tblMemberRegister">

					<tbody>

						<tr>
							<td class="tiles">
								<h5 class="subtitle">이름</h5> 
								<input type="text" name="name" id="name" class="requiredInfo" placeholder="이름" /> <br>
								<span class="CheckResult" id="nameCheckResult"></span>
							</td>
						</tr>
							
						<tr>
							<td class="tiles">
								<h5 class="subtitle">휴대전화</h5>
									<div style="display: flex; flex-direction: center;">
										<div style="width: 100%;">
											<input class="" type="text" id="hp1" name="hp1" size="8" maxlength="3" value="010" readonly />&nbsp;-&nbsp; 
											<input class="" type="text" id="hp2" name="hp2" size="8" maxlength="4" />&nbsp;-&nbsp; 
											<input class="" type="text" id="hp3" name="hp3" size="8" maxlength="4" /> 
											<button style="font-size: 8pt; margin-bottom: 0pt; margin-left: 30pt;" onclick="sendMsg();">인증번호</button>
											<!-- <span style="display: inline-block; width: 90px; height: 30px; border: solid 1px gray; border-radius: 5px; font-size: 8pt; text-align: center; margin-left: 10px; cursor: pointer;" onclick="sendMsg();">인증번호 받기</span> -->
									   </div>
								   </div> <br> <span id="error" class="error">휴대폰 형식이 아닙니다.</span>
							</td>
						</tr>
						
						<tr id="certificate" style="display: none">
							<td class="tiles">
								<h5 class="subtitle">인증번호</h5> 
								<input type="text" id="certificateNum" class="requiredInfo" placeholder="인증번호 입력하세요" /> <br> 
								<span id="certificateResult"></span>
							</td>
						</tr>
						
						<tr>
							<td id="list"></td>
						</tr>
					</tbody>
				</table>
			</form>
			
				<button onclick="gohome();">홈</button>			
				<button onclick="gofindPw();">비밀번호 찾기 </button>
				<button class = "" id="checkEmail"  onclick="checkEmail();">다음</button>
				
		</div>
	</div>
</body>
