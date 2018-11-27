package com.hanbit.dao;

import java.util.List;

import com.hanbit.vo.UserVO;

public interface JoinDAO {
	//회원가입
	public int getJoin(UserVO vo);
	//로그인 or 프로필뿌려줄떄 필요
	public UserVO getProfile(UserVO list);
	
	//아이디(폰번호) 찾기 
	public UserVO findphone(UserVO list);
	//패스워드찾기1 
	public int getpassChange(UserVO vo);
	//패스워드 찾기2
	public int getpassChange2(UserVO vo);
	//아이디 중복 체크
	public int getIdcheck(String phone);
	//rpw 넣기
	public int setRpw(UserVO vo);
	//팔로워 리스트받아오기
	public List<UserVO> getFollowerList(String sid);
	//팔로잉 리스트 받아오기
	public List<UserVO> getFriendList(String string);
	//맞팔 리스트 받아오기
	public List<UserVO> getMatpalList(String sid);
	//나랑 맞팔회원 수 
	public int getMatpalCount(String sid);
	//친구 페이지
	public UserVO getProfile2(String phone);
	
	public UserVO getProfile3(String sid);
	
	

	
	

	

}

//리턴타입은 vo

/*
 * public class JoinDAO { Connection conn = null; PreparedStatement pstmt =
 * null; ResultSet rs = null;
 * 
 * public JoinDAO(){}
 * 
 * public void getConnection(){ try{ Context context = new InitialContext();
 * DataSource dataSource =
 * (DataSource)context.lookup("java:comp/env/jdbc/oracle"); conn =
 * dataSource.getConnection();
 * 
 * }catch(Exception e){e.printStackTrace();} }
 * 
 * 
 * public void getPreparedStatement(String sql){ try{ pstmt =
 * conn.prepareStatement(sql); }catch(Exception e){} }
 * 
 * //insert public int execInsert(JoinVO vo){ int result=0; try{
 * pstmt.setString(1, vo.getPhone()); pstmt.setString(2, vo.getName());
 * pstmt.setString(3, vo.getPw()); pstmt.setString(4, vo.getGender());
 * pstmt.setString(5, vo.getAge());
 * 
 * result = pstmt.executeUpdate(); }catch(Exception e){ e.printStackTrace(); }
 * 
 * return result; }
 */

/*
 * public LoginVO execQuery(String id){ LoginVO vo = new LoginVO();
 * 
 * try{ pstmt.setString(1, id); rs = pstmt.executeQuery();
 * 
 * if(rs.next()){ vo.setEmail(rs.getString(1)); vo.setPass(rs.getString(2)); }
 * 
 * }catch(Exception e){}
 * 
 * return vo; }
 */
/*
 * public void close(){ try{ if(rs != null) rs.close(); if(pstmt != null)
 * pstmt.close(); if(conn != null) conn.close(); }catch(Exception e){} }
 * 
 * }
 */

