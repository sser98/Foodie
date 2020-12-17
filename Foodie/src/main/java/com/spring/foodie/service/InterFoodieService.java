package com.spring.foodie.service;

import java.util.List;
import java.util.Map;

import com.spring.foodie.model.SearchVO;

public interface InterFoodieService {

	List<SearchVO> getStoreList(String place, String scrollCtrl);

	SearchVO getStoreDetail(String code);

	List<Map<String, String>> moreView(String place, String scrollCtrl);

	
}






