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
   
   table#tblMemberRegister #th {
   		height: 20%;
   		text-align: center;
   		
   		font-size: 14pt;
   }
   
   table#tblMemberRegister td {
   		
   		line-height: 30px;
   		padding-top: 0px;
   		padding-bottom: 8px;
   }
   
   .star { color: red;
           font-weight: bold;
           font-size: 13pt;
   }
   
   
   div#Container {
   
   width: 100%;
   display: flex;
   justify-content: center;
   align-items: center;
   min-height: 100vh;
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
   	height: 51px;
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
   	background-color: gray;
   }
   
   span#certificateResult {
   
   	font-size: 8pt;
   		
   }
   
</style>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var flagIdDuplicateClick = false;
	// 가입하기 버튼을 클릭시 "아이디중복확인" 을 클릭했는지 클릭안했는지를 알아보기위한 용도임.
	
	var flagCertificate = false;
	var flagh2="";
	var flagh3="";
	var key="";
	
	$(document).ready(function(){

		var emailcheck = "";
		
		
		
		$("span.error").hide();
		$("input#email").focus();
		
		$("input#name").blur(function(){
			var name = $("input#name").val();
			
		 
			if(name == "") {
				
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
			    $(this).parent().find(".error").show();
			    $("input#name").focus();
			    
			    $("span#nameCheckResult").html("이름은 필수 사항입니다.").css("color", "red");
			    
			}
			else {
				$(this).parent().find(".error").hide();
				$(":input").prop("disabled",false);
				$("span#nameCheckResult").html("멋진 이름 입니다!").css("color", "green");
			}
			
		}); 	
		
		
		$("input#pwd").blur(function(){
			
			var pwd = $(this).val();
			
		 	var regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
			
			var bool = regExp.test(pwd);
			
			if(!bool) {
				// 암호가 정규표현식에 위배된 경우
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
			
			    $(this).parent().find(".error").show();
			
			    $(this).focus();
			}
			else {
				// 암호가 정규표현식에 맞는 경우
				$(this).parent().find(".error").hide();
				$(":input").prop("disabled",false);
			}
			
		}); // 아이디가 pwd 인 것은 포커스를 잃어버렸을 경우(blur) 이벤트를 처리해주는 것이다.
		

		$("input#pwdcheck").blur(function(){
			var pwd = $("input#pwd").val();
			var pwdcheck = $(this).val();
		 
			if(pwd != pwdcheck) {
				// 암호와 암호확인값이 틀린 경우
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
				$("input#pwd").prop("disabled",false);
			
			//	$(this).next().show();
			//  또는
			    $(this).parent().find(".error").show();
			
			    $("input#pwd").focus();
			}
			else {
				// 암호와 암호확인값이 같은 경우
				$(this).parent().find(".error").hide();
				$(":input").prop("disabled",false);
			}
			
		}); 

		
		
		 $("input#email").blur(function(){
			
			 $("span#emailCheckResult").html("");
			var email = $(this).val().trim();
			
			  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			 // 이메일 정규표현식 객체 생성
				
			 var bool = regExp.test(email);
				
			 if(!bool) {
					// 이메일이 정규표현식에 위배된 경우
					 $(":input").prop("disabled",true);
					$(this).prop("disabled",false); 
				
				    $(this).parent().find(".error").show();
				    $(this).focus();
				    
				    
				}
			 else {
					// 이메일이 정규표현식에 맞는 경우
					$(this).parent().find(".error").hide();
					$(":input").prop("disabled",false);
					
					
					isExistEmailCheck();
					
			 }
			
		}); 
		

		$("input#hp2").blur(function(){
			
			var hp2 = $(this).val();  
			
			var regExp = new RegExp(/^[1-9][0-9]{2,3}$/g);
			// 숫자 3자리 또는 4자리만 들어오도록 검사해주는 정규표현식 객체 생성
			
			var bool = regExp.test(hp2);
			
			if(!bool) {
				// 국번이 정규표현식에 위배된 경우
				 $(":input").prop("disabled",true);
				 $(this).prop("disabled",false);
			
			    $(this).parent().find(".error").show();
			
			    $(this).focus();
			}
			else {
				$(this).parent().find(".error").hide();
				 $(":input").prop("disabled",false);
				 
				 flagh2="1";
			}
			
		}); 		

		
		$("input#hp3").blur(function(){
			
			var hp3 = $(this).val();  
			
			var regExp = new RegExp(/^\d{4}$/g);
			// 숫자 4자리만 들어오도록 검사해주는 정규표현식 객체 생성
			
			var bool = regExp.test(hp3);
			
			if(!bool) {
				// 마지막 전화번호 4자리가 정규표현식에 위배된 경우
				$(":input").prop("disabled",true);
				$(this).prop("disabled",false);
			
			    $(this).parent().find(".error").show();
			
			    $(this).focus();
			}
			else {
				// 마지막 전화번호 4자리가 정규표현식에 맞는 경우
				$(this).parent().find(".error").hide();
			    $(":input").prop("disabled",false);
			    
			    flagh3="2";
			}
			
		}); 	
		     		
		
		
		//////////////////////////////// 
	$("input#certificateNum").blur(function(){
			
			var certificateNum = $(this).val();  
			
			if($("input#certificateNum").val().trim() != key) {
			    
				$("span#certificateResult").html("인증번호가 틀렸습니다.").css("color","red");
				flagCertificate = false;
			}
			
			else {
				$("span#certificateResult").html("인증에 성공하였습니다.").css("color","green");
				flagCertificate = true;
			}
			
			
		}); 		
	
	}); // end of $(document).ready()--------------------------------
    

    
	function goRegister() {
		
		var checkboxCheckedLength = $("input:checkbox[id=agree]:checked").length;
		
	/* 	if(checkboxCheckedLength == 0) {
			alert("이용약관에 동의하셔야 합니다.");
			return;  // 종료 
		} */
			
		if(!isExistEmailCheck) { // 이메일확인을 클릭했는지 클릭안했는지 알아오기 위한 것임.
			alert("이메일중복확인 클릭하여 중복검사를 하세요!!");
			return; // 종료 
		}
		
		
	    //// 필수입력사항에 모두 입력이 되었는지 검사한다  ////
		var bFlagRequiredInfo = false;
		
		$(".requiredInfo").each(function(){
			var data = $(this).val();
			if(data == "") {
				/* bFlagRequiredInfo = true; */
				/* alert("*표시된 필수입력사항은 모두 입력하셔야 합니다."); */
				/* return false;  // break 라는 뜻이다. */
			}
		});
		
		if(!flagCertificate) {
			alert("휴대폰 인증에 실패하셨습니다. 휴대폰 인증 후에 다시 클릭해 주세요.")
			return false;
		}
		
		if(!bFlagRequiredInfo) {
			
			var frm = document.registerFrm;
			frm.action = "/foodie/signup.food";
			frm.method = "POST";
			frm.submit();
			
		}
		
	}// end of function goRegister()---------------------------------
	
	
	// 이메일 중복여부 검사하기 
	function isExistEmailCheck() {
		
		$("span#emailCheckResult").html("");
		
		$.ajax({
    		url:"<%= ctxPath%>/emailDuplicateCheck.food",
    		data:{"email":$("input#email").val()}, // data 는 /foodie/emailDuplicateCheck.food 로 전송해야할 데이터를 말한다. 
    		type:"post",
    		dataType:"json",   // Javascript Standard Object Notation.  dataType은  /foodie/emailDuplicateCheck.food 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다. 
    		success:function(json){
    			if(json.isExists) {
    				// 입력한 email 이 이미 사용중이라면 
    				$("span#emailCheckResult").html("이미 사용중인 이메일 입니다.").css("color","red");
    				/* $("input#email").val(""); */
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
		
		
		var flagphone=flagh2+flagh3;
		
		if(flagphone != "12") {
			
			return false;
		}
		
		$("tr#certificate").show();
		
		$.ajax({
    		url:"<%= ctxPath%>/certificate.food",
    		data:{"hp1":$("input#hp1").val(),
    			  "hp2":$("input#hp2").val(),
    			  "hp3":$("input#hp3").val(), 
    			},  
    		type:"post",
    		dataType:"json",    
    		success:function(json){
    			
    			
    			key=json.key;
				console.log(key);    			
				
    		},
    		error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
    	});	
		
		
		
	};
	
	
	
</script>

<body>




	<div class="row" id="Container">

		<div id="Container_Frm" align="center">
			<a href="/foodie/index.food"><img src="<%=ctxPath%>/resources/images/foodie_logo.png" alt=""></a>

			<form name="registerFrm">

				<table id="tblMemberRegister">

					<tbody>
						<tr style="height: 110px;">
							<!-- style="width: 100%; height:107pt; text-align: left; -->
							<td>
								<h5 class="subtitle">이메일</h5> <input type="text" name="email"
								id="email" class="requiredInfo" value='${paraMap.email}'
								placeholder="UserEmail@foodie.com" /> <br> <span
								id="error" class="error">이메일 형식에 맞지 않습니다.</span> <span
								class="CheckResult" id="emailCheckResult"></span>
							</td>
						</tr>
						<tr style="height: 110px;">
							<td class="tiles">
								<h5 class="subtitle">이름</h5> <input type="text" name="name"
								id="name" class="requiredInfo" value='${paraMap.name}'
								placeholder="이름" /> <br> <!-- <span id="error" class="error">닉네임은 필수 사항 입니다.</span> -->
								<span class="CheckResult" id="nameCheckResult"></span>
							</td>
						</tr>
						<tr>
							<td class="tiles">
								<h5 class="subtitle">비밀번호</h5> <input type="password" name="pwd"
								id="pwd" class="requiredInfo" /> <br> <span id="error"
								class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
							</td>
						</tr>

						<tr>
							<td class="tiles">
								<h5 class="subtitle">비밀번호 재확인</h5> <input type="password"
								id="pwdcheck" class="requiredInfo" /> <br> <span
								class="CheckResult" id="pwdCheckResult2"></span> <span
								id="error" class="error">암호가 일치하지 않습니다.</span>
							</td>
						</tr>

						<tr>

							<td class="tiles">
								<h5 class="subtitle">휴대전화</h5>

								<div style="display: flex; flex-direction: center;">
									<div style="width: 100%;">
										<input type="text" id="hp1" name="hp1" size="6" maxlength="3"
											value="010" readonly />&nbsp;-&nbsp; <input type="text"
											id="hp2" name="hp2" size="6" maxlength="4" />&nbsp;-&nbsp; <input
											type="text" id="hp3" name="hp3" size="6" maxlength="4" /> <span
											style="display: inline-block; width: 90px; height: 30px; border: solid 1px gray; border-radius: 5px; font-size: 8pt; text-align: center; margin-left: 10px; cursor: pointer;"
											onclick="sendMsg();">인증번호 받기</span>
									</div>
								</div> <br> <span id="error" class="error">휴대폰 형식이 아닙니다.</span>
							</td>
						</tr>

						<tr id="certificate" style="display: none;">
							<td class="tiles">
								<h5 class="subtitle">인증번호</h5> <input type="text"
								id="certificateNum" class="requiredInfo"
								placeholder="인증번호 입력하세요" /> <br> <span
								id="certificateResult"></span>
							</td>
						</tr>

						<input type="hidden" name="kakaoid" value='${paraMap.kakaoid}' />
						<input type="hidden" name="thumbnail_image" value='${paraMap.thumbnail_image}' />
						<tr>
							<td colspan="2" style="line-height: 90px;">


								<button type="button" id="btnRegister" onClick="goRegister();">
									<img style="width: 100%;"
										src="<%= ctxPath %>/resources/img/signup/join1.png">
								</button>

							</td>

						</tr>
					</tbody>
				</table>
			</form>
		</div>
	</div>


</body>
