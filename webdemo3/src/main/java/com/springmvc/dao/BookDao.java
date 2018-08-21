package com.springmvc.dao;

import java.sql.Connection;

import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.mysql.jdbc.Statement;
import com.springmvc.entity.book;

public interface BookDao {
		
		
		//获取所有书籍信息
		public ArrayList<book> getBook();
		//获取某本书籍信息	
		public book getbook(int bid);
		//删除某本书籍	
		public int deteleBook(int bid); 
		//获取标记为好书的书籍
		public ArrayList<book> getNiceBook();
		//新增书籍
		public int insertBook(book b) ;
		//点击购物车中的增加按钮，数量增加
		public int updatenum(@Param("num")int num,@Param("bid")int bid);
		//点击购物车中的“-”按钮，数量减少
		public int updatenum1(@Param("num")int num,@Param("bid")int bid);
		//根据某个名字搜索书籍
		public ArrayList<book> selectbook(@Param("bookname")String bookname,@Param("current")int current,@Param("everyPage")int everyPage);
		//查询书本数量
		public int selectbooknum();
		//分页所需获取第current条开始往下everyPage条数据
		public List<book> findAll(String chaxun);
}
