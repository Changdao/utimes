package com.utimes.study.web.admin;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SchoolEditController extends AbstractController {
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

        return new ModelAndView("/admin/school_edit","key","");
    }
}
