package cn.table;

import java.sql.ResultSet;

public class Admin {
	private int adminid;
	private String username;
	private String password;
	private String owner;

	
	
	
	public int getAdminid() {
		return adminid;
	}
	public void setAdminid(int adminid) {
		this.adminid = adminid;
	}
	public Admin(int adminid, String username, String password, String owner) {
		super();
		this.adminid = adminid;
		this.username = username;
		this.password = password;
		this.owner = owner;
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
	public String getOwner() {
		return owner;
	}
	public void setOwner(String owner) {
		this.owner = owner;
	}
	public Admin() {
		super();
	}

	
}
