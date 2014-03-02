package com.utimes.study.bean;

import java.util.List;

/**
 * Created by nevernew on 2/5/14.
 */
public class PriceListBean {
    private String schoolName;
    private double total;
    private List items;

    public String getSchoolName() {
        return schoolName;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public List getItems() {
        return items;
    }

    public void setItems(List items) {
        this.items = items;
    }

    public void setSchoolName(String schoolName) {
        this.schoolName = schoolName;
    }
}
