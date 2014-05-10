package com.utimes.study.service;
import java.util.List;


import com.utimes.study.bean.UserBean;
public interface UserService
{
    public int getCount();
    public void signup(UserBean user, boolean sendMail);
    public List<Object> getUsers(int pageNumber, int countPerPage);
    public UserBean login(String email,String password);
    public boolean exists(String email);
    public boolean update(UserBean user);
    public UserBean getUser(String id);
    public boolean delete(String id);
}
