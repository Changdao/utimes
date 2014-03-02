package com.utimes.study.service;

import com.utimes.study.bean.PriceListBean;

import java.util.List;

/**
 * Created by nevernew on 1/8/14.
 */
public interface PriceService {
    public List getPriceList(int schoolId,int courseId,int weeks);
    public PriceListBean getPriceListBean(int schoolId,int courseId,int weeks);

}
