package com.springmvc.service;

import java.util.List;

import com.springmvc.entity.User;
import com.springmvc.entity.book;


/**
 * 业务接口：站在"使用者"角度设计接口 三个方面：方法定义粒度，参数，返回类型（return 类型/异常）
 */
public interface LoginService {

	
	
	public List<book> getNiceBook();

	public User checkUser(String userName, String userpwd);

	public boolean checkuser(String userName);

	public int insertData(User u);

	

}
