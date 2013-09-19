package com.utimes.study.web.admin;

import com.utimes.study.bean.SchoolBean;
import com.utimes.study.service.SchoolService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class SchoolEditController extends AbstractController {

    private SchoolService schoolService;

    public SchoolService getSchoolService() {
        return schoolService;
    }

    public void setSchoolService(SchoolService schoolService) {
        this.schoolService = schoolService;
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String name=request.getParameter("name");
        System.out.println("name:"+name);

        String loadTuitionPanel=(String)request.getParameter("loadtuitionpanel");
        if(!(null==loadTuitionPanel||"".equals(loadTuitionPanel.trim())))
        {
            String rownumber=(String)request.getParameter("rownumber");

            return new ModelAndView("/admin/tuition_panel","rownumber",rownumber);
        }

        String schoolId=(String)request.getParameter("schoolid");
        if(null!=schoolId&&!"".equals(schoolId.trim()))
        {
            SchoolBean sb =schoolService.getSchool(schoolId);
            Thread.sleep(1000);
            return new ModelAndView("/admin/school_edit","school",sb);
        }


        return new ModelAndView("/admin/school_edit","key","");
    }
}
