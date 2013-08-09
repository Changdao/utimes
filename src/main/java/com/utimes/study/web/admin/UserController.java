package com.utimes.study.web.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import com.utimes.study.service.UserService;
/**
 * Admin the registers.
 */
public class UserController extends AbstractController {

	private UserService userService;
	private int countPerPage;
	
	public int getCountPerPage() {
		return countPerPage;
	}

	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String pns=request.getParameter("pageno");
		int pageNumber=pns==null||"".equals(pns)?0:Integer.parseInt(pns);
		List<Object> registers=userService.getUsers(pageNumber,countPerPage);
		return new ModelAndView("admin/users","registers",registers);
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	

}
