package com.spring.foodie.model;

import java.util.List;
import java.util.Map;

public interface InterFoodieDAO {

	List<SearchVO> getStoreList(String place, String scrollCtrl);

	SearchVO getStoreDetail(String code);

	List<Map<String, String>> moreView(String place, String scrollCtrl);
	
	
}







