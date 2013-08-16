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
<link rel="stylesheet" href="/utimes/css/jquery-ui-1.9.2.custom.css" />
<link rel="stylesheet" href="/utimes/css/utimes.css" />
<link rel="stylesheet" href="/utimes/css/ui.jqgrid.css" />
<script src="/utimes/js/jquery-1.9.1.js"></script>
<script src="/utimes/js/jquery-ui-1.9.2.custom.js"></script>
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

.ui-tabs-nav li {position: relative;}
.ui-tabs-selected a span {padding-right: 10px;}
.ui-tabs-close {display: none;position: absolute;top: 3px;right: 0px;z-index: 800;width: 16px;height: 14px;font-size: 10px; font-style: normal;cursor: pointer;}
.ui-tabs-selected .ui-tabs-close {display: block;}
.ui-layout-west .ui-jqgrid tr.jqgrow td { border-bottom: 0px none;}
.ui-datepicker {z-index:1200;}
.rotate
    {
        /* for Safari */
        -webkit-transform: rotate(-90deg);

        /* for Firefox */
        -moz-transform: rotate(-90deg);

        /* for Internet Explorer */
        filter: progid:DXImageTransform.Microsoft.BasicImage(rotation=3);
    }



</style>
<script type="text/javascript">
	jQuery(document).ready(function(){


    $('body').layout({
    		resizerClass: 'ui-state-default',
            west__onresize: function (pane, $Pane) {
                jQuery("#west-grid").jqGrid('setGridWidth',$Pane.innerWidth()-2);
    		}
    });



	var maintab =$('#tabs','#RightPane').tabs({
            add: function(e, ui) {
                // append close thingy
                $(ui.tab).parents('li:first')
                    .append('<span class="ui-tabs-close ui-icon ui-icon-close" title="Close Tab"></span>')
                    .find('span.ui-tabs-close')
    				.show()
                    .click(function() {
                        maintab.tabs('remove', $('li', maintab).index($(this).parents('li:first')[0]));
                    });
                // select just added tab
                maintab.tabs('select', '#' + ui.panel.id);
            }
        });



    $.jgrid.defaults = $.extend($.jgrid.defaults,{loadui:"enable"});

    jQuery("#west-grid").jqGrid({
                url: "main.htm?loadmenu=true",
                datatype: "xml",
                height: "auto",
                pager: false,
                loadui: "disable",
                colNames: ["id","Items","url"],
                colModel: [
                    {name: "id",width:1,hidden:true, key:true},
                    {name: "menu", width:150, resizable: false, sortable:false},
                    {name: "url",width:1,hidden:true}
                ],
                treeGrid: true,
        		caption: "Utimes Administration",
                ExpandColumn: "menu",
                autowidth: true,
                //width: 180,
                rowNum: 200,
                ExpandColClick: true,
                treeIcons: {leaf:'ui-icon-document-b'},
                onSelectRow: function(rowid) {
                    var treedata = $("#west-grid").jqGrid('getRowData',rowid);
                    if(treedata.isLeaf=="true") {
                        //treedata.url
                        var st = "#t"+treedata.id;
        				if($(st).html() != null ) {
        					maintab.tabs('select',st);
        				} else {

        					maintab.tabs('add',st, treedata.menu);
        					//$(st,"#tabs").load(treedata.url);
        					$.ajax({
        						url: treedata.url,
        						type: "GET",
        						dataType: "html",
        						complete : function (req, err) {
        							$(st,"#tabs").append(req.responseText);
        							/*try { var pageTracker = _gat._getTracker("UA-5463047-4"); pageTracker._trackPageview(); } catch(err) {};
        							var clck = '<p style="border: 1px solid; background-color: lemonchiffon; width:654px;height:25px;margin-bottom: 8px;padding-top: 8px;text-align: center">';
        							clck += '<b>Please, support the jqGrid project by clicking on our sponsors ad! </b></p>';

        							var fs = '<iframe src="adds.html" style="width:336px; height:290px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" vspace="0" hspace="0"/>\
        									&nbsp;&nbsp;&nbsp;&nbsp;<iframe src="adds3.html" style="width:336px; height:290px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" vspace="0" hspace="0"/>\
        									<br/><iframe src="adds2.html" style="width:728px; height:95px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" vspace="0" hspace="0"/><br>\
        									&nbsp;&nbsp;&nbsp;&nbsp;<iframe src="adds4.html" style="width:728px; height:95px;"scrolling="no" marginwidth="0" marginheight="0" frameborder="0" vspace="0" hspace="0"/>\
        							';
        							$(st,"#tabs").append(clck);
        							$(st,"#tabs").append(fs);  */
        						}
        					});
        				}
                    }
                }
            });



    });

</script>

</head>
<body>

	    <div id="LeftPane" class="ui-layout-west ui-widget ui-widget-content">
            <table id="west-grid"></table>
        </div> <!-- #LeftPane -->
       	<div id="RightPane" class="ui-layout-center ui-helper-reset ui-widget-content" ><!-- Tabs pane -->




        <div id="switcher"></div>
        <div id="tabs" class="jqgtabs">
        			<ul>
        				<li><a href="#tabs-1">Utimes administration</a></li>
        			</ul>
        			<div id="tabs-1" style="font-size:12px;"> Utimes administration console. version 0.1.1. Copyright: Jidong Liu <br/>
        			<br/>
        			Enjoy
        			<br/>
        			<br/>

        			<p style="border: 1px solid; background-color: lemonchiffon; width:728px;height:25px;margin-bottom: 8px;padding-top: 8px;text-align: center">
        			<b>Support: Jidong Liu jameslau@263.net </b>
        			</p>

        			<iframe src="/utimes/admin/welcome.html" style="width:728px; height:100px;" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" vspace="0" hspace="0"/>

        			</div>
        		</div>
        </div>

	</body>
</html>