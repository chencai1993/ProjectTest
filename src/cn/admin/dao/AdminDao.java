package cn.admin.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import cn.table.Admin;
import cn.table.User;

@Repository
public class AdminDao {
	@Resource
	private JdbcTemplate jdbctemplate;

	public boolean register(Admin admin) {
		String sql = "insert into admin(username,password,owner) values(?,?,?)";
		int count = jdbctemplate.update(sql, new Object[] {
				admin.getUsername(), admin.getPassword(), admin.getOwner() });
		return count > 0;
	}
	
	public void delete(int adminid) {

		String sql = "delete from admin where adminid=?";
		jdbctemplate.update(sql, new Object[] { adminid});

	}

	public List<Admin> query() {

		String sql = "select * from admin";
		List<Admin> result = jdbctemplate.query(sql, new RowMapper<Admin>() {

			public Admin mapRow(ResultSet rs, int rowNum) throws SQLException {
				// TODO Auto-generated method stub

				return new Admin(rs.getInt("AdminId"), rs.getString("Username"),
						rs.getString("Password"), rs.getString("Owner"));
			}

		});
		return result;

	}

	public String login(String username, String password) {

		String sql = "select * from admin where username=? and password=?";
		Map result = jdbctemplate.queryForMap(sql, new Object[] { username,
				password });
		return (String) result.get("Owner");

	}
}
