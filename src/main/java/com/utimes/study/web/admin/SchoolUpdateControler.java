package com.utimes.study.web.admin;

import com.utimes.study.bean.SchoolBean;
import com.utimes.study.service.SchoolService;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Enumeration;


//todo: use AbstractCommandController SimpleFormController replace AbstractController

/**
 * SchoolUpdateController
 * Another SchoolEditController to implement update action.
 * Until now(2013-9-14) I'm learning spring and jquery.
 */
public class SchoolUpdateControler extends AbstractController {
    private SchoolService schoolService;

    public SchoolService getSchoolService() {
        return schoolService;
    }

    public void setSchoolService(SchoolService schoolService) {
        this.schoolService = schoolService;
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String id=request.getParameter("id");

        String name=request.getParameter("name");
        String introduce=request.getParameter("introduce");
        String location=request.getParameter("location");
        String since=request.getParameter("since");

        Enumeration emer=request.getParameterNames();
        while(emer.hasMoreElements())
        {
            Object obj=emer.nextElement();
            System.out.println("name:"+obj+" value:"+request.getParameter((String)obj));
        }

        SchoolBean sb=new SchoolBean();
        sb.setId(Integer.parseInt(id));
        sb.setName(name);
        sb.setMemo(introduce);
        sb.setLocation(location);
        //todo: process the since.

        schoolService.updateSchool(sb);

        return new ModelAndView("/admin/blank","school","");
    }
}
