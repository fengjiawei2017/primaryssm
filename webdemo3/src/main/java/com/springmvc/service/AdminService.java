package com.springmvc.service;

import java.util.List;



import com.springmvc.entity.User;
import com.springmvc.entity.book;

/**
 * 业务接口：站在"使用者"角度设计接口 三个方面：方法定义粒度，参数，返回类型（return 类型/异常）
 */
public interface AdminService {

	

	User getUserById(int uid);

	List<book> getBook();

	List<User> getUser();

	boolean insertBook(book b);

	int deteleBook(int bid);

	int deteleUser(int uid);

	boolean updateUser(User u);

	

}
