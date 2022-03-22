package lab.spring.sikgu.model;

public class MenuVO {

		private String menu_id;
		private int menu_num;
		private int menu_price;
		private String menu_name;
		
		public MenuVO() {}
		
		public MenuVO(String menu_id, String menu_name, int menu_price) {
			this.menu_id = menu_id;
			this.menu_price = menu_price;
			this.menu_name = menu_name;
		}

		public MenuVO(int menu_num,String menu_id, String menu_name, int menu_price) {
			this.menu_id = menu_id;
			this.menu_num = menu_num;
			this.menu_price = menu_price;
			this.menu_name = menu_name;
		}
		public String getMenu_id() {return menu_id;}
		public int getMenu_num() {return menu_num;}
		public int getMenu_price() {return menu_price;}
		public String getMenu_name() {return menu_name;}
		
		public void setMenu_id(String menu_id) {this.menu_id = menu_id;}
		public void setMenu_num(int menu_num) {this.menu_num = menu_num;}
		public void setMenu_price(int menu_price) {this.menu_price = menu_price;}
		public void setMenu_name(String menu_name) {this.menu_name = menu_name;}
		
		
		
		
}
