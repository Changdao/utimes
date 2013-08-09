package com.utimes.study.bean;

public class EmailAddress {
	private String body;
	private String name;
	private String host;
	
	public EmailAddress()
	{
		this.body="";
		this.name="";
		this.host="";
	}
	public EmailAddress(String email)
	{
		this.body=email;
        if(email!=null&&!"".equals(email))
		parseAddress();
	}
	private void parseAddress()
	{
		int idx=body.indexOf('@');
        if(idx<0)return;
		this.name=body.substring(0,idx);
		this.host=body.substring(idx,body.length());
	}
	public String getName()
	{
		return this.name;
	}
	public void setName(String value)
	{
		this.name=value;
		resetBody();
	}
	private void resetBody() {
		this.body=this.name+'@'+this.host;
	}
	public String getHost()
	{
		return this.host;
	}
	public void setHost(String value)
	{
		this.host=value;
		resetBody();
	}
	public String toString()
	{
		return body;
	}
}
