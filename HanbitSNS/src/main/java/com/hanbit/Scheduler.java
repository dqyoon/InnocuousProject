package com.hanbit;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.hanbit.dao.*;
@Component
public class Scheduler {
	
	
	
	@Autowired
	private SqlSession sqlSession;
	
	//@Scheduled(cron = "*/30 * * * * **")
	
	public void Test1(){
		System.out.println("***** per 30sec *****");
		
		DeleteDAO dao = sqlSession.getMapper(DeleteDAO.class);
		try {
		
		
		int k = dao.getDelete2();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}
	
}
	
	



