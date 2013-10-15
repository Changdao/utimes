<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.gson.Gson" %>
<%
    Object tuition=request.getAttribute("tuition");
    if(tuition!=null)
    {
	    Gson gson=new Gson();
	    out.print(gson.toJson(tuition));
	}
%>