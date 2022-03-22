package lab.spring.sikgu.model;

public class move_incomeVO {
   
    private String s_name;
    private String mm_income;
    private String t1_income;
    private String t2_income;
    private String t3_income;
    private String t4_income;
    private String t5_income;
    private String t6_income;
    private String T1_mov_pop;
    private String T2_mov_pop;
    private String T3_mov_pop;
    private String T4_mov_pop;
    private String T5_mov_pop;
    private String T6_mov_pop;
   
    
    //constructor
    public move_incomeVO() {}
    public move_incomeVO(String s_name, String mm_income, String t1_income, String t2_income, String t3_income,
         String t4_income, String t5_income, String t6_income, String t1_mov_pop, String t2_mov_pop,
         String t3_mov_pop, String t4_mov_pop, String t5_mov_pop, String t6_mov_pop) {
      super();
      this.s_name = s_name;
      this.mm_income = mm_income;
      this.t1_income = t1_income;
      this.t2_income = t2_income;
      this.t3_income = t3_income;
      this.t4_income = t4_income;
      this.t5_income = t5_income;
      this.t6_income = t6_income;
      T1_mov_pop = t1_mov_pop;
      T2_mov_pop = t2_mov_pop;
      T3_mov_pop = t3_mov_pop;
      T4_mov_pop = t4_mov_pop;
      T5_mov_pop = t5_mov_pop;
      T6_mov_pop = t6_mov_pop;
    }
    
   //getter , setter
   public String getS_name() {
      return s_name;
   }
   public String getMm_income() {
      return mm_income;
   }
   public String getT1_income() {
      return t1_income;
   }
   public String getT2_income() {
      return t2_income;
   }
   public String getT3_income() {
      return t3_income;
   }
   public String getT4_income() {
      return t4_income;
   }
   public String getT5_income() {
      return t5_income;
   }
   public String getT6_income() {
      return t6_income;
   }
   public String getT1_mov_pop() {
      return T1_mov_pop;
   }
   public String getT2_mov_pop() {
      return T2_mov_pop;
   }
   public String getT3_mov_pop() {
      return T3_mov_pop;
   }
   public String getT4_mov_pop() {
      return T4_mov_pop;
   }
   public String getT5_mov_pop() {
      return T5_mov_pop;
   }
   public String getT6_mov_pop() {
      return T6_mov_pop;
   }
   public void setS_name(String s_name) {
      this.s_name = s_name;
   }
   public void setMm_income(String mm_income) {
      this.mm_income = mm_income;
   }
   public void setT1_income(String t1_income) {
      this.t1_income = t1_income;
   }
   public void setT2_income(String t2_income) {
      this.t2_income = t2_income;
   }
   public void setT3_income(String t3_income) {
      this.t3_income = t3_income;
   }
   public void setT4_income(String t4_income) {
      this.t4_income = t4_income;
   }
   public void setT5_income(String t5_income) {
      this.t5_income = t5_income;
   }
   public void setT6_income(String t6_income) {
      this.t6_income = t6_income;
   }
   public void setT1_mov_pop(String t1_mov_pop) {
      T1_mov_pop = t1_mov_pop;
   }
   public void setT2_mov_pop(String t2_mov_pop) {
      T2_mov_pop = t2_mov_pop;
   }
   public void setT3_mov_pop(String t3_mov_pop) {
      T3_mov_pop = t3_mov_pop;
   }
   public void setT4_mov_pop(String t4_mov_pop) {
      T4_mov_pop = t4_mov_pop;
   }
   public void setT5_mov_pop(String t5_mov_pop) {
      T5_mov_pop = t5_mov_pop;
   }
   public void setT6_mov_pop(String t6_mov_pop) {
      T6_mov_pop = t6_mov_pop;
   }
    
}