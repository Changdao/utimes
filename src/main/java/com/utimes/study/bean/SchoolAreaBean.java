package com.utimes.study.bean;

import java.util.List;

/**
 * One school often have only one area, but Fella has two.
 *
 */
public class SchoolAreaBean {
    private SchoolBean owner;
    private int id;
    private String name;
    private String location;
    private String memo;
    private List<CourseBean> courses;


    public SchoolBean getOwner() {
        return owner;
    }

    public void setOwner(SchoolBean owner) {
        this.owner = owner;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public List<CourseBean> getCourses() {
        return courses;
    }

    public void setCourses(List<CourseBean> courses) {
        this.courses = courses;
    }
}
