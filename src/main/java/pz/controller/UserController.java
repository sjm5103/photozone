package pz.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import pz.service.UserService;
import pz.vo.UserVo;

@Controller
@Slf4j
public class UserController {
	
	@Autowired
	UserService userService;

	@PostMapping("/userSignup.do")
	@ResponseBody
	public boolean signup(UserVo vo) throws Exception {
		return userService.signup(vo);
	}
	
	@GetMapping("/login.do")
	@ResponseBody
	public ModelAndView login(@RequestParam String userid, @RequestParam String pwd, @RequestParam boolean autoLogin,
																HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:main.do");
		
		UserVo vo = userService.login(userid, pwd);
		
		if(vo.getUsername() == null) {
			return mv;
		}
		
		if(autoLogin) {
			Cookie autoLoginCookie = new Cookie("autoLogin", String.valueOf(autoLogin));
			autoLoginCookie.setMaxAge(60 * 60 * 24 * 10); //10일 유지
			Cookie useridCookie = new Cookie("userid", userid);
			useridCookie.setMaxAge(60 * 60 * 24 * 10); //10일 유지
			
			response.addCookie(autoLoginCookie);
			response.addCookie(useridCookie);
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("userid", vo.getUserid());
		}
		
		mv.addObject("vo", vo);	
		
		return mv;
	}
	
	@GetMapping("logout.do")
	public ModelAndView logout(
			@CookieValue(value = "autoLogin", required = false) boolean autoLoginCookie,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:main.do");
		
		if(autoLoginCookie) {
			Cookie autoLoginCookie2 = new Cookie("autoLogin", null);
			autoLoginCookie2.setMaxAge(0); //0초 유지
			Cookie useridCookie = new Cookie("userid", null);
			useridCookie.setMaxAge(0); //0초 유지
			
			response.addCookie(autoLoginCookie2);
			response.addCookie(useridCookie);
		} else {
			HttpSession session = request.getSession();
			session.removeAttribute("userid");
		}
		
		return mv;
	}
	
	@PostMapping("/updateUser.do")
	@ResponseBody
	public int updateUser(UserVo vo) throws Exception {
		log.info("{}", vo);
		int result = userService.updateUser(vo);
		log.info("result: {}", result);
		return result;
	}
	
	@PostMapping("/deleteUser.do")
	@ResponseBody
	public boolean deleteUser(String userid) throws Exception {
		return userService.deleteUser(userid);
	}
	
	  @PostMapping("/userIdCheck.do")
	  @ResponseBody 
	  public boolean idCheck(String userid) throws Exception {
		  boolean result = userService.idCheck(userid); 
		  return result; 
	  }
		 
	
	@PostMapping("/nicknameCheck.do")
	@ResponseBody
	public boolean nicknameCheck(String nickname) throws Exception {
		log.info("nickname: {}", nickname);
		boolean result = userService.nicknameCheck(nickname);
		return result;
	}
}
