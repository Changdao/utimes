<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
<title>Utimes Schools
</title>
  <script src="/utimes/js/jquery-1.9.1.js"></script>
  <script src="/utimes/js/jquery-ui.js"></script>
  <link rel="stylesheet" href="/utimes/css/jquery.ui.all.css" />
  <link rel="stylesheet" href="/utimes/css/utimes.css" />
  
  <script>
  $(function(){
	  $(".schoolhref").click(function(event){
		  			event.preventDefault();
		  			$("#content").load(this.href);
			  });
  });
  
  </script>
</head>


<div id="container">
<div id="content-wrapper" class="clearfix row">
<div class="content-right twelve columns">
<div id="content">

</div>

<div id="sidebar">
<c:forEach items="${shools}" var="school">
<li><a class="schoolhref" href="<c:url value="/schools.htm" > <c:param name="id" value="${school.id}"/></c:url>"><c:out value="${school}"/></a></li>
</c:forEach>

</div>
</div>

</div>
</div>




</html>