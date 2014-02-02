package com.utimes.study.service;

import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by nevernew on 1/8/14.
 */
public class PriceServiceImpl implements PriceService {

    private JdbcTemplate jdbcTemplate;

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List getPriceList(int schoolId, int courseId, int weeks) {
        //getCourse by course Id
        //calc couse price by weeks
        //calc other tuition items

        //return it.

        return new ArrayList();
    }
}
