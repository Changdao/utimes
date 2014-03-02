package com.utimes.study.service;

import com.utimes.study.bean.*;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by nevernew on 1/8/14.
 */
public class PriceServiceImpl implements PriceService {

    private JdbcTemplate jdbcTemplate;
    private SchoolService schoolService;

    public SchoolService getSchoolService() {
        return schoolService;
    }

    public void setSchoolService(SchoolService schoolService) {
        this.schoolService = schoolService;
    }

    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List getPriceList(int schoolId, int courseId, int weeks) {

        List result=new ArrayList();

        CourseBean course=schoolService.getCourse(courseId);
        double money=course.getMoneyRate()/4*weeks;
        PriceListItem item1=new PriceListItem();
        item1.setName("学费");
        item1.setValue(money);
        result.add(item1);

        SchoolBean school=schoolService.getSchool(""+schoolId);

        List<SchoolTuitionBean> items=school.getTuitionItems();
        for(SchoolTuitionBean tuitionItem:items)
        {
            item1=new PriceListItem();
            item1.setName(tuitionItem.getName());
            item1.setValue(tuitionItem.getMoney());
            result.add(item1);
        }

        return result;
    }

    @Override
    public PriceListBean getPriceListBean(int schoolId, int courseId, int weeks) {
        List items=getPriceList(schoolId,courseId,weeks);

        double total=0;
        for(PriceListItem i:(List<PriceListItem>)items)
        {
            total+=i.getValue();
        }
        SchoolBean school=schoolService.getSchool(""+schoolId);

        PriceListBean bean=new PriceListBean();
        bean.setItems(items);
        bean.setSchoolName(school.getName());
        bean.setTotal(total);
        return bean;
    }
}
