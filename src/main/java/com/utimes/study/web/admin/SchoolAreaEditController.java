package com.utimes.study.web.admin;

import com.utimes.study.bean.SchoolAreaBean;
import com.utimes.study.service.SchoolService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-9-15
 * Time: 上午8:44
 * To change this template use File | Settings | File Templates.
 */
public class SchoolAreaEditController  extends AbstractController {
    private SchoolService schoolService;
    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {


        String action=request.getParameter("action");
        if("delete".equals(action))
        {
            String id=request.getParameter("id");

            System.out.println("==>Delete school area id:"+id);
            schoolService.deleteArea(id);
            return new ModelAndView("/admin/schoolarea","schoolarea","");
        }
        if("add".equals(action))
        {
            String schoolIdStr=request.getParameter("schoolid");
            Integer schoolId= Integer.parseInt(schoolIdStr);
            SchoolAreaBean schoolArea=new SchoolAreaBean();
            schoolArea.setLocation(request.getParameter("location"));
            schoolArea.setName(request.getParameter("name"));
            schoolService.addSchoolArea(schoolArea,schoolId);
        }

        return new ModelAndView("/admin/schoolarea","schoolarea","");
    }
}
