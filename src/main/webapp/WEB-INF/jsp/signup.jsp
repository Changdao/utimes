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
    $( "#resizable" ).resizable({
			handles: "se"
		});
    $("input[type=submit], input[type=reset]").button().click(function(event){
				event.preventDefault();
				});
    $("#submitbutton").click(function(event)){
    	$("register").submit();
    });
  });
  </script>
</head>
<body>

<div id="main-container">	<!-- The main container element -->
<span id="ui-id-1" class="ui-dialog-title">学员注册</span>
<c:forEach items="${registers}" var="register">
<li><c:out value="${register}"/></li>
</c:forEach>
<div id="form-container">	<!-- The form container -->


<form:form commandName="user" id="contact-form" name="register" method="post" action="register.htm">	<!-- The form, sent to submit.php -->

<table width="40%" border="0" cellspacing="0" cellpadding="5">

<tr>
<td><label for="email">Email</label></td>
<td><form:input  cssClass="validate[required,custom[email]]" path="email" id="email" /></td>
<td width=37%><form:errors path="email" /></td>
</tr>

<tr>
<td><label for="password">Password</label></td>
<td><form:input cssClass="validate[required]" path="password" id="password"/></td>
<td with=37%><form:errors path="password" /></td>
</tr>

<tr>
<td width="18%"><label for="lastname">姓</label></td>	<!-- Text label for the input field -->
<td width="45%">
<form:input cssClass="validate[required,custom[onlyLetter]]" path="lastName" id="lastname"/></td>
<!-- We are using session to prevent losing data between page redirects -->

<td width=37%><form:errors path="lastName" /></td>
</tr>
<tr>
<td width="18%"><label for="firstname">名</label></td>	<!-- Text label for the input field -->
<td width="45%"><form:input cssClass="validate[required,custom[onlyLetter]]" path="firstName" /></td>
<!-- We are using session to prevent losing data between page redirects -->

<td width=37%><form:errors path="firstName" /></td>
</tr>


<tr>
<td><label for="subject">兴趣</label></td>

<!-- This select is being replaced entirely by the jqtransorm plugin -->

<td><form:select path="interest" items="${interests}"/></td>
<td width=37%><form:errors path="interest" /></td>
</tr>

<tr>
<td valign="top"><label for="message">说明</label></td>
<td><form:textarea path="description" id="resizable" cssClass="validate[required]" cols="35" rows="5"/></td>
<td width=37%><form:errors path="description" /></td>
</tr>

<tr>
<td><label for="captcha">20+21=</label></td>

<td><input class="validate[required,custom[onlyNumber]]" name="captcha" id="captcha" /></td>
<td valign="top">&nbsp;</td>

</tr>




<tr>
<td valign="top">&nbsp;</td>
<!-- These input buttons are being replaced with button elements -->
<td colspan="2"><input type="submit" name="button" id="submitbutton" value="提交" />
<input type="reset" name="button2" id="button2" value="重置" />


</td>
</tr>

</table>
</form:form>


<!-- The $success variable contains the message that is shown if JS is disabled and the form is submitted successfully -->

</div>
</div>	<!-- closing the containers -->
</body>
</html>
