package com.utimes.study.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.utimes.study.bean.SchoolBean;

public class SchoolServiceImpl implements SchoolService {

	private class SchoolRowMapper implements RowMapper {

		public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
			SchoolBean school = new SchoolBean();
			school.setId(rs.getInt("id"));
			school.setName(rs.getString("name"));
			school.setLocation(rs.getString("location"));
			school.setMemo(rs.getString("introduce"));
			school.setSince(rs.getDate("Since"));
			return school;
		}

	}

	private JdbcTemplate jdbcTemplate;
	private static String SCHOOL_SELECT_SQL = "SELECT * FROM SCHOOL";

	@SuppressWarnings("unchecked")
	public List<SchoolBean> getSchools() {
		return jdbcTemplate.query(SCHOOL_SELECT_SQL, new Object[] {},
				new SchoolRowMapper());
	}

	private static String SCHOOL_GET_BY_ID_SQL = "select * from SCHOOL where id=?";

	public SchoolBean getSchool(String id) {
		return (SchoolBean) jdbcTemplate.queryForObject(SCHOOL_GET_BY_ID_SQL,
				new Object[] { id }, new SchoolRowMapper());
	}

    private static String SCHOOL_CREATE_SQL ="insert into SCHOOL(name,location,INTRODUCE) value(?,?,?)";
	public void addSchool(SchoolBean school) {
        jdbcTemplate.update(SCHOOL_CREATE_SQL,new Object[]{school.getName(),school.getLocation(),school.getMemo()});

	}

	public void removeSchool() {
		// TODO Auto-generated method stub

	}

	public void addCourse() {
		// TODO Auto-generated method stub

	}

    private static String SCHOOL_GET_BY_NAME_SQL = "select * from SCHOOL where name=?";
    @Override
    public SchoolBean findSchoolByName(String name) {
        List<SchoolBean> results= jdbcTemplate.query(SCHOOL_GET_BY_NAME_SQL,
                new Object[] { name }, new SchoolRowMapper());
        if(results.size()>0)return results.get(0);
        else return null;
    }

    public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
