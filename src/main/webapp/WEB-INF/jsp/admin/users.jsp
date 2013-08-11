<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.UserBean"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
					url : "users.htm?loaddata=true",
                    datatype : "json",
					height : 250,
					colNames : [ '<fmt:message key="user.email"/>', '<fmt:message key="user.lastname"/>', '<fmt:message key="user.firstname"/>', 'Last Date',
							'Register Date','<fmt:message key="user.description"/>' ],
					colModel : [ {
						name : 'email',
						index : 'email',
						width : 60
					}, {
						name : 'lastName',
						index : 'lastName',
						width : 100
					}, {
						name : 'firstName',
						index : 'firstName',
						width : 100
					} , {
                        name : 'lastdate',
                        index : 'lastdate',
                        width : 90,
                        sorttype : "date"
                    }, {
                        name : 'regdate',
                        index : 'regdate',
                        width : 90,
                        sorttype : "date"
                    },
					{
					    name: 'description',
					    index: 'description',
					    width: 100
					}],
					autowidth:true,
					rownum:10,
					viewrecords: true,
                    rowList:[10,20,30],
                    pager: jQuery('#pager2'),
					multiselect : false,
					caption : "Registers List"
				}).navGrid('#pager2',{edit:false,add:false,del:false});
		});
	

</script>
</head>
<body>
	<div id="main-container">
		<table id="list4"></table>
		<div id="pager2"></div>
	</div>
</body>
</html>