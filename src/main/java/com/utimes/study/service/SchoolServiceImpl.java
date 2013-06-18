package com.utimes.study.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.utimes.study.bean.SchoolBean;

public class SchoolServiceImpl implements SchoolService {
	
	private JdbcTemplate jdbcTemplate;
	private static String SCHOOL_SELECT_SQL="SELECT * FROM SCHOOL";
	@SuppressWarnings("unchecked")
	public List<SchoolBean> getSchools() {
		return jdbcTemplate.query(SCHOOL_SELECT_SQL, new Object[]{}, 
				new RowMapper(){

					public Object mapRow(ResultSet rs, int rowNum)
							throws SQLException {
						SchoolBean school=new SchoolBean();
						school.setName(rs.getString("name"));
						school.setLocation(rs.getString("location"));
						school.setMemo(rs.getString("introduce"));
						school.setSince(rs.getDate("Since"));
						return school;					}
			
		});
	}


	public void addSchool(SchoolBean school) {
		// TODO Auto-generated method stub
		
	}


	public void removeSchool() {
		// TODO Auto-generated method stub
		
	}


	public void addCourse() {
		// TODO Auto-generated method stub
		
	}


	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}
	
	
	
}
