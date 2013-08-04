package com.utimes.study.service;

import com.utimes.study.fee.SchoolFeeStrategy;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-8-4
 * Time: 下午10:42
 * To change this template use File | Settings | File Templates.
 */
public class SchoolFeeStrategyFactoryImpl implements SchoolFeeStrategyFactory{
    private JdbcTemplate jdbcTemplate;

    @Override
    public SchoolFeeStrategy createSchoolFeeStrategy() {
        return new SchoolFeeStrategy();  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public SchoolFeeStrategy saveSchoolFeeStrategy() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }


    @Override
    public SchoolFeeStrategy loadSchoolFeeStrategy() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
