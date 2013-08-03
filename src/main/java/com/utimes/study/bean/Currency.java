package com.utimes.study.bean;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-6-27
 * Time: 上午12:03
 * To change this template use File | Settings | File Templates.
 */
public class Currency {
    public  enum CarryType{
        Two(2), Three(3), Four(4);
        private int carryValue;
        private int carry;
        CarryType(int carry)
        {
            this.carry=carry;
            this.carryValue=1;
            for(int i=1;i<=carry;i++)
            this.carryValue*=10;

        }

        public int getCarryValue() {
            return carryValue;
        }
        private static final String[] compensation={"","0","00","0000"};

        public String formatDecimal(int value)
        {
            String a=Integer.toString(value);

            return (new StringBuilder()).append(compensation[this.carry-a.length()]).append(a).toString();

        }

    };
    private String currencyType;
    private int whole;
    private int decimal;
    private double toDouble;
    private CarryType carry;


    public Currency(CarryType carry,int whole,int decimal)
    {
        this.carry=carry;
        this.whole=whole;
        this.decimal=decimal;
    }


    public String toString()
    {
      return whole+"."+carry.formatDecimal(this.decimal);
    }

    public Currency add(Currency currency)
    {
        this.whole+= currency.whole;
        this.decimal+= currency.decimal;
        if(this.decimal>=carry.getCarryValue())
        {
            this.decimal=this.decimal-carry.getCarryValue();
            this.whole+=1;
        }
        return this;
    }

}
