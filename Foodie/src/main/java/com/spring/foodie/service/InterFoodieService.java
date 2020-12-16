package com.spring.foodie.service;

import java.util.List;

import com.spring.foodie.model.SearchVO;

public interface InterFoodieService {

	List<SearchVO> getStoreList(String place);

	SearchVO getStoreDetail(String code);

	
}






