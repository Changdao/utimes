package com.utimes.study.service;

import com.utimes.study.fee.SchoolFeeStrategy;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-8-4
 * Time: 下午10:39
 * To change this template use File | Settings | File Templates.
 */
public interface SchoolFeeStrategyFactory
{

    public SchoolFeeStrategy createSchoolFeeStrategy();
    public SchoolFeeStrategy saveSchoolFeeStrategy();
    public SchoolFeeStrategy loadSchoolFeeStrategy();
}
