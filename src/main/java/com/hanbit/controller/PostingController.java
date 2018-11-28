package com.hanbit.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
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

import com.hanbit.dao.ContentDAO;
import com.hanbit.vo.ContentVO;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("board")
/* user 에서 */
public class PostingController {
	private static final Logger logger = LoggerFactory.getLogger(PostingController.class);

	@Autowired
	private SqlSession sqlSession;

	@Autowired
	ServletContext context;

	// 게시글 등록
	@RequestMapping(value = "post.do", method = RequestMethod.POST)
	@ResponseBody
	public void Post(ContentVO vo, HttpSession httpSession) throws IOException {
		String path1;
		String path2;
		String uNam1;
		String uNam2;
		ContentDAO dao = sqlSession.getMapper(ContentDAO.class);

		if (vo.getFilename1() == null) {
			vo.setFile1("");
		}

		if (vo.getFilename2() == null) {
			vo.setFile2("");
		}

		if (vo.getFilename1() != null) {
			uNam1 = UUID.randomUUID().toString().replaceAll("-", "");
			vo.setFile1(uNam1 + ".jpg");
			path1 = context.getRealPath("/resources/BOARDIMAGE/" + uNam1 + ".jpg");
			FileOutputStream fos1 = new FileOutputStream(path1);
			fos1.write(vo.getFilename1().getBytes());
			fos1.close();
		}
		if (vo.getFilename2() != null) {
			uNam2 = UUID.randomUUID().toString().replaceAll("-", "");
			vo.setFile2(uNam2 + ".jpg");
			path2 = context.getRealPath("/resources/BOARDIMAGE/" + uNam2 + ".jpg");
			FileOutputStream fos2 = new FileOutputStream(path2);
			fos2.write(vo.getFilename2().getBytes());
			fos2.close();
		}
		vo.setUser_phone((String) httpSession.getAttribute("sid"));
		System.out.println("VO수신내역 : " + vo.toString());
		dao.uploadboard(vo);
	}

	// 색 정렬
	@RequestMapping(value = "colorSorting", method = RequestMethod.GET)
	@ResponseBody
	public JSONArray colorSorting(HttpSession httpSession, @RequestParam("color") String color) {
		ContentDAO dao = sqlSession.getMapper(ContentDAO.class);
		List<ContentVO> list = dao.getColorSortingList((String) httpSession.getAttribute("sid"), color);

		JSONArray jsonData = new JSONArray();
		for (ContentVO vo : list) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("no", vo.getNo());
			jsonObject.put("content", vo.getContent());
			jsonObject.put("uploaddate", vo.getUploaddate());
			jsonObject.put("file1", vo.getFile1());
			jsonObject.put("file2", vo.getFile2());
			jsonObject.put("checkin", vo.getCheckin());
			jsonObject.put("color", vo.getColor());
			jsonObject.put("user_phone", vo.getUser_phone());

			jsonData.add(jsonObject);
		}
		return jsonData;
	}
}