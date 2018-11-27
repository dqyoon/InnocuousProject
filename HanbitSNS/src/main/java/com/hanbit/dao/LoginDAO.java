package com.hanbit.dao;

import com.hanbit.vo.UserVO;

public interface LoginDAO {
	//로그인 아이디비밀번호 가져오기로직
	public UserVO getLogin(UserVO vo);
	//비밀번호 찾기 (폰, 닉네임)
	public UserVO getpassCheck(UserVO vo);
	//폰찾기( 이름, 닉네임)
	public UserVO getphoneCheck(UserVO vo);
	//비활성화 깨기 ( 구분자에 null넣기)
	public void setReset(UserVO vo);
}

// 리턴타입은 vo

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

