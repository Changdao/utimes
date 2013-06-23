package com.utimes.study.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.utimes.study.bean.UserBean;

public class MyUtimesController extends AbstractController {
	private String loginView;
	private String successView;
	

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserBean user=(UserBean)request.getSession().getAttribute(Common.WEB_USER_KEY);
		if(user!=null)return new ModelAndView(getSuccessView(),Common.WEB_USER_KEY,user);
		else return new ModelAndView("login"); 
	}


	public String getLoginView() {
		return loginView;
	}


	public void setLoginView(String loginView) {
		this.loginView = loginView;
	}


	public String getSuccessView() {
		return successView;
	}


	public void setSuccessView(String successView) {
		this.successView = successView;
	}
	
	
	

}
