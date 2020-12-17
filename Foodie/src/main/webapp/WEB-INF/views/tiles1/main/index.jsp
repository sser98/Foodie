<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
   String ctxPath = request.getContextPath();
  //       /board 
%>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Directing Template">
    <meta name="keywords" content="Directing, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>3조 | 파이널</title>
    
</head>
<style type="text/css">
.top_list{
/* == topList 스팬태그 가운데로 == */
      position: relative;
        bottom: 90px;
        right:78px;
        color:white;
        font-size:20px;
        font-weight:bold;
        text-align:center;
          
}
.top_list2{
/* == topList 스팬태그 가운데로 == */
        position: relative;
        bottom: 90px;
        right:78px;
        color:white;
        font-size:15px;
        font-weight:bold;
        text-align:center;
          
}



div.listing__item__pic set-bg{
   /* position:relative;
   width:500px;
   height:300px; */
}
div.listing__item{
   /* position:relative; */
   width:380px;
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		$("div.listing__item").click(function() {
			
			var index = $("div.listing__item").index(this);
			
			var hotPlace = $("span.top_list").eq(index).text();
			
			var hotPlaceInfo = $("p.top_list2").eq(index).text();
			
			location.href="<%=ctxPath %>/storeBoard/storeMain.food?hotPlace="+hotPlace+"&hotPlaceInfo="+hotPlaceInfo+"&scrollCtrl=1";
		});
		
	});
