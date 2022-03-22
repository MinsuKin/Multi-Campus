package lab.spring.sikgu.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.servlet.ModelAndView;

import lab.spring.sikgu.model.MenuVO;
import lab.spring.sikgu.model.SikguVO;
import lab.spring.sikgu.model.StoreVO;
import lab.spring.sikgu.service.MenuService;
import lab.spring.sikgu.service.UserService;

@Controller
public class UserManageController {

	@Autowired
	UserService service;
	MenuService menuservice;
	HttpSession session;

	@RequestMapping(value = "/main.do")
	public String index() {
		return "MainHome";
	}
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String form() {
		return "login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(SikguVO user, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		SikguVO vo = null;
		vo = service.login(user.getSikgu_id(), user.getSikgu_pwd());
		StoreVO vo2 = null;
		vo2 = service.getStore(user.getSikgu_id());

		if (vo != null) {
			mav.addObject("user", vo);
			session.setAttribute("user", vo);
			session.setAttribute("store", vo2);

			mav.setViewName("MyPage");
		} else {
			if (service.loginCheckId(user.getSikgu_id()) != null) {
				mav.addObject("PWDErr", "비밀번호가 다릅니다.");
				System.out.println("비밀번호");
			} else {
				mav.addObject("IDErr", "존재하지 않는 아이디입니다.");
				System.out.println("아이디");
			}
			mav.setViewName("login");
		}
		System.out.println(mav.getModel().get("PWDErr"));
		System.out.println(mav.getModel().get("IDErr"));
		return mav;
	}

	@RequestMapping("/logout.do")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView("redirect:/login.do");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	public int postIdCheck(@RequestParam("sikgu_id") String sikgu_id) {
		SikguVO idCheck = service.loginCheckId(sikgu_id);
		int result = 0;
		if (idCheck != null || sikgu_id.length() > 15) {
			result = 1;
		}
		return result;
	}

	@RequestMapping(value = "/userSearch.do", method = RequestMethod.GET)
	public String formm() {
		return "userSearch";
	}

	@RequestMapping(value = "/userSearch.do", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("inputName_1") String sikgu_name,
			@RequestParam("inputPhone_1") String sikgu_phone) {

		String result = service.searchId(sikgu_name, sikgu_phone);

		System.out.println("아이디확인" + result);

		return result;
	}

	@RequestMapping(value = "/userSearch1.do", method = RequestMethod.POST)
	@ResponseBody
	public String userPwSearch(@RequestParam("inputId") String sikgu_id,
			@RequestParam("inputEmail_2") String sikgu_email) {

		String result = service.searchPassword(sikgu_id, sikgu_email);

		System.out.println("비밀번호확인" + result);

		return result;
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.GET)
	public String form2() {
		return "register";
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public ModelAndView insertSikgu(@ModelAttribute("user") SikguVO vo, BindingResult rs, HttpSession session) {
		session.setAttribute("user", vo);
		ModelAndView mav = new ModelAndView();
		mav.addObject("sikgu", vo.getSikgu_id());
		if (service.insertSikgu(vo) > 0) {
			mav.setViewName("register2");
		} else {
			mav.setViewName("redirect:/login.do");
		}
		return mav;
	}

	@RequestMapping(value = "/sikgu.do", method = RequestMethod.GET)
	public String formmm() {
		return "sikguinfo";
	}

	@RequestMapping(value = "/addS.do", method = RequestMethod.POST)
	public ModelAndView insertStore(@ModelAttribute("user") StoreVO vo, BindingResult rs) {
		ModelAndView mav = new ModelAndView();

		if (service.insertStore(vo) > 0) {
			mav.setViewName("MyPage");
		} else {
			mav.setViewName("register2");
		}
		return mav;
	}

	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public String mypage() {
		return "MyPage";
	}

	@RequestMapping(value = "/owner.do", method = RequestMethod.GET)
	public String Owner() {
		return "MyPageOwner";

	}
	@RequestMapping(value = "/updateOwner.do", method = RequestMethod.POST)
	public ModelAndView updateSikgu(@ModelAttribute("user") SikguVO vo, BindingResult rs) {
		ModelAndView mav = new ModelAndView();

		if (service.updateSikgu(vo) > 0) {
			mav.setViewName("MyPageOwner");
		} else {
			mav.setViewName("redirect:/owner.do");
		}
		return mav;
	}

	@RequestMapping(value = "/shop.do", method = RequestMethod.GET)
	public String Shop() {
		return "MyPageShop";
	}

	@RequestMapping(value = "/user/needLogin.do")
	public ModelAndView needLogin() throws Exception {
		ModelAndView mav = new ModelAndView("/user/loginWarning");
		mav.addObject("msg", "로그인 후 이용해주시기 바랍니다.");
		return mav;
	}
}
