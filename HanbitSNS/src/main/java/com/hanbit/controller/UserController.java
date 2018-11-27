package com.hanbit.controller;

import java.io.FileOutputStream;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanbit.dao.ContentDAO;
import com.hanbit.dao.DeleteDAO;
import com.hanbit.dao.FriendDAO;
import com.hanbit.dao.JoinDAO;
import com.hanbit.dao.LoginDAO;
import com.hanbit.dao.ProfileUploadDAO;
import com.hanbit.vo.UserVO;

//import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("user")
/* user 에서 */
public class UserController {
	private static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	@Autowired
	ServletContext context;

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping(value = "/passcheck3", method = RequestMethod.GET)
	public String PC3() {
		return "user/passcheck3";
	}

	@RequestMapping(value = "/passcheck2", method = RequestMethod.GET)
	public String PC2() {
		return "user/passcheck2";
	}

	@RequestMapping(value = "/passcheck", method = RequestMethod.GET)
	public String PC() {
		return "user/passcheck";
	}

	@RequestMapping(value = "/phonecheck", method = RequestMethod.GET)
	public String PHC() {
		return "user/phonecheck";
	}

	// 아이디찾기
	@RequestMapping(value = "/phonecheck.do", method = RequestMethod.POST)
	public ModelAndView PHC(UserVO vo, HttpSession session) {
		System.out.println("phonecheckdo들어옴.");
		ModelAndView mv = new ModelAndView();
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		UserVO list = new UserVO();
		list = dao.findphone(vo);
		System.out.println(list.toString());
		mv.setViewName("user/phonecheck2");
		mv.addObject("list", list);
		return mv;
	}

