package com.springmvc.dao;

import java.sql.*;

import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.springmvc.entity.*;

public interface CarDao {


	
	//获得购物车里的数据
	public List<Car> getCarBook(int uid);
	//往购物车里插入书本
	public int insertCarVal(@Param("uid")int uid,@Param("b") book b);
	//查询是否有此书
	public Car isContainBook(@Param("uid")int uid,@Param("bid") int bid);
	//查询数量
	public int selnum(@Param("uid")int uid,@Param("bid")int bid);
	//更新数量
	public int updnum(@Param("uid")int uid,@Param("dnum") int dnum,@Param("bid")int bid);

	//更新总价
	public int updtotal(@Param("uid")int uid,@Param("bid")int bid);
	//查询该用户借书车的数量
	public int selsnum(int uid);
	//删除借书车里的某本书
	public int delebook(@Param("uid")int uid,@Param("bid")int bid);
	//清空借书车
	public int clearcar(int uid);
	
}
