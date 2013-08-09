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

        public long carry(double value)
        {
           return Math.round(     value*(double)this.getCarryValue() -  (double)((int)value) * this.getCarryValue()  ) ;
        }

        public int getCarryValue() {
            return carryValue;
        }
        private static final String[] compensation={"","0","00","0000"};

        public String formatDecimal(long value)
        {
            String a=Long.toString(value);

            return (new StringBuilder()).append(compensation[this.carry-a.length()]).append(a).toString();

        }

    };

    private long whole;
    private long decimal;
    private CarryType carry;


    /**
     * Default Currency, as a NullCurrency, to return 0.
     */
    public Currency()
    {
        this.carry=CarryType.Two;
        this.whole=0;
        this.decimal=0;
    }

    public Currency(CarryType carry,int whole,int decimal)
    {
        this.carry=carry;
        this.whole=whole;
        this.decimal=decimal;
    }

    public Currency(CarryType carry, double value)
    {
        this.carry=carry;
        this.whole=(int)value;
        this.decimal=carry.carry(value-whole);
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

    public double toDouble()
    {
        return (this.whole+this.decimal/this.carry.getCarryValue());
    }

    public long getWhole() {
        return whole;
    }

    public long getDecimal() {
        return decimal;
    }
}
