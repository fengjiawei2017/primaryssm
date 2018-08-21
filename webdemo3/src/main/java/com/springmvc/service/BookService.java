package com.springmvc.service;

import java.util.ArrayList;
import java.util.List;


import com.springmvc.entity.Car;
import com.springmvc.entity.User;
import com.springmvc.entity.book;
import com.springmvc.entity.order;


public interface BookService {

	

	List<Car> getCarBook(int uid);

	book getbook(int bid);

	List<book> getNiceBook();

	boolean isContainBook(int uid, int bid);

	int insertCarVal(int uid, book b);



	int selsnum(int uid);


	void clearBook(int uid);

	User getUserById(int uid);

	void insertOrder(order o);



	int returnbook(int ordernum, int uid);

	boolean ModifyNum(int uid, int bid, int dnum);

	void updatenum(int num, int bid);

	int updatenum1(int count, int bbid);

	List<book> selectbook(String chaxun,int current,int everyPage);

	void deleteBook(int uid, int bookid);

	List<order> getorderBook(int uid);

	int getCont();
	
	int findAll(String chaxun);

	

}
