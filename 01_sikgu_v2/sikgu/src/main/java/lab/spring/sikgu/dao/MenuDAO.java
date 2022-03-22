package lab.spring.sikgu.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lab.spring.sikgu.model.MenuVO;

@Repository
public class MenuDAO {

	@Autowired
	SqlSession sqlsession;
	
	public List<MenuVO> getMenu(HashMap<String, Object> menus) {
		return sqlsession.selectList("lab.mybatis.menu.MenuMapper.getMenu", menus);
	}

	public int insertMenu(MenuVO vo) {
		return sqlsession.insert("lab.mybatis.menu.MenuMapper.insertMenu", vo);
	}

}
