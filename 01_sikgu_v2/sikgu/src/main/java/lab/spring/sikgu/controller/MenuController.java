package lab.spring.sikgu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lab.spring.sikgu.model.MenuVO;
import lab.spring.sikgu.service.MenuService;

@Controller
public class MenuController<Int> {

	@Autowired
	MenuService service;
	
	@RequestMapping(value="/getMenu.do", method=RequestMethod.POST)
	@ResponseBody
	public List<MenuVO> getMenu(@RequestBody Map<String, Object> Map) {		 
		HashMap<String, Object> searchKey = (Map instanceof HashMap)? (HashMap<String, Object>) Map : new HashMap<String, Object>(Map);
		List<MenuVO> menus = service.getMenu(searchKey);
		return menus;
		
	}
	
	@RequestMapping(value="/insertMenu.do", method=RequestMethod.POST)	
	public ModelAndView insertMenu(@RequestParam("sikgu_id") String sikgu_id,@RequestParam(value="menu_name",required=true) String[] name,
			@RequestParam(value="menu_price",required=true) int[] price) {
		ModelAndView mav = new ModelAndView();
		MenuVO vo = new MenuVO();
		vo.setMenu_id(sikgu_id);
		
		for(int i=0;i<name.length;i++) {
			vo.setMenu_name(name[i]);
			vo.setMenu_price(price[i]);
			if(service.insertMenu(vo)>0) {}
			else {
				break;
			}
		}
		 mav.setViewName("MainHome");
		return mav; 
	}
	

}
