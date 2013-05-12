package com.utimes.study.service;
import javax.sql.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

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
}
