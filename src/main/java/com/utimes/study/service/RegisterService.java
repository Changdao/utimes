package com.utimes.study.service;
import java.util.List;


import com.utimes.study.bean.UserBean;
public interface RegisterService
{
  public int getCount();
  public void register(UserBean user);
  public List<Object> getRegisters(int pageNumber, int countPerPage);
}
