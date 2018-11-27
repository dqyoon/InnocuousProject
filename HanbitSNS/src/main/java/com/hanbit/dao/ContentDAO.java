package com.hanbit.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hanbit.vo.ContentVO;
import com.hanbit.vo.UserVO;

public interface ContentDAO {

	// 게시글 등록
	public void uploadboard(ContentVO vo);

	// 게시글 가져오기
	public List<ContentVO> getContentList(@Param("sid") String sid, @Param("startNum") int sNum,
			@Param("endNum") int eNum);

	// 게시글 카운트 가져오기
	public int getContentCount(@Param("sid") String sid);

	// 로그인한 유저 정보 가져오기
	public UserVO getUserProfile(@Param("sid") String sid);

	// 칼라별 정렬
	public List<ContentVO> getColorSortingList(@Param("sid") String sid, @Param("color") String color);
	
	// 글삭제
	int boarddelete(@Param("no")int no);
	
	/*
	 * public int setPost(ContentVO vo); // 조회수 칼라 증가 public void hitUp(int
	 * idx); ArrayList<ContentVO> getmaincontent(); ArrayList<ContentVO>
	 * getcontent(ContentVO vo); int contentupdate(int no);
	 * 
	 * ArrayList<ContentVO> contentreview(); ArrayList<ContentVO> moreContent();
	 */

	public String getpropile(@Param("sid") String sid);

	public List<UserVO> getImage1(String string);

	public List<UserVO> getcontentsload(String sid);

	public int getcontentnumber(String sid);

	public int deletecontent(String no);

	public UserVO getnumber(String sid);
	
}
