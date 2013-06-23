package com.utimes.study.bean;

public class UserBean {
	private String firstName;
	private String lastName;
	private EmailAddress email;
	private String interest;
	private String description;
	private String userId;
	private String password;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public EmailAddress getEmail() {
		return email;
	}
	public void setEmail(EmailAddress email) {
		this.email = email;
	}
	private String desc;
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String toString()
	{
		return super.toString()+email;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public void setUserId(String string) {
		this.userId=string;		
	}
	public String getUserId() {
		return userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
		
	
}
