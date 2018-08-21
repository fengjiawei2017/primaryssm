package com.springmvc.service.impl;

import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.dao.*;
import com.springmvc.entity.Car;
import com.springmvc.entity.User;
import com.springmvc.entity.book;
import com.springmvc.entity.order;
import com.springmvc.service.BookService;



@Service
public class BookServiceImpl implements BookService {
	@Autowired
	CarDao cardao;
	@Autowired
	OrderDao orderdao;
	@Autowired
	BookDao bookdao;
	@Autowired
	UserDao userdao;
	
	@Override
	public List<Car> getCarBook(int uid) {
		// TODO Auto-generated method stub
		return cardao.getCarBook(uid);
	}

	@Override
	public book getbook(int bid) {
		// TODO Auto-generated method stub
		return bookdao.getbook(bid);
	}

	@Override
	public List<book> getNiceBook() {
		// TODO Auto-generated method stub
		return bookdao.getNiceBook();
	}

	@Override
	public boolean isContainBook(int uid, int bid) {
		// TODO Auto-generated method stub
		
		Car car= cardao.isContainBook(uid, bid);
		if(car!=null)
			return true;
		else
			return false;
	}

	@Override
	public int insertCarVal(int uid, book b) {
		// TODO Auto-generated method stub
		return cardao.insertCarVal(uid, b);
	}



	@Override
	public int selsnum(int uid) {
		// TODO Auto-generated method stub
		return cardao.selsnum(uid);
	}



	@Override
	public void clearBook(int uid) {
		// TODO Auto-generated method stub
		cardao.clearcar(uid);
		
	}

	@Override
	public User getUserById(int uid) {
		// TODO Auto-generated method stub
		return userdao.getUserById(uid);
	}

	@Override
	public void insertOrder(order o) {
		// TODO Auto-generated method stub
		orderdao.insertOrder(o);
	}

	@Override
	public int returnbook(int ordernum, int uid) {
		// TODO Auto-generated method stub
		return orderdao.returnbook(ordernum, uid);
	}

	@Override
	public boolean ModifyNum(int uid, int bid, int dnum) {
		// TODO Auto-generated method stub
		
		int num=cardao.selnum(uid, bid);
		if(dnum == -1 && num <= 1){//如果数量小于等于1就不能减
			return false;
		}
		
		cardao.updnum(uid, dnum, bid);//更新数量
		
		cardao.updtotal(uid, bid);//更新总价
		num=cardao.selnum(uid, bid);
		if(num>5)
			return false;
		else 
			return true;
		
		
		
		
		
		
		
	}

	@Override
	public void updatenum(int num, int bid) {
		// TODO Auto-generated method stub
		bookdao.updatenum(num, bid);
	}

	@Override
	public int updatenum1(int count, int bbid) {
		// TODO Auto-generated method stub
		return bookdao.updatenum1(count, bbid);
	}

	@Override
	public List<book> selectbook(String chaxun,int current,int everyPage) {
		// TODO Auto-generated method stub
		return bookdao.selectbook(chaxun,current, everyPage);
	}

	@Override
	public void deleteBook(int uid, int bookid) {
		// TODO Auto-generated method stub
		cardao.delebook(uid, bookid);
	}

	@Override
	public List<order> getorderBook(int uid) {
		// TODO Auto-generated method stubs
		return orderdao.getorderBook(uid);
	}

	@Override
	public int getCont() {
		// TODO Auto-generated method stub
		return bookdao.selectbooknum();
	}

	@Override
	public int findAll(String chaxun) {
		// TODO Auto-generated method stub
		List<book> list=bookdao.findAll(chaxun);
 		return list.size();
	}



	
	

	

	

	

}
