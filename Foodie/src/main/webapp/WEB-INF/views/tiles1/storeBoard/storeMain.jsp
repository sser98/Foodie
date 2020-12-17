<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<style>
	.store {
		display:inline-block;
		width: 50%;
		padding-top: 50px;
		border-bottom: 1px solid gray;
	}
	
	.store_item_img {
		width: 238px;
		height: 238px;
	}
</style>

<script>
	$(document).ready(function() {
		
	});
	
	 $(window).scroll(function() {
	        var scrolltop = $(document).scrollTop();
	        var height = $(document).height();
	        var height_win = $(window).height();
	     if (Math.round( $(window).scrollTop()) == $(document).height() - $(window).height()) {
	        moreList();
	    }
	 });
	 
	 function storeClick() {
		
		$("div.store_item").click(function() {
			var index = $("div.store_item").index(this);
			
			var code = $("input.code").eq(index).val();
			
			alert(code);
				
			var frm = document.storeListForm;
			frm.method="GET";
			frm.action="<%=ctxPath%>/storeBoard/storeDetail.food?code="+code;
			frm.submit();
		});
		
	 }
	    
	 function moreList() {
		var scrollCtrl = $("#scrollCtrl").val();
		var hotPlace = "${hotPlace}";
		var hotPlaceInfo = "${hotPlaceInfo}";
		
		var nscrollCtrl = Number(scrollCtrl) + 1;
		
		var html = "";
		
		$("#scrollCtrl").val(nscrollCtrl);
		
		var urlContent = {"hotPlace":hotPlace, "hotPlaceInfo":hotPlaceInfo, "nscrollCtrl":nscrollCtrl};
		
		$.ajax({
				url:"<%=ctxPath%>/storeBoard/moreView.food",
				data: urlContent,
				dataType:"JSON",
				success:function(json){
					for(var i=0; i<json.length; i++) {
						html += "<div class='store nice-scroll' align='center'>" +
					        	 	"<div class='store__list'>" +
					            		"<div class='store_item' style='cursor: pointer;' onclick='storeClick()'>" +
						               	 	"<div class='store_item_img' style='display: inline-block;'>" +
						                    "<img src='<%=ctxPath %>/resources/images/레노보.png'>" +
						                	"</div>" +
						                	"<div class='store__item__text' style='display: inline-block;'>" +
						                    "<div><h4>" + json[i].RNO +". "+ json[i].NAME + "</h4></div>" +
						                    "<div><h5>" + json[i].ADDRESS + "</h5></div>" +
						                    "<div><h5>" + json[i].CALL +"</h5></div>" +
						                    "<input type='text' value=" + json[i].CODE +" name='code' class='code' />" +
						                    "<div align='right'>" + json[i].NAME  + " 더보기 </div>" +
								            "</div>" +
							            "</div>" +
						        	"</div>" +
					    		"</div></br>";
					}
					$("div#storeList").append(html);
				},
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			 	}
			});
		}
		
</script>

<form name="storeListForm">
	<div class="ov-hid">
	    
	    <!-- Page Preloder -->
	    <div id="preloder">
	        <div class="loader"></div>
	    </div>
	    
	    <div class="store__text__top" align="left">
	    	<div id="hotPlace">${hotPlace}</div>
	    	<div id="hotPlaceInfo">${hotPlaceInfo}</div>
	    </div>
	    
	    <div id="storeList">
		    <c:forEach items="${storeList}" var="store" varStatus="status"> 
			    <!-- Listing Section Begin -->
			    <div class="store nice-scroll" align="center">
			        <div class="store__list">
			            <div class="store_item" style="cursor: pointer;" onclick="storeClick()">
			                <div class="store_item_img" style="display: inline-block;">
			                    <img src="<%=ctxPath %>/resources/images/레노보.png">
			                </div>
			                
			                <div class="store__item__text" style="display: inline-block;">
			                    <div><h4>${status.index + 1}. ${store.name}</h4></div>
			                    <div><h5>${store.address}</h5></div>
			                    <div><h5>${store.call}</h5></div>
			                    <input type="text" value="${store.code}" name="code" class="code"/>
			                    <div align="right">${store.name} 더보기</div>
			                </div>
			            </div>
			        </div>
			    </div>
		    </c:forEach>
	    </div>
	    <!-- Listing Section End -->
	    <input type="hidden" value="${scrollCtrl}" id="scrollCtrl" />
	</div>
 <!-- Js Plugins -->
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
</form>
    