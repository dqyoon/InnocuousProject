package com.hanbit.vo;

public class FriendVO {
	String u_phone;
	String f_phone;

	public String getU_phone() {
		return u_phone;
	}

	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}

	public String getF_phone() {
		return f_phone;
	}

	public void setF_phone(String f_phone) {
		this.f_phone = f_phone;
	}

	@Override
	public String toString() {
		return "FriendVO [u_phone=" + u_phone + ", f_phone=" + f_phone + "]";
	}

}
