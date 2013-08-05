package com.utimes.study.fee;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-8-4
 * Time: 下午11:35
 * To change this template use File | Settings | File Templates.
 */
public class SchoolFeeTableCalculator implements SchoolFeeCalculator{
    private int feeTableId;
    private HashMap<String,Double> rateTable;
    private double constantRate;
    private double threshold;

    public SchoolFeeTableCalculator()
    {
        rateTable=new HashMap<String ,Double>();
    }

    public SchoolFeeTableCalculator(HashMap<String, Double> rateTable,double threshold,double constantRate)
    {
        this.rateTable=rateTable;
        this.constantRate=constantRate;
        this.threshold=threshold;
    }


    /**
     *
     * @return
     */
    public HashMap<String, Double> getRateTable() {
        return rateTable;
    }

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

    public double getConstantRate() {
        return constantRate;
    }

    public void setConstantRate(double constantRate) {
        this.constantRate = constantRate;
    }

    public double getThreshold() {
        return threshold;
    }

    public void setThreshold(double threshold) {
        this.threshold = threshold;
    }

    @Override
    public double calc(double value) {

        //find in table for corresponding value;

        Double v=this.rateTable.get(Double.toString(value));
        if(v!=null) return v;
        String closestKey=null;
        double closestV=0;
        Set<String> keys=rateTable.keySet();
        Iterator<String> ite=keys.iterator();
        while(ite.hasNext())
        {
            String key=ite.next();
            Double keyV=Double.parseDouble(key);

            if(keyV>=value)break;

            if((value-keyV)<(value-closestV))
            {
                closestV=keyV;
                closestKey=key;
            }

        }
        if(closestKey!=null)
        {

            return rateTable.get(closestKey)+(value-closestV)*constantRate;
        }
        else throw new RuntimeException("Can't get the fee for :"+value+"");

    }
}
