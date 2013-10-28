package com.utimes.study.bean;

public class CourseBean {
	private SchoolAreaBean owner;

    private double moneyRate; //money per 4 weeks

    private String name;
    private int id;
    private String memo;

    public SchoolAreaBean getOwner() {
        return owner;
    }

    public void setOwner(SchoolAreaBean owner) {
        this.owner = owner;
    }

    public double getMoneyRate() {
        return moneyRate;
    }

    public void setMoneyRate(double moneyRate) {
        this.moneyRate = moneyRate;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }
}
