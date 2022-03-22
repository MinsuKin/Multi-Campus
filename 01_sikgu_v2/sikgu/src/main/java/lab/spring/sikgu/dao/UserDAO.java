package lab.spring.sikgu.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lab.spring.sikgu.model.CustomerVO;
import lab.spring.sikgu.model.SikguVO;
import lab.spring.sikgu.model.StoreVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSession sqlsession;
	
// UserManage_嚥≪뮄�젃占쎌뵥#############################################################
	
	public SikguVO login(String sikgu_id, String sikgu_pwd) {
		Object vo = null;
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("sikgu_id", sikgu_id);
		hm.put("sikgu_pwd", sikgu_pwd);
		vo = sqlsession.selectOne("lab.mybatis.user.UserMapper.login", hm);
		return (SikguVO)vo;
	}
	public SikguVO loginCheckId(String sikgu_id) {
		Object vo = null;
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("sikgu_id", sikgu_id);
		vo = sqlsession.selectOne("lab.mybatis.user.UserMapper.loginCheckId", hm);
		return (SikguVO)vo;
	}

//  아이디 비밀번호 찾기 #############################################################

	public String searchId(String sikgu_name, String sikgu_phone) {
		String vo = null;
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("sikgu_name", sikgu_name);
		hm.put("sikgu_phone", sikgu_phone);
		vo = sqlsession.selectOne("lab.mybatis.user.UserMapper.searchId", hm);
		return vo;
	}
	public String searchPassword(String sikgu_id, String sikgu_email) {
		String vo = null;
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("sikgu_id", sikgu_id);
		hm.put("sikgu_email", sikgu_email);
		vo = sqlsession.selectOne("lab.mybatis.user.UserMapper.searchPassword", hm);
		return vo;
	}
	

// UserManage_占쎌읈筌ｏ옙 鈺곌퀬�돳 ###########################################################

	public List<SikguVO> getSikguList() {
		return sqlsession.selectList("lab.mybatis.user.UserMapper.getSikguList");
	}	
	public List<SikguVO> getStoreList() {
		return sqlsession.selectList("lab.mybatis.user.UserMapper.getStoreList");
	}
// / UserManage_占쎌읈筌ｏ옙 鈺곌퀬�돳 ###########################################################

// UserManage_占쎌돳占쎌뜚 揶쏉옙占쎌뿯 #############################################################

	public SikguVO checkSikgu(String sikgu_id) {
		return sqlsession.selectOne("lab.mybatis.user.UserMapper.checkSikgu", sikgu_id);
	}
	public SikguVO checkStore(String store_biz_number) {
		return sqlsession.selectOne("lab.mybatis.user.UserMapper.checkStore", store_biz_number);
	}
	public int insertSikgu(SikguVO vo) {
		return sqlsession.insert("lab.mybatis.user.UserMapper.insertSikgu", vo);
	}
	public int insertStore(StoreVO vo) {
		return sqlsession.insert("lab.mybatis.user.UserMapper.insertStore", vo);
	}

// / UserManage_占쎌돳占쎌뜚 揶쏉옙占쎌뿯 #############################################################

// UserManage_占쎌돳占쎌뜚 占쎌젟癰귨옙 占쎈땾占쎌젟 ############################################################

	public int updateSikgu(SikguVO vo) {
		return sqlsession.update("lab.mybatis.user.UserMapper.updateSikgu", vo);
	}
	public int updateStore(StoreVO vo) {
		return sqlsession.update("lab.mybatis.user.UserMapper.updateStore", vo);
	}
	
// / UserManage_占쎌돳占쎌뜚 占쎌젟癰귨옙 占쎈땾占쎌젟 ###########################################################


//	(sikgu_type == S) => storelist
	public StoreVO getStore(String sikgu_id) {
		return sqlsession.selectOne("lab.mybatis.user.UserMapper.getStore", sikgu_id);
	}
	
// / MYLIST_鈺곌퀬�돳 ###############################################################
	
	
}
