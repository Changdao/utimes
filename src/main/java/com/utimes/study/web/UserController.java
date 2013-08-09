package com.utimes.study.web;

import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.servlet.mvc.SimpleFormController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.validation.BindException;
import java.util.*;

import com.utimes.study.bean.EmailAddress;
import com.utimes.study.bean.UserBean;
import com.utimes.study.service.UserService;

public class UserController extends SimpleFormController {
	public UserController() {
		setCommandClass(UserBean.class);
		setCommandName("user");
	}
	
	private static final String[] ALL_INTERESTS={
		"Study abroad","Study tour","Imigration","Travel"
	};
	
	protected ModelAndView onSubmit(Object command, BindException be)
	{
		System.out.println("-->onSubmit was called:"+command);
		UserBean user=(UserBean)command;
		userService.signup(user);
        logger.debug(user);
		return new ModelAndView(getSuccessView());
	}
	
	protected Object formBackingObject(HttpServletRequest request)throws Exception
	{
		System.out.println("-->formBackingObject was callled");
		UserBean user=(UserBean)super.formBackingObject(request);
		return user;
	}
	
	protected Map<String, String[]> referenceData(HttpServletRequest request)throws Exception
	{
		System.out.println("-->referenceData was called.");
		Map<String, String[]> referenceData = new HashMap<String, String[]>();
		referenceData.put("interests", ALL_INTERESTS);
		return referenceData;
	}

	/*protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		if ("POST".equalsIgnoreCase(request.getMethod())) {
			UserBean user=new UserBean();
			user.setFirstName(request.getParameter("firstname"));
			user.setLastName(request.getParameter("lastname"));
			user.setDescription(request.getParameter("memo"));
			user.setEmail(new EmailAddress(request.getParameter("email")));
			registerService.register(user);
			return new ModelAndView("registered","",null);
		}
		else
		{
			List<Object> registers = new ArrayList<Object>();
			registers.add(new Integer(registerService.getCount()));

			return new ModelAndView("register", "registers", registers);
		}
	}*/
	
	

	private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService rs) {
		this.userService = rs;
	}
}
