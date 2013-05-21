package com.utimes.study.bean;

import java.beans.PropertyEditorSupport;

public class EmailAddressEditor extends PropertyEditorSupport {
	public void setAsText(String textValue)
	{
		EmailAddress ea=new EmailAddress(textValue);
		setValue(ea);
		
	}

}
