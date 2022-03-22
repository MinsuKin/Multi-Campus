package lab.spring.sikgu.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lab.spring.sikgu.model.StoreVO;
import lab.spring.sikgu.service.MapService;

@Controller
public class mapController {

	@Autowired
	MapService service;
	
	@RequestMapping(value="/map.do", method = RequestMethod.GET)
	public ModelAndView map() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("map");
		return mav;
	}
	
	@RequestMapping(value="/getMarkers.do", method=RequestMethod.POST)
	@ResponseBody
	public List<StoreVO> mapPost(@RequestBody Map<String, Object> Map) {
		HashMap<String, Object> bounds = (Map instanceof HashMap)? (HashMap<String, Object>) Map : new HashMap<String, Object>(Map);
		List<StoreVO> StoreList = service.getMarkers(bounds);
		return StoreList;
	}
}
