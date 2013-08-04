package com.utimes.study.fee;

import com.utimes.study.bean.Currency;

/**
  School Fee Def is a definition of specific school's fee item.
 */
public class SchoolFeeDef {

    private SchoolFeeStrategy owner;
    private SchoolFeeType type;
    private double value;
    private Currency currency;
    private SchoolFeeCalculator calculator;

    public SchoolFeeCalculator getCalculator() {
        return calculator;
    }

    public void setCalculator(SchoolFeeCalculator calculator) {
        this.calculator = calculator;
    }


    public SchoolFeeDef(SchoolFeeType type, double value, SchoolFeeStrategy owner)
    {
        this.type=type;
        this.value=value;
        this.owner=owner;
    }
    public Currency compute()
    {
        //todo:something bad smell.
        if(calculator!=null)
        this.currency=new Currency(Currency.CarryType.Two,calculator.calc(value));

        return this.currency;

    }

}
