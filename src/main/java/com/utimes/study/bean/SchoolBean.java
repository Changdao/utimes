package com.utimes.study.bean;

import java.util.Date;
import java.util.List;

public class SchoolBean {

	private int id;
    private List<SchoolAreaBean> areas;
    private List<SchoolTuitionBean> tuitionItems;
	private String name;
	private String memo;
	private Date since;
	private String location;

    public List<SchoolTuitionBean> getTuitionItems() {
        return tuitionItems;
    }

    public void setTuitionItems(List<SchoolTuitionBean> tuitionItems) {
        this.tuitionItems = tuitionItems;
    }

    public List<SchoolAreaBean> getAreas() {
        return areas;
    }

    public void setAreas(List<SchoolAreaBean> areas) {
        this.areas = areas;
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Date getSince() {
		return since;
	}
	public void setSince(Date since) {
		this.since = since;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
	public String toString()
	{
		return super.toString()+"name:"+name+"\nLocation:"+location+"\nmemo:"+memo;
	}
	
}
