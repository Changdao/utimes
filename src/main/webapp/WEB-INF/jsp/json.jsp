<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.gson.Gson" %>
<%

    Object obj=request.getAttribute("UTIMES_JSON");
    if(obj!=null)
    {
	    Gson gson=new Gson();
	    out.print(gson.toJson(obj));
	}
%>