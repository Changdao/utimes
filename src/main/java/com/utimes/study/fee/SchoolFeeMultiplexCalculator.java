package com.utimes.study.fee;

/**
    The simple calculator, return the round(value*(ratio/base));
 */
public class SchoolFeeMultiplexCalculator implements SchoolFeeCalculator {

    //for example: 750dollar/4 weeks, the ratio is 750;
    private double ratio;
    //for example: 750dollar/4 weeks, the base is 4;
    private double base;

    public SchoolFeeMultiplexCalculator(double ratio, double base)
    {
        this.ratio=ratio;
        this.base=base;
    }

    @Override
    public double calc(double value) {
        return Math.round(value*(ratio/base));
    }
}
