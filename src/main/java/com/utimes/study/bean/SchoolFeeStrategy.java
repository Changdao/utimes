package com.utimes.study.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-6-26
 * Time: 下午10:00
 * SchoolFeeStrategy to organize SchoolFee.
 */
public class SchoolFeeStrategy {
    private List<SchoolFeeDef> feeDef;
    private List feePolicies;

    SchoolFeeStrategy()
    {
        this.feeDef =new ArrayList();
    }

    public void addSchoolFeeDefinition(SchoolFeeDef feeDef)
    {
        this.feeDef.add(feeDef);
    }


    public class FeePolicy
    {
        private int value; //For example: study fee is 125 /week
        private String name;
        private double money;
        public FeePolicy(String name, double money, int value)
        {
            this.value=value;
            this.name=name;
            this.money=money;
        }
    }
}
