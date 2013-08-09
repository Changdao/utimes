package com.utimes.study.web.admin;

import com.utimes.study.bean.SchoolBean;
import com.utimes.study.service.SchoolService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
  Create the School
 */
public class SchoolCreationController extends AbstractController {
    SchoolService schoolService;
    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String schoolName=request.getParameter("name");
        String schoolLocation=request.getParameter("location");
        String schoolMemo=request.getParameter("introduce");
        SchoolBean school= new SchoolBean();
        school.setName(schoolName);
        school.setLocation(schoolLocation);
        school.setMemo(schoolMemo);

        System.out.println(school);

        schoolService.addSchool(school);

        SchoolBean result=schoolService.findSchoolByName(schoolName);
        //todo implement this.
        return new ModelAndView("admin/createschoolresult","result",result);
    }

    public SchoolService getSchoolService() {
        return schoolService;
    }

    public void setSchoolService(SchoolService schoolService) {
        this.schoolService = schoolService;
    }
}
