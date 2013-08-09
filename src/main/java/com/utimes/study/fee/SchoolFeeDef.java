package com.utimes.study.fee;

import com.utimes.study.bean.Currency;

/**
  School Fee Def is a definition of specific school's fee item.
 */
public class SchoolFeeDef {

    private SchoolFeeStrategy owner;
    private SchoolFeeType type;
    private String subType;

    private Currency currency;
    private SchoolFeeCalculator calculator;

    public SchoolFeeCalculator getCalculator() {
        return calculator;
    }

    public void setCalculator(SchoolFeeCalculator calculator) {
        this.calculator = calculator;
        this.currency=new Currency();
    }



    public String getSubType() {
        return subType;
    }

    public void setSubType(String subType) {
        this.subType = subType;
    }

    public SchoolFeeDef(SchoolFeeType type,  SchoolFeeStrategy owner)
    {
        this.type=type;

        this.owner=owner;
    }
    public Currency compute(double value)
    {
        //todo:something bad smell.
        if(calculator!=null)
        this.currency=new Currency(Currency.CarryType.Two,calculator.calc(value));

        return this.currency;

    }

}
