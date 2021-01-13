<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String ctxPath = request.getContextPath(); 

	
	



%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	<style>
	
		.site-btn {
			
			
		}
		
		button#btnAddcomment {
			font-size: 8pt;
		}
		
		.hideUl {
			
			/* display: none; */
			
		
		}
		
		.replycontent {
			
			width: 93%;
		}
		
		div.subcomment1 {
			
			margin-left: 10%;
		}
		
		div.subcomment2 {
			
			margin-left: 20%;
		}
		div.subcomment3 {
			
			margin-left: 30%;
		}
		
		div.subcomment4 {
			
			margin-left: 40%;
		}
		div.subcomment5 {
			
			margin-left: 50%;
		}

		div.listing__details__rating {
			display: flex;
			align-content: center;
			
			
		}
		
		div.listing__details__rating__overall {
			margin-right: 0px;
			float: none;
			width: 30%;
			
		}
		
		div.listing__details__rating__bar {
			
			width: 70%;
			font-weight: 700;
		}
		
		h2 {
			margin-top: 10pt;
		}
		
		.fa-star:before {
			margin-right: 2px;
			font-size: 12pt;
		}
		
		div.addcoment {
			display: flex;
			flex-direction: column;
			width: 15%;
			align-items: center; 
		}
		
		.listing__details__comment__item__rating {
			align-items: center; 
		}
		
		.listing__details__rating {
			margin-bottom: 0px;
		}
		
		
	</style>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=adf2708493f00cbb2f18296dc2c60b88"></script>	
 <script type="text/javascript">

	
	
 	var store_id="290249009";
 	var basicInfo="";
 	var menuInfo="";
 	var menuList="";
 	
 	var len = 5;
 	var end = 0;
 	
 	var blogReview="";
 	var comment="";
 	
 	var photo="";
 	var s2graph="";
 	var feedback="";
 	var cid="";
 	var photo="";
 	var mainphotourl="";
 	$(document).ready(function () {
		
 		 
 		$("span#currentCnt").hide();
 		$("span#totalCnt").hide();
 		
 		
 		// 별점 클릭 이벤트
 		$("#star0").click(function() {
 			
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "gray");
 	         $("#star2").css("color", "gray");
 	         $("#star3").css("color", "gray");
 	         $("#star4").css("color", "gray");
 	         $("input[name=spoint]").val("1");
 	         
 	      });
 		
 	      $("#star1").click(function() {
 	         reviewnum = 2;
 	         
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "orange");
 	         $("#star2").css("color", "gray");
 	         $("#star3").css("color", "gray");
 	         $("#star4").css("color", "gray");
 	         $("input[name=spoint]").val("2");
 	         
 	      });
 	      
 	      $("#star2").click(function() {
 	         
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "orange");
 	         $("#star2").css("color", "orange");
 	         $("#star3").css("color", "gray");
 	         $("#star4").css("color", "gray");
 	         $("input[name=spoint]").val("3");
 	      });
 	      
 	      $("#star3").click(function() {
 	         
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "orange");
 	         $("#star2").css("color", "orange");
 	         $("#star3").css("color", "orange");
 	         $("#star4").css("color", "gray");
 	         $("input[name=spoint]").val("4");
 	         
 	      });
 	      
 	      $("#star4").click(function() {
 	    	  
 	         $("#star0").css("color", "orange");
 	         $("#star1").css("color", "orange");
 	         $("#star2").css("color", "orange");
 	         $("#star3").css("color", "orange");
 	         $("#star4").css("color", "orange");
 	         $("input[name=spoint]").val("5");
 	         
 	      });
 	    // 별점 클릭 이벤트 끝
	 	    
 	    
 		// 댓글을 더보기 위하여 "더 보기" 버튼 클릭액션 이벤트 
		$("button#btnMoreComment").click(function(){
			if($(this).text() == "처음으로") {
				
				$("div#commentView").empty();
				
				getComment(0);
				$(this).text("더 보기");
				
			} else {
				
				getComment($(this).val());
				
			}// end of if($(this).text() == "처음으로"){}--------------------------
		});// end of $("button#btnMoreOneQuery").click(function(){})----------------------    
 	    
 	    
		
		
 	    // 가져오기 
 		goViewJson();       // json 카카오api
 		getComment(1);       // 해당 store_id 
 		likestroechecked(); // 좋아요 체크
 		
 		
 		// 지도를 담을 영역의 DOM 레퍼런스 
        var mapContainer = document.getElementById('map');
        
        // 지도를 생성할때 필요한 기본 옵션
        var options = {
               center: new kakao.maps.LatLng(37.56602747782394, 126.98265938959321), // 지도의 중심좌표. 반드시 존재해야함.
            level: 4 // 지도의 레벨(확대, 축소 정도). 숫자가 적을수록 확대된다. 4가 적당함.
        };
 
          
        // 지도 생성 및 생성된 지도객체 리턴
        var mapobj = new kakao.maps.Map(mapContainer, options);
        
        // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성함.    
        var mapTypeControl = new kakao.maps.MapTypeControl();
        
        // 지도 타입 컨트롤을 지도에 표시함.
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미함.   
        mapobj.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
        
        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성함.   
        var zoomControl = new kakao.maps.ZoomControl();
        
        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 지도에 표시함.
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 RIGHT는 오른쪽을 의미함.    
        mapobj.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
        
        if(navigator.geolocation) {
           // HTML5의 geolocation 으로 사용할 수 있는지 확인한다.
           
           // GeoLocation을 이용해서 웹페이지에 접속한 사용자의 현재 위치를 확인하여 그 위치(위도,경도)를 지도의 중앙에 오도록 한다.
           navigator.geolocation.getCurrentPosition(function(position) { 
              
              var latitude = position.coords.latitude;   // 현위치의 위도
              var longitude = position.coords.longitude; // 현위치의 경도
           
              // 마커가 표시될 위치를 geolocation으로 얻어온 현위치의 위.경도 좌표로 한다   
              // 저기 안에다가 꽂아주면 위치가 알아서뜸
              /* var locPosition = new kakao.maps.LatLng(37.57777094158683, 126.97679253697846); */
              
              var locPosition = new kakao.maps.LatLng(37.57777094158683, 126.97679253697846);
             // 마커이미지의 크기 
               var imageSize = new kakao.maps.Size(34, 39);
                
            // 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정한다. 
               var imageOption = {offset: new kakao.maps.Point(15, 39)};

            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성한다. 
               var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
               
            // == 마커 생성하기 == //
              var marker = new kakao.maps.Marker({ 
                 map: mapobj, 
                   position: locPosition, // locPosition 좌표에 마커를 생성 
                   image: markerImage     // 마커이미지 설정
                   
             }); 
              
             marker.setMap(mapobj); // 지도에 마커를 표시한다
              // == 지도의 센터위치를 locPosition로 변경한다.(사이트에 접속한 클라이언트 컴퓨터의 현재의 위.경도로 변경한다.)
              mapobj.setCenter(locPosition);
           });
        }
        else {
           // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정한다.
           var locPosition = new kakao.maps.LatLng(37.556583,126.919557);     
             
          // 지도의 센터위치를 위에서 정적으로 입력한 위.경도로 변경한다.
            mapobj.setCenter(locPosition);
        }// end of if ~ else---------------------------------------------------
        
        
        // ================== 지도에 클릭 이벤트를 등록하기 ======================= //
        // 지도를 클릭하면 클릭한 위치에 마커를 표시하면서 위,경도를 보여주도록 한다.
        
        // == 마커 생성하기 == //
        // 1. 마커이미지 변경
        var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png';       
                
        // 2. 마커이미지의 크기 
         var imageSize = new kakao.maps.Size(34, 39);   
                 
         // 3. 마커이미지의 옵션. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정한다. 
         var imageOption = {offset: new kakao.maps.Point(15, 39)};   
           
         // 4. 이미지정보를 가지고 있는 마커이미지를 생성한다. 
         var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
               
         var movingMarker = new kakao.maps.Marker({ 
             map: mapobj, 
             image: markerImage  // 마커이미지 설정
        });
        
       	 // 가져온 데이터를 attr으로 넣기  
