package com.utimes.study.bean;

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
}
