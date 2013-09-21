package com.utimes.study.service;
import java.util.List;

import com.utimes.study.bean.SchoolAreaBean;
import com.utimes.study.bean.SchoolBean;

public interface SchoolService {
	public List<SchoolBean> getSchools();
	public void addSchool(SchoolBean school);
	public void removeSchool();
	public void addCourse();
    public void updateSchool(SchoolBean schoolBean);
	public SchoolBean getSchool(String id);
    public SchoolBean findSchoolByName(String name);
    public void deleteArea(String id);

    /**
     *
     * @param schoolArea
     * @return the new added SchoolArea Id
     */
    public Integer addSchoolArea(SchoolAreaBean schoolArea);
    public Integer addSchoolArea(SchoolAreaBean schoolArea, Integer schoolId);


}
