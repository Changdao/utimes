<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.google.gson.Gson" %>
<%
    System.out.println("<TRACE> the schools_courses_json.jsp was called.");
    Object courses=request.getAttribute("courses");
    if(courses!=null)
    {
	    Gson gson=new Gson();
	    out.print(gson.toJson(courses));
	}
%>