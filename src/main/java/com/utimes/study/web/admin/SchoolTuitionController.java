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


    public int validateInteger(String para)throws Exception
    {
        if(para!=null)
        {
            return Integer.parseInt(para.trim());
        }
        else throw new NumberFormatException(para+" is not a number");
    }

    public double validateNumber(String para)throws Exception
    {
        if(para!=null)
        {
            return Double.parseDouble(para.trim());
        }
        else throw new NumberFormatException(para+" is not a number");
    }

    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String action=request.getParameter("action");
        if(action!=null&&!"".equals(action.trim()))
        {
            String id;
            switch( action)
            {
                case "delete":
                     id=request.getParameter("id");
                    schoolService.deleteTuition(Integer.parseInt(id));
                    return new ModelAndView("/admin/schooltuitionJSON","tuition",null);

                case "add":
                    break;
                case "save":
                     id=request.getParameter("id");
                    String paytype=request.getParameter("paytype");
                    String name=request.getParameter("name");
                    String type=request.getParameter("type");
                    String memo=request.getParameter("memo");
                    String money=request.getParameter("money");
                    String schoolId=request.getParameter("schoolid");
                    try
                    {

                        SchoolTuitionBean tuitionBean = new SchoolTuitionBean();
                        tuitionBean.setId(validateInteger(id));
                        tuitionBean.setName(name);
                        tuitionBean.setMemo(memo);
                        tuitionBean.setMoney(validateNumber(money));
                        tuitionBean.setPayType(validateInteger(paytype));
                        tuitionBean.setType(validateInteger(type));
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
                    }
                    catch(Exception e)
                    {
                        return new ModelAndView("/admin/schooltuitionJSON","tuition",null);
                    }


                case "get":
                    break;
                default:
                    break;
            }

        }
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
