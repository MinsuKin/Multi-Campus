package lab.spring.sikgu.model;

public class total_chartVO {
   
    private String s_name;
    private double mm_income;
    private double cnt;
    private double a1_income;
    private double a2_income;
    private double a3_income;
    private double a4_income;
    private double a5_income;
    private double a6_income;
    private double a1_wor_pop;
    private double a2_wor_pop;
    private double a3_wor_pop;
    private double a4_wor_pop;
    private double a5_wor_pop;
    private double a6_wor_pop;
    private double a1_mov_pop;
    private double a2_mov_pop;
    private double a3_mov_pop;
    private double a4_mov_pop;
    private double a5_mov_pop;
    private double a6_mov_pop;
   
    
    //constructor
    public total_chartVO() {}

    

	public total_chartVO(String s_name, double mm_income, double cnt, double a1_income, double a2_income,
			double a3_income, double a4_income, double a5_income, double a6_income, double a1_wor_pop,
			double a2_wor_pop, double a3_wor_pop, double a4_wor_pop, double a5_wor_pop, double a6_wor_pop,
			double a1_mov_pop, double a2_mov_pop, double a3_mov_pop, double a4_mov_pop, double a5_mov_pop,
			double a6_mov_pop) {
		super();
		this.s_name = s_name;
		this.mm_income = mm_income;
		this.cnt = cnt;
		this.a1_income = a1_income;
		this.a2_income = a2_income;
		this.a3_income = a3_income;
		this.a4_income = a4_income;
		this.a5_income = a5_income;
		this.a6_income = a6_income;
		this.a1_wor_pop = a1_wor_pop;
		this.a2_wor_pop = a2_wor_pop;
		this.a3_wor_pop = a3_wor_pop;
		this.a4_wor_pop = a4_wor_pop;
		this.a5_wor_pop = a5_wor_pop;
		this.a6_wor_pop = a6_wor_pop;
		this.a1_mov_pop = a1_mov_pop;
		this.a2_mov_pop = a2_mov_pop;
		this.a3_mov_pop = a3_mov_pop;
		this.a4_mov_pop = a4_mov_pop;
		this.a5_mov_pop = a5_mov_pop;
		this.a6_mov_pop = a6_mov_pop;
	}



	public String getS_name() {	return s_name;}
	public void setS_name(String s_name) {this.s_name = s_name;}
	public double getMm_income() {	return mm_income;}
	public void setMm_income(double mm_income) {this.mm_income = mm_income;	}	
	public double getCnt() {return cnt;}
	public void setCnt(double cnt) {this.cnt = cnt;}
	public double getA1_income() {	return a1_income;}
	public void setA1_income(double a1_income) {this.a1_income = a1_income/cnt;	}
	public double getA2_income() {	return a2_income;}
	public void setA2_income(double a2_income) {this.a2_income = a2_income/cnt;}
	public double getA3_income() {return a3_income;}
	public void setA3_income(double a3_income) {this.a3_income = a3_income/cnt;}
	public double getA4_income() {return a4_income;}
	public void setA4_income(double a4_income) {this.a4_income = a4_income/cnt;}
	public double getA5_income() {return a5_income;}
	public void setA5_income(double a5_income) {this.a5_income = a5_income/cnt;}
	public double getA6_income() {return a6_income;}
	public void setA6_income(double a6_income) {this.a6_income = a6_income/cnt;}
	public double getA1_wor_pop() {return a1_wor_pop;}
	public void setA1_wor_pop(double a1_wor_pop) {this.a1_wor_pop = a1_wor_pop;}
	public double getA2_wor_pop() {return a2_wor_pop;}
	public void setA2_wor_pop(double a2_wor_pop) {this.a2_wor_pop = a2_wor_pop;}
	public double getA3_wor_pop() {return a3_wor_pop;}
	public void setA3_wor_pop(double a3_wor_pop) {this.a3_wor_pop = a3_wor_pop;}
	public double getA4_wor_pop() {return a4_wor_pop;}
	public void setA4_wor_pop(double a4_wor_pop) {this.a4_wor_pop = a4_wor_pop;}
	public double getA5_wor_pop() {return a5_wor_pop;}
	public void setA5_wor_pop(double a5_wor_pop) {this.a5_wor_pop = a5_wor_pop;}
	public double getA6_wor_pop() {return a6_wor_pop;}
	public void setA6_wor_pop(double a6_wor_pop) {this.a6_wor_pop = a6_wor_pop;}
	public double getA1_mov_pop() {return a1_mov_pop;}
	public void setA1_mov_pop(double a1_mov_pop) {this.a1_mov_pop = a1_mov_pop;}
	public double getA2_mov_pop() {return a2_mov_pop;}
	public void setA2_mov_pop(double a2_mov_pop) {this.a2_mov_pop = a2_mov_pop;}
	public double getA3_mov_pop() {return a3_mov_pop;}
	public void setA3_mov_pop(double a3_mov_pop) {this.a3_mov_pop = a3_mov_pop;}
	public double getA4_mov_pop() {return a4_mov_pop;}
	public void setA4_mov_pop(double a4_mov_pop) {this.a4_mov_pop = a4_mov_pop;}
	public double getA5_mov_pop() {return a5_mov_pop;}
	public void setA5_mov_pop(double a5_mov_pop) {this.a5_mov_pop = a5_mov_pop;}
	public double getA6_mov_pop() {return a6_mov_pop;}
	public void setA6_mov_pop(double a6_mov_pop) {this.a6_mov_pop = a6_mov_pop;}    
	
	
	
}