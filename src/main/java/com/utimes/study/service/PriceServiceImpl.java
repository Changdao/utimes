package com.utimes.study.service;

import org.springframework.jdbc.core.JdbcTemplate;

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
}
