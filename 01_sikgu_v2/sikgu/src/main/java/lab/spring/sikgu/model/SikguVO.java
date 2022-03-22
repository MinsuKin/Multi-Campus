package lab.spring.sikgu.model;

// 로그인용 VO (간편로그인 -> biznumber + 생성)

public class SikguVO {

	private String sikgu_id;
	private String sikgu_pwd;
	private long sikgu_biznumber;
	private String sikgu_name;
	private String sikgu_phone;
	private String sikgu_email;
	
	//constructor

	public SikguVO() {}
	public SikguVO(String sikgu_id, String sikgu_pwd, long sikgu_biznumber) {
		this.sikgu_id = sikgu_id;
		this.sikgu_pwd = sikgu_pwd;
		this.sikgu_biznumber = sikgu_biznumber;
		
	}
	public SikguVO(String sikgu_id, String sikgu_pwd, long sikgu_biznumber, String sikgu_name, String sikgu_phone,
			String sikgu_email) {
		this.sikgu_id = sikgu_id;
		this.sikgu_pwd = sikgu_pwd;
		this.sikgu_biznumber = sikgu_biznumber;
		this.sikgu_name = sikgu_name;
		this.sikgu_phone = sikgu_phone;
		this.sikgu_email = sikgu_email;
	}


	//getter
	public String getSikgu_id() {return sikgu_id;}
	public String getSikgu_pwd() {return sikgu_pwd;}
	public long getSikgu_biznumber() {return sikgu_biznumber;}
	public String getSikgu_name() {return sikgu_name;}
	public String getSikgu_phone() {return sikgu_phone;}
	public String getSikgu_email() {return sikgu_email;}
	

	//setter
	public void setSikgu_id(String sikgu_id) {this.sikgu_id = sikgu_id;}
	public void setSikgu_pwd(String sikgu_pwd) {this.sikgu_pwd = sikgu_pwd;}
	public void setSikgu_biznumber(Long sikgu_biznumber) {this.sikgu_biznumber = sikgu_biznumber;}
	public void setSikgu_biznumber(long sikgu_biznumber) {this.sikgu_biznumber = sikgu_biznumber;}
	public void setSikgu_name(String sikgu_name) {this.sikgu_name = sikgu_name;}
	public void setSikgu_phone(String sikgu_phone) {this.sikgu_phone = sikgu_phone;}
	public void setSikgu_email(String sikgu_email) {this.sikgu_email = sikgu_email;}
}