	// 중복체크
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.GET)
	@ResponseBody
	public String idCheck(String phone) {
		System.out.println("입장!");
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		int result = dao.getIdcheck(phone);
		String succ = "";
		if (result == 0) {
			succ = "N";
		} else {
			succ = "Y";
		}
		return succ;

	}

	/* user 에서 매핑할 뷰단의 액션 값 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String Login() {
		return "user/login";
	}

	@RequestMapping(value = "/login2", method = RequestMethod.GET)
	public String Login2() {
		return "user/login2";
	}

	@RequestMapping(value = "/join.do", method = RequestMethod.GET)
	public String Join() {
		return "user/login";
	}

	@RequestMapping(value = "/profile2", method = RequestMethod.GET)
	public String Profile2() {
		return "user/profile2";
	}

	
	@RequestMapping(value = "/dropout", method = RequestMethod.GET)
	public ModelAndView dropout(UserVO vo, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		if ((String) session.getAttribute("sid") == null) {
			mv.setViewName("result");
			mv.addObject("msg", "로그인하셔야 접근가능한 페이지입니다");
			mv.addObject("url", "login2");
			return mv;
		}
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		FriendDAO dao2 = sqlSession.getMapper(FriendDAO.class);
		UserVO list = new UserVO();

		list.setSid((String) session.getAttribute("sid"));// sid set 해주고
		list = dao.getProfile(list);
		System.out.println("sid를 list 에 추가 ");
		list.setSid((String) session.getAttribute("sid"));

		System.out.println(list.getSid());// getprofile을통해 나머지 db 정보들다불러와서 추가.

		int k = dao2.getFollowerCount(list.getSid());
		String k2 = Integer.toString(k);
		System.out.println(Integer.toString(k));
		System.out.println("팔로워카운트" + k2);
		list.setFcount(Integer.toString(k));
		mv.addObject("list", list); // 뷰에서 el

		System.out.println(list);
		mv.setViewName("/user/dropout");// 페이지

		return mv;
	}

	

	// 회원정보수정 뿌려주는페이지 list에넣고 el언어
	@RequestMapping(value = "/profileUpdate", method = RequestMethod.GET)
	public ModelAndView ProfileInfo2(UserVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if ((String) session.getAttribute("sid") == null) {
			mv.setViewName("result");
			mv.addObject("msg", "로그인하셔야 접근가능한 페이지입니다");
			mv.addObject("url", "login2");
			return mv;
		}
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		UserVO list = new UserVO();
		list.setSid((String) session.getAttribute("sid"));
		list = dao.getProfile(list);
		list.setSid((String) session.getAttribute("sid"));
		mv.setViewName("user/profileUpdate");
		mv.addObject("list", list);
		System.out.println(list);
		return mv;
	}

	// 검색

	// 친구 프로필 페이지
	@RequestMapping("/friendprofile.do")
	public ModelAndView BoardContent(String phone, HttpSession session, String no) {
		
		ModelAndView mv = new ModelAndView();
		if ((String) session.getAttribute("sid") == null) {
			mv.setViewName("result");
			mv.addObject("msg", "로그인하셔야 접근가능한 페이지입니다");
			mv.addObject("url", "user/login2");
			return mv;
		}
		System.out.println("넘어온 phone =" + phone);
		FriendDAO dao2 = sqlSession.getMapper(FriendDAO.class);
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		ContentDAO dao3 = sqlSession.getMapper(ContentDAO.class);
		UserVO vo = new UserVO();
		// list
		UserVO list = dao.getProfile2(phone);
		// 친구 프로필 클릭한것목록
		System.out.println(phone + "의 목록: " + list);
		// 세션 넣기
		vo.setSid((String) session.getAttribute("sid"));
		// 세션 확인
		System.out.println(vo.getSid());
		// 팔로워 수 받기
		int k = dao2.getFollowerCount(phone);
		// 팔로잉 수 받기
		int k2 = dao2.getFollowingCount(phone);
		// 맞팔 카운트 받기
		int k3 = dao.getMatpalCount(phone);
		//게시물수 
		int k4 = dao3.getcontentnumber(phone);
		//삭제
		
	
		
		List<UserVO> content = dao3.getcontentsload(phone);

		for (int i = 0; i <  content.size(); i++) {

			System.out.println( content.get(i));
			mv.addObject(" content",  content);

		}
		
		//이미지파일 불러오기.
		List<UserVO> image = dao3.getImage1(phone);

		for (int i = 0; i < image.size(); i++) {

			System.out.println(image.get(i));
			mv.addObject("image", image);

		}
		
		
		
		List<UserVO> list0 = dao.getMatpalList(phone);
		for (int i = 0; i < list0.size(); i++) {
			System.out.println("맞팔리스트" + list0.get(i));
			mv.addObject("list0", list0);

		}
		List<UserVO> list2 = dao.getFollowerList(phone);

		for (int i = 0; i < list2.size(); i++) {

			System.out.println(list2.get(i));
			mv.addObject("list2", list2);

		}
		List<UserVO> list3 = dao.getFriendList(phone);
		for (int i = 0; i < list3.size(); i++) {

			System.out.println(list3.get(i));
			mv.addObject("list3", list3);

		}

		// 추가 카운트
		list.setContentnumber(Integer.toString(k4));
		list.setFcount3(Integer.toString(k3));
		list.setFcount(Integer.toString(k));
		list.setFcount2(Integer.toString(k2));

		mv.setViewName("/user/friendprofile");
		mv.addObject("list", list);

		// mv.addObject("no", no);

		return mv;
	}
	
	
	// 프로필2
		@RequestMapping(value = "/profile1", method = RequestMethod.GET)
		public ModelAndView ProfileInfo4(UserVO vo, HttpSession session,String no) {
			
			ModelAndView mv = new ModelAndView();
			if ((String) session.getAttribute("sid") == null) {
				mv.setViewName("result");
				mv.addObject("msg", "로그인하셔야 접근가능한 페이지입니다");
				mv.addObject("url", "login2");
				return mv;
			}
			FriendDAO dao2 = sqlSession.getMapper(FriendDAO.class);
			JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
			ContentDAO dao3 = sqlSession.getMapper(ContentDAO.class);
			
			
			UserVO list = new UserVO();
			

			list.setSid((String) session.getAttribute("sid"));// sid set 해주고
			list = dao.getProfile(list);
			
			System.out.println("이름과 날짜 list"+ list);
			System.out.println("sid를 list 에 추가 ");
			list.setSid((String) session.getAttribute("sid"));
			
			System.out.println(list.getSid());
			
			System.out.println("성별" + list.getGender());
			
			//삭제
			//number받기
			
			
			int j = dao3.deletecontent(no);
		
			if(j==1){
				System.out.println("삭제완료");
			}
			else{
				System.out.println("삭제실패");
			}
			//내용과 날짜 불러오기
			
			List<UserVO> content = dao3.getcontentsload(list.getSid());

			for (int i = 0; i <  content.size(); i++) {

				System.out.println( content.get(i));
				mv.addObject(" content",  content);

			}
			
			//이미지파일 불러오기.
			List<UserVO> image = dao3.getImage1((list.getSid()));

			for (int i = 0; i < image.size(); i++) {

				System.out.println(image.get(i));
				mv.addObject("image", image);

			}
			
			int k = dao2.getFollowerCount(list.getSid());
			int k2 = dao2.getFollowingCount(list.getSid());
			int k3 = dao.getMatpalCount(list.getSid());
			int k4 = dao3.getcontentnumber(list.getSid());
			List<UserVO> list3 = dao.getFriendList((list.getSid()));

			for (int i = 0; i < list3.size(); i++) {

				System.out.println(list3.get(i));
				mv.addObject("list3", list3);

			}
			List<UserVO> list0 = dao.getMatpalList(list.getSid());
			for (int i = 0; i < list0.size(); i++) {
				System.out.println("맞팔리스트" + list0.get(i));
				mv.addObject("list0", list0);

			}

			List<UserVO> list2 = dao.getFollowerList(list.getSid());

			for (int i = 0; i < list2.size(); i++) {

				System.out.println(list2.get(i));
				mv.addObject("list2", list2);

			}
			list.setContentnumber(Integer.toString(k4));
			list.setFcount3(Integer.toString(k3));
			list.setFcount(Integer.toString(k));
			list.setFcount2(Integer.toString(k2));

			// getprofile을통해 나머지 db 정보들다불러와서 추가.
			mv.setViewName("/user/profile");// 페이지
			mv.addObject("list", list); // 뷰에서 el
			System.out.println(list);

			return mv;

		}
	// 프로필
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public ModelAndView ProfileInfo3(UserVO vo, HttpSession session, String no) {

		ModelAndView mv = new ModelAndView();
		/*if ((String) session.getAttribute("sid") == null) {
			mv.setViewName("result");
			mv.addObject("msg", "로그인하셔야 접근가능한 페이지입니다");
			mv.addObject("url", "login2");
			return mv;
		}*/
		FriendDAO dao2 = sqlSession.getMapper(FriendDAO.class);
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		ContentDAO dao3 = sqlSession.getMapper(ContentDAO.class);
		
		
		UserVO list = new UserVO();
		/*UserVO k1 = new UserVO();*/

		list.setSid((String) session.getAttribute("sid"));// sid set 해주고
		list = dao.getProfile(list);
		
		System.out.println("이름과 날짜 list"+ list);
		System.out.println("sid를 list 에 추가 ");
		list.setSid((String) session.getAttribute("sid"));
		
		System.out.println(list.getSid());
		
		System.out.println("성별" + list.getGender());
		
		
		
		//내용과 날짜 불러오기
		
		List<UserVO> content = dao3.getcontentsload(list.getSid());

		for (int i = 0; i <  content.size(); i++) {

			System.out.println( content.get(i));
			mv.addObject(" content",  content);

		}
		
		//이미지파일 불러오기.
		List<UserVO> image = dao3.getImage1((list.getSid()));

		for (int i = 0; i < image.size(); i++) {

			System.out.println(image.get(i));
			mv.addObject("image", image);

		}
		
		int k = dao2.getFollowerCount(list.getSid());
		int k2 = dao2.getFollowingCount(list.getSid());
		int k3 = dao.getMatpalCount(list.getSid());
		int k4 = dao3.getcontentnumber(list.getSid());
		List<UserVO> list3 = dao.getFriendList((list.getSid()));

		for (int i = 0; i < list3.size(); i++) {

			System.out.println(list3.get(i));
			mv.addObject("list3", list3);

		}
		List<UserVO> list0 = dao.getMatpalList(list.getSid());
		for (int i = 0; i < list0.size(); i++) {
			System.out.println("맞팔리스트" + list0.get(i));
			mv.addObject("list0", list0);

		}

		List<UserVO> list2 = dao.getFollowerList(list.getSid());

		for (int i = 0; i < list2.size(); i++) {

			System.out.println(list2.get(i));
			mv.addObject("list2", list2);

		}
		list.setContentnumber(Integer.toString(k4));
		list.setFcount3(Integer.toString(k3));
		list.setFcount(Integer.toString(k));
		list.setFcount2(Integer.toString(k2));

		// getprofile을통해 나머지 db 정보들다불러와서 추가.
		mv.setViewName("/user/profile");// 페이지
		mv.addObject("list", list); // 뷰에서 el
		System.out.println(list);

		return mv;

	}

	

	// 비밀번호 변경(프로필페이지내에서)
	@RequestMapping(value = "/passcheck3.do", method = RequestMethod.POST)
	public String Passcheck2(UserVO vo, HttpSession session) {
		System.out.println("변경3");

		String page = "";
		System.out.println("1.mv");
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		System.out.println("2.sqlsession");
		System.out.println(vo.getSid());
		vo.setSid((String) session.getAttribute("sid"));
		int k = dao.getpassChange2(vo);
		vo.setSid((String) session.getAttribute("sid"));
		if (k == 1) {

			System.out.println("변경성공");
			page = "/user/profile";
		} else {
			page = "/user/profile";

		}

		return "redirect:" + page;

	}

	// 비밀번호잃어버렸을떄 2단계
	@RequestMapping(value = "/passcheck2.do", method = RequestMethod.POST)
	public ModelAndView Passcheck2(UserVO vo) {
		System.out.println("변경");
		ModelAndView mv = new ModelAndView();
		System.out.println("1.mv");
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		System.out.println("2.sqlsession");

		System.out.println(vo.toString());
		vo.setPw(vo.getRpw());
		int change = dao.setRpw(vo);
		System.out.println("pw 컬럼에 Rpw입력완료");

		if (change == 1) {
			
			System.out.println("비밀번호 변경");
			mv.setViewName("/user/login2");
		} else {
			
			System.out.println("비밀번호 변경실패 ");
			mv.setViewName("/user/login2");
		}

		return mv;
	}

	// 비밀번호잃어버렸을떄 1단계
	@RequestMapping(value = "/passcheck.do", method = RequestMethod.POST)
	public ModelAndView PC(UserVO vo, HttpSession session) {
		System.out.println("passcheckdo들어옴.");
		ModelAndView mv = new ModelAndView();
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		UserVO list = new UserVO();

		list = dao.getpassCheck(vo);

		String rpw = UUID.randomUUID().toString().replace("-", "");
		System.out.println(rpw);
		list.setRpw(rpw);

		System.out.println(list.toString());

		mv.setViewName("user/passcheck2");
		mv.addObject("list", list);
		list.setPw(rpw);
		System.out.println(list.getRpw());

		return mv;

	}

	// 비활성화
	@RequestMapping(value = "/delete2.do", method = RequestMethod.POST)
	public String Drop2(UserVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		
		System.out.println("회원탈퇴로직 입장 ");
		String page = "";
		System.out.println("mv");
		DeleteDAO dao = sqlSession.getMapper(DeleteDAO.class);
		System.out.println("sqlSession");
		vo.setSid((String) session.getAttribute("sid"));
		vo = dao.getdProfile(vo);
		vo.setSid((String) session.getAttribute("sid"));
		System.out.println("여러가지를 list 에 추가 ");
		System.out.println("sid 를 불러옵니다 :" + vo.getSid());
		dao.setSysdate(vo);
		System.out.println(vo.toString());

		int drop = dao.setDelete(vo);
		System.out.println("1이들어갔음 reason에");
		System.out.println("int drop값 " + drop);

		if (drop == 1) {
			System.out.println("비활성화 로직 들어감.");
			page = "/user/logout.do";
		} else {
			System.out.println("탈퇴실패");
			page = "/user/profile";
		}

		return "redirect:" + page;
	}

	// 회원탈퇴(즉시탈퇴)
	@RequestMapping(value = "/delete.do", method = RequestMethod.POST)
	public String Drop(UserVO vo, HttpSession session) {
		System.out.println("회원탈퇴로직 입장 ");
		String page = "";
		System.out.println("mv");
		DeleteDAO dao = sqlSession.getMapper(DeleteDAO.class);
		System.out.println("sqlSession");
		vo.setSid((String) session.getAttribute("sid"));
		vo = dao.getdProfile(vo);
		vo.setSid((String) session.getAttribute("sid"));
		System.out.println("여러가지를 list 에 추가 ");
		System.out.println("sid 를 불러옵니다 :" + vo.getSid());
		dao.setSysdate(vo);
		System.out.println("today컬럼 추가완료삭제를누른 시점.");
		System.out.println(vo.toString());
		System.out.println("오늘 아이디 삭제버튼을 누른날짜" + vo.getToday());

		
		int k = dao.getDelete3(vo);
		System.out.println(k);

		if (k == 1) {
			System.out.println("탈퇴성공");
			page = "/user/login";
		}else {
			System.out.println("24 시간뒤 탈퇴하세요");
			page = "/user/profile";
		}
			return "redirect:" + page;

	}

	// 회원정보수정 do
	@RequestMapping(value = "/Update.do", method = RequestMethod.POST)
	public String ProfileUpdate(UserVO vo, HttpSession session) {
		System.out.println("프로필 업데이트.do입장 ");
		String page = "";
		ProfileUploadDAO dao = sqlSession.getMapper(ProfileUploadDAO.class);
		System.out.println("2.sqlSession");
		vo.setSid((String) session.getAttribute("sid"));
		System.out.println(vo.getSid());
		System.out.println(vo.toString());
		String fname = vo.getFileimage().getOriginalFilename();
		System.out.println("이미지의 이름을 fname으로 설정 결과: " + fname);
		String path = context.getRealPath("/resources/UPLOADIMG/" + fname);
		System.out.println("업로드이미지위치" + path);
		vo.setImage(fname);
		try {
			FileOutputStream fos = new FileOutputStream(path);
			fos.write(vo.getFileimage().getBytes());
			System.out.println("fos를통해" + path + "경로" + vo.getImage());
			fos.close();
			System.out.println("--fos out --");
		} catch (Exception e) {
		}

		System.out.println(vo.getImage());
		System.out.println(vo.getFileimage());
		/* int upload = dao.getProfileUpload(vo); */
		UserVO ppap = dao.getImageCheck(vo);

		int update = dao.getProfileUpdate(vo);
		System.out.println("없데이트 값" + update);

		/* System.out.println("변경된 upload 값 " + upload); */

		System.out.println("3");

		if (update == 1 && ppap == null) {
			System.out.println("변경성공 유니크한 이미지값");
			/* mv.setViewName("/user/profile"); */
			page = "/user/profile";
		} else {

			System.out.println("변경실패 이미지파일명이 이미있습니다.");

			page = "/user/profileUpdate";
		}
		/* return mv; */
		return "redirect:" + page;

	}

	
	//로그인1
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String LoginPost(UserVO vo, HttpSession session) {
		String page = "";
		ModelAndView mv = new ModelAndView();
		System.out.println("1");
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		System.out.println("2");

		UserVO login = dao.getLogin(vo);
		System.out.println("3");

		session.setAttribute("sid", vo.getPhone());
		vo.setSid((String) session.getAttribute("sid"));
		System.out.println("sid  에 저장되는 값" + session);
		System.out.println(vo.getPhone());

		if (login != null) {
			System.out.println("login 성공");
			System.out.println(vo.toString());
			vo.setSid((String) session.getAttribute("sid"));
			dao.setReset(vo);
			
			page = "/board/boardcontent";

			
		} else {

			page = "/user/login2";
			System.out.println("login 실패");

		}

		/* return mv; */
		return "redirect:" + page;
	}
	//로그아웃
	@RequestMapping(value = "/logout.do")
	public String cgvLogoutPost(HttpSession session) {
		String page = "";

		if (session != null) {
			session.removeAttribute("sid");
			session.invalidate();

			System.out.println("세션 지워졌어");
			page = "/user/login";
		}

		return "redirect:" + page;
	}
	//로그인2
	@RequestMapping(value = "/login2.do", method = RequestMethod.POST)
	public String LoginPost2(UserVO vo, HttpSession session) {
		System.out.println("login.do 인식완료 ");
		String page = "";
		System.out.println("1");
		LoginDAO dao = sqlSession.getMapper(LoginDAO.class);
		System.out.println("2");

		UserVO login = dao.getLogin(vo);
		System.out.println("3");

		session.setAttribute("sid", vo.getPhone());
		vo.setSid((String) session.getAttribute("sid"));

		System.out.println(vo.toString());

		if (login != null) {
			System.out.println("login 성공");
			System.out.println(vo.toString());
			System.out.println(vo.getSid());

			// --

			dao.setReset(vo);
			System.out.println("reason 초기화완료. 비활성화취소");
			page = "/board/boardcontent";

		} else {
			page = "/user/login2";
			System.out.println("login 실패");
		}

		return "redirect:" + page;
	}
	//회원가입
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public ModelAndView JoinPost(UserVO vo) {
		System.out.println("Join.do 인식완료 ");

		ModelAndView mv = new ModelAndView();
		System.out.println("1");
		JoinDAO dao = sqlSession.getMapper(JoinDAO.class);
		System.out.println("2");
		System.out.println(vo.getAddress());
		System.out.println(vo.getNick());
		int join = dao.getJoin(vo);
		System.out.println("3");
		System.out.println(vo.toString());
		System.out.println(vo.getGender());

		if (join == 1) {
			// ȸ������ ����
			System.out.println("join 성공");
			mv.setViewName("/user/login2");
		} else {
			// ȸ������ ����
			System.out.println("join 실패");
			mv.setViewName("/user/loginfail");
		}

		return mv;
	}

}
