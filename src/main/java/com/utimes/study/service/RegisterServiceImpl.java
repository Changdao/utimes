package com.utimes.study.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.utimes.study.bean.EmailAddress;
import com.utimes.study.bean.UserBean;

public class RegisterServiceImpl implements RegisterService {
	private static String COUNT_SQL = "SELECT COUNT(*) FROM Register";
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jt) {
		this.jdbcTemplate = jt;
	}

	public int getCount() {
		return jdbcTemplate.queryForInt(COUNT_SQL);
	}

	private static String REGISTER_SQL = "insert into register(lastname,firstname,email,memo) values(?,?,?,?)";

	public void register(UserBean user) {
		jdbcTemplate.update(REGISTER_SQL, new Object[] {
				user.getLastName(), user.getFirstName(),
				user.getEmail().toString(), user.getDesc() });
	}

	private static String GET_REGISTER_SQL="select * from register limit ?,?";
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Object> getRegisters(int pageNumber, int countPerPage) {
		return jdbcTemplate.query(GET_REGISTER_SQL, new Object[]{new Integer(pageNumber*countPerPage),new Integer(countPerPage)}, 
				new RowMapper(){

					@Override
					public Object mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						UserBean user=new UserBean();
						user.setDesc(rs.getString("memo"));
						user.setEmail(new EmailAddress(rs.getString("email")));
						user.setFirstName(rs.getString("firstName"));
						user.setLastName(rs.getString("lastName"));
					
						return user;
					}
			
		});
		
	}
}
