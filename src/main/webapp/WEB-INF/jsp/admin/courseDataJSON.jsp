<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.gson.Gson" %>
<%
    Object course=request.getAttribute("course");
    if(course!=null)
    {
	    Gson gson=new Gson();
	    out.print(gson.toJson(course));
	}
%>