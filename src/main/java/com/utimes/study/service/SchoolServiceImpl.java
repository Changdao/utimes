package com.utimes.study.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.utimes.study.bean.SchoolBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.TransactionCallback;
import org.springframework.transaction.support.TransactionCallbackWithoutResult;
import org.springframework.transaction.support.TransactionTemplate;
import org.springframework.util.Assert;

public class SchoolServiceImpl implements SchoolService {

    private final TransactionTemplate transactionTemplate;

    public SchoolServiceImpl(PlatformTransactionManager transactionManager) {
        Assert.notNull(transactionManager, "The 'transactionManager' argument must not be null.");
        this.transactionTemplate = new TransactionTemplate(transactionManager);
    }


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

    private Integer getLastInsertID()
    {
        List<Integer> results=jdbcTemplate.query("SELECT LAST_INSERT_ID() as id",new RowMapper(){
            @Override
            public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
                return new Integer(rs.getInt("id"));
            }
        });
        if(results==null||results.size()<=0)throw new RuntimeException("Error while get last id");
        return results.get(0);
    }

    private static String SCHOOL_CREATE_SQL ="insert into SCHOOL(name,location,INTRODUCE) value(?,?,?)";
    private static String SCHOOL_CREATE_DEFAULT_AREA_SQL="insert into schoolarea(name,location,school_id) value(?,?,?)";
	public void addSchool(SchoolBean school) {
        final SchoolBean theSchool=school;
        transactionTemplate.execute(new TransactionCallbackWithoutResult() {

            // the code in this method executes in a transactional context
            public void doInTransactionWithoutResult(TransactionStatus status) {
                jdbcTemplate.update(SCHOOL_CREATE_SQL, new Object[]{theSchool.getName(), theSchool.getLocation(), theSchool.getMemo()});
                Integer id=getLastInsertID();
                jdbcTemplate.update(SCHOOL_CREATE_DEFAULT_AREA_SQL,new Object[]{"缺省校区",theSchool.getLocation(),id});


            }
        });

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

    private static String SCHOOL_UPDATE_SQL="update school set name=? , location=? , introduce=? , since=? where id=?";
    public void updateSchool(SchoolBean schoolBean)
    {
        jdbcTemplate.update(SCHOOL_UPDATE_SQL,new Object[]{schoolBean.getName(),schoolBean.getLocation(),
                                                            schoolBean.getMemo(),
                                                            schoolBean.getSince(),schoolBean.getId()
                                               });
    }

    public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

}
