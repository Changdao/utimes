package com.utimes.study.web.admin;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-8-16
 * Time: 上午11:10
 * To change this template use File | Settings | File Templates.
 */
public class MainController  extends AbstractController {
    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String loadMenu=request.getParameter("loadmenu");
        if(loadMenu!=null&&!"".equals(loadMenu)) return new ModelAndView("/admin/menuxml","key","");
        return new ModelAndView("/admin/main","key","");
    }
}
