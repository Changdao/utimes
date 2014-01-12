package com.utimes.study.web;

import com.utimes.study.service.PriceService;
import com.utimes.study.service.SchoolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * Created by nevernew on 1/8/14.
 */
@Controller
public class PricingController {
    @Autowired
    private PriceService priceService;

    @Autowired
    private SchoolService schoolService;

    public void setPriceService(PriceService priceService) {
        this.priceService = priceService;
    }

    @RequestMapping("/price")
    public String priceSearch()
    {
        System.out.println("<DEBUG>annotation worked...!");
        return "price";
    }

    @RequestMapping("/schools")
    public ModelAndView  schoolList()
    {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("schools_json");
        mav.addObject("schools", schoolService.getSchools());
        return mav;

    }

    @RequestMapping("/schools/{schoolId}/courses")
    public ModelAndView schoolCourseList(@PathVariable int schoolId)
    {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("school_course_json");
        mav.addObject("courses",schoolService.getCourses(schoolId));
        return mav;
    }

    @RequestMapping("/pricelists")
    public ModelAndView schoolPriceList(HttpServletRequest request)
    {
       Enumeration en= request.getParameterNames();
        System.out.println("<TRACE>>>===============================================================================");
        while(en.hasMoreElements())
        {
            String n= (String) en.nextElement();
            System.out.println(n+":"+request.getParameter(n));
        }
        System.out.println("<TRACE><<===============================================================================");

        int schoolId=Integer.parseInt(request.getParameter("school"));
        int courseId=Integer.parseInt(request.getParameter("course"));
        int weeks=Integer.parseInt(request.getParameter("weeks"));

        ModelAndView mav = new ModelAndView();
        mav.setViewName("price_list_json");
        mav.addObject("pricelist", priceService.getPriceList(schoolId,courseId,weeks));

       return mav;
    }

}
