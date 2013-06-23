package com.utimes.study.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.utimes.study.bean.UserBean;
import com.utimes.study.service.RegisterService;

public class LoginController extends AbstractController {

	private RegisterService registerService;
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		UserBean user;
		System.out.println("email:"+email);
		System.out.println("passowrd:"+password);
		
		if(email==null||email.trim().equals("")||
				password==null||password.trim().equals("")||
				(user=registerService.login(email, password))==null)
			return new ModelAndView("login");
		
		request.getSession().setAttribute(Common.WEB_USER_KEY,user );
		
		return new ModelAndView("myutimes",Common.WEB_USER_KEY,user);
		
	}

	public RegisterService getRegisterService() {
		return registerService;
	}

	public void setRegisterService(RegisterService registerService) {
		this.registerService = registerService;
	}
	

}
