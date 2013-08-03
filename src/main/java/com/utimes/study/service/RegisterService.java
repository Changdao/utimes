package com.utimes.study.service;

import com.utimes.study.bean.RegistrationBean;

import java.util.Date;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-6-26
 * Time: 上午2:13
 * To change this template use File | Settings | File Templates.
 */
public interface RegisterService {
    public List getRegistrations();
    public List getRegistrations(String school);
    public List getRegistrations(Date from, Date to);
    public List getRegistrations(Object[] conditions);
    public void register(RegistrationBean registration);


}
