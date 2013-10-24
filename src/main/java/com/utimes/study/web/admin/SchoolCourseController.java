package com.utimes.study.web.admin;

import com.utimes.study.bean.CourseBean;
import com.utimes.study.service.SchoolService;
import com.utimes.study.util.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-10-22
 * Time: 下午11:21
 * To change this template use File | Settings | File Templates.
 */
public class SchoolCourseController extends AbstractController {
    SchoolService schoolService;

    public SchoolService getSchoolService() {
        return schoolService;
    }

    public void setSchoolService(SchoolService schoolService) {
        this.schoolService = schoolService;
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String action=request.getParameter("action");

        switch(action)
        {
            case "loadpanel":
                return new ModelAndView("/admin/course_panel","course",new CourseBean());
            case "new":
                Logger.debug("new was called.");

                return new ModelAndView("/admin/course_row","course",new CourseBean());
            case "delete":
                break;
            case "save":
                break;
            default:
                break;
        }
        //todo: implement this method.
        return new ModelAndView("/admin/school_course_data","course","");
    }
}
