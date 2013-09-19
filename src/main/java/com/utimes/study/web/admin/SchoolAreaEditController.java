package com.utimes.study.web.admin;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-9-15
 * Time: 上午8:44
 * To change this template use File | Settings | File Templates.
 */
public class SchoolAreaEditController  extends AbstractController {
    @Override
    protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
        return new ModelAndView("/admin/schoolarea","schoolare","");
    }
}
