package com.utimes.study.bean;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-6-26
 * Time: 上午2:17
 * To change this template use File | Settings | File Templates.
 */
public class RegistrationBean {
    private String name;
    private String nickName;
    private int age;
    private String gender;
    private String passport;
    private Date birthday;
    private String phoneNumber;
    private String cellNumber;
    private EmailAddress email;
    private String organization;
    private String address;
    private String campus;
    private double during;
    private String curriculum;
    private Date depart;
    private Date enter;
    private String airLine;
    private String RoomType;
    private double SSP;
    private double registrationFee;    //todo: here I use double to represent money, in this application money should be more flexible to easily handle rmb/usd/...
    private double amount;
    private double scholarShip;
    private String branches;
    private String aPersonInCharge;
    private String agentPhoneNumber;
    private String etc;
}
