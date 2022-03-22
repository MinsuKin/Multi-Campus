package lab.spring.sikgu.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lab.spring.sikgu.model.CustomerVO;
import lab.spring.sikgu.model.SikguVO;
import lab.spring.sikgu.model.StoreVO;
import lab.spring.sikgu.service.UserService;

@Controller 
public class UserManageController {

	@Autowired
	UserService service;

	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String form() {
		return"loginForm";
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public ModelAndView login(SikguVO user) {
		ModelAndView mav = new ModelAndView();
		SikguVO vo =null;
		vo = service.login(user.getSikgu_id(),user.getSikgu_pwd());
		mav.addObject("user",vo);
		if(vo!=null) {
			mav.setViewName("index");
		}else {
		mav.setViewName("loginFail");
	}
		return mav;
}

	
//	@RequestMapping(method=RequestMethod.POST)
//	public ModelAndView login(@RequestParam(value="sikgu_id", required=false) String uid,
//		@RequestParam(value="sikgu_pwd", required=false)String upwd) {
//		ModelAndView mav = new ModelAndView();
//		SikguVO vo =null;
//		vo = service.login(uid,upwd);
//		mav.addObject("user",vo);
//		if(vo!=null) {
//			mav.setViewName("index");
//		}else {
//		mav.setViewName("loginFail");
//	}
//	
//return mav;
	
	
//	@RequestMapping(method=RequestMethod.POST)
//	public ModelAndView login(UserVO user) {
//		ModelAndView mav = new ModelAndView();
//		UserVO vo =null;
//		vo = service.login(user.getUserid(),user.getUserpwd());
//		mav.addObject("user",vo);
//		if(vo!=null) {
//			mav.setViewName("loginSuccess");
//		}else {
//		mav.setViewName("loginFail");
//	}
//		return mav;
//				
//	}
	
	@RequestMapping(value = "/add.do", method=RequestMethod.GET)
	public String form2() {
		return "user_form";
	}
	
	@RequestMapping(value="/add.do", method=RequestMethod.POST)
	public ModelAndView insertSikgu(@ModelAttribute("user") SikguVO vo
			,BindingResult rs) {
		
		ModelAndView mav = new ModelAndView();
	 if(service.insertSikgu(vo)>0 && vo.getSikgu_type().equals("S")){
		mav.setViewName("storeinfo");// �������� ���� �������� �Ѿ
	 }else if(vo.getSikgu_type().equals("C")){
			mav.setViewName("customerinfo"); //������ ���� �������� �Ѿ

		}else{
			mav.setViewName("redirect:/login.do");
		}
		return mav; 
	}
	
	
	@RequestMapping(value = "/addC.do", method=RequestMethod.GET)
	public String form3() {
		return "customerinfo";
	}
	
	@RequestMapping(value="/addC.do", method=RequestMethod.POST)
	public ModelAndView insertCustomer(@ModelAttribute("user") CustomerVO vo
			,BindingResult rs) {
		
		ModelAndView mav = new ModelAndView();
		
		if(service.insertCustomer(vo)>0){
			mav.setViewName("index"); //ȸ�����Եǰ� ������������
		}else{
			mav.setViewName("customerinfo"); //ȸ�����Խ���
		}
		return mav; 
	}
	
	
	@RequestMapping(value = "/addS.do", method=RequestMethod.GET)
	public String form4() {
		//return "storeinfo";
		return "index"; //ȸ�����Եǰ� ������������
	}
	
	@RequestMapping(value="/addS.do", method=RequestMethod.POST)
	public ModelAndView insertStore(@ModelAttribute("user") StoreVO vo
			,BindingResult rs) {
		
		ModelAndView mav = new ModelAndView();
		
		if(service.insertStore(vo)>0){
			mav.setViewName("index"); //ȸ�����Եǰ� ������������
		}else{
			mav.setViewName("storeinfo"); //ȸ�����Խ���
		}
		return mav; 
	}
	
	
	@RequestMapping("/list.do")
	public ModelAndView listUser() {

		ModelAndView mav = new ModelAndView();
		List<SikguVO> userList = null;
		userList = service.getSikguList();
		mav.addObject("users",userList);
		mav.setViewName("user_list");
		return mav;
	}
	

	@RequestMapping("/view.do")
	public ModelAndView modifyUser(@RequestParam("sikgu_id")String uid) {
		ModelAndView mav = new ModelAndView();
		CustomerVO vo =null;
		vo =service.getCustomer(uid);
		mav.addObject("user",vo);
		mav.setViewName("user_modify");
		return mav;
	}
	
	
	@RequestMapping("/update.do")
	public ModelAndView updateUser(SikguVO user) {
		ModelAndView mav = new ModelAndView();
		if(service.updateSikgu(user) > 0) {
			mav.setViewName("index"); //������Ʈ �Ǹ� �α��� �� �������� �Ѿ�� ����(���� �Ȱ�ħ)
		}else{
			mav.setViewName("redirect:/view.do"); //������Ʈ �ȵǸ� ���� �޼��� �߰� �ٽ� �Է��ϰ� ����
		}
		return mav; 
	}
	
//	@RequestMapping("/remove.do")
//	public ModelAndView dropUser(@RequestParam("userid")String uid) {
//		ModelAndView mav = new ModelAndView();
//		if(service.removeUser(uid)>0) {
//			mav.setViewName("redirect:/login.do"); //���� �Ǹ� �̿밨�� �޼��� �߰� �α��� �������� �Ѿ�� ����
//		}else{
//			mav.setViewName("redirect:/view.do"); //���� �ȵǸ� ���� �޼��� �߰� �ٽ� ���� ��������
//		}
//		return mav; 
//	}
	
	
}

