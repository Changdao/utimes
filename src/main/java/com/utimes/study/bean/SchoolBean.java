package com.utimes.study.bean;

import java.util.Date;
import java.util.List;

public class SchoolBean {
	private List<CourseBean> courses;
	private List areas;
	private String name;
	private String memo;
	private Date since;
	private String location;
	public List<CourseBean> getCourses()
	{
		return courses;
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
	
}
