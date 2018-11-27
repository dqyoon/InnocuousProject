package com.hanbit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hanbit.vo.FriendVO;
import com.hanbit.vo.UserVO;

public interface FriendDAO {

	// 알수도 있는사람 가져오기
	public List<UserVO> getHumanList(@Param("sid") String sid, @Param("startNum") int sNum, @Param("endNum") int eNum);
	
	//알수도 있는 사람 전체 갯수 가져오기
	public int getHumanTotalCount(@Param("sid") String sid);

	// 친구목록 가져오기
	public List<UserVO> getFriendList(@Param("sid") String sid, @Param("startNum") int sNum, @Param("endNum") int eNum);

	// 내가 팔로윙중인 사람 명수 가져오기
	public int getFollowingCount(@Param("id") String id);

	// 나를 팔로윙중인 사람 명수 가져오기
	public int getFollowerCount(@Param("id") String id);

	// 팔로워 목록 가져오기
	public List<UserVO> getFollowerList(@Param("sid") String sid, @Param("startNum") int sNum, @Param("endNum") int eNum);

	// 팔로윙 상태 체크
	public int followingCheck(FriendVO vo);

	// 팔로윙 추가
	public int addFollowing(FriendVO vo);

	// 팔로윙 해제
	public int noFollowing(FriendVO vo);

	// 자동완성
	public List<UserVO> getAutoComplete(@Param("keyword") String keyword);
	
	//친구페이지 프로필 가져오기
	public UserVO getProfile(@Param("id") String id);	
	
	//게시글 갯수 가져오기
	public int getBoardCount(@Param("id") String id);		
	
	//친구 검색 결과 가져오기
	public List<UserVO> getSearchList(@Param("sid") String sid, @Param("keyword") String keyword, @Param("startNum") int sNum, @Param("endNum") int eNum);
	
	//친구 검색 결과 갯수 가져오기
	public int getSearchCount(@Param("sid") String sid, @Param("keyword") String keyword);
	
	//팔로워 Top5 가져오기
	public List<UserVO> getFollowerTop5();
	

}
