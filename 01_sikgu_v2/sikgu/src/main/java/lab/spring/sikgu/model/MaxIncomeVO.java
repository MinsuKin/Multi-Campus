package lab.spring.sikgu.model;

public class MaxIncomeVO {
   
   private String S_NAME;
   private String gubun;
   private long max_store_income;
   
   // constructor
   public MaxIncomeVO() {}
   public MaxIncomeVO(String s_NAME, String gubun, long max_store_income) {
      S_NAME = s_NAME;
      this.gubun = gubun;
      this.max_store_income = max_store_income;
   }
   
   //getter , setter 
   
   public String getS_NAME() {
      return S_NAME;
   }
   public String getGubun() {
      return gubun;
   }
   public long getMax_store_income() {
      return max_store_income;
   }
   public void setS_NAME(String s_NAME) {
      S_NAME = s_NAME;
   }
   public void setGubun(String gubun) {
      this.gubun = gubun;
   }
   public void setMax_store_income(long max_store_income) {
      this.max_store_income = max_store_income;
   }
}