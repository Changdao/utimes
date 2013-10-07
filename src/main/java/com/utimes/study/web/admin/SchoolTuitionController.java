package com.utimes.study.web.admin;

import com.utimes.study.bean.SchoolTuitionBean;
import com.utimes.study.service.SchoolService;
import com.utimes.study.util.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-10-7
 * Time: 下午8:12
 * To change this template use File | Settings | File Templates.
 */
public class SchoolTuitionController extends AbstractController {
    private SchoolService schoolService;

    public SchoolService getSchoolService() {
        return schoolService;
    }

    public void setSchoolService(SchoolService schoolService) {
        this.schoolService = schoolService;
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String action=request.getParameter("action");
        if(action!=null&&!"".equals(action.trim()))
        {
            switch( action)
            {
                case "delete":
                    break;
                case "add":
                    break;
                case "save":
                    String id=request.getParameter("id");
                    String paytype=request.getParameter("paytype");
                    String name=request.getParameter("name");
                    String type=request.getParameter("type");
                    String memo=request.getParameter("memo");
                    String money=request.getParameter("money");
                    String schoolId=request.getParameter("schoolid");
                    SchoolTuitionBean tuitionBean = new SchoolTuitionBean();
                    tuitionBean.setId(Integer.parseInt(id));
                    tuitionBean.setName(name);
                    tuitionBean.setMemo(memo);
                    tuitionBean.setMoney(Double.parseDouble(money));
                    tuitionBean.setPaytype(Integer.parseInt(paytype));
                    tuitionBean.setType(Integer.parseInt(type));
                    Logger.debug(tuitionBean.toString());
                    if(tuitionBean.getId()>0)
                    {
                        schoolService.updatefSchoolTuition(tuitionBean);
                    }
                    else
                    {

                        schoolService.addSchoolTuition(tuitionBean,Integer.parseInt(schoolId));
                    }
                    return new ModelAndView("/admin/schooltuitionJSON","tuition",tuitionBean);

                case "get":
                    break;
                default:
                    break;
            }

        }
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
