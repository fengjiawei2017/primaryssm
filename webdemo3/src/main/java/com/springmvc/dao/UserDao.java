package com.springmvc.dao;

import java.sql.*;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.springmvc.entity.*;

public interface UserDao {
		//登录是查询用户信息是否对
		public User checkUser(@Param("name")String name,@Param("pwd")String pwd);
		//获取所有用户	
		public ArrayList<User> getUser();
		//注册用户数据	
		public int insertData(User u);
		//根据用户名字查询名字	
		public User checkuser(String name);
		//更新用户	
		public int updateUser(User u);
		
		//通过uid得到用户
		public User getUserById(int uid);
		//删除某个用户
		public int deteleUser(int uid); 

}
