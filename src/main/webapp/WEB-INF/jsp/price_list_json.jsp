<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.gson.Gson" %>
<%

    Object pricelist=request.getAttribute("pricelist");
    if(pricelist!=null)
    {
	    Gson gson=new Gson();
	    out.print(gson.toJson(pricelist));
	}
%>