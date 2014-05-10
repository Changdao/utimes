package com.utimes.study.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;


//import org.apache.log4j.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.utimes.study.bean.UserBean;



public class UserServiceImpl implements UserService {
	private static String COUNT_SQL = "SELECT COUNT(*) FROM user where flag<>-1";
	private JdbcTemplate jdbcTemplate;
    private MailService mailService;
    private String mailFrom;
    private String registerMailTopic;
    private String registerMailContent;

	public void setJdbcTemplate(JdbcTemplate jt) {
		this.jdbcTemplate = jt;
	}

    public void setMailService(MailService mailService) {
        this.mailService = mailService;
    }

    public void setMailFrom(String mailFrom) {
        this.mailFrom = mailFrom;
    }

    public void setRegisterMailTopic(String registerMailTopic) {
        this.registerMailTopic = registerMailTopic;
    }

    public void setRegisterMailContent(String registerMailContent) {
        this.registerMailContent = registerMailContent;
    }

    static
    {
        System.out.println("<DEBUG> USER SERVICE IMPL THIS IS INITIALIZAED.......");
    }

	public int getCount() {
		return jdbcTemplate.queryForInt(COUNT_SQL);
	}

	private static String USER_SQL = "insert into user(lastname,firstname,email,memo,password) values(?,?,?,?,?)";

	public void signup(UserBean user,boolean sendMail) {


		jdbcTemplate.update(USER_SQL, new Object[] {
				user.getLastName(), user.getFirstName(),
				user.getEmail().toString(), user.getDescription(), user.getPassword() });
        if(sendMail)
        mailService.sendService(mailFrom,user.getEmail().toString(),registerMailTopic,registerMailContent);
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
	private static String GET_USERS_SQL ="select * from user where flag<>-1 limit ?,?";
	
	@SuppressWarnings("unchecked")
	public List<Object> getUsers(int pageNumber, int countPerPage) 
	{
		return jdbcTemplate.query(GET_USERS_SQL, new Object[]{new Integer((pageNumber-1)*countPerPage),new Integer(countPerPage)},
				new UserBeanMapper());
		
	}
	private static String LOGIN_SQL="select * from user where email=? and password=? and flag<>-1";
	public UserBean login(String email,String password)
	{   try
        {
		    Object obj=jdbcTemplate.queryForObject(LOGIN_SQL, new Object[]{email,password},
				new UserBeanMapper());
		    //Logger.getLogger(this.getClass()).debug("UserBean is:"+obj);
		    return (UserBean)obj;
        }
        catch(org.springframework.dao.EmptyResultDataAccessException e)
        {
            return null;
        }
	}

    @Override
    public boolean exists(String email) {
        List list=jdbcTemplate.queryForList("SELECT * FROM USER WHERE flag<>-1 and EMAIL=?",new Object[]{email});

        return list!=null&&list.size()>1;
    }

    private static String USER_EDIT_SQL = "update user set firstname=?,lastname=?,email=?,memo=? where id = ?";

    @Override
    public boolean update(UserBean user) {
        jdbcTemplate.update(USER_EDIT_SQL,new Object[]{user.getFirstName(),user.getLastName(),user.getEmail(),user.getDescription(),user.getId()});
        return true;
    }


    private static String GET_USER_SQL = "select * from user where id= ?";

    @Override
    public UserBean getUser(String id) {
        try
        {
            Object obj=jdbcTemplate.queryForObject(GET_USER_SQL, new Object[]{id},
                    new UserBeanMapper());
            //Logger.getLogger(this.getClass()).debug("UserBean is:"+obj);
            return (UserBean)obj;
        }
        catch(org.springframework.dao.EmptyResultDataAccessException e)
        {
            return null;
        }
    }

    @Override
    public boolean delete(String id) {
        jdbcTemplate.update("update user set flag=-1 where id=?",new Object[]{id});
        return true;
    }
}
