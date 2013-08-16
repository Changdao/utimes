<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.utimes.study.bean.UserBean"%>
<%@ page import="java.io.*,java.util.Locale" %>
<%@ page import="javax.servlet.*,javax.servlet.http.* "%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta charset="utf-8" />
<title>Utimes School Page</title>
<link rel="stylesheet" href="/utimes/css/jquery.ui.all.css" />
<link rel="stylesheet" href="/utimes/css/jquery.ui.custom.css" />
<link rel="stylesheet" href="/utimes/css/utimes.css" />
<link rel="stylesheet" href="/utimes/css/ui.jqgrid.css" />
<script src="/utimes/js/jquery-1.9.1.js"></script>
<script src="/utimes/js/jquery-ui.js"></script>
<script src="/utimes/js/jquery.form.js"></script>
<script src="/utimes/js/jquery.jqGrid.min.js" > </script>
<script src="/utimes/js/jquery.layout.js"></script>
<script src="/utimes/js/grid.locale-cn.js"> </script>

<style>
html, body {
	margin: 0;			/* Remove body margin/padding */
	padding: 0;
	overflow: hidden;	/* Remove scroll bars on browser window */
    font-size: 75%;
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

#LeftPane {
	overflow: auto;
}

#RightPane {
	padding: 2px;
	overflow: auto;
}

</style>
<script type="text/javascript">
	$(function() {


		jQuery("#schools").jqGrid({
			url : "schools.htm?loaddata=true",
			datatype : "json",
			colNames : [ "<fmt:message key='school.name'/>", "<fmt:message key='school.location'/>", '<fmt:message key="school.since"/>', '<fmt:message key="school.rate"/>', '<fmt:message key="school.description"/>' ],
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
			autowidth:true,
			rownum:10,
			rowList:[10,20,30],
			viewrecords: true,
			pager: jQuery('#pager2'),
			multiselect : false,
			caption : "<fmt:message key='schools.caption'/>"
		}).navGrid('#pager2',{edit:false,add:false,del:false});
		
		/*jQuery("#schools").jqGrid('navGrid', '#pager2', {
			edit : false,
			add : false,
			del : false
		});*/

		var name = $( "#name" ),
	      location = $( "#location" ),
	      introduce = $( "#introduce" ),
	      allFields = $( [] ).add( name ).add( location ).add( introduce ),
	      tips = $( ".validateTips" );

		$("#dialog-form").dialog(
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



										$('#school-form').submit(
										function(){$.get('createschool.htm', $('#school-form').serialize(),
										           function(data){
                                                       $('#testcontent').html(data);
                                                   });
                                                   });

                                          judge result. return is a json.
                                          ok? add row
                                          no?

                                        jQuery("#a4").click( function(){
                                        	var datarow = {id:"99",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"};
                                        	var su=jQuery("#list5").jqGrid('addRowData',99,datarow);
                                        	if(su) alert("Succes. Write custom code to add data in server"); else alert("Can not update");
                                        });

                                        */

                                        $('#school-form').submit();

										//$(this).dialog("close");
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

		var options = {
                //target:        '#output1',   // target element(s) to be updated with server response
                beforeSubmit:  showRequest,  // pre-submit callback
                success:       showResponse  // post-submit callback

                // other available options:
                //url:       url         // override for form's 'action' attribute
                //type:      type        // 'get' or 'post', override for form's 'method' attribute
                //dataType:  null        // 'xml', 'script', or 'json' (expected server response type)
                //clearForm: true        // clear all form fields after successful submit
                //resetForm: true        // reset the form after successful submit

                // $.ajax options can be used here too, for example:
                //timeout:   3000
            };



        // pre-submit callback
        function showRequest(formData, jqForm, options) {
            /*var queryString = $.param(formData);
            alert('About to submit: \n\n' + queryString);*/
            return true;
        }

        // post-submit callback
        function showResponse(responseText, statusText, xhr, $form)  {

            /*alert('status: ' + statusText + '\n\nresponseText: \n' + responseText +
                '\n\nThe output div should have already been updated with the responseText.');  */
            var datarow = jQuery.parseJSON(responseText);
            //{id:"99",invdate:"2007-09-01",name:"test3",note:"note3",amount:"400.00",tax:"30.00",total:"430.00"};
            var su=jQuery("#schools").jqGrid('addRowData',datarow.id,datarow);
            if(!su) alert("Can not update");
            $('#dialog-form').dialog("close");
        }

       $('#school-form').ajaxForm(options);

	});

</script>

</head>
<body>



            <table id="schools"></table>
            <div id="pager2"></div>
            <input type="BUTTON" id="new" value="<fmt:message key='school.add'/>" />
            <input
                type="BUTTON" id="modify" value="Modify Selected School" />


	<div id="dialog-form" title="Create new school">
		<p class="validateTips">All form fields are required.</p>

		<form id="school-form" action="createschool.htm">
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
	<div id="testcontent"/>

</body>
</html>