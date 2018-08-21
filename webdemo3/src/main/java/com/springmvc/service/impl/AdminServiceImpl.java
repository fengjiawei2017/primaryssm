package com.springmvc.service.impl;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.springmvc.dao.*;
import com.springmvc.entity.*;
import com.springmvc.service.*;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	UserDao userdao;
	@Autowired
	BookDao bookdao;
	
	@Override
	public User getUserById(int uid) {
		// TODO Auto-generated method stub
		return userdao.getUserById(uid);
	}

	@Override
	public List<book> getBook() {
		// TODO Auto-generated method stub
		return bookdao.getBook();
	}

	@Override
	public List<User> getUser() {
		// TODO Auto-generated method stub
		return userdao.getUser();
	}

	@Override
	public boolean insertBook(book b) {
		// TODO Auto-generated method stub
		
		int flag=bookdao.insertBook(b);
		if(flag>0)
			return true;
		else
			return false;
	}

	@Override
	public int deteleBook(int bid) {
		// TODO Auto-generated method stub
		return bookdao.deteleBook(bid);
	}

	@Override
	public int deteleUser(int uid) {
		// TODO Auto-generated method stub
		return userdao.deteleUser(uid);
	}

	@Override
	public boolean updateUser(User u) {
		// TODO Auto-generated method stub
		
		int flag=userdao.updateUser(u);
		if(flag>0)
			return true;
		else
			return false;
	}

	

	

}
