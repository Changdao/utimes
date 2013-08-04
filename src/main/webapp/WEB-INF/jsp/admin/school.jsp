<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.UserBean"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<html lang="zh_CN">
<head>
<meta charset="utf-8" />
<title>Utimes School Page</title>
<link rel="stylesheet" href="/utimes/css/jquery.ui.all.css" />
<link rel="stylesheet" href="/utimes/css/utimes.css" />
<link rel="stylesheet" href="/utimes/css/ui.jqgrid.css" />
<script src="/utimes/js/jquery-1.9.1.js"></script>
<script src="/utimes/js/jquery-ui.js"></script>
<script src="/utimes/js/jquery.jqGrid.min.js" /></script>
<script src="/utimes/js/grid.locale-cn.js" /></script>
<style>
body {
	font-size: 62.5%;
}

label,input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

h1 {
	font-size: 1.2em;
	margin: .6em 0;
}

div#users-contain {
	width: 350px;
	margin: 20px 0;
}

div#users-contain table {
	margin: 1em 0;
	border-collapse: collapse;
	width: 100%;
}

div#users-contain table td,div#users-contain table th {
	border: 1px solid #eee;
	padding: .6em 10px;
	text-align: left;
}

.ui-dialog .ui-state-error {
	padding: .3em;
}

.validateTips {
	border: 1px solid transparent;
	padding: 0.3em;
}
</style>
<script type="text/javascript">
	$(function() {
		jQuery("#schools").jqGrid({
			url : "schools.htm?loaddata=true",
			datatype : "json",
			colNames : [ 'Name', 'Location', 'Since', 'Rate', 'Description' ],
			colModel : [ {
				name : 'name',
				index : 'name',
				width : 60
			}, {
				name : 'location',
				index : 'location',
				width : 90
			}, {
				name : 'since',
				index : 'since',
				width : 90
			}, {
				name : 'rate',
				index : 'rate',
				width : 100
			}, {
				name : 'memo',
				index : 'memo',
				width : 100
			} ],
			multiselect : false,
			caption : "Schools"
		});

		jQuery("#list2").jqGrid('navGrid', '#pager2', {
			edit : false,
			add : false,
			del : false
		});
		
		var name = $( "#name" ),
	      location = $( "#location" ),
	      introduce = $( "#introduce" ),
	      allFields = $( [] ).add( name ).add( location ).add( introduce ),
	      tips = $( ".validateTips" );
		
		$("#dialog-form")
				.dialog(
						{
							autoOpen : false,
							height : 300,
							width : 350,
							modal : true,
							buttons : {
								"Create an school" : function() {
									var bValid = true;
									allFields.removeClass("ui-state-error");

									/*bValid = bValid
											&& checkLength(name, "username", 3,
													16);
									bValid = bValid
											&& checkLength(email, "location", 6,
													80);
									bValid = bValid
											&& checkLength(password,
													"password", 5, 16);

									bValid = bValid
											&& checkRegexp(name,
													/^[a-z]([0-9a-z_])+$/i,
													"Username may consist of a-z, 0-9, underscores, begin with a letter.");
									// From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
									bValid = bValid
											&& checkRegexp(
													email,
													/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,
													"eg. ui@jquery.com");
									bValid = bValid
											&& checkRegexp(password,
													/^([0-9a-zA-Z])+$/,
													"Password field only allow : a-z 0-9");*/

									if (bValid) {
										/*
										Call the function to save the result.
										Reload the grid/Asychronous update the grid?
										
										*/									
										
										
										$(this).dialog("close");
									}
								},
								Cancel : function() {
									$(this).dialog("close");
								}
							},
							close : function() {
								allFields.val("").removeClass("ui-state-error");
							}
						});

		$("#new").button().click(function() {
			$( "#dialog-form" ).dialog( "open" );
		});
		$("#modify").button().click(function() {
			var gr = jQuery("#schools").jqGrid('getGridParam', 'selrow');
			if (gr != null)
				/*jQuery("#schools").jqGrid('editGridRow', gr, {
					height : 280,
					reloadAfterSubmit : false
				});*/
				{
					//Edit the school;
				}
			else
				alert("Please Select Row");
		});

	});
</script>

</head>
<body>
	<div id="main-container">
		<table id="schools"></table>
		<div id="pager2"></div>
		<input type="BUTTON" id="new" value="Add New School" /> 
		<input
			type="BUTTON" id="modify" value="Modify Selected School" />
	</div>

	<div id="dialog-form" title="Create new school">
		<p class="validateTips">All form fields are required.</p>

		<form>
			<fieldset>
				<label for="name">Name</label> 
				<input type="text" name="name"
					id="name" class="text ui-widget-content ui-corner-all" /> 
				<label
					for="location">Location</label> 
				<input type="text" name="location"
					id="location" value="" class="text ui-widget-content ui-corner-all" />
				<label for="introduce">Introduce</label> 
				<input type="text"
					name="introduce" id="introduce" value=""
					class="text ui-widget-content ui-corner-all" />
			</fieldset>
		</form>
	</div>
</body>
</html>