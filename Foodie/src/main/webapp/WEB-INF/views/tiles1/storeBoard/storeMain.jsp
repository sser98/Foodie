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
		
		$("div.store_item").click(function() {
			
			var index = $("div.store_item").index(this);
			
			var frm = document.storeListForm;
			frm.method="POST";
			frm.action="<%=ctxPath%>/storeBoard/storeDetail.food";
			frm.submit();
		});
		
	});
</script>

<form name="storeListForm">
	<div class="ov-hid">
	    <!-- Page Preloder -->
	    <div id="preloder">
	        <div class="loader"></div>
	    </div>
	    <div align="left">
	    	<div>${hotPlace}</div>
	    	<div>${hotPlaceInfo}</div>
	    </div>
	    
	    <c:forEach items="${storeList}" var="store" varStatus="status"> 
		    <!-- Listing Section Begin -->
		    <div class="store nice-scroll" align="center">
		        <div class="store__text__top">
		            
		        </div>
		        <div class="store__list">
		            <div class="store_item" style="cursor: pointer;">
		                <div class="store_item_img" style="display: inline-block;">
		                    <img src="<%=ctxPath %>/resources/images/레노보.png">
		                </div>
		                
		                <div class="store__item__text" style="display: inline-block;">
		                    <div><h4>${status.index + 1}. ${store.name}</h4></div>
		                    <div><h5>${store.address}</h5></div>
		                    <div><h5>${store.call}</h5></div>
		                    <input type="hidden" value="${store.code}" name="code" />
		                    <div align="right">${store.name} 더보기</div>
		                </div>
		            </div>
		        </div>
		    </div>
	    </c:forEach>
	    <!-- Listing Section End -->
	</div>
</form>
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
    