package com.utimes.study.web.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.utimes.study.bean.SchoolBean;
import com.utimes.study.service.SchoolService;

public class SchoolController extends AbstractController {

	private SchoolService schoolService;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String s=request.getParameter("loaddata");
		logger.debug("request parameter: loaddata:"+s);
		if(s!=null&&!"".equals(s.trim()))
		{
			List<SchoolBean> schools=schoolService.getSchools();
			return new ModelAndView("schoolsdata","schools",schools);
		}
		else return new ModelAndView("school");
	}

	public SchoolService getSchoolService() {
		return schoolService;
	}

	public void setSchoolService(SchoolService schoolService) {
		this.schoolService = schoolService;
	}

}
