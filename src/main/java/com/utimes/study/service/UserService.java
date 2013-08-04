package com.utimes.study.service;
import java.util.List;


import com.utimes.study.bean.UserBean;
public interface UserService
{
  public int getCount();
  public void signup(UserBean user);
  public List<Object> getUsers(int pageNumber, int countPerPage);
  public UserBean login(String email,String password);
}
