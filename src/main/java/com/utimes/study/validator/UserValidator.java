package com.utimes.study.validator;

import com.utimes.study.bean.UserBean;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserValidator implements Validator{

    @Override
    public boolean supports(Class clazz) {
        //just validate the Customer instances
        return UserBean.class.isAssignableFrom(clazz);

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

    }

}