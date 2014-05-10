<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>

<head>
  <meta name="GENERATOR" content="Evrsoft First Page">
  <title>Your Company Login</title>
  <meta name="description" content="" />
    <link rel="stylesheet" href="/utimes/assets/css/jquery-ui-1.9.2.custom.css" />
    <script src="/utimes/assets/js/jquery-1.9.1.js"></script>
    <script src="/utimes/assets/js/jquery-ui.js"></script>
<script>
$(function() {
		// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		var name = $( "#name" ),
			email = $( "#email" ),
			pwd = $( "#pwd" ),
			allFields = $( [] ).add( name ).add( email ).add( pwd ),
			tips = $( ".validateTips" );
	    function updateTips( t ) {
			tips.text( t ).addClass( "ui-state-highlight" );
			setTimeout(function() {
				tips.removeClass( "ui-state-highlight", 1500 );
			}, 500 );
		}
		function checkLength( o, n, min, max ) {
			if ( o.val().length > max || o.val().length < min ) {
				o.addClass( "ui-state-error" );
				updateTips( "Length of " + n + " must be between " +
					min + " and " + max + "." );
				return false;
			} else {
				return true;
			}
		}
		function checkRegexp( o, regexp, n ) {
			if ( !( regexp.test( o.val() ) ) ) {
				o.addClass( "ui-state-error" );
				updateTips( n );
				return false;
			} else {
				return true;
			}
		}

});
</script>
<script>
$(function() {
	// a workaround for a flaw in the demo system (http://dev.jqueryui.com/ticket/4375), ignore!
	$( "#dialog:ui-dialog" ).dialog( "destroy" );
	var name = $( "#name" ),
	email = $( "#email" ),
	pwd = $( "#pwd" ),
		allFields = $( [] ).add( name ).add( email ).add( pwd ),
		tips = $( ".validateTips" );
		function updateTips( t ) {
	       tips
		.text( t )
		.addClass( "ui-state-highlight" );
		setTimeout(function() {
		tips.removeClass( "ui-state-highlight", 1500 );
		}, 500 );
		}
	function checkLength( o, n, min, max ) {
	if ( o.val().length > max || o.val().length < min ) {
	o.addClass( "ui-state-error" );
	updateTips( "Length of " + n + " must be between " +
min + " and " + max + "." );
	return false;
} else {
return true;
	}
}
function checkRegexp( o, regexp, n ) {
if ( !( regexp.test( o.val() ) ) ) {
			o.addClass( "ui-state-error" );
			updateTips( n );
		return false;
		} else {
		return true;
		}
		}

	});
	</script>
      <style>
    /* HTML elements  */
        h1, h2, h3, h4, h5, h6{
            font-weight:normal;
            margin:0;
            line-height:1.1em;
            color:#000;
            }
        input.text { margin-bottom:12px; width:95%; padding: .4em; }
        fieldset { padding:0; border:0; margin-top:25px; }
    h1 { font-size: 1.2em; margin: .6em 0; }
    div#users-contain { width: 350px; margin: 20px 0; }
    div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
                div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
                .ui-dialog .ui-state-error { padding: .3em; }
                .validateTips { border: 1px solid transparent; padding: 0.3em; }
            h1{font-size:2em;margin-bottom:.5em;}
            h2{font-size:1.75em;margin-bottom:.5142em;padding-top:.2em;}
            h3{font-size:1.5em;margin-bottom:.7em;padding-top:.3em;}
            h4{font-size:1.25em;margin-bottom:.6em;}
            h5,h6{font-size:1em;margin-bottom:.5em;font-weight:bold;}
        p, blockquote, ul, ol, dl, form, table, pre{line-height:inherit;margin:0 0 1.5em 0;}
            ul, ol, dl{padding:0;}
            ul ul, ul ol, ol ol, ol ul, dd{margin:0;}
            li{margin:0 0 0 2em;padding:0;display:list-item;list-style-position:outside;}
            blockquote, dd{padding:0 0 0 2em;}
            pre, code, samp, kbd, var{font:100% mono-space,monospace;}
            pre{overflow:auto;}
            abbr, acronym{
        text-transform:uppercase;
        border-bottom:1px dotted #000;
        letter-spacing:1px;
    }
    abbr[title], acronym[title]{cursor:help;}
    small{font-size:.9em;}
        sup, sub{font-size:.8em;}
        em, cite, q{font-style:italic;}
        img{border:none;}
        hr{display:none;}
    table{width:100%;border-collapse:collapse;}
        th,caption{text-align:left;}
        form div{margin:.5em 0;clear:both;}
    label{display:block;}
    fieldset{margin:0;padding:0;border:none;}
    legend{font-weight:bold;}
    input[type="radio"],input[type="checkbox"], .radio, .checkbox{margin:0 .25em 0 0;}
    /* //  HTML elements */
    /* base */
    body, table, input, textarea, select, li, button{
        font:1em "Lucida Sans Unicode", "Lucida Grande", sans-serif;
        line-height:1.5em;
        color:#444;
        }
    body{
        font-size:12px;
            background:#c4f0f1;
        text-align:center;
    }

    #login{
        margin:5em auto;
        background:#fff;
        border:8px solid #eee;
        width:500px;
        -moz-border-radius:5px;
        -webkit-border-radius:5px;
        border-radius:5px;
        -moz-box-shadow:0 0 10px #4e707c;
        -webkit-box-shadow:0 0 10px #4e707c;
        box-shadow:0 0 10px #4e707c;
        text-align:left;
        position:relative;
        }
    #login a, #login a:visited{color:#0283b2;}
    #login a:hover{color:#111;}
    #login h1{
        background:#0092c8;
        color:#fff;

        text-shadow:#007dab 0 1px 0;
        font-size:14px;
        padding:18px 23px;
        margin:0 0 1.5em 0;
        border-bottom:1px solid #007dab;
    }
    #login .register{
        position:absolute;
            float:left;
            margin:0;
        line-height:30px;
        top:-40px;
            right:0;
        font-size:11px;
       }
    #login p{margin:.5em 25px;}
    #login div{
        margin:.5em 25px;
        background:#eee;
        padding:4px;
        -moz-border-radius:3px;
        -webkit-border-radius:3px;
        border-radius:3px;
        text-align:right;
    position:relative;
    }
    #login label{
        float:left;
        line-height:30px;
        padding-left:10px;
        }
    #login .field{
        border:1px solid #ccc;
        width:280px;
        font-size:12px;
        line-height:1em;
        padding:4px;
        -moz-box-shadow:inset 0 0 5px #ccc;
        -webkit-box-shadow:inset 0 0 5px #ccc;
    box-shadow:inset 0 0 5px #ccc;
    }
    #login div.submit{background:none;margin:1em 25px;text-align:left;}
    #login div.submit label{float:none;display:inline;font-size:11px;}
    #login button{
        border:0;
        padding:0 30px;
        height:30px;
        line-height:30px;
        text-align:center;
        font-size:12px;
        color:#fff;
        text-shadow:#007dab 0 1px 0;
        background:#0092c8;
        -moz-border-radius:50px;
        -webkit-border-radius:50px;
        border-radius:50px;
        cursor:pointer;
    }
    #login .forgot{text-align:right;font-size:11px;}
    #login .back{padding:1em 0;border-top:1px solid #eee;text-align:right;font-size:11px;}
    #login .error{
        float:left;
        position:absolute;
        left:95%;
        top:-5px;
        background:#890000;
        padding:5px 10px;
        font-size:11px;
        color:#fff;
        text-shadow:#500 0 1px 0;
        text-align:left;
        white-space:nowrap;
        border:1px solid #500;
        -moz-border-radius:3px;
        -webkit-border-radius:3px;
        border-radius:3px;
        -moz-box-shadow:0 0 5px #700;
        -webkit-box-shadow:0 0 5px #700;
        box-shadow:0 0 5px #700;
    }
    </style>
</head>
<body>
<form id="login" method="post" action="<c:url value='j_spring_security_check' />">
<h1><fmt:message key='login.title'/></h1>

<div>
<label for="usr_email">Username</label>
<input type="text" name="j_username" id="usr_email" class="field required" title="Please provide your Username" />
</div>
<div>
<label for="login_pwd">Password</label>
<input type="password" name="j_password" id="login_pwd" class="field required" title="Password is required" />
</div>
<div class="submit">
    <button type="submit">Log in</button>
        <label>
<input type="checkbox" name="remember" id="login_remember" value="yes" />Remember my login on this computer
</label>
</div>
</form>


</body>
</html>