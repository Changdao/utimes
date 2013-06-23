<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.UserBean"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<html lang="zh_CN">
<head>
<meta charset="utf-8" />
<title>Utimes Register Page</title>
<link rel="stylesheet" href="/utimes/css/jquery.ui.all.css" />
<link rel="stylesheet" href="/utimes/css/utimes.css" />
<link rel="stylesheet" href="/utimes/css/ui.jqgrid.css" />
<script src="/utimes/js/jquery-1.9.1.js"></script>
<script src="/utimes/js/jquery-ui.js"></script>
<script src="/utimes/js/jquery.jqGrid.min.js" /></script>
<script src="/utimes/js/grid.locale-cn.js" /></script>


<script type="text/javascript">
	$(function() {
		jQuery("#list4").jqGrid(
				{
					datatype : "local",
					height : 250,
					colNames : [ 'Email', 'Last Date', 'Reg Date', 'Last Name',
							'First Name' ],
					colModel : [ {
						name : 'email',
						index : 'email',
						width : 60
					}, {
						name : 'lastdate',
						index : 'lastdate',
						width : 90,
						sorttype : "date"
					}, {
						name : 'regdate',
						index : 'regdate',
						width : 90,
						sorttype : "date"
					}, {
						name : 'lastname',
						index : 'lastname',
						width : 100
					}, {
						name : 'firstname',
						index : 'firstname',
						width : 100
					} ],
					multiselect : true,
					caption : "Registers List"
				});
	
	var mydata = [
<%List data = (List) request.getAttribute("registers");
			for (int i = 0; i < data.size(); i++) {
				UserBean user = (UserBean) data.get(i);
				String sep = "\n";
				if (i < data.size() - 1)
					sep = ",\n";
				out.print("{email:\"" + user.getEmail() + "\",lastdate:\""
						+ "\",regdate:\"" + "\",lastname:\""
						+ user.getLastName() + "\",firstname:\""
						+ user.getFirstName() + "\"}" + sep);

			}%>
	];
	for ( var i = 0; i <= mydata.length; i++)
		jQuery("#list4").jqGrid('addRowData', i + 1, mydata[i]);
	});
</script>
</head>
<body>
	<div id="main-container">
		<table id="list4"></table>
	</div>
</body>
</html>