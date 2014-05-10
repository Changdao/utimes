<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.gson.Gson" %>
<%

    Object user=request.getAttribute("user");
    if(user!=null)
    {
	    Gson gson=new Gson();
	    out.print(gson.toJson(user));
	}
%>