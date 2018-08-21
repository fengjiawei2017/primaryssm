package com.springmvc.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.entity.User;
import com.springmvc.entity.book;
import com.springmvc.service.AdminService;
import com.springmvc.service.BookService;
import com.springmvc.service.LoginService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;
	@Autowired
	LoginService loginservice;
	@Autowired
	BookService bookservice;

	@RequestMapping("/addbook")
	public ModelAndView addbook(HttpServletRequest request, book b) {
		ModelAndView mav = new ModelAndView();

		List<book> blist = adminservice.getBook();
		mav.addObject("blist", blist);

		List<User> userlist = adminservice.getUser();
		mav.addObject("userlist", userlist);

		String msg = request.getParameter("msg");
		mav.addObject("msg", msg);
		mav.setViewName("addbook");
		return mav;

	}

	@RequestMapping("/addbooktushu")
	public ModelAndView addbooktushu(HttpServletRequest request, book b) {
		ModelAndView mav = new ModelAndView();

		List<book> blist = adminservice.getBook();
		mav.addObject("blist", blist);

		List<User> userlist = adminservice.getUser();
		mav.addObject("userlist", userlist);

		if (adminservice.insertBook(b)) {
			mav.addObject("msg", "添加图书成功！");
			mav.setViewName("redirect:addbook");
			return mav;
		} else {
			mav.addObject("msg", "添加图书失败");
			mav.setViewName("redirect:addbook");
			return mav;

		}

	}

	@RequestMapping("/deletebook")
	public ModelAndView deletebook(HttpServletRequest request, int bid) {
		ModelAndView mav = new ModelAndView();

		List<book> blist = adminservice.getBook();
		mav.addObject("blist", blist);

		List<User> userlist = adminservice.getUser();
		mav.addObject("userlist", userlist);

		if (adminservice.deteleBook(bid) > 0) {

			mav.addObject("msg", "删除成功！");
			mav.setViewName("redirect:addbook");
			return mav;
		} else {
			mav.addObject("msg", "删除失败");
			mav.setViewName("redirect:addbook");
			return mav;
		}
	}

	@RequestMapping("/deleteuser")
	public ModelAndView deleteuser(HttpServletRequest request, int uid) {
		ModelAndView mav = new ModelAndView();

		List<book> blist = adminservice.getBook();
		mav.addObject("blist", blist);

		List<User> userlist = adminservice.getUser();
		mav.addObject("userlist", userlist);

		if (adminservice.deteleUser(uid) > 0) {

			mav.addObject("msg", "删除用户成功！");
			mav.setViewName("redirect:addbook");
			return mav;
		} else {
			mav.addObject("msg", "删除用户失败！");
			mav.setViewName("redirect:addbook");
			return mav;
		}

	}

	@RequestMapping("/update")
	public ModelAndView update(HttpServletRequest request, User user) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		
		if(u==null) {
			mav.addObject("msg", "请登录！");
			mav.setViewName("redirect:login");
			return mav;
		}
		int uid = u.getUid();
		
		user.setUid(uid);
		user.setSex(u.getSex());
		if (adminservice.updateUser(user) ){
			mav.addObject("msg", "修改成功！");
			mav.setViewName("redirect:addbook");
			return mav;
		} else {
			mav.addObject("msg", "修改成功！");
			mav.setViewName("redirect:addbook");
			return mav;
		}

	}
}
