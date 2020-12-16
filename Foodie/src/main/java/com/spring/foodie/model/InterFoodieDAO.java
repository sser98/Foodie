package com.spring.foodie.model;

import java.util.List;

public interface InterFoodieDAO {

	List<SearchVO> getStoreList(String place);

	SearchVO getStoreDetail(String code);
	
	
}







