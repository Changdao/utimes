package com.utimes.study.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.utimes.study.bean.UserBean;
import com.utimes.study.service.UserService;

public class ProfileController extends AbstractController {

	private UserService userService;

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		UserBean user = (UserBean) request.getSession().getAttribute(
				Common.WEB_USER_KEY);
        if(user==null)return new ModelAndView("login");


		// todo to reimplement this by a native method

		request.setAttribute("interests", new String[] { "Study abroad",
					"Study tour", "Imigration", "Travel" });
		return new ModelAndView("register", "user", user);
	}

}
