package com.utimes.study.web.admin;

import com.utimes.study.bean.SchoolBean;
import com.utimes.study.service.SchoolService;
import com.utimes.study.util.Logger;
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
        Logger.debug("name:"+name);

        String action=(String)request.getParameter("action");
        Logger.debug("action:"+action);

        String schoolId=(String)request.getParameter("schoolid");
        Logger.debug("\n==>SchoolId:"+schoolId);
        SchoolBean sb=null;
        if(null!=schoolId&&!"".equals(schoolId.trim()))
        {
            sb =schoolService.getSchool(schoolId);
            Logger.debug("\n==>school area size:"+sb.getAreas().size());
            Thread.sleep(1000);

        }
        if(!(null==action||"".equals(action.trim())))
        {
            switch(action)
            {
                case "delete":
                    schoolService.deleteSchool(schoolId);
                    return new ModelAndView("/admin/blank","","");
                case "loadtuitionpanel":
                    Logger.debug("Action:loadtuitionpanel");
                    String rownumber=(String)request.getParameter("rownumber");
                    Logger.debug("rownumber:"+rownumber);
                    return new ModelAndView("/admin/tuition_panel","rownumber",rownumber);

                case "loadtuitionrow":
                    return new ModelAndView("/admin/tuition_row","rownumber","");

                case "editcourse":
                    if(sb!=null)
                    {
                        schoolService.loadCourses(sb);
                    }
                    return new ModelAndView("/admin/school_course","school",sb);
            }
        }
        if(sb==null)
        return new ModelAndView("/admin/school_edit","key","");
        else return new ModelAndView("/admin/school_edit","school",sb);
    }
}
