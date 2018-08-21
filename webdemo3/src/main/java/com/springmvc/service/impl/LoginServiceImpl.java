package com.springmvc.service.impl;

import java.awt.print.Book;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.dao.BookDao;
import com.springmvc.dao.UserDao;
import com.springmvc.entity.User;
import com.springmvc.entity.book;
import com.springmvc.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	BookDao bookDao;
	@Autowired
	UserDao userDao;
	
	@Override
	public List<book> getNiceBook() {
		// TODO Auto-generated method stub
		
		return bookDao.getNiceBook();
	}

	@Override
	public User checkUser(String userName, String userpwd) {
		// TODO Auto-generated method stub
		return userDao.checkUser(userName, userpwd);
	}

	@Override
	public boolean checkuser(String userName) {
		// TODO Auto-generated method stub
		User user=userDao.checkuser(userName);
		if(user!=null) {
			return true;
		}else
		return false;
	}

	@Override
	public int insertData(User u) {
		// TODO Auto-generated method stub
		return userDao.insertData(u);
	}



	

	

}
