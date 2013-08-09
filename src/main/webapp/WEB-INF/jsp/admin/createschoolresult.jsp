<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.SchoolBean"%>

<%@ page import="com.google.gson.Gson" %>
<%
    System.out.println("I'm called.");
	Gson gson=new Gson();
	out.print(gson.toJson(request.getAttribute("result")));
%>

