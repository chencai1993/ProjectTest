package cn.table;

public class User {
	private int userid;
	private String name;
	public String userno;
	private String username;
	private String password;
	private String phone;
	private int postid;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserno() {
		return userno;
	}
	public void setUserno(String userno) {
		this.userno = userno;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPostid() {
		return postid;
	}
	public void setPostid(int postid) {
		this.postid = postid;
	}
	public User(int userid, String name, String userno, String username,
			String password, String phone, int postid) {
		super();
		this.userid = userid;
		this.name = name;
		this.userno = userno;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.postid = postid;
	}
	public User() {
		super();
	}
	public User(String name, String userno, String username, String password,
			String phone, int postid) {
		super();
		this.name = name;
		this.userno = userno;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.postid = postid;
	}

	
}
