package com.springmvc.controller;

import java.text.SimpleDateFormat;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springmvc.dao.*;
import com.springmvc.entity.*;
import com.springmvc.service.*;

@Controller
public class BookController {

	@Autowired
	BookService bookservice;

	@RequestMapping("/addtocar")

	public ModelAndView addtocar(HttpServletRequest request, int bid) {
		ModelAndView mav = new ModelAndView();

		book b = new book();

		b = bookservice.getbook(bid);

		List<book> list = bookservice.getNiceBook();
		mav.addObject("goodbook", list);

		HttpSession session = request.getSession();
		if (session.getAttribute("uid") == null) {
			/* 判断用户是否为空 */
			request.setAttribute("msg", "您尚未登录，请先登录！");
			mav.setViewName("redirect:index");
			return mav;
		} else {

			int uid = (Integer) session.getAttribute("uid");

			// 查看要插入的书是否已经插入
			if (bookservice.isContainBook(uid, bid)) {
				request.setAttribute("msg", "此书已加入借书车，请勿重复添加！");
				mav.setViewName("index");
				return mav;
			} else {

				bookservice.insertCarVal(uid, b);
				request.setAttribute("msg", "加入借书车成功！");
				mav.setViewName("index");
				return mav;
			}

		}

	}

	@RequestMapping("/car")
	public ModelAndView car(HttpServletRequest request, String m) {
		ModelAndView mav = new ModelAndView();

		// 获取重定向传的msg
		String msg = request.getParameter("msg");
		mav.addObject("msg", msg);

		HttpSession session = request.getSession();
		if (session.getAttribute("uid") != null) {
			int uid = (Integer) session.getAttribute("uid");
			if (m != null) {
				if (m.equals("1")) {
					mav.addObject("msg", "数量为1，已不能再减少！");
				} else if (m.equals("2")) {
					mav.addObject("msg", "删除成功！");
				} else if (m.equals("3")) {
					mav.addObject("msg", "清空借书车成功！");
				} else if (m.equals("4")) {
					mav.addObject("msg", "最大借阅数量为5本！");
				}
			}

			List<Car> list = bookservice.getCarBook(uid);
			mav.addObject("list", list);
			int totalNum = bookservice.selsnum(uid);
			mav.addObject("totalNum", totalNum);

			mav.setViewName("borrow");
			return mav;
		} else {
			mav.addObject("msg", "您尚未登录，请先登录！");
			mav.setViewName("index");
			return mav;
		}

	}

	@RequestMapping("/addbnum")
	public ModelAndView addbnum(HttpServletRequest request, int hid, String m) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		int uid = (Integer) (session.getAttribute("uid"));
		int bid = Integer.parseInt((String) request.getParameter("bookid"));

