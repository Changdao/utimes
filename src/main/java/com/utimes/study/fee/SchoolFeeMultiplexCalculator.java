package com.utimes.study.fee;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-8-5
 * Time: 上午12:03
 * To change this template use File | Settings | File Templates.
 */
public class SchoolFeeMultiplexCalculator implements SchoolFeeCalculator {
    private double ratio;

    SchoolFeeMultiplexCalculator(double value)
    {
        this.ratio=value;
    }

    @Override
    public double calc(double value) {
        return value*ratio;
    }
}
