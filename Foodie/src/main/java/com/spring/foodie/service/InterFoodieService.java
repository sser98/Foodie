package com.spring.foodie.service;

import java.util.List;
import java.util.Map;

import com.spring.foodie.model.SearchVO;

public interface InterFoodieService {

	//검색하기
	List<SearchVO> searchList(Map<String, String> paraMap);

	
}






