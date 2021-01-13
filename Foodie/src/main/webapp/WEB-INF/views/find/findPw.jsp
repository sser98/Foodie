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
   table#tblPw {
   	    width: 93%;
   	    border: hidden;
   	    margin: 10px;
   }  
   
   table#tblPw #th {
   		height: 20%;
   		text-align: center;
   		
   		font-size: 14pt;
   }
   
   table#tblPw td {
   		line-height: 30px;
   		padding-top: 0px;
   		padding-bottom: 8px;
   }
   
   .star { color: red;
           font-weight: bold;
           font-size: 13pt;
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
   
   .hp {
   	
   	height: 40px;
   	
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
   	background-image: url("<%= ctxPath %>/resources/img/login/background.jpg");
	
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
	
	.certificateBtn {
		margin-bottom: 0pt;
	}
</style>
<script src="<c:url value="/resources/js/jquery-3.3.1.min.js" />"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	var flagCertificate = false;
	var flagCheck= false;
	var flaghp="";
	var key="";
	var emailcheck = "";
	var flagname="";
	var emailList="";
	var flagemail="";
	
	
	
	$(document).ready(function(){
		
		$(".error").hide();
		
		
		
 		 $("input#email").blur(function(){
			
 			flagemail = "1";
			 $("span#emailCheckResult").html("");
			var email = $(this).val().trim();
			
			  var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
			 // 이메일 정규표현식 객체 생성
				
			 var bool = regExp.test(email);
				
			 if(!bool) {
					// 이메일이 정규표현식에 위배된 경우
					 $(":input").prop("disabled",true);
					$(this).prop("disabled",false); 
				
				    
				    $(this).focus();
				    
				    
				}
			 
			 else {
					// 이메일이 정규표현식에 맞는 경우
					$(this).parent().find(".error").hide();
					$(":input").prop("disabled",false);
					
					
					isExistEmailCheck();
					
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
				 
				 flagh2="2";
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
			    
			    flagh3="3";
			}
			
		}); 
		
		//////////////////////////////// 
	$("input#certificateNum").blur(function(){
			
			var certificateNum = $(this).val();  
			

			if($("input#certificateNum").val().trim() != key) {
			    
				$("span#certificateResult").html("인증번호가 틀렸습니다.").css("color","red");
				flagCertificate = false;
				
				return false;
			}
			
			else {
				$("span#certificateResult").html("인증에 성공하였습니다.").css("color","green");
				flagCertificate = true;
				
				if(!flagCheck) {
					
					alert("해당이메일과 해당 휴대폰 번호의 정보를 가진 회원이 존재하지 않습니다. 인증에 실패하였습니다.");
					return false;
					
				}
				
				else {
					$("tr[name=newPw]").show();	
				}
				
				
				
			}
			
			
		}); 		
		
		
		
	}); // end of $(document).ready()--------------------------------
    

	
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
    				$("span#emailCheckResult").html("이미 사용중인 이메일 입니다.").css("color","green");
    				
    			}
    			
    			else {
    				// 입력한 email 이 DB 테이블에 존재하지 않는 경우라면 
     				$("span#emailCheckResult").html("없는 이메일 입니다.").css("color","red");
     				$("input#email").val("");
    			}
    			
    			
    		},
    		error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
    	});	
		
	}// end of function isExistEmailCheck()--------------------------
	
	
	
	function sendMsg() {
		
		
		var flag=flagemail+flagh2+flagh3;
		
		if(flag != "123") {
			
			return false;
		}
		
		doubleCheck();
		
		if (flagCheck) {
			alert("입력하신 이메일과 휴대전화 정보가 등록된 계정이 없습니다.");
			
			$("intput#email").val("");
			$("intput#hp1").val("");
			$("intput#hp2").val("");
			$("intput#hp3").val("");
			
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
	
	
	function doubleCheck() {
		
			
			$.ajax({
	    		url:"<%= ctxPath%>/searchPwd.food",
	    		data:{"hp1":$("input#hp1").val(),
	  			      "hp2":$("input#hp2").val(),
	  			      "hp3":$("input#hp3").val(),  
	  			      "email":$("input#email").val()},  
	    		type:"POST",
	    		dataType:"json",    
	    		success:function(json){
	    			
	    			if(json.n == "1") {
	    				
	    				flagCheck = true;
	    				
	    			}
	    			 
	    			
	    		},
	    		error: function(request, status, error){
	    			
	    			alert("실패");
	    			
					
				}
	    	});	
			
		};
		
		function modifyPwd() {
			
			
			
			var frm = document.findPwFrm;
			frm.action = "/foodie/findPw.food";
			frm.method = "POST";
			frm.submit();
			
		};	
	
</script>

<body>

	<div class="row" id="Container">
		
		<div id="Container_Frm" align="center">
			<h3>비밀번호 찾기</h3>
			<h6 id="msg">회원정보에 등록한 이메일과 등록된 휴대전화 번호가 같아야, 인증번호를 받을 수 있습니다.</h6> 
			
			<form name="findPwFrm">

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

						<tr>
							<td class="tiles">
								<h5 class="subtitle">휴대전화</h5>
								<div style="display: flex; flex-direction: center;">
										<div style="width: 100%;">
											<input class="hp" type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" readonly />&nbsp;-&nbsp; 
											<input class="hp" type="text" id="hp2" name="hp2" size="6" maxlength="4" />&nbsp;-&nbsp; 
											<input class="hp" type="text" id="hp3" name="hp3" size="6" maxlength="4" />
											<button style="font-size: 8pt;" onclick="sendMsg();">인증번호</button> 
											<!-- <span  class="certificateBtn" style="display: inline-block; width: 90px; height: 30px; border: solid 1px gray; border-radius: 5px; font-size: 8pt; text-align: center; margin-left: 10px; cursor: pointer;" onclick="sendMsg();">인증번호 받기</span> -->
									   </div>
								   </div> <br> <span id="error" class="error">휴대폰 형식이 아닙니다.</span>
							</td>
						</tr>
						
						<tr id="certificate" style="display: none;">
							<td class="tiles">
								<h5 class="subtitle">인증번호</h5> 
								<input type="text" id="certificateNum" class="requiredInfo" placeholder="인증번호 입력하세요" /> <br> 
								<span id="certificateResult"></span>
								
							</td>
						</tr>
						
						<tr name="newPw" style="display: none;">
							<td class="tiles">
								<h5 class="subtitle">새 비밀번호</h5> <input type="password" name="pwd"
								id="pwd" class="requiredInfo" /> <br> <span id="error"
								class="error">암호는 영문자,숫자,특수기호가 혼합된 8~15 글자로 입력하세요.</span>
							</td>
						</tr>

						<tr name="newPw" style="display: none;">
							<td class="tiles">
								<h5 class="subtitle">새 비밀번호 재확인</h5> 
								<input type="password" id="pwdcheck" class="requiredInfo" /> 
								<br> 
								<span class="CheckResult" id="pwdCheckResult2"></span> 
								<span id="error" class="error">암호가 일치하지 않습니다.</span>
							</td>
						</tr>
						
						
					</tbody>
					
				</table>
			</form>
				<button name id="checkEmail"  onclick="modifyPwd();">암호 변경하기</button>

		
		</div>
	</div>
	

</body>
