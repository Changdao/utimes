package com.utimes.study.service;
import java.util.List;

import com.utimes.study.bean.SchoolBean;

public interface SchoolService {
	public List<SchoolBean> getSchools();
	public void addSchool(SchoolBean school);
	public void removeSchool();
	public void addCourse();
	public SchoolBean getSchool(String id);

}
