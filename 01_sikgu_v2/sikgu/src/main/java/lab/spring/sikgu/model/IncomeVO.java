package lab.spring.sikgu.model;

public class IncomeVO {
	
	private String s_name;
	private double mm_income;
	private double a10_ratio;
	private double a20_ratio;
	private double a30_ratio;
	private double a40_ratio;
	private double a50_ratio;
	private double a60_ratio;
	private double income;
	
	public IncomeVO() {
		super();
	}

	public IncomeVO(String s_name, double mm_income, double a10_ratio, double a20_ratio, double a30_ratio,
			double a40_ratio, double a50_ratio, double a60_ratio, double income) {
		super();
		this.s_name = s_name;
		this.mm_income = mm_income;
		this.a10_ratio = a10_ratio;
		this.a20_ratio = a20_ratio;
		this.a30_ratio = a30_ratio;
		this.a40_ratio = a40_ratio;
		this.a50_ratio = a50_ratio;
		this.a60_ratio = a60_ratio;
		this.income = income;
	}


	

	//getter
	public String getS_name() {return s_name;}
	public double getMm_income() {return mm_income;	}
	public double getA10_ratio() {return a10_ratio;	}
	public double getA20_ratio() {return a20_ratio;	}
	public double getA30_ratio() {return a30_ratio;	}
	public double getA40_ratio() {return a40_ratio;	}
	public double getA50_ratio() {return a50_ratio;	}
	public double getA60_ratio() {return a60_ratio;	}
	public double getIncome() {return income;}

	//setter
	public void setMm_income(double mm_income) {this.mm_income = mm_income;	}
	public void setA10_ratio(double a10_ratio) {this.a10_ratio = Math.round((this.mm_income*(a10_ratio/100))/10000);	}
	public void setA20_ratio(double a20_ratio) {this.a20_ratio = Math.round((this.mm_income*(a20_ratio/100))/10000);	}
	public void setA30_ratio(double a30_ratio) {this.a30_ratio = Math.round((this.mm_income*(a30_ratio/100))/10000);	}
	public void setA40_ratio(double a40_ratio) {this.a40_ratio = Math.round((this.mm_income*(a40_ratio/100))/10000);	}
	public void setA50_ratio(double a50_ratio) {this.a50_ratio = Math.round((this.mm_income*(a50_ratio/100))/10000);	}
	public void setA60_ratio(double a60_ratio) {this.a60_ratio = Math.round((this.mm_income*(a60_ratio/100))/10000);	}
	public void setS_name(String s_name) {this.s_name = s_name;	}
	public void setIncome(double income) {this.income = income;}
	
   }