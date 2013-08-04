package com.utimes.study.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.List;


import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.utimes.study.bean.EmailAddress;
import com.utimes.study.bean.UserBean;



public class UserServiceImpl implements UserService {
	private static String COUNT_SQL = "SELECT COUNT(*) FROM user";
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jt) {
		this.jdbcTemplate = jt;
	}

	public int getCount() {
		return jdbcTemplate.queryForInt(COUNT_SQL);
	}

	private static String USER_SQL = "insert into user(lastname,firstname,email,memo) values(?,?,?,?)";

	public void signup(UserBean user) {
		jdbcTemplate.update(USER_SQL, new Object[] {
				user.getLastName(), user.getFirstName(),
				user.getEmail().toString(), user.getDesc() });
	}

	private class UserBeanMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			UserBean user=new UserBean();
			user.setDesc(rs.getString("memo"));
			user.setEmail(new EmailAddress(rs.getString("email")));
			user.setFirstName(rs.getString("firstName"));
			user.setLastName(rs.getString("lastName"));
		
			return user;
		}
	}
	private static String GET_USER_SQL="select * from user limit ?,?";
	
	@SuppressWarnings("unchecked")
	public List<Object> getUsers(int pageNumber, int countPerPage) 
	{
		return jdbcTemplate.query(GET_USER_SQL, new Object[]{new Integer(pageNumber*countPerPage),new Integer(countPerPage)}, 
				new UserBeanMapper());
		
	}
	private static String LOGIN_SQL="select * from user where email=? and password=?";
	public UserBean login(String email,String password)
	{
		Object obj=jdbcTemplate.queryForObject(LOGIN_SQL, new Object[]{email,password},
				new UserBeanMapper());
		Logger.getLogger(this.getClass()).debug("UserBean is:"+obj);
		return (UserBean)obj;
	}
	
}
