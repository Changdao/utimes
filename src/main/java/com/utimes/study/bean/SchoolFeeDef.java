package com.utimes.study.bean;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-6-27
 * Time: 上午12:02
 * To change this template use File | Settings | File Templates.
 */
public class SchoolFeeDef {
    private SchoolFeeStrategy owner;
    private SchoolFeeType type;
    private Currency currency;
    public SchoolFeeDef(SchoolFeeType type, Currency currency, SchoolFeeStrategy owner)
    {
        this.type=type;
        this.currency=currency;
        this.owner=owner;
    }
}
