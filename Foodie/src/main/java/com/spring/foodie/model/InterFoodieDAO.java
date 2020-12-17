package com.spring.foodie.model;

import java.util.List;

public interface InterFoodieDAO {

	List<SearchVO> getStoreList(String place, String scrollCtrl);

	SearchVO getStoreDetail(String code);
	
	
}