</script>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Categories Section Begin -->
    <!-- <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Most Popular Categories</h2>
                        <p>Travelocity empowers travelers who are giving back on their trips in ways big and small</p>
                    </div>
                </div>
            </div>
        </div>
    </section> -->
    <!-- Categories Section End -->

    <!-- Most Search Section Begin -->
    <section class="most-search spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2 style="color:orange; font-weight:bold;">믿고 보는 맛집 리스트</h2>
                        <p></p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="most__search__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">
                                    <span class="flaticon-039-fork"></span>
                                    인기지역
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">
                                    <span class="flaticon-030-kebab"></span>
                                    한식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab">
                                    <span class="flaticon-032-food-truck"></span>
                                    일식                
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-4" role="tab">
                                    <span class="flaticon-031-delivery"></span>
                                    중식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-5" role="tab">
                                    <span class="flaticon-038-take-away"></span>
                                    양식
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">
                                    <span class="flaticon-017-croissant"></span>
                                   카페&제과                   
                                </a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-6" role="tab">
                                    <span class="flaticon-031-delivery"></span>
                                   주점                   
                                </a>
                            </li>
                        </ul>
                    </div>
                    
                    
                    <!-- 지역핫플레이스 -->
                    <div class="tab-content">
                    
                        <div class="tab-pane active" id="tabs-1" role="tabpanel"> <!-- 지역핫플레이스 -->
                        
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                           <%--  <%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png"> --%>
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                            <span class="top_list">신논현역 맛집 베스트</span>
                                            <br><br>
                                             <p class="top_list2">신논현의 맛집 모음</p>
                                               <!--  <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a> -->
                                            </div>
                                        </div>
                                    </div>
                               </div>
                               
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/keyword_search/meta/pictures/fniqmkbao7_tgrue.png?fit=around|600:400&crop=600:400;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">가로수길 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">가로수길 처음와봐?</p>
                                           </div>
                                       </div>
                                   </div>
                               </div>
                                    
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://cdn.crowdpic.net/list-thumb/thumb_l_F3D127229BB327266846B663A87B0803.jpg">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">명동 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">명동이 요즘 핫하다던데..</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                   
                                <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://www.newzealand.com/assets/Tourism-NZ/Lake-Taupo/c47317b551/img-1536064442-8738-30473-p-11DB6F53-9C1F-12FB-64B569C5E02289AB-2544003__aWxvdmVrZWxseQo_CropResizeWzk0MCxudWxsLDgwLCJqcGciXQ.jpg">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">이태원 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">이태원 클라쓰!!</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://static.wtable.co.kr/image/production/service/recipe/668/6c59105b-1ea9-4e6d-bdd2-e5deafe499e3.jpg">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">종로 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">종로로 모이자!!</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                                  <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://t1.daumcdn.net/cfile/tistory/01384F4B516317E018">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">강남역 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">강남의 핫한 맛집은?</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                         </div>
                         </div>
                                 
                                 
                                 
                                 
                        <!-- 2번째 태그 -->
                        
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="row">
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/59110_1607255618220385.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag hot_deal">Hot Deal</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">갈비 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">회식 할 곳 찾아?</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                                
                                
                               <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/567494_1480569707297549.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">삼겹살 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">삼쏘 한잔?</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                                 
                                 
                               <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/added_restaurants/447545_1471073424411761.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">냉면 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">면치기 하고 싶은 날</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                               

                        <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/37398/593070_1472836660192_7917?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">국밥 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">든든한 국밥 먹을러 갈래요?</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                                 
                                 
                                 
                                 <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/1432016_1574946598893990.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                           <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">부대찌개 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">겨울엔 역시 탕이지!</p>
                                           </div>
                                       </div>
                                     </div>
                                 </div> 
                                
                                
                                  <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/3000_1443145350860?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">족발 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">족발 매니아들만 안다는 그 곳들</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                            </div>
                         </div>
                                 
                                 
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                     <div class="listing__item">
                                        <div class="listing__item__pic set-bg top_list_image" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/3000_1443145350860?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                        
                                           <!--  <img src="resources/images/listing/list_icon-1.png" alt=""> -->
                                             <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns"><span class="top_list">족발 맛집 베스트</span>
                                            <br><br>
                                            <p class="top_list2">족발 매니아들만 안다는 그 곳들</p>
                                           </div>
                                       </div>
                                   </div>
                                 </div> 
                                 
                                 
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="https://mp-seoul-image-production-s3.mangoplate.com/54303_1528720802986009.jpg?fit=around|359:240&crop=359:240;*,*&output-format=jpg&output-quality=80">
                                            
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Crab fried with tamarind</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 14320 Keenes Mill Rd.
                                                        Cottondale, Alabama(AL), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-5.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-5.png" alt="">
                                            <div class="listing__item__pic__tag hot_deal">Hot Deal</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Tortoise grilled on salt</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-4.png" alt="">
                                                    <span>Shopping</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-6.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-6.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Fish cooked with fishsauce</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 2604 E Drachman St. Tucson,
                                                        Arizona, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-4" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Chinese Sausage Restaurant</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-2.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-2.png" alt="">
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Shrimp floured and fried</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
                                                        Georgia(GA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>Food & Drink</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-3.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-3.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Sweet and sour pork ribs</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 251 Wiley St. Forks,
                                                        Washington(WA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-6.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-6.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Fish cooked with fishsauce</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 2604 E Drachman St. Tucson,
                                                        Arizona, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-5" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Chinese Sausage Restaurant</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-2.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-2.png" alt="">
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Shrimp floured and fried</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
                                                        Georgia(GA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>Food & Drink</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-3.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-3.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Sweet and sour pork ribs</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 251 Wiley St. Forks,
                                                        Washington(WA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-4.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-4.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Crab fried with tamarind</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 14320 Keenes Mill Rd.
                                                        Cottondale, Alabama(AL), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right closed">Closed</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-6.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-6.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Fish cooked with fishsauce</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 2604 E Drachman St. Tucson,
                                                        Arizona, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-3.png" alt="">
                                                    <span>Hotel</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-6" role="tabpanel">
                            <div class="row">
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-1.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-1.png" alt="">
                                            <div class="listing__item__pic__tag">Popular</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Chinese Sausage Restaurant</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 236 Littleton St. New
                                                        Philadelphia, Ohio, United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-1.png" alt="">
                                                    <span>Restaurant</span>
                                                </div>
                                                <div class="listing__item__text__info__right">Open Now</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-6">
                                    <div class="listing__item">
                                        <div class="listing__item__pic set-bg" data-setbg="<%=ctxPath %>/resources/img/listing/list-2.jpg">
                                            <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_icon-2.png" alt="">
                                            <div class="listing__item__pic__tag top_rate">Top Rate</div>
                                            <div class="listing__item__pic__btns">
                                                <a href="#"><span class="icon_zoom-in_alt"></span></a>
                                                <a href="#"><span class="icon_heart_alt"></span></a>
                                            </div>
                                        </div>
                                        <div class="listing__item__text">
                                            <div class="listing__item__text__inside">
                                                <h5>Shrimp floured and fried</h5>
                                                <div class="listing__item__text__rating">
                                                    <div class="listing__item__rating__star">
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star"></span>
                                                        <span class="icon_star-half_alt"></span>
                                                    </div>
                                                    <h6>$40 - $70</h6>
                                                </div>
                                                <ul>
                                                    <li><span class="icon_pin_alt"></span> 1012 Vesper Dr. Columbus,
                                                        Georgia(GA), United States</li>
                                                    <li><span class="icon_phone"></span> (+12) 345-678-910</li>
                                                </ul>
                                            </div>
                                            <div class="listing__item__text__info">
                                                <div class="listing__item__text__info__left">
                                                    <<%=ctxPath %>/resources/img src="<%=ctxPath %>/resources/img/listing/list_small_icon-2.png" alt="">
                                                    <span>Food & Drink</span>
                                                </div>
                           