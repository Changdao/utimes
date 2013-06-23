package com.utimes.study.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.utimes.study.bean.UserBean;
import com.utimes.study.service.RegisterService;

public class ProfileController extends AbstractController {

	private RegisterService registerService;

	public RegisterService getRegisterService() {
		return registerService;
	}

	public void setRegisterService(RegisterService registerService) {
		this.registerService = registerService;
	}

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserBean user = (UserBean) request.getSession().getAttribute(
				Common.WEB_USER_KEY);
		if (user != null) {

			// todo to reimplement this by a native method

			request.setAttribute("interests", new String[] { "Study abroad",
					"Study tour", "Imigration", "Travel" });
			return new ModelAndView("register", "user", user);
		} else
			return new ModelAndView("login");

	}

}
