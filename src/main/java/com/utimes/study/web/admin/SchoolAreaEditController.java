package com.utimes.study.web.admin;

import com.utimes.study.bean.SchoolAreaBean;
import com.utimes.study.service.SchoolService;
import com.utimes.study.util.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * School area manipulate controller.
 * User: nevernew
 * Date: 13-9-15
 * Time: 上午8:44
 * CRUD: (new no persistence,add do persistence), delete
 */
public class SchoolAreaEditController  extends AbstractController {
    private SchoolService schoolService;

    public SchoolService getSchoolService() {
        return schoolService;
    }

    public void setSchoolService(SchoolService schoolService) {
        this.schoolService = schoolService;
    }

    private int retrieveSchoolId(HttpServletRequest request)
    {
        String schoolIdStr=request.getParameter("schoolid");
        return Integer.parseInt(schoolIdStr);
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {



        String action=request.getParameter("action");
        SchoolAreaBean area=new SchoolAreaBean();
        switch(action)
        {
            case "delete":
                String id=request.getParameter("id");

                System.out.println("==>Delete school area id:"+id);
                schoolService.deleteArea(id);
                return new ModelAndView("/admin/schoolarea","schoolarea","");

            case "add":


                area.setLocation(request.getParameter("location"));
                area.setName(request.getParameter("name"));
                schoolService.addSchoolArea(area,retrieveSchoolId(request));
                return new ModelAndView("/admin/schoolarea","schoolarea",area);

            case "new":

                return new ModelAndView("/admin/area_row","area",area);

            case "loadpanel":

                return new ModelAndView("/admin/area_panel","area",area);

            case "save":

                String areaId=request.getParameter("id");
                String areaName=request.getParameter("name");
                String areaLocation=request.getParameter("location");
                String areaMemo=request.getParameter("memo");

                int intAreaId=0;
                if(areaId!=null&&!"".equals(areaId.trim()))
                {
                    intAreaId=Integer.parseInt(areaId);
                }
                if(intAreaId>=1)
                {
                    area.setId(intAreaId);
                    area.setLocation(areaLocation);
                    area.setMemo(areaMemo);
                    area.setName(areaName);
                    Logger.debug("update area:"+area);
                    schoolService.updateSchoolArea(area);
                    Logger.debug("added");
                }
                else
                {

                    area.setLocation(areaLocation);
                    area.setMemo(areaMemo);
                    area.setName(areaName);
                    Logger.debug("to add area:" + area);
                    intAreaId=schoolService.addSchoolArea(area,retrieveSchoolId(request));
                    Logger.debug("Added");
                    area.setId(intAreaId);

                }
                return new ModelAndView("/admin/schoolAreaJSON","area",area);

            default :
                break;

        }
        return new ModelAndView("/admin/schoolarea","schoolarea","");
    }
}
