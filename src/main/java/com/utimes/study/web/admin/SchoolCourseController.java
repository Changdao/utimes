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

        Logger.debug("School Course action:"+action);
        if(action!=null)action=action.trim();
        String idStr="";
        int id=0;
        switch(action)
        {
            case "loadpanel":
                return new ModelAndView("/admin/course_panel","course",new CourseBean());
            case "new":
                Logger.debug("new was called.");

                return new ModelAndView("/admin/course_row","course",new CourseBean());
            case "delete":

                idStr=request.getParameter("id");
                if(idStr!=null&!"".equals(idStr))
                {
                    id=Integer.parseInt(idStr);
                    Logger.debug("delete was called id is:"+id);


                    schoolService.deleteCourse(id);

                    return new ModelAndView("/admin/courseDataJSON","course",new CourseBean());
                }
                break;
            case "save":
                Logger.debug("action here....save.");
                CourseBean courseBean=new CourseBean();
                idStr=request.getParameter("id");
                String moneyStr=request.getParameter("money");
                String memo=request.getParameter("memo");
                String name=request.getParameter("name");
                String areaIdStr=request.getParameter("areaId");
                int areaId=Integer.parseInt(areaIdStr);

                id=0;
                if(idStr!=null&&!"".equals(idStr))id=Integer.parseInt(idStr);

                double money=0;
                if(moneyStr!=null&&!"".equals(moneyStr))money=Double.parseDouble(moneyStr);



                courseBean.setMemo(memo);
                courseBean.setMoneyRate(money);
                courseBean.setName(name);
                courseBean.setId(id);
                if(id>0)
                {
                    schoolService.updateCourse(courseBean);
                }
                else
                {
                schoolService.addCourse(courseBean,areaId);
                }

                return new ModelAndView("/admin/courseDataJSON","course",courseBean);

            default:
                break;
        }
        //todo: implement this method.
        return new ModelAndView("/admin/school_course_data","course","");
    }
}
