package lab.spring.sikgu.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lab.spring.sikgu.model.IncomeVO;
import lab.spring.sikgu.model.MaxIncomeVO;
import lab.spring.sikgu.model.move_incomeVO;
import lab.spring.sikgu.model.total_chartVO;

@Repository
public class GraphDAO {

	@Autowired
	SqlSession sqlsession;
	
	public List<IncomeVO> getPreIncomeChart(HashMap<String, Object> bounds) {
		return sqlsession.selectList("lab.mybatis.map.ChartMapper.getPreIncomeData", bounds);
	}
	public IncomeVO getIncomeDetail(HashMap<String, Object> Income_info) {
		return sqlsession.selectOne("lab.mybatis.map.ChartMapper.getIncomeDetail", Income_info);
	}	
	public List<move_incomeVO> getMoveIncome(HashMap<String, Object> move_Income_info) {
		      return sqlsession.selectList("lab.mybatis.map.ChartMapper.getMoveIncomeData", move_Income_info);
	}
	public List<total_chartVO> getTotalChart(HashMap<String, Object> move_Income_info) {
	      return sqlsession.selectList("lab.mybatis.map.ChartMapper.getTotalData", move_Income_info);
	}
	public List<IncomeVO> getIncomeAgeRatio(HashMap<String, Object> bounds) {
		return sqlsession.selectList("lab.mybatis.map.ChartMapper.age_ratio", bounds);
	}
	public List<MaxIncomeVO> getMaxIncomeChart(HashMap<String, Object> maxIncome) {
	    return sqlsession.selectList("lab.mybatis.map.ChartMapper.getMaxIncome", maxIncome);
	}
}
