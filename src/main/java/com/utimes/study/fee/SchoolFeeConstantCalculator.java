package com.utimes.study.fee;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-8-5
 * Time: 上午12:01
 * To change this template use File | Settings | File Templates.
 */
public class SchoolFeeConstantCalculator implements SchoolFeeCalculator {

    private double ratio;

    public SchoolFeeConstantCalculator(double value)
    {
        this.ratio=value;
    }

    @Override
    public double calc(double value) {
        value=value;
        return ratio;
    }
}
