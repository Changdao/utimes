package com.utimes.study.web;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import com.utimes.study.service.RegisterService;

public class RegisterController extends AbstractController{
  public RegisterController(){}
  protected ModelAndView handleRequestInternal(
	HttpServletRequest request, HttpServletResponse response)throws Exception
  {
     List<Object> registers=new ArrayList<Object>();
     registers.add(new Integer(registerService.getCount()));
     
     return new ModelAndView("register","registers",registers);
  }
  
  private RegisterService registerService;
  public void setRegisterService(RegisterService rs)
  {
    this.registerService = rs;
  }
}
