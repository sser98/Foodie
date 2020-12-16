package com.spring.foodie.model;

import java.util.List;
import java.util.Map;

public interface InterFoodieDAO {

	//검색
	List<SearchVO> searchList(Map<String, String> paraMap);
	
	
}







