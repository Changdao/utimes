package com.utimes.study.bean;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-10-7
 * Time: 下午9:15
 *
 * This is a simplest implementation,
 * the more complex one is located in com.utimes.study.fee.
 */
public class SchoolTuitionBean {
    private int id;
    private String name;
    private int type;//for calculation
    private int paytype;//for category;
    private double money;
    private String memo;
    private SchoolBean owner;

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

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getPaytype() {
        return paytype;
    }

    public void setPaytype(int paytype) {
        this.paytype = paytype;
    }

    public double getMoney() {
        return money;
    }

    public void setMoney(double money) {
        this.money = money;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public SchoolBean getOwner() {
        return owner;
    }

    public void setOwner(SchoolBean owner) {
        this.owner = owner;
    }

    @Override
    public String toString() {
        return super.toString()+"{id:"+this.id+",name:"+this.name+",type:"+this.type+",paytype:"+this.paytype+",money:"+this.money+"}";
    }
}
