<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.SchoolBean"%>
<%@ page import="com.google.gson.Gson" %>
<%
	Gson gson=new Gson();
	out.print(gson.toJson(request.getAttribute("schools")));
%>