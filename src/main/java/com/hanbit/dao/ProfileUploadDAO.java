package com.hanbit.dao;

import com.hanbit.vo.UserVO;

public interface ProfileUploadDAO {
	//�씠誘몄�( 鍮꾪솢�꽦�솕) 吏�湲덉븞�� profile2 �봽濡쒗넗���엯踰꾩졏
	public int getProfileUpload(UserVO vo);
	//�씠誘몄� + �젙蹂댁닔�젙
	public int getProfileUpdate(UserVO vo);
	
	public UserVO getImageCheck(UserVO vo);

	
}

// 由ы꽩���엯�� vo

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

