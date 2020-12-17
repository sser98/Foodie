package com.spring.foodie.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.spring.foodie.common.FileManager;
import com.spring.foodie.model.SearchVO;
import com.spring.foodie.service.*;

//=== #30. 컨트롤러 선언 === 
@Component
@Controller
public class FoodieController {

	@Autowired     
	private InterFoodieService service;
	
	@Autowired     
	private FileManager fileManager;
	
	@RequestMapping(value="/index.food")
	public String test_insert(HttpServletRequest request) {
		
		return "main/index.tiles1";
	//  /WEB-INF/views/sample/test_insert.jsp 페이지를 만들어야 한다.
	}
	
	@RequestMapping(value ="/storeBoard/storeMain.food")
	public ModelAndView viewMainBoard(ModelAndView mav, HttpServletRequest request) {
		
		String hotPlace = request.getParameter("hotPlace");
		String hotPlaceInfo = request.getParameter("hotPlaceInfo");
		String scrollCtrl = request.getParameter("scrollCtrl");
		
		String target = " ";
		
		String Place = hotPlace.substring(0, hotPlace.indexOf(target));
		//System.out.println(hotPlace);
		
		List<SearchVO> storeList = service.getStoreList(Place,scrollCtrl);
		
		mav.addObject("storeList", storeList);
		mav.addObject("hotPlace", hotPlace);
		mav.addObject("hotPlaceInfo", hotPlaceInfo);
		mav.addObject("scrollCtrl", scrollCtrl);
		
		mav.setViewName("storeBoard/storeMain.tiles1");
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value ="/storeBoard/moreView.food", produces="text/plain;charset=UTF-8")
	public String moreView(HttpServletRequest request) {
		
		String hotPlace = request.getParameter("hotPlace");
		String hotPlaceInfo = request.getParameter("hotPlaceInfo");
		String scrollCtrl = request.getParameter("nscrollCtrl");
		
		String target = " ";
		
		String Place = hotPlace.substring(0, hotPlace.indexOf(target));
		
		List<Map<String,String>> storeList = service.moreView(Place,scrollCtrl);

		JSONArray jsonArr = new JSONArray();
		
		for (Map<String, String> svo : storeList) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("RNO", svo.get("RNO"));
			jsonObj.put("NAME", svo.get("NAME"));
			jsonObj.put("CALL", svo.get("CALL"));
			jsonObj.put("ADDRESS", svo.get("ADDRESS"));
			jsonObj.put("CODE", svo.get("CODE"));

			jsonArr.put(jsonObj);
		}
		 
		String json = jsonArr.toString();
		
		System.out.println(json);
		
 		return json;
	}
	
	@RequestMapping(value="/storeBoard/storeDetail.food", method = {RequestMethod.GET})
	public ModelAndView viewDetailBoard(ModelAndView mav, HttpServletRequest request) {
		
		String code = request.getParameter("code");
		
		SearchVO svo = service.getStoreDetail(code);
		
		mav.addObject("svo",svo);
		mav.setViewName("storeBoard/storeDetail.tiles1");
		
		return mav;
	}
	
}





