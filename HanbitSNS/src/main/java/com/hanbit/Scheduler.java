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
		System.out.println("***** 비활성화 스케쥴러 작동중 per 30sec *****");
		
		DeleteDAO dao = sqlSession.getMapper(DeleteDAO.class);
		try {
		
		
		int k = dao.getDelete2();
		/*System.out.println("DB조회값:"+k);
		if(k==1){
			System.out.println("비활성화 완료");
		}if(k==0){
			System.out.println("비활성화 정보 계정없음.");
		}*/
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	
	}
	
}
	
	



