package com.utimes.study.validator;

import com.utimes.study.bean.UserBean;
import com.utimes.study.service.UserService;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import javax.sql.DataSource;

public class UserValidator implements Validator{

    @Override
    public boolean supports(Class clazz) {
        //just validate the Customer instances
        return UserBean.class.isAssignableFrom(clazz);

    }

    private UserService userService;

    public UserService getUserService() {
        return userService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public boolean emailExists(String email)
    {
        return userService.exists(email);
    }
    @Override
    public void validate(Object target, Errors errors) {
        System.out.println("UserValidator validate was called");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "firstName",
                "firstname.required", "FirstName is required.");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "lastName",
                "lastname.required", "FirstName is required.");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email",
                "email.required", "Email is required.");

        ValidationUtils.rejectIfEmptyOrWhitespace(errors,"password","password.required","Password is required!");
        String email=(String)errors.getFieldValue("email");
        if(emailExists(email))
            errors.rejectValue("email","email.duplicated","Email address is used!");


        for(Object err: errors.getAllErrors())System.out.println("<debug>:"+err+"\n");

    }

}