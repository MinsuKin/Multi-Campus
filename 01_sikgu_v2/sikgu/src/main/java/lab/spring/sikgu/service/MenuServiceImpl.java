package lab.spring.sikgu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lab.spring.sikgu.dao.MenuDAO;
import lab.spring.sikgu.model.MenuVO;

@Service("MenuService")
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuDAO dao;


	public int insertMenu(MenuVO vo) {
		return dao.insertMenu(vo);
	}

	public List<MenuVO> getMenu(HashMap<String, Object> menus) {
		return dao.getMenu(menus);
	}

}
