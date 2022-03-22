package lab.spring.sikgu.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lab.spring.sikgu.dao.GraphDAO;
import lab.spring.sikgu.model.IncomeVO;
import lab.spring.sikgu.model.MaxIncomeVO;
import lab.spring.sikgu.model.move_incomeVO;
import lab.spring.sikgu.model.total_chartVO;


@Service("ChartService")
public class ChartSeviceImpl implements ChartService {

	@Autowired
	GraphDAO dao;
	
	public List<IncomeVO> getPreIncomeChart(HashMap<String, Object> getIncomeInfo) {
		return dao.getPreIncomeChart(getIncomeInfo);
	}
	public IncomeVO getIncomeDetail(HashMap<String, Object> getOneInfo) {
		return dao.getIncomeDetail(getOneInfo);
	}
	   
	public List<move_incomeVO> getMoveIncome(HashMap<String, Object> getmoveIncome) {
	      return dao.getMoveIncome(getmoveIncome);
	 }
	public List<total_chartVO> getTotalChart(HashMap<String, Object> gettotalChart) {
		return dao.getTotalChart(gettotalChart);
	}
	public List<IncomeVO> getIncomeAgeRatio(HashMap<String, Object> getIncomeInfo) {
		return dao.getIncomeAgeRatio(getIncomeInfo);
	}
	public List<MaxIncomeVO> getMaxIncomeChart(HashMap<String, Object> getMaxIncome) {
	    return dao.getMaxIncomeChart(getMaxIncome);
	}
}
