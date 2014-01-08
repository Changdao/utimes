package com.utimes.study.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


//import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.utimes.study.bean.UserBean;



public class UserServiceImpl implements UserService {
	private static String COUNT_SQL = "SELECT COUNT(*) FROM user";
	private JdbcTemplate jdbcTemplate;

	public void setJdbcTemplate(JdbcTemplate jt) {
		this.jdbcTemplate = jt;
	}

    static
    {
        System.out.println("<DEBUG> USER SERVICE IMPL THIS IS INITIALIZAED.......");
    }

	public int getCount() {
		return jdbcTemplate.queryForInt(COUNT_SQL);
	}

	private static String USER_SQL = "insert into user(lastname,firstname,email,memo,password) values(?,?,?,?,?)";

	public void signup(UserBean user) {
		jdbcTemplate.update(USER_SQL, new Object[] {
				user.getLastName(), user.getFirstName(),
				user.getEmail().toString(), user.getDescription(), user.getPassword() });
	}

	private class UserBeanMapper implements RowMapper {
		public Object mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			UserBean user=new UserBean();
			user.setDescription(rs.getString("memo"));
			user.setEmail(rs.getString("email"));
			user.setFirstName(rs.getString("firstName"));
			user.setLastName(rs.getString("lastName"));
            user.setId(rs.getInt("id"));
		
			return user;
		}
	}
	private static String GET_USER_SQL="select * from user limit ?,?";
	
	@SuppressWarnings("unchecked")
	public List<Object> getUsers(int pageNumber, int countPerPage) 
	{
		return jdbcTemplate.query(GET_USER_SQL, new Object[]{new Integer((pageNumber-1)*countPerPage),new Integer(countPerPage)},
				new UserBeanMapper());
		
	}
	private static String LOGIN_SQL="select * from user where email=? and password=?";
	public UserBean login(String email,String password)
	{
		Object obj=jdbcTemplate.queryForObject(LOGIN_SQL, new Object[]{email,password},
				new UserBeanMapper());
		//Logger.getLogger(this.getClass()).debug("UserBean is:"+obj);
		return (UserBean)obj;
	}

    @Override
    public boolean exists(String email) {
        List list=jdbcTemplate.queryForList("SELECT * FROM USER WHERE EMAIL=?",new Object[]{email});

        return list!=null&&list.size()>1;
    }
}