		int totalNum = bookservice.selsnum(uid);
		if (totalNum < 5 && bookservice.ModifyNum(uid, bid, hid)) {

			totalNum = bookservice.selsnum(uid);
			;
			mav.addObject("totalNum", totalNum);
			List<Car> list = bookservice.getCarBook(uid);
			mav.addObject("list", list);
			mav.setViewName("borrow");
			return mav;
		} else {
			List<Car> list = bookservice.getCarBook(uid);
			mav.addObject("list", list);
			m = "" + 4;
			if (m != null) {
				if (m.equals("1")) {
					mav.addObject("msg", "数量为1，已不能再减少！");
				} else if (m.equals("2")) {
					mav.addObject("msg", "删除成功！");
				} else if (m.equals("3")) {
					mav.addObject("msg", "清空借书车成功！");
				} else if (m.equals("4")) {
					mav.addObject("msg", "最大借阅数量为5本！");
				}
			}
			mav.addObject("totalNum", totalNum);
			mav.setViewName("borrow");
			return mav;
		}
	}

	@RequestMapping("/subbnum")
	public ModelAndView subbnum(HttpServletRequest request, int hid, String m) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		int uid = (Integer) (session.getAttribute("uid"));
		int bid = Integer.parseInt((String) request.getParameter("bookid"));

		int totalNum = bookservice.selsnum(uid);
		if (bookservice.ModifyNum(uid, bid, hid)) {
			totalNum = bookservice.selsnum(uid);
			mav.addObject("totalNum", totalNum);
			List<Car> list = bookservice.getCarBook(uid);
			mav.addObject("list", list);
			mav.setViewName("borrow");
			return mav;
		} else {
			List<Car> list = bookservice.getCarBook(uid);
			mav.addObject("list", list);
			m = "" + 1;
			if (m != null) {
				if (m.equals("1")) {
					mav.addObject("msg", "数量为1，已不能再减少！");
				} else if (m.equals("2")) {
					mav.addObject("msg", "删除成功！");
				} else if (m.equals("3")) {
					mav.addObject("msg", "清空借书车成功！");
				} else if (m.equals("4")) {
					mav.addObject("msg", "最大借阅数量为5本！");
				}
			}
			mav.addObject("totalNum", totalNum);
			mav.setViewName("borrow");
			return mav;
		}
	}

	@RequestMapping("/delbnum")
	public ModelAndView delbnum(HttpServletRequest request, int bookid, String m) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		int uid = (Integer) session.getAttribute("uid");

		bookservice.deleteBook(uid, bookid);
		List<Car> list = bookservice.getCarBook(uid);
		mav.addObject("list", list);
		m = "" + 2;
		if (m != null) {
			if (m.equals("1")) {
				mav.addObject("msg", "数量为1，已不能再减少！");
			} else if (m.equals("2")) {
				mav.addObject("msg", "删除成功！");
			} else if (m.equals("3")) {
				mav.addObject("msg", "清空借书车成功！");
			} else if (m.equals("4")) {
				mav.addObject("msg", "最大借阅数量为5本！");
			}
		}
		mav.setViewName("borrow");
		return mav;
	}

	@RequestMapping("/delcar")
	public ModelAndView delcar(HttpServletRequest request, String m) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		int uid = (Integer) session.getAttribute("uid");

		bookservice.clearBook(uid);
		List<Car> list = bookservice.getCarBook(uid);
		mav.addObject("list", list);
		m = "" + 3;
		if (m != null) {
			if (m.equals("1")) {
				mav.addObject("msg", "数量为1，已不能再减少！");
			} else if (m.equals("2")) {
				mav.addObject("msg", "删除成功！");
			} else if (m.equals("3")) {
				mav.addObject("msg", "清空借书车成功！");
			} else if (m.equals("4")) {
				mav.addObject("msg", "最大借阅数量为5本！");
			}
		}
		mav.setViewName("borrow");
		return mav;

	}

	@RequestMapping("/lend")
	public ModelAndView lend(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		int uid = (Integer) (session.getAttribute("uid"));
		int totalNum = bookservice.selsnum(uid);
		if (totalNum <= 5) {

			List<Car> carList = bookservice.getCarBook(uid);

			User user = bookservice.getUserById(uid);
			String status = "已借";

			// 一下两段为时间格式
			Date d = new Date();
			System.out.println(d);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
			String lend = sdf.format(d);
			System.out.println("借书日期：" + lend);

			Calendar c = Calendar.getInstance();
			Date date = new Date();
			c.setTime(date);
			c.add(Calendar.DATE, 90);
			Date newDate = c.getTime();
			String returnsday = sdf.format(newDate);
			System.out.println("还书日期：" + returnsday);

			for (Car car : carList) {
				order o = new order();
				o.setUid(uid);
				o.setBid(car.getBid());
				o.setUname(user.getUserName());
				o.setBname(car.getCname());
				o.setBnum(car.getNum());
				o.setStatus(status);
				o.setLend(lend);
				o.setReturns(returnsday);
				bookservice.updatenum(car.getNum(), car.getBid());
				bookservice.insertOrder(o);
			}
			// 数据插入后将购物车清空
			bookservice.clearBook(uid);

			List<Car> olist = bookservice.getCarBook((int) session.getAttribute("uid"));
			mav.addObject("olist", olist);
			mav.addObject("msg", "借阅成功！");
			mav.setViewName("redirect:order");
			return mav;
		} else {

			mav.addObject("msg", "最大借阅数量为5本！！！");
			List<Car> list = bookservice.getCarBook(uid);
			mav.addObject("list", list);
			mav.setViewName("redirect:car");
			return mav;
		}

	}

	@RequestMapping("/returnbook")
	public ModelAndView returnbook(HttpServletRequest request, String oid, String num, String bid) {
		ModelAndView mav = new ModelAndView();

		int ordernum = Integer.parseInt(oid);
		System.out.println("ordernm" + ordernum);

		int count = Integer.parseInt(num);
		System.out.println("count" + count);

		int bbid = Integer.parseInt(bid);
		System.out.print("bbid" + bbid);

		HttpSession session = request.getSession();
		int uid = (Integer) session.getAttribute("uid");

		List<Car> olist = bookservice.getCarBook((int) session.getAttribute("uid"));
		mav.addObject("olist", olist);

		if ((bookservice.returnbook(ordernum, uid)) > 0 && (bookservice.updatenum1(count, bbid) > 0)) {
			mav.setViewName("redirect:order");
			return mav;
		} else {
			mav.setViewName("redirect:order");
			return mav;
		}

	}

	@RequestMapping("/select")
	public ModelAndView select(HttpServletRequest request, String chaxun) {
		ModelAndView mav = new ModelAndView();
		
		if(chaxun==null||chaxun=="") {
			mav.addObject("msg", "关键词不能为空！");
			mav.setViewName("index");
			return mav;
		}
		mav.addObject("chaxun", chaxun);
		
		
		int everyPage = 10;// 每页记录数
		int totalCount = bookservice.findAll(chaxun);// 获取总记录数
		int totalPage = totalCount % everyPage == 0 ? totalCount / everyPage : totalCount / everyPage + 1; // 计算需要多少页
		mav.addObject("totalPage", totalPage);
		
		String scurrentPage = request.getParameter("currentPage");
		int currentPage = 1; // 当前页，默认1
		if (scurrentPage == null) {
			currentPage = 1;// 从第一页开始访问
		} else {
			currentPage = Integer.parseInt(scurrentPage);
		}
		mav.addObject("currentPage", currentPage);

		// 当前页的第一条信息的位置
		int current = (currentPage - 1) * everyPage;

		List<book> slist = bookservice.selectbook(chaxun, current, everyPage);
		mav.addObject("slist", slist);

		
		mav.setViewName("select");
		return mav;

	}

}
