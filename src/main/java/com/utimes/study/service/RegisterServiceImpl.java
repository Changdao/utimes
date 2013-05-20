package com.utimes.study.service;
import org.springframework.jdbc.core.JdbcTemplate;

import com.utimes.study.bean.UserBean;

public class RegisterServiceImpl implements RegisterService
{
   private static String COUNT_SQL="SELECT COUNT(*) FROM Register";
   private JdbcTemplate jdbcTemplate;
   public void setJdbcTemplate(JdbcTemplate jt)
   {
     this.jdbcTemplate=jt;
   }
   public int getCount()
   {
      return jdbcTemplate.queryForInt(COUNT_SQL);
   }
   private static String REGISTER_SQL="insert into register(name,email,memo) values(?,?,?)";
   public void register(UserBean user)
   {
	   jdbcTemplate.update(REGISTER_SQL, new Object[]{user.getLastName()+user.getFirstName(),user.getEmail().toString(),user.getDesc()});	   
   }
}
