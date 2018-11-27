package com.hanbit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.FriendDAO;
import com.hanbit.vo.FriendVO;
import com.hanbit.vo.UserVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping(value = "friend")
public class FriendController {
	@Autowired
	private SqlSession session;

	// 로그출력
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);

	// 친구 페이지 출력
	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView friend(HttpSession httpsession) {
		ModelAndView mav = new ModelAndView();
		if ((String) httpsession.getAttribute("sid") == null) {
			mav.setViewName("result");
			mav.addObject("msg", "로그인하셔야 접근가능한 페이지입니다");
			mav.addObject("url", "user/login.do");
			return mav;
		}

		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> humanList = dao.getHumanList((String) httpsession.getAttribute("sid"), 1, 5);
		int followingCount = dao.getFollowingCount((String) httpsession.getAttribute("sid"));
		int followerCount = dao.getFollowerCount((String) httpsession.getAttribute("sid"));
		int startNum = 1;
		List<UserVO> friendList = dao.getFriendList((String) httpsession.getAttribute("sid"), startNum, startNum * 10);

		mav.setViewName("/friend/friend");
		mav.addObject("humanList", humanList);
		mav.addObject("followingCount", followingCount);
		mav.addObject("followerCount", followerCount);
		mav.addObject("friendList", friendList);

		return mav;
	}

	// 팔로윙 상태 체크
	@RequestMapping(value = "followingCheck", method = RequestMethod.GET)
	@ResponseBody
	public String followingCheck(FriendVO vo) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		int count = dao.followingCheck(vo);
		String result = String.valueOf(count);
		return result;
	}

	// 팔로윙 처리
	@RequestMapping(value = "following", method = RequestMethod.GET)
	@ResponseBody
	public String following(FriendVO vo) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		int count = dao.addFollowing(vo);
		String result = String.valueOf(count);
		return result;
	}

	// 친구목록 새로고침
	@RequestMapping(value = "friendRefresh", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray friendRefresh(HttpSession httpsession, @RequestParam("startNum") int startNum,
			@RequestParam("endNum") int endNum) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> friendList = dao.getFriendList((String) httpsession.getAttribute("sid"), startNum, endNum);

		JSONArray jsonData = new JSONArray();
		for (UserVO vo : friendList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("phone", vo.getPhone());
			jsonObject.put("name", vo.getName());
			jsonObject.put("image", vo.getImage());
			jsonData.add(jsonObject);
		}
		return jsonData;
	}

	// 팔로윙 해제 처리
	@RequestMapping(value = "noFollowing", method = RequestMethod.GET)
	@ResponseBody
	public String noFollowing(FriendVO vo) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		int count = dao.noFollowing(vo);
		String result = String.valueOf(count);
		return result;
	}

	// 알수도 있는 사람 목록 새로고침
	@RequestMapping(value = "humanRefresh", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray humanRefresh(HttpSession httpsession) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> humanList = dao.getHumanList((String) httpsession.getAttribute("sid"), 1, 5);
		JSONArray jsonData = new JSONArray();

		for (UserVO vo : humanList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("phone", vo.getPhone());
			jsonObject.put("name", vo.getName());
			jsonObject.put("image", vo.getImage());
			jsonData.add(jsonObject);
		}
		return jsonData;
	}

	// 팔로워 불러오기
	@RequestMapping(value = "followerRefresh", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray followerRefresh(HttpSession httpsession, @RequestParam("startNum") int startNum,
			@RequestParam("endNum") int endNum) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> followerList = dao.getFollowerList((String) httpsession.getAttribute("sid"), startNum, endNum);

		JSONArray jsonData = new JSONArray();
		for (UserVO vo : followerList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("phone", vo.getPhone());
			jsonObject.put("name", vo.getName());
			jsonObject.put("image", vo.getImage());
			jsonData.add(jsonObject);
		}
		return jsonData;
	}

	// autoComplete
	@RequestMapping(value = "autoComplete", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray autoComplete(@RequestParam String term) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> autoList = dao.getAutoComplete("%" + term + "%");

		JSONArray jsonData = new JSONArray();
		for (UserVO vo : autoList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("phone", vo.getPhone());
			jsonObject.put("name", vo.getName());
			jsonObject.put("image", vo.getImage());
			jsonObject.put("nick", vo.getNick());
			jsonObject.put("age", vo.getAge());
			jsonData.add(jsonObject);
		}
		return jsonData;
	}

	// 친구목록 더보기
	@RequestMapping(value = "moreFriendList", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray moreFriendList(@RequestParam("nowCount") int pNum, HttpSession httpsession) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> moreFriendList = dao.getFriendList((String) httpsession.getAttribute("sid"), pNum + 1, pNum + 10);

		JSONArray jsonData = new JSONArray();
		for (UserVO vo : moreFriendList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("phone", vo.getPhone());
			jsonObject.put("name", vo.getName());
			jsonObject.put("image", vo.getImage());
			jsonObject.put("nick", vo.getNick());
			jsonData.add(jsonObject);
			System.out.println(jsonObject.toString());
		}
		return jsonData;
	}

	// 팔로워목록 더보기
	@RequestMapping(value = "moreFollowerList", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray moreFollowerList(@RequestParam("pageNum") int pNum, HttpSession httpsession) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> moreFollowerList = dao.getFollowerList((String) httpsession.getAttribute("sid"),
				(pNum - 1) * 10 + 1, pNum * 10);

		JSONArray jsonData = new JSONArray();
		for (UserVO vo : moreFollowerList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("phone", vo.getPhone());
			jsonObject.put("name", vo.getName());
			jsonObject.put("image", vo.getImage());
			jsonObject.put("nick", vo.getNick());
			jsonData.add(jsonObject);
			System.out.println(jsonObject.toString());
		}
		return jsonData;
	}

	// 친구페이지(게시물 가져오기 처리필요)
	@RequestMapping(value = "friendPage", method = RequestMethod.GET)
	public ModelAndView friendPage(HttpSession httpsession, @RequestParam("id") String id) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		UserVO profile = dao.getProfile(id);
		int followingCount = dao.getFollowingCount(id);
		int followerCount = dao.getFollowerCount(id);
		/* int boardCount = dao.getBoardCount(id); */

		ModelAndView mav = new ModelAndView();
		mav.setViewName("/friend/friendPage");
		mav.addObject("profile", profile);
		mav.addObject("followCount", followingCount);
		mav.addObject("followerCount", followerCount);
		/* mav.addObject("boardCount", boardCount); */

		return mav;
	}

	// 친구검색
	@RequestMapping(value = "friendSearch", method = RequestMethod.GET)
	public ModelAndView friendSearch(HttpSession httpsession, @RequestParam("keyword") String keyword) {
		ModelAndView mav = new ModelAndView();
		if ((String) httpsession.getAttribute("sid") == null) {
			mav.setViewName("result");
			mav.addObject("msg", "로그인하셔야 접근가능한 페이지입니다");
			mav.addObject("url", "../user/login.do");
			return mav;
		}

		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> searchList = dao.getSearchList((String) httpsession.getAttribute("sid"), "%" + keyword + "%", 1,
				20);
		int searchCount = dao.getSearchCount((String) httpsession.getAttribute("sid"), "%" + keyword + "%");

		mav.setViewName("friend/friendSearch");
		mav.addObject("searchList", searchList);
		mav.addObject("searchCount", searchCount);

		return mav;
	}

	// 알수도 있는 사람 전체보기
	@RequestMapping(value = "friendFind", method = RequestMethod.GET)
	public ModelAndView friendFind(HttpSession httpsession) {
		ModelAndView mav = new ModelAndView();
		if ((String) httpsession.getAttribute("sid") == null) {
			mav.setViewName("result");
			mav.addObject("msg", "로그인하셔야 접근가능한 페이지입니다");
			mav.addObject("url", "../user/login.do");
			return mav;
		}

		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> followerTop5 = dao.getFollowerTop5();
		List<UserVO> humanList = dao.getHumanList((String) httpsession.getAttribute("sid"), 1, 20);
		int humanTotalCount = dao.getHumanTotalCount((String) httpsession.getAttribute("sid"));

		mav.setViewName("friend/friendFind");
		mav.addObject("followerTop5", followerTop5);
		mav.addObject("humanList", humanList);
		mav.addObject("humanTotalCount", humanTotalCount);

		return mav;
	}

	// 알수도 있는 사람 더보기
	@RequestMapping(value = "friendMoreFind", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray friendMoreFind(@RequestParam("startNum") int sNum, HttpSession httpsession) {
		FriendDAO dao = session.getMapper(FriendDAO.class);
		List<UserVO> moreHumanList = dao.getHumanList((String) httpsession.getAttribute("sid"), sNum, sNum + 19);

		JSONArray jsonData = new JSONArray();
		for (UserVO vo : moreHumanList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("phone", vo.getPhone());
			jsonObject.put("name", vo.getName());
			jsonObject.put("image", vo.getImage());
			jsonObject.put("nick", vo.getNick());
			jsonObject.put("age", vo.getAge());
			jsonObject.put("love", vo.getLove());
			jsonObject.put("gender", vo.getGender());

			jsonData.add(jsonObject);
		}

		return jsonData;
	}
}
