package com.utimes.study.service;
import java.util.List;

import com.utimes.study.bean.CourseBean;
import com.utimes.study.bean.SchoolAreaBean;
import com.utimes.study.bean.SchoolBean;
import com.utimes.study.bean.SchoolTuitionBean;

public interface SchoolService {
	public List<SchoolBean> getSchools();
	public void addSchool(SchoolBean school);
	public void removeSchool();

    public int addCourse(CourseBean course, int id);
    public void updateCourse(CourseBean course);
    public void deleteCourse(CourseBean course);
    public void deleteCourse(int id);
    public CourseBean getCourse(int id);

    public void updateSchool(SchoolBean schoolBean);
	public SchoolBean getSchool(String id);
    public void deleteSchool(String id);
    public SchoolBean findSchoolByName(String name);
    public void deleteArea(String id);
    public void deleteTuition(int id);

    /**
     *
     * @param schoolArea
     * @return the new added SchoolArea Id
     */
    public Integer addSchoolArea(SchoolAreaBean schoolArea);
    public Integer addSchoolArea(SchoolAreaBean schoolArea, Integer schoolId);
    public void updateSchoolArea(SchoolAreaBean areaBean);


    int updatefSchoolTuition(SchoolTuitionBean tuitionBean);

    void addSchoolTuition(SchoolTuitionBean tuitionBean,int schoolId);
    void loadCourses(SchoolBean school);
    public List<CourseBean> getCourses(int schoolId);
}
