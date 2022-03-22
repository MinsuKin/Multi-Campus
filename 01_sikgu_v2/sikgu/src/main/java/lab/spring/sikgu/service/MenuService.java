package lab.spring.sikgu.service;

import java.util.HashMap;
import java.util.List;

import lab.spring.sikgu.model.MenuVO;

public interface MenuService {

	public List<MenuVO> getMenu(HashMap<String, Object> menus);
	public int insertMenu(MenuVO vo);

}
