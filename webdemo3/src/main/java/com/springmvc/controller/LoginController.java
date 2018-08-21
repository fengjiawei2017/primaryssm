package com.springmvc.controller;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.entity.*;
import com.springmvc.service.*;

@Controller
public class LoginController {

	@Autowired
	LoginService loginservice;
	@Autowired
	AdminService adminservice;
	@Autowired
	BookService bookservice;

	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		List<book> list = loginservice.getNiceBook();
		mav.addObject("goodbook", list);
		mav.setViewName("index");
		return mav;
	}

	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String msg = request.getParameter("msg");
		String error1 = request.getParameter("error1");
		mav.addObject("error1", error1);
		mav.addObject("msg", msg);
		mav.setViewName("register");
		return mav;
	}

	@RequestMapping("/center")
	public ModelAndView center(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("uid") != null) {
			int uid = (int) session.getAttribute("uid");
			User u = adminservice.getUserById(uid);
			mav.addObject("u", u);
		}
		mav.setViewName("center");
		return mav;
	}

	@RequestMapping("/addbooks")
	public String addbooks(HttpServletRequest request) {

		return "addbook";
	}

	@RequestMapping("/order")
	public ModelAndView order(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		if (session.getAttribute("uid") != null) {
			List<order> olist = bookservice.getorderBook((int) session.getAttribute("uid"));
			mav.addObject("olist", olist);
		}
		mav.setViewName("order");
		return mav;
	}

	@RequestMapping("/denglujiemian")
	public ModelAndView denglujiemian(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/logina")
	public ModelAndView logina(HttpServletRequest request, String userName) {
		ModelAndView mav = new ModelAndView();
		
		User user = new User();

		// String username=request.getParameter("userName");
		String userpwd = request.getParameter("userPwd");
		user = loginservice.checkUser(userName, userpwd);
		HttpSession session = request.getSession();
		session.setAttribute("a", new Date());

		String msg = request.getParameter("msg");
		mav.addObject("msg", msg);
		if (user != null) {

			session.setAttribute("username", user.getUserName());
			session.setAttribute("userpwd", user.getUserPwd());
			session.setAttribute("user", user);
			session.setAttribute("uid", user.getUid());
			request.setAttribute("error", null);

			if (userName.equals("admin")) {

				mav.setViewName("redirect:addbook");
				return mav;

			} else {
				
				mav.setViewName("redirect:index");
				return mav;
			}
		} else {
			mav.addObject("msg", "请检查账号 或密码是否有误");
			mav.setViewName("login");
			return mav;
		}

	}

	@RequestMapping("/registers")
	public ModelAndView register(HttpServletRequest request, User u, String pwd) {
		ModelAndView mav = new ModelAndView();

		if (loginservice.checkuser(u.getUserName())) {
			mav.addObject("error2", new String("用户已存在"));
			mav.setViewName("redirect:register");
			return mav;
		} else {

			if (u.getUserPwd().equals(pwd)) {

				if (loginservice.insertData(u) > 0) {

					mav.addObject("msg", "注册成功");

					mav.setViewName("redirect:login");
					return mav;
				} else {

					mav.addObject("msg", "注册失败");
					mav.setViewName("redirect:register");
					return mav;
				}

			} else {
				mav.addObject("error1", "两次输入密码不一样");
				mav.setViewName("redirect:register");
				return mav;
			}

		}

	}

	@RequestMapping("/loginOut")
	public String loginOut(HttpServletRequest request, User u, String pwd) {

		HttpSession session = request.getSession();
		session.setAttribute("username", null);
		session.setAttribute("uid", null);

		return "redirect:index";
	}

}
