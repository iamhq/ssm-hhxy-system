package cn.hqisgood.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.hqisgood.bean.Manager;
import cn.hqisgood.bean.SuperManager;
import cn.hqisgood.bean.Teacher;
import cn.hqisgood.bean.User;
import cn.hqisgood.service.ManagerService;
import cn.hqisgood.service.SuperService;
import cn.hqisgood.service.TeacherService;

@Controller
public class userController {
	@Autowired
	ManagerService managerService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	SuperService superService;

	@RequestMapping(value="/check", method=RequestMethod.POST)
	public String check(User user, Model model, HttpSession session) {
		Integer u = user.getU();
		System.out.println("userid = " + user.getUserId());
		//1代表超级管理员，2代表院系管理员，3代表教师
		if(u == 1) {
			SuperManager m = superService.login(user);
			if (m == null) {
				model.addAttribute("msg", "账号或密码错误");
				return "login";
			}else {
				session.setAttribute("USER", m);
				return "super";
			}
			
		}
		if(u == 2) {
			Manager m = managerService.login(user);
			if (m == null) {
				model.addAttribute("msg", "账号或密码错误");
				return "login";
			}else {
				session.setAttribute("USER", m);
				return "manager";
			}
			
		}
		if(u == 3) {
			Teacher m = teacherService.login(user);
			if (m == null) {
				model.addAttribute("msg", "账号或密码错误");
				return "login";
			}else {
				session.setAttribute("USER", m);
				return "teacher";
			}
		}
		model.addAttribute("msg", "账号或密码错误");
		return "login";
	}
	
	
	@RequestMapping("/toRegister")
	public String toRegister() {
		return "register";
	}
}
