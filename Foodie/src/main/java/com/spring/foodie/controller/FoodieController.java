package com.spring.foodie.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.foodie.common.FileManager;
import com.spring.foodie.service.*;

//=== #30. 컨트롤러 선언 === 
@Component
@Controller
public class FoodieController {

	@Autowired     
	private InterFoodieService service;
	
	@Autowired     
	private FileManager fileManager;
	
	@RequestMapping(value="/index.foodie")
	public String test_insert(HttpServletRequest request) {
		
		String message = "";
		
		request.setAttribute("message", message);
		
		return "main/index.tiles1";
	//  /WEB-INF/views/sample/test_insert.jsp 페이지를 만들어야 한다.
	}
	
}





