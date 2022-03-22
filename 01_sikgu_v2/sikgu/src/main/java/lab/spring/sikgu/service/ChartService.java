package lab.spring.sikgu.service;

import java.util.HashMap;
import java.util.List;

import lab.spring.sikgu.model.IncomeVO;
import lab.spring.sikgu.model.MaxIncomeVO;
import lab.spring.sikgu.model.move_incomeVO;
import lab.spring.sikgu.model.total_chartVO;

public interface ChartService {
	
	public List<IncomeVO> getPreIncomeChart(HashMap<String, Object> getIncomeInfo);
	public IncomeVO getIncomeDetail(HashMap<String, Object> getOneInfo);
	public List<move_incomeVO> getMoveIncome(HashMap<String, Object> getmoveIncome);
	public List<total_chartVO> getTotalChart(HashMap<String, Object> gettotalChart);
	public List<IncomeVO> getIncomeAgeRatio(HashMap<String, Object> getIncomeInfo);
	public List<MaxIncomeVO> getMaxIncomeChart(HashMap<String, Object> getMaxIncome);
}
