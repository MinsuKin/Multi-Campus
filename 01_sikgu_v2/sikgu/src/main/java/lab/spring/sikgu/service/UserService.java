package lab.spring.sikgu.service;

import java.util.List;

import lab.spring.sikgu.model.CustomerVO;
import lab.spring.sikgu.model.SikguVO;
import lab.spring.sikgu.model.StoreVO;

public interface UserService {

	public SikguVO login(String sikgu_id, String sikgu_password);
	public SikguVO loginCheckId(String sikgu_id);
	public String searchId(String sikgu_name, String sikgu_phone);
	public String searchPassword(String sikgu_id, String sikgu_email);
	public List<SikguVO> getSikguList();
	public List<SikguVO> getStoreList();
	public SikguVO checkSikgu(String sikgu_id);
	public SikguVO checkStore(String store_biz_number);
	public int insertSikgu(SikguVO vo);
	public int insertStore(StoreVO vo);
	public int updateSikgu(SikguVO vo);
	public int updateStore(StoreVO vo);
	public StoreVO getStore(String sikgu_id);
}
