<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!doctype html>
 
<html lang="zh_CN">
<head>
  <meta charset="utf-8" />
  <title>Utimes Register Page</title>
  <script src="/utimes/js/jquery-1.9.1.js"></script>
  <script src="/utimes/js/jquery-ui.js"></script>
  <link rel="stylesheet" href="/utimes/css/jquery.ui.all.css" />
  <link rel="stylesheet" href="/utimes/css/utimes.css" />
  <style>
.ui-resizable-se {
		bottom: 17px;
	}
  </style>
  <script>
  $(function() {
    
    $("input[type=submit], input[type=reset]").button().click(function(event){
				event.preventDefault();
				});
    $("#submitbutton").click(function(event)){
    	$("login").submit();
    }
  });
  </script>
</head>
<body>

<div id="main-container">	<!-- The main container element -->
<span id="ui-id-1" class="ui-dialog-title">登录</span>

<div id="form-container">	<!-- The form container -->


<form id="login" name="login" method="post" action="login.htm">	<!-- The form, sent to submit.php -->

<table width="40%" border="0" cellspacing="0" cellpadding="5">


<tr>
<td><label for="email">Email</label></td>
<td><input type="text" class="validate[required,custom[email]]" name="email" id="email" /></td>
<td width=37%></td>
</tr>



<tr>
<td valign="top"><label for="password">Password</label></td>
<td><input type="password" name="password" id="password" class="validate[required]" /></td>
<td width=37%></td>
</tr>


<tr>
<td valign="top">&nbsp;</td>
<!-- These input buttons are being replaced with button elements -->
<td colspan="2"><input type="submit" name="button" id="submitbutton" value="提交" />
<input type="reset" name="button2" id="button2" value="重置" />
</td>
</tr>

<tr>
<td></td>
<td><a href="/utimes/register.htm">注册用户</a></td>
</tr>

</table>
</form>


<!-- The $success variable contains the message that is shown if JS is disabled and the form is submitted successfully -->

</div>
</div>	<!-- closing the containers -->
</body>
</html>
