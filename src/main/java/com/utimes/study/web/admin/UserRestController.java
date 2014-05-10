package com.utimes.study.web.admin;

/**
 * Created by nevernew on 14-5-10.
 */

import com.utimes.study.bean.UserBean;
import com.utimes.study.service.SchoolService;
import com.utimes.study.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.google.gson.JsonObject;

import javax.servlet.http.HttpServletRequest;


@Controller
public class UserRestController {
    @Autowired
    private UserService userService;

    @RequestMapping("/users/{userid}")
    public ModelAndView getUser(@PathVariable String userid)
    {
        UserBean user = userService.getUser(userid);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("user_json");
        mav.addObject("user", user);
        return mav;
    }


    @RequestMapping(value="/users",consumes = "application/json",method = { RequestMethod.POST})
    public ModelAndView addUser(@RequestBody UserBean user,HttpServletRequest request)
    {
        System.out.println("<UTIMES> user:"+user);
        user.setPassword("");
        userService.signup(user,false);


        ModelAndView mav = new ModelAndView();
        mav.setViewName("admin/user_json");
        mav.addObject("user", user);

        return mav;
    }

    @RequestMapping(value="/users/{userid}",method = { RequestMethod.PUT})
    public ModelAndView updateUser(@RequestBody UserBean user,HttpServletRequest request)
    {

        System.out.println("<UTIMES> user:"+user);

        userService.update(user);


        ModelAndView mav = new ModelAndView();
        mav.setViewName("user_json");
        mav.addObject("user", user);

        return mav;
    }

    @RequestMapping(value="/users/{userid}",method = { RequestMethod.DELETE})
    @ResponseBody
    public String deleteUser(@PathVariable String userid,HttpServletRequest request)
    {

        System.out.println("<UTIMES> user:"+userid);
        userService.delete(userid);
        return "{\"result\":\"OK\"}";
    }

    @ExceptionHandler({org.springframework.http.converter.HttpMessageNotReadableException.class})
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ResponseBody
    public String resolveException() {
        System.out.println("\n\n\nRequest error!");

        return "{result:\"OK\"}";
    }
}
