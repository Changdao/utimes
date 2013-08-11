package com.utimes.study.bean;

public class UserBean {
    private int Id;
	private String firstName;
	private String lastName;
	private String email;
	private String interest;
    private String description;
	private String userId;
	private String password;

    public int getId() {
        return Id;
    }

    public void setId(int id) {
        Id = id;
    }

    public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
		return super.toString()+"email:"+email+"\nfirst name:"+this.firstName+"\n lastnaem:"+this.lastName+"\n memo:"+this.description;
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
