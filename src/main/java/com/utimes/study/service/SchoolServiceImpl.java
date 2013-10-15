package com.utimes.study.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.utimes.study.bean.SchoolAreaBean;
import com.utimes.study.bean.SchoolTuitionBean;
import com.utimes.study.util.Logger;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.utimes.study.bean.SchoolBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
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

    private class SchoolTuitionRowMapper implements RowMapper{
        private final SchoolBean school;

        public SchoolTuitionRowMapper(SchoolBean owner)
        {
            this.school=owner;
        }

        @Override
        public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            SchoolTuitionBean tuition=new SchoolTuitionBean();
            tuition.setName(rs.getString("name"));
            tuition.setPayType(rs.getInt("paytype"));
            tuition.setType(rs.getInt("type"));
            tuition.setMoney(rs.getDouble("money"));
            tuition.setMemo(rs.getString("memo"));
            tuition.setOwner(this.school);
            tuition.setId(rs.getInt("id"));
            return tuition;
        }
    }

    private class SchoolAreaRowMapper implements RowMapper{

        private final SchoolBean owner;

        public SchoolAreaRowMapper(SchoolBean owner)
        {
            this.owner=owner;
        }

        public Object mapRow(ResultSet rs, int rowNum) throws SQLException{
            SchoolAreaBean area=new SchoolAreaBean();
            area.setLocation(rs.getString("location"));
            area.setName(rs.getString("name"));
            area.setId(rs.getInt("id"));
            area.setOwner(owner);
            area.setMemo(rs.getString("memo"));
            return area;

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
    private static String SCHOOL_AREA_GET_BY_SCHOOL_SQL="select * from SCHOOLAREA where flag>=0 and school_id=?";
    private static String SCHOOL_TUITION_GET_BY_SCHOOL_SQL="select * from SCHOOLTUITIONITEMS WHERE school_id=? and flag>=0";


	public SchoolBean getSchool(String id) {

		SchoolBean school=(SchoolBean) jdbcTemplate.queryForObject(SCHOOL_GET_BY_ID_SQL,
				new Object[] { id }, new SchoolRowMapper());
        List<SchoolAreaBean> areas=jdbcTemplate.query(SCHOOL_AREA_GET_BY_SCHOOL_SQL, new Object[]{id}, new SchoolAreaRowMapper(school));
        List<SchoolTuitionBean> tuitions=jdbcTemplate.query(SCHOOL_TUITION_GET_BY_SCHOOL_SQL,new Object[]{id},new SchoolTuitionRowMapper(school));
        Logger.debug("Tuition count:"+tuitions.size());
        school.setAreas(areas);
        school.setTuitionItems(tuitions);
        return school;
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

    private static String SCHOOL_AREA_DELETE_SQL="update schoolarea set flag=-1 where id=? ";
    public void deleteArea(String id)
    {
        jdbcTemplate.update(SCHOOL_AREA_DELETE_SQL,new Object[]{id});
    }

    private static final String TUITION_DELETE_SQL="update schooltuitionitems set flag=-1 where id=?";
    @Override
    public void deleteTuition(int id) {
        jdbcTemplate.update(TUITION_DELETE_SQL,new Object[]{id});
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


    private static String SCHOOL_AREA_INSERT_SQL="insert into schoolarea(name,school_id,location,memo,flag) value(?,?,?,?,1)";

    @Override
    public Integer addSchoolArea(SchoolAreaBean schoolArea, Integer schoolId) {
        jdbcTemplate.update(SCHOOL_AREA_INSERT_SQL,new Object[]{schoolArea.getName(),schoolId ,schoolArea.getLocation(),schoolArea.getMemo()});
        return getLastInsertID();
    }

    public Integer addSchoolArea(SchoolAreaBean schoolArea)
    {
        addSchoolArea(schoolArea, schoolArea.getOwner().getId());
        return getLastInsertID();
    }




    public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


    private static String SCHOOL_AREA_UPDATE_SQL="update schoolarea set name=?,location=?,memo=?,flag=0 where id=?";

    @Override
    public void updateSchoolArea(SchoolAreaBean areaBean) {
        jdbcTemplate.update(SCHOOL_AREA_UPDATE_SQL,new Object[]{areaBean.getName(),areaBean.getLocation(),areaBean.getMemo(),areaBean.getId()});

    }


    private static String SCHOOL_TUITION_UPDATE_SQL="update schooltuitionitems set name=?,type=?,paytype=?,money=?,memo=? where id=?";

    @Override
    public int updatefSchoolTuition(SchoolTuitionBean tuitionBean) {
        jdbcTemplate.update(SCHOOL_TUITION_UPDATE_SQL, new Object[]{tuitionBean.getName(),tuitionBean.getType(),tuitionBean.getPayType(),tuitionBean.getMoney(),tuitionBean.getMemo(),tuitionBean.getId()});
        return getLastInsertID();
    }



    private static String SCHOOL_TUITION_ADD_SQL="insert into schooltuitionitems(name,type,paytype,money,memo,school_id) value(?,?,?,?,?,?)";
    @Override
    public void addSchoolTuition(SchoolTuitionBean tuitionBean,int schoolId) {
        jdbcTemplate.update(SCHOOL_TUITION_ADD_SQL,new Object[]{tuitionBean.getName(),tuitionBean.getType(),tuitionBean.getPayType(),tuitionBean.getMoney(),tuitionBean.getMemo(),schoolId});
    }
}
