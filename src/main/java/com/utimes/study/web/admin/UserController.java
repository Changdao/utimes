package com.utimes.study.web.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.utimes.study.bean.JSONListBean;
import com.utimes.study.bean.SchoolBean;
import com.utimes.study.bean.UserBean;
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

    private JSONListBean.IdGetter idGetter=new JSONListBean.IdGetter() {
        @Override
        public int getId(Object obj) {
            return ((UserBean)obj).getId();
        }
    };

	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
        String load=request.getParameter("loaddata");
        String page=request.getParameter("page");
        String rows=request.getParameter("rows");
        String sidx=request.getParameter("sidx");
        String sord=request.getParameter("sord");
        logger.debug("request:"+page+" "+rows+" "+sidx+" "+sord);

        int rowsNum=rows==null||"".equals(rows)?10:Integer.parseInt(rows);

        logger.debug("request parameter: loaddata:"+load);
        if(load!=null&&!"".equals(load.trim()))
        {


            int thePage=0;
            if(page!=null&&!"".equals(page))thePage=Integer.parseInt(page);
            else thePage=1;
            List users=userService.getUsers(thePage,rowsNum);
            System.out.println("====>Users count:"+users.size());
            JSONListBean userList=new JSONListBean();
            userList.setPage(thePage);
            userList.setRecords(users.size());
            userList.addAllRows(users, idGetter);
            userList.setTotal(users.size() / rowsNum + 1);
		    return new ModelAndView("admin/usersdata","users",userList);
        }
        else return new ModelAndView("admin/users");

	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	

}
