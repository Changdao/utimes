package com.utimes.study.fee;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-8-4
 * Time: 下午11:35
 * To change this template use File | Settings | File Templates.
 */
public class SchoolFeeTableCalculator implements SchoolFeeCalculator{
    private int feeTableId;


    /**
     * FeeTableId is the identifier to identify which fee the rate table is for.
     * @return
     */
    public int getFeeTableId() {
        return feeTableId;
    }

    /**
     * refer to getFeeTableId()
     * @param feeTableId
     */
    public void setFeeTableId(int feeTableId) {
        this.feeTableId = feeTableId;
    }

    @Override
    public double calc(double value) {

        //find in table for corresponding value;
        //if not found
        // find the most near least record
        // calc it by multiplex ratio
        return 0;
    }
}
