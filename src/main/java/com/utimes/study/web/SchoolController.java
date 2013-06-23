package com.utimes.study.web;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.utimes.study.bean.SchoolBean;
import com.utimes.study.service.SchoolService;

public class SchoolController extends AbstractController {

	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id=request.getParameter("id");
		if(id!=null&&!id.trim().equals(""))
		{
			System.out.println("LOADED school:id:"+id);
			SchoolBean school=schoolService.getSchool(id);
			return new ModelAndView("school","school",school);
		}
		List schools=schoolService.getSchools();
		request.setAttribute("shools",schools);
		return new ModelAndView("schools","schools",schools); 
	}

	
	
	private SchoolService schoolService;



	public SchoolService getSchoolService() {
		return schoolService;
	}



	public void setSchoolService(SchoolService schoolService) {
		this.schoolService = schoolService;
	}
	
	
}