/*          $("span#chart1").attr("data-percentage", "${paraMap.one}");
         $("span#chart2").attr("data-percentage", "${paraMap.two}");
         $("span#chart3").attr("data-percentage", "${paraMap.three}");
         $("span#chart4").attr("data-percentage", "${paraMap.four}");
         $("span#chart5").attr("data-percentage", "${paraMap.five}"); */
         
         
         
	}); // end of ready
 	
 	function goViewJson() {
		
		$.ajax({
			url:"/foodie/get/json.food",
			data:"",
			dataType:"JSON",
			success:function(json){
					
				
				basicInfo=json.basicInfo;
				blogReview=json.blogReview;
				comment=json.comment;
				menuInfo=json.menuInfo;
				menuList=menuInfo.menuList
				photo=json.photo;
				s2graph=json.s2graph;
				feedback=json.feedback;
				photo=json.photo;
				cid=basicInfo.cid;
				
				console.log(cid);
				console.log(basicInfo);
				
				$("#adress_detail").text(basicInfo.address.region.fullname+" "+basicInfo.address.newaddr.newaddrfull);
				$("a#page").text(basicInfo.homepage);
				$("#store_name").text(basicInfo.placenamefull);				
				$("label#adress_detail").text(basicInfo.address.region.fullname+basicInfo.address.newaddr.newaddrfull);
				$("label#email").text("");
				$("label#phone").text(basicInfo.phonenum);
				
				var scorercnt = comment.scorecnt;
				var scoresum = comment.scoresum;
				var allComntcnt = comment.allComntcnt;
				var score =scoresum/scorercnt;
				
				
				score=score.toFixed(1);
				$("div#commentscnt").text(comment.scorecnt);

					html ="";
					
					$.each(menuInfo.menuList, function (index, item) {
						
						var menu=item.menu;
						var price=item.price;
						html += "<li>"+menu+"  :   "+price+"</li>";
						
					});
					
					$("div#menuList").html(html);
					
					
					// 메인 photourl 가져오기					
					mainphotourl=basicInfo.mainphotourl
					
					html ="";
					html ="<img class='listing__details__gallery__item__large' src='"+mainphotourl+"' alt=''>";
					
					$("div.listing__details__gallery__item").html(html);
					
					
					html="";
					$.each(photo, function (index, item) {
						
						var food1=item[1];
						var photolist=food1['list'];
						
						$.each(photolist, function (index, item) {
							
							console.log(item['orgurl']);
								
							var orgurl=item['orgurl'];
							
							
							html +="<img data-imgbigurl='"+mainphotourl+"' src='"+orgurl+"' alt=''>";
							
							
							});
							
					});
					// $("div.listing__details__gallery__slider").html(html);
					
				},
				error : function(request, status, error) {
				}

			});

		}// end of function goViewJson(){}------------------------
		
		
	 	function getComment(end) {
			
			$.ajax({
				url:"/foodie/readComment.food",
				data:{"code": "290249009",
					   "end" : end,
					   "len" : len
					   },
				type:"POST",
				dataType:"JSON",
				success:function(json){
						
					var html = "";
					if(json.length > 0) {
						$.each(json, function(index, item){
							
						if(item.depthno == "0") {
							
							html +=	"<div class='listing__details__comment__item' style='margin-bottom: 0px;'>";
							
						}
						
						else if(item.depthno == "1")  {
							html +=	"<div class='subcomment1' style='margin-bottom: 0px;'>";	
						}
						else if(item.depthno == "2")  {
							html +=	"<div class='subcomment2' style='margin-bottom: 0px;'>";	
						}
						else if(item.depthno == "3")  {
							html +=	"<div class='subcomment3' style='margin-bottom: 0px;'>";	
						}
						else if(item.depthno == "4")  {
							html +=	"<div class='subcomment4' style='margin-bottom: 0px;'>";	
						}
						else if(item.depthno == "5")  {
							html +=	"<div class='subcomment5' style='margin-bottom: 0px;'>";	
						}
						
						html +=	"<div class='listing__details__comment__item__pic'>";
						
						if(item.thumbnail_image == "0") {
							html += "<img src='<%=ctxPath %>/resources/img/listing/details/comment.png' alt=''>";	
						}
						console.log(item.thumbnail_image);
						html += "<img src='"+item.thumbnail_image+"' alt=''>";
						
                        html += "</div>";
                        html += "<div id='"+index+"' class='listing__details__comment__item__text'>";
                        html +="<div class='listing__details__comment__item__rating'>";
                        
                        if (item.spoint == "1") {
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                        }
                        
						if (item.spoint == "2") {
							html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                        }
						
						if (item.spoint == "3") {
							html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                            
                        }
						
						if (item.spoint == "4") {
							html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:gray;'></i>";
                        }
						
						if (item.spoint == "5") {
							html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
                            html +="<i class='fa fa-star' style='color:orange;'></i>";
							
                        }
						
                        html += "</div>"; 
                        html += "<span>"+item.regDate+"</span>";
                        html += "<h5>"+item.name+"</h5>";
                        html += "<p>"+item.content+"</p>";  
                        html += "<ul><li><i onclick='addLike("+item.seq+");' class='fa fa-hand-o-right'></i> Like "+item.likecnt+"</li><li><i class='fa fa-share-square-o'></i> Reply "+item.commentcnt+"</li></ul><ul class='hideUl'><input class='replycontent' id='replycontent"+index+"'type='text'><button onclick='addReply("+item.seq+","+item.depthno+","+item.code+","+index+","+item.groupno+");'>답글</button></ul></div></div><hr>";
						});
						
					}
					
					$("div#commentView").html(html);
					
					// ★★★ 중요 !!! 더보기 버튼의 value 속성에 값을 지정하기 ★★★ //
					
					
					$("button#btnMoreComment").val(Number(end) + len);
					
					// 자기 자신의 원래 값에 불러온 json의 개수의 값을 넣어준다.
					$("span#currentCnt").text( Number($("span#currentCnt").text()) + json.length);  // 현재 기록된 개수에 불러온 개수(배열의 길이 == 개수)를 더한다.
					// 더보기 버튼을 계속해서 클릭해 countHIT 값과 totalHITCount 값이 일치하는 경우
					
					if($("span#currentCnt").text() == $("span#totalCnt").text()) {
						
						$("button#btnMoreComment").text("처음으로");
						$("span#currentCnt").text("0");
						
					}
					
					},

					error : function(request, status, error) {
						alert("오류가 발생했습니다.");
					}
			
				});

			}// end of function goViewJson(){}------------------------
			
			// 답글 누르면 아래 ul태그가 show 보여지는 이벤트
			function showReplycontent(index) {
				
				var divNumber=index;
				
				
				
				console.log($("ul"));
				
				
			};
			
			
			
			// == 댓글쓰기 ==  함수인데 페이지 이동이됨?//
			function goAddWrite() {
					
					if(${empty sessionScope.loginuser}) {
						   alert("후기를 작성하시려면 먼저 로그인 하셔야 합니다.");
						   location.href="/foodie/login.food";
						   return;
					   }
					
					var contentVal = $("textarea[name=content]").val()
					if(contentVal == "") {
						alert("댓글 내용을 입력하세요!!");
						return;
					}
					
					var spoint=$("input[name=spoint]").val();
					
					if(spoint == "0") {
						alert("별점을 클릭하세요");
						return;
						
					}
					var form_data = $("form[name=addcomment]").serialize();
					
					$.ajax({
						url:"<%= request.getContextPath()%>/addComment.food",
						data:form_data,
						type:"POST",
						dataType:"JSON",
						success:function(json){  
							var n = json.n;
							
							if(n == 0) {
								alert("댓글쓰기 실패");
							}
							else {
								alert("댓글쓰기 성공");
								getComment(); 
							}
							
							$("textarea[name=content]").val("");
							$("#star0").css("color", "orange");
				 	        $("#star1").css("color", "gray");
				 	        $("#star2").css("color", "gray");
				 	        $("#star3").css("color", "gray");
				 	        $("#star4").css("color", "gray");
				 	        $("input[name=spoint]").val("0");
						},
						
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					 	}
					});
					
			}// end of function goAddWrite(){}---------------------------
			
			
			   // **** 특정댓글에 댓글 쓰기 // 
			   function addReply(parentSeq, depthno, code, index, groupno) {
					
				    var content=$("input#replycontent"+index).val();
					if(${empty sessionScope.loginuser}) {
						   alert("댓글을 작성하시려면 먼저 로그인 하셔야 합니다.");
						   location.href="/foodie/login.food";
						   return;
					   }
					
 					 	$.ajax({
							url:"<%= request.getContextPath()%>/addReply.food",
							data:{"parentSeq":parentSeq, "depthno":depthno, "code":code, "parentSeq":parentSeq, "content":content, "groupno":groupno},
							type:"POST",
							dataType:"JSON",
							success:function(json){  
								var n = json.n;
								
								if(n == 0) {
									alert("댓글쓰기 실패");
								}
								else {
									
									alert("댓글쓰기 성공");
									getComment(); 
									
								}
								
								$("textarea[name=content]").val("");
							},
							
							error: function(request, status, error){
								alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						 	}
						});  
						    
			   }// end of addReply(seq, depthno) ---------------
			   // **** 특정댓글에 대한 좋아요 등록하기 **** // 
			   
			   function addLike(seq) {
					
					if(${empty sessionScope.loginuser}) {
						   
						   location.href="/foodie/login.food";
						   return;
					   }
					
					
					
					// 중복검사 ajax
					$.ajax({
						url:"<%= request.getContextPath()%>/duplicateCheckLike.food",
						data:{"seq":seq,
						     "email":"${sessionScope.loginuser.email}"},
						type:"POST",
						dataType:"JSON",
						success:function(json){  
							var n = json.n;
							if(n == 0) {
								
								// 좋아요를 클릭한적이 없는경우 
								   $.ajax({
									   url:"/foodie/likeAdd.food",
									   type:"POST",
									   data:{"seq":seq,
										     "email":"${sessionScope.loginuser.email}"},
									   dataType:"JSON", 
									   success:function(json) {
										getComment($("button#btnMoreComment").val());	
											
									   },
									   error: function(request, status, error){
											alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
									   }
								   });
							}
							
							else {
								// 좋아요를 클릭한 적이 있는경우
								$.ajax({
									url:"<%= request.getContextPath()%>/delLikeCnt.food",
									data:{"seq":seq,
									     "email":"${sessionScope.loginuser.email}"},
									type:"POST",
									dataType:"JSON",
									success:function(json){  
										getComment($("button#btnMoreComment").val());										
									},
									error: function(request, status, error){
										alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
								 	}
								});
							}
							
						},
						
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					 	}
						
					});//
					
			   }// end of addLike(seq)---------------
			   
			// 가고싶다 추가함수
			function likeStore() {				
					
				$.ajax({
					url:"<%= request.getContextPath()%>/storelike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){
						
						
						alert("추가되었습니다.22222");
																
						
					},
					
					error: function(request, status, error){
						console.log("ajax 실패");
						console.log(cid);
						console.log(email);
						
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
				   
			};

			// 가고싶다 삭제 함수
			function delStoreLike() {
				
				$.ajax({
					url:"<%= request.getContextPath()%>/delstorelike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						
						if(n == 0) {
							
							
							return false;
							
						} else {
							
							alert("삭제에 성공하셨습니다.");
							
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
				
			};
			
			// 가고싶다 중복검사결과에 따라 추가/삭제 함수 실행
			function duplicateStoreLike() {
				
				if(${empty sessionScope.loginuser}) {
					   alert("가고싶다 체크를 하시려면 먼저 로그인 하셔야 합니다.");
					   location.href="/foodie/login.food";
					   return;
					   
				   }
				
				$.ajax({
					url:"<%= request.getContextPath()%>/duplicateCheckStoreLike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						console.log(n);
						
						if(n == 1) {
							
							alert("삭제합니다.");
							
							delStoreLike();
							
						} else {
							
							alert("추가합니다.");
							
							likeStore();
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
				   
				
			};   
			
			// 가고싶다에 이전에 클릭했을 경우 
			function likestroechecked() {
				
				$.ajax({
					url:"<%= request.getContextPath()%>/duplicateCheckStoreLike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						console.log(n);
						
						if(n == 1) {
							
							
							$("a.primary-btn").css('color','red');
							
							
						} else {
							
							
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
			};
			
			
			// 댓글 삭제하기 Ajax
			function deleteComment(seq) {
				
				$.ajax({
					url:"<%= request.getContextPath()%>/deleteComment.food",
					data:{"seq":seq,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						console.log(n);
						
						if(n == 1) {
							
							
							console.log("성공적으로 댓글을 삭제했습니다.");
							
							
						} else {
							
							
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
			};
			
			// 댓글 수정하기 Ajax
			function likestroechecked() {
				
				$.ajax({
					url:"<%= request.getContextPath()%>/duplicateCheckStoreLike.food",
					data:{"cid":cid,
					     "email":"${sessionScope.loginuser.email}"},
					type:"POST",
					dataType:"JSON",
					success:function(json){  
						var n = json.n;
						console.log(n);
						
						if(n == 1) {
							
							
							$("a.primary-btn").css('color','red');
							
							
						} else {
							
							
						}
																
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				 	}
					
				});
			};
			
			

			
	</script>
					
					
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader">제목</div>
    </div>

    <!-- Listing Section Begin -->
    <section class="listing-hero set-bg" data-setbg="<%= ctxPath %>/resources/img/listing/details/listing-hero.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__hero__option">
                        <div class="listing__hero__icon">
                            <img src="<%= ctxPath %>/resources/img/listing/details/ld-icon.png">
                        </div>
                        <div class="listing__hero__text">
                            <h2 id="store_name"></h2>
                            <div class="listing__hero__widget">
                                <div class="listing__hero__widget__rating" >
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star-half_alt"></span>
                                </div>
                                <div id=commentscnt></div> <span>Views</span>
                            </div>
                            <p><span class="icon_pin_alt"></span> <label id="adress_detail"></label></p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__hero__btns">
                        <a href="#" class="primary-btn" onclick="duplicateStoreLike();"><i class="fa fa-bookmark"></i> 가고싶다</a>
                    </div>
                </div>
            </div>
        </div>
        
    </section>
    
    <!-- Listing Section End -->

    <!-- Listing Details Section Begin -->
    <section class="listing-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="listing__details__text">


                        <div class="listing__details__gallery" style="padding-top: 0pt;">
                             <div class="listing__details__gallery__pic">
                                <div class="listing__details__gallery__item">
                                
                                </div>
                                <div class="listing__details__gallery__slider owl-carousel"> 
                             		  
                                </div>
                            </div>
                             
                        </div>
                                                
                        <div id="menuList" class="listing__details__menu"></div>                                               
                       
                        <div class="listing__details__rating">
                            
                            <div class="listing__details__rating__overall">
                                <h2>${storeAverage}</h2>
                                <div class="listing__details__rating__star">
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                    <span class="icon_star"></span>
                                </div>
                                <span id=reviewcnt></span>
                            </div>
                            
                            <div class="listing__details__rating__bar">
                                <div class="listing__details__rating__bar__item">
                                    <span>5점</span>
                                    <div id="bar5" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.five}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntFive}</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>4점</span>
                                    <div id="bar4" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.four}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntFour}</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>3점</span>
                                    <div id="bar3" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.three}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntThree}</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>2점</span>
                                    <div id="bar2" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.two}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntTwo}</span>
                                </div>
                                <div class="listing__details__rating__bar__item">
                                    <span>1점</span>
                                    <div id="bar1" class="barfiller">
                                        <span class="fill" data-percentage="${paraMap.one}"></span>
                                    </div>
                                    <span class="right">${paraMap.cntOne}</span>
                                </div>
                            </div>
                            
                        </div>
                        
                         <div class="listing__details__review">
                            
                            <form name="addcomment">
                            	<input name ="name" type="hidden" value="${loginuser.name}">
                            	<input name ="code" type="hidden" value="290249009">   
                            	<input name ="spoint" type="hidden" value="0">
                            	
                            	<div style="display: flex;">
                            		<div style="width: 85%">
                            		<textarea style="resize: both;" name="content" placeholder="공개 댓글 추가 ..."></textarea>
                            		</div>
                            		
                            		<div class="addcoment">
                            			<br>
                            			<div class="listing__details__comment__item__rating" >
                                        <i id="star0" class="fa fa-star" style="font-size: 10pt;"></i>
                                        <i id="star1" class="fa fa-star" style="font-size: 10pt;"></i>
                                        <i id="star2" class="fa fa-star" style="font-size: 10pt;"></i>
                                        <i id="star3" class="fa fa-star" style="font-size: 10pt;"></i>
                                        <i id="star4" class="fa fa-star" style="font-size: 10pt;"></i>
                                		</div>
                                		<br>
                                		<div>
                                		<button id="btnAddcomment" class="site-btn" style="width: 100%;" onclick="goAddWrite();">댓글</button>
                                		</div>
                            		</div>
                					
                            	</div>   
                            	
   
                            </form>
                            <!-- <button class="site-btn" onclick="goAddWrite();">댓글</button> -->
                        </div>
                        
                        
                        <div id="commentView" class="listing__details__comment">
                          	
                        </div>
                        
                        <div>
                        	<span id="currentCnt">0</span>
							<span id="totalCnt">${totalCnt}</span>
							<button type="button" id="btnMoreComment" value="">더 보기</button>
                        </div>
                       
                        
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="listing__sidebar">
                        <div class="listing__sidebar__contact">
                            <div class="listing__sidebar__contact__map">
								<div id="map" style="width: 360px; height: 200px;"></div>
								<div id="latlngResult"></div>
                            </div>
                            <div class="listing__sidebar__contact__text">
                                <h4>Contacts</h4>
                                <ul>
                                    <li><span class="icon_pin_alt"></span> <label id="adress_detail"></label> </li>
                                    <li><span class="icon_phone"></span> <label id="phone"></label></li>
                                    <li><span class="icon_mail_alt"></span> <label id="email"></label></li>
                                    <li><span class="icon_globe-2"></span><a id="page"></a></li>
                                </ul>
                                
                                <div class="listing__sidebar__contact__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
                                    <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
                                    <a href="#" class="google"><i class="fa fa-google"></i></a>
                                </div>
                                
                            </div>
                        </div>
                        <div class="listing__sidebar__working__hours">
                            <h4>Working Hours</h4>
                            <ul>
                                <li>Monday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Tuesday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Wednesday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Thursday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Friday <span class="opening">Opening</span></li>
                                <li>Saturday <span>09:00 AM - 20:00 PM</span></li>
                                <li>Saturday <span class="closed">Closed</span></li>
                            </ul>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Listing Details Section End -->

    <!-- Newslatter Section Begin -->
    <section class="newslatter">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="newslatter__text">
                        <h3>Subscribe Newsletter</h3>
                        <p>Subscribe to our newsletter and don’t miss anything</p>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <form action="#" class="newslatter__form">
                        <input type="text" placeholder="Your email">
                        <button type="submit">Subscribe</button>
                    </form>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Newslatter Section End -->
	<script src="<%=ctxPath %>/resources/js/jquery-3.3.1.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/bootstrap.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.nice-select.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery-ui.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.nicescroll.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.barfiller.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/jquery.slicknav.js"></script>
    <script src="<%=ctxPath %>/resources/js/owl.carousel.min.js"></script>
    <script src="<%=ctxPath %>/resources/js/main.js"></script>


