package com.hanbit.vo;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class UserVO {
	
	
	@Override
	public String toString() {
		return "UserVO [result=" + result + ", no=" + no + ", content="
				+ content + ", uploaddate=" + uploaddate + ", file1=" + file1
				+ ", file2=" + file2 + ", rpw=" + rpw + ", phone=" + phone
				+ ", name=" + name + ", pw=" + pw + ", gender=" + gender
				+ ", age=" + age + ", address=" + address + ", love=" + love
				+ ", nick=" + nick + ", image=" + image + ", joindate="
				+ joindate + ", today=" + today + ", sid=" + sid + ", reason="
				+ reason + ", fcount=" + fcount + ", fcount2=" + fcount2
				+ ", fcount3=" + fcount3 + ", contentnumber=" + contentnumber
				+ ", fileimage=" + fileimage + "]";
	}
	public String FollowerList(){
		return "UserVO [phone="+phone+", name ="+name+", image="+image+"]";
	}
	int result,joa,siro;
	public int getJoa() {
		return joa;
	}
	public void setJoa(int joa) {
		this.joa = joa;
	}
	public int getSiro() {
		return siro;
	}
	public void setSiro(int siro) {
		this.siro = siro;
	}
	String no,content, uploaddate, file1,file2, rpw, phone, name, pw, gender, age, address, love, nick, image, joindate,today, sid,reason,fcount,fcount2,fcount3,contentnumber;
	

	
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getContentnumber() {
		return contentnumber;
	}
	public void setContentnumber(String contentnumber) {
		this.contentnumber = contentnumber;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getFcount3() {
		return fcount3;
	}
	public void setFcount3(String fcount3) {
		this.fcount3 = fcount3;
	}
	public String getFcount2() {
		return fcount2;
	}

	public void setFcount2(String fcount2) {
		this.fcount2 = fcount2;
	}

	public String getRpw() {
		return rpw;
	}
	
	public void setRpw(String rpw) {
		
		this.rpw = rpw;
	}

	public String getFcount() {
		return fcount;
	}

	public void setFcount(String fcount) {
		this.fcount = fcount;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getToday() {
		return today;
	}

	public void setToday(String today) {
		this.today = today;
	}

	public String getJoindate() {
		return joindate;
	}

	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}

	CommonsMultipartFile fileimage;
	public CommonsMultipartFile getFileimage() {
		return fileimage;
	}

	public void setFileimage(CommonsMultipartFile fileimage) {
		this.fileimage = fileimage;
	}

	public String getNick() {
		return nick;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	/* JoinDAO dao= new JoinDAO(); */

	public String getPhone() {
		return phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = DigestUtils.sha512Hex(pw);
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getLove() {
		return love;
	}

	public void setLove(String love) {
		this.love = love;
	}	

	/*
	 * public int joinExecute(){ dao.getConnection(); String sql =
	 * "insert into usertable(usertable_seq.nextval,?,?,?,?,?,?)";
	 * dao.getPreparedStatement(sql); int result = dao.execInsert(this);
	 * dao.close();
	 * 
	 * return result; }
	 */

}
