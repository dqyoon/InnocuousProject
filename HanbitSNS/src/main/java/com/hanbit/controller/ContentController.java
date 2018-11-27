package com.hanbit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.ContentDAO;
import com.hanbit.vo.ContentVO;
import com.hanbit.vo.UserVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class ContentController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/board/boardcontent", method = { RequestMethod.GET })
	public ModelAndView Board(HttpSession httpSession) {
		ModelAndView mav = new ModelAndView();
		if ((String) httpSession.getAttribute("sid") == null) {
			mav.setViewName("result");
			mav.addObject("msg", "");
			mav.addObject("url", "../user/login");
			return mav;
		}

		ContentDAO dao = sqlSession.getMapper(ContentDAO.class);
		List<ContentVO> list = dao.getContentList((String) httpSession.getAttribute("sid"), 1, 5);
		int count = dao.getContentCount((String) httpSession.getAttribute("sid"));
		UserVO vo = dao.getUserProfile((String) httpSession.getAttribute("sid"));

		mav.addObject("list", list);
		mav.addObject("count", count);
		mav.addObject("vo", vo);
		mav.setViewName("/board/boardcontent");
		return mav;
	}

	@RequestMapping(value = "/board/moreList", method = { RequestMethod.GET })
	@ResponseBody
	public JSONObject moreContentList(HttpSession httpSession, @RequestParam("startNum") int sNum,
			@RequestParam("endNum") int eNum) {
		ContentDAO dao = sqlSession.getMapper(ContentDAO.class);
		List<ContentVO> list = dao.getContentList((String) httpSession.getAttribute("sid"), sNum, eNum);

		JSONArray jlist = new JSONArray();
		JSONObject jsonData = new JSONObject();
		for (ContentVO voData : list) {
			JSONObject obj = new JSONObject();
			obj.put("no", voData.getNo());
			obj.put("content", voData.getContent());
			obj.put("uploaddate", voData.getUploaddate());
			obj.put("file1", voData.getFile1());
			obj.put("file2", voData.getFile2());
			obj.put("nick", voData.getNick());
			obj.put("image", voData.getImage());
			obj.put("color", voData.getColor());
			jlist.add(obj);
		}
		jsonData.put("moreList", jlist);
		return jsonData;
	}

	@ResponseBody
	public int content_delete(@RequestParam("no") int no) {
		ContentDAO dao = sqlSession.getMapper(ContentDAO.class);
		int count = dao.boarddelete(no);
		return count;
	}

	/*
	 * @RequestMapping(value = "/board/boardcontent2", method = {
	 * RequestMethod.POST })
	 * 
	 * @ResponseBody public JSONArray Content(ContentVO vo) { ContentDAO dao =
	 * sqlSession.getMapper(ContentDAO.class); ArrayList<ContentVO> list =
	 * dao.getcontent(vo);
	 * 
	 * JSONArray jlist = new JSONArray(); for (ContentVO voData : list) {
	 * JSONObject obj = new JSONObject(); obj.put("no", voData.getNo());
	 * obj.put("content", voData.getContent()); obj.put("uploaddate",
	 * voData.getUploaddate()); obj.put("file1", voData.getFile1());
	 * obj.put("file2", voData.getFile2()); obj.put("checkin",
	 * voData.getCheckin()); obj.put("nick", voData.getNick()); obj.put("image",
	 * voData.getImage()); jlist.add(obj); } return jlist; }
	 * 
	 * @RequestMapping(value = "/board/boardcontent3", method = {
	 * RequestMethod.POST })
	 * 
	 * @ResponseBody public JSONArray modifycc(ContentVO vo) { ContentDAO dao =
	 * sqlSession.getMapper(ContentDAO.class); ArrayList<ContentVO> list =
	 * dao.getcontent(vo);
	 * 
	 * JSONArray alist = new JSONArray(); for (ContentVO voData : list) {
	 * JSONObject obj = new JSONObject(); obj.put("no", voData.getNo());
	 * obj.put("content", voData.getContent()); obj.put("uploaddate",
	 * voData.getUploaddate()); obj.put("file1", voData.getFile1());
	 * obj.put("file2", voData.getFile2()); obj.put("checkin",
	 * voData.getCheckin()); obj.put("nick", voData.getNick()); obj.put("image",
	 * voData.getImage()); alist.add(obj); }
	 * 
	 * return alist;
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/board/modify5", method = { RequestMethod.POST
	 * })
	 * 
	 * @ResponseBody public int content_modify(@RequestParam("") int no) {
	 * ContentDAO dao = sqlSession.getMapper(ContentDAO.class); int count =
	 * dao.contentupdate(no); return count; }
	 * 
	 * @RequestMapping(value = "/board/contentdelete", method = {
	 * RequestMethod.GET })
	 * 
	 * 
	 * 
	 * @RequestMapping("/board/contentdelete1")
	 * 
	 * @ResponseBody public JSONArray content_review() { ContentDAO dao =
	 * sqlSession.getMapper(ContentDAO.class); ArrayList<ContentVO> list =
	 * dao.contentreview();
	 * 
	 * JSONArray jlist = new JSONArray(); for (ContentVO voData : list) {
	 * JSONObject obj = new JSONObject(); obj.put("no", voData.getNo());
	 * obj.put("content", voData.getContent()); obj.put("uploaddate",
	 * voData.getUploaddate()); obj.put("file1", voData.getFile1());
	 * obj.put("file2", voData.getFile2()); obj.put("checkin",
	 * voData.getCheckin()); obj.put("nick", voData.getNick()); obj.put("image",
	 * voData.getImage()); jlist.add(obj); } return jlist; }
	 * 
	 * 
	 * }
	 */
}