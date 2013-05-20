<%@ page contentType="text/html;charset=utf-8"%>
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
    $( "#resizable" ).resizable({
			handles: "se"
		});
    $("input[type=submit], input[type=reset]").button().click(function(event){
				/*event.preventDefault();*/
				});
  });
  </script>
</head>
<body>

<div id="main-container">	<!-- The main container element -->
<span id="ui-id-1" class="ui-dialog-title">游学注册</span>
<c:forEach items="${registers}" var="register">
<li><c:out value="${register}"/></li>
</c:forEach>
<div id="form-container">	<!-- The form container -->


<form id="contact-form" name="contact-form" method="post" action="register.htm">	<!-- The form, sent to submit.php -->

<table width="40%" border="0" cellspacing="0" cellpadding="5">

<tr>
<td width="18%"><label for="name">姓</label></td>	<!-- Text label for the input field -->
<td width="45%"><input type="text" class="validate[required,custom[onlyLetter]]" name="lastname" id="lastname" value="" /></td>
<!-- We are using session to prevent losing data between page redirects -->

<td width="37%" id="errOffset">&nbsp;</td>
</tr>
<tr>
<td width="18%"><label for="name">名</label></td>	<!-- Text label for the input field -->
<td width="45%"><input type="text" class="validate[required,custom[onlyLetter]]" name="firstname" id="firstname" value="" /></td>
<!-- We are using session to prevent losing data between page redirects -->

<td width="37%" id="errOffset">&nbsp;</td>
</tr>
<tr>
<td><label for="email">Email</label></td>
<td><input type="text" class="validate[required,custom[email]]" name="email" id="email" value="" /></td>
<td>&nbsp;</td>
</tr>

<tr>
<td><label for="subject">兴趣</label></td>

<!-- This select is being replaced entirely by the jqtransorm plugin -->

<td><select name="subject" id="subject">
<option value="" selected="selected"> - 请选择 -</option>
<option value="Question">游学</option>
<option value="Business proposal">旅游</option>
<option value="Advertisement">学校</option>
<option value="Complaint">合作</option>
</select>          </td>
<td>&nbsp;</td>
</tr>

<tr>
<td valign="top"><label for="message">说明</label></td>
<td><textarea name="memo" id="resizable" class="validate[required]" cols="35" rows="5"></textarea></td>
<td valign="top">&nbsp;</td>
</tr>

<tr>
<td><label for="captcha">20+21=</label></td>

<td><input type="text" class="validate[required,custom[onlyNumber]]" name="captcha" id="captcha" /></td>
<td valign="top">&nbsp;</td>
</tr>

<tr>
<td valign="top">&nbsp;</td>
<!-- These input buttons are being replaced with button elements -->
<td colspan="2"><input type="submit" name="button" id="button" value="提交" />
<input type="reset" name="button2" id="button2" value="重置" />


</td>
</tr>

</table>
</form>


<!-- The $success variable contains the message that is shown if JS is disabled and the form is submitted successfully -->

</div>
</div>	<!-- closing the containers -->
</body>
</html>
