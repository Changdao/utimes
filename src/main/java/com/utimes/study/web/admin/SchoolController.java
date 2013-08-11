package com.utimes.study.web.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utimes.study.bean.JSONListBean;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.utimes.study.bean.SchoolBean;
import com.utimes.study.service.SchoolService;

public class SchoolController extends AbstractController {

	private SchoolService schoolService;
    private static JSONListBean.IdGetter idGetter=new JSONListBean.IdGetter() {
        public int getId(Object obj)
        {
            return ( (SchoolBean)obj).getId();
        }
    };
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String s=request.getParameter("loaddata");
        String page=request.getParameter("page");
        String rows=request.getParameter("rows");
        String sidx=request.getParameter("sidx");
        String sord=request.getParameter("sord");
        logger.debug("request:"+page+" "+rows+" "+sidx+" "+sord);

        int rowsNum=rows==null||"".equals(rows)?10:Integer.parseInt(rows);

		logger.debug("request parameter: loaddata:"+s);
		if(s!=null&&!"".equals(s.trim()))
		{
			List<SchoolBean> schools=schoolService.getSchools();
            System.out.println("schools count:"+schools.size());
            int thePage=0;
            if(page!=null&&!"".equals(page))thePage=Integer.parseInt(page);
            else thePage=1;

            JSONListBean schoolList=new JSONListBean();
            schoolList.setPage(thePage);
            schoolList.setRecords(schools.size());
            schoolList.addPaginateRows(thePage,rowsNum,schools, idGetter );
            schoolList.setTotal(schools.size()/rowsNum+1);

			return new ModelAndView("admin/schoolsdata","schools",schoolList);
		}
		else return new ModelAndView("admin/school");
	}

	public SchoolService getSchoolService() {
		return schoolService;
	}

	public void setSchoolService(SchoolService schoolService) {
		this.schoolService = schoolService;
	}

}
