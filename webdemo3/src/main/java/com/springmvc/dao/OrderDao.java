package com.springmvc.dao;

import java.sql.*;


import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

 
import com.springmvc.entity.*;

public interface OrderDao {

	//借阅成功
	public int insertOrder(order o);
	//获取借阅书籍
	public List<order> getorderBook(int uid);
	//还书
	public int returnbook(@Param("ordernum")int ordernum,@Param("uid")int uid);
	
}
