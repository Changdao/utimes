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
<link rel="stylesheet" href="/utimes/assets/css/jquery-ui-1.9.2.custom.css" />
<link rel="stylesheet" href="/utimes/assets/css/utimes.css" />
<link rel="stylesheet" href="/utimes/assets/css/ui.jqgrid.css" />
<script src="/utimes/assets/js/jquery-ui-1.9.2.custom.js"></script>
<script src="/utimes/assets/js/jquery-ui.js"></script>
<script src="/utimes/assets/js/jquery.jqGrid.min.js" /></script>
<script src="/utimes/assets/js/grid.locale-cn.js" /></script>
<script src="/utimes/assets/js/underscore.js"></script>
<script src="/utimes/assets/js/backbone.js"></script>
<script src="/utimes/assets/js/utimes/useredit.js"></script>


</head>
<body>
	<div id="main-container">
		<table id="list4"></table>
		<div id="pager2"></div>
		<input type="BUTTON" id="new" value="<fmt:message key='user.add'/>" />
        <input type="BUTTON" id="modify" value="<fmt:message key='user.edit'/>" />
        <input type="BUTTON" id="password" value="<fmt:message key='user.password'/>" />
        <input type="BUTTON" id="delete" value="<fmt:message key='user.delete'/>" />
	</div>

	 <script id="user_form_template" type="text/tempalte">

               <div class="thumbnail info-thumbnail background-clouds color-text">
                 <div class="pricing-head bordered">
                   <div class="pricing-head-body background-white">
                     <div class="price-wrapper color-text">
                       <span class="price"></span><br>
                       <span class="per">Total</span>
                     </div>
                   </div>
                 </div>
                 <div class="special background-peter-river color-white" id="school_name"><h3>学费</h3></div>
                 <div class="caption">
                   <div id="items">

                   </div>
                   <p class="buttons"><a href="#" class="btn btn-primary" id="Request"><span class="fa fa-shopping-cart"></span> Request</a></p>
                 </div>
               </div>

        </script>
</body>
</html>