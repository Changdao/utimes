<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.gson.Gson" %>
<%
    System.out.println("<TRACE> the schools_json.jsp was called.");
    Object schools=request.getAttribute("schools");
    if(schools!=null)
    {
	    Gson gson=new Gson();
	    out.print(gson.toJson(schools));
	}
%>