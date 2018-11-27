package com.hanbit.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class ContentVO {

	@Override
	public String toString() {
		return "ContentVO [no=" + no + ", user_phone=" + user_phone + ", uploaddate=" + uploaddate + ", name=" + name
				+ ", content=" + content + ", checkin=" + checkin + ", color=" + color + ", image=" + image + ", nick="
				+ nick + ", file1=" + file1 + ", file2=" + file2 + ", filename1=" + filename1 + ", filename2="
				+ filename2 + "]";
	}

	String no, user_phone, uploaddate, name, content, checkin, color, image, nick, file1, file2;

	CommonsMultipartFile filename1, filename2;

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCheckin() {
		return checkin;
	}

	public void setCheckin(String checkin) {
		this.checkin = checkin;
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

	public CommonsMultipartFile getFilename1() {
		return filename1;
	}

	public void setFilename1(CommonsMultipartFile filename1) {
		this.filename1 = filename1;
	}

	public CommonsMultipartFile getFilename2() {
		return filename2;
	}

	public void setFilename2(CommonsMultipartFile filename2) {
		this.filename2 = filename2;
	}

}
