package cn.user.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cn.table.User;

@Repository
public class UserDao {

	@Resource
	private JdbcTemplate jdbctemplate;

	public boolean register(User user) { // 注册用户
		String sql = "insert into user(UserNo,Username,Password,Name,Phone,PostId) values(?,?,?,?,?,?)";
		boolean count = Update(
				sql,
				new Object[] { user.getUserno(), user.getUsername(),
						user.getPassword(), user.getName(), user.getPhone(),
						user.getPostid() });
		return count;
	}

	public boolean login(String username, String password) { // 进行用户登录验证
		User user;
		String sql = "select * from user where username=? and password=?";
		Map result = jdbctemplate.queryForMap(sql, new Object[] { username,
				password });
		return result != null;

	}

	public List<User> querystaff(String userno, String name) { // 查询员工数据

		String sql;
		Object[] ojs;
		if (userno != null && !userno.equals("")) {
			sql = "select * from user where userno like ?";
			ojs = new Object[] { "%" + userno + "%" };
		} else if (name != null && !name.equals("")) {
			sql = "select * from user where name like ?";
			ojs = new Object[] { "%" + name + "%" };
		} else {
			sql = "select * from user where 1=1 or userno=?";
			ojs = new Object[] { userno };
		}
		List<User> result = Query(sql, ojs);
		return result;
	}

	public User getUerById(int userid) {  
		String sql = "select * from user where userid=?";
		User user = Query(sql, new Object[] { userid }).get(0);
		return user;
	}

	public List<User> Query(String sql, Object[] ojs) { // 通过sql及参数列表，从jdbc中获取数据
		List<User> result = jdbctemplate.query(sql, ojs, new RowMapper<User>() {

			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub

				return new User(rs.getInt("UserId"), rs.getString("Name"), rs
						.getString("UserNo"), rs.getString("Username"), rs
						.getString("Password"), rs.getString("Phone"), rs
						.getInt("PostId"));
			}

		});
		return result;
	}

	public boolean Update(String sql, Object[] ojs) // 通过sql及参数列表，从jdbc中更新数据
	{
		return (jdbctemplate.update(sql, ojs) > 0);
	}

	public boolean delete(int userid) {
		// TODO Auto-generated method stub
		String sql = "delete from user where userid=?";
		Object[] args = new Object[] { userid };
		return Update(sql, args);
	}

	public boolean modify(User user) {
		// TODO Auto-generated method stub
		String sql = "update user set password=?,phone=?,postid=? where userid=?";
		Object[] args = new Object[] { user.getPassword(), user.getPhone(),
				user.getPostid(), user.getUserid() };
		boolean result=Update(sql, args);
		return result;
	}
}
