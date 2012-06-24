<%@ page language="java" import="java.util.*" pageEncoding="BIG5"%>
<%@ include file="/common/session.jsp"%>
<%
	if (Usr.getAuth()) {
		response.sendRedirect("do.jsp");
	}
%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>WineGuy PRoJeCTo</title>
<link rel="stylesheet" type="text/css" href="CSS/Style.css" />
<style type="text/css">
tr td {
	border: none;
	font-family: Arial;
	font-weight: bold;
	color: #fff;
}

table {
	border: none;
}
</style>
<script type="text/javascript" src="Script/jquery-1.2.6.min.js"></script>
<script type="text/javascript">
	function slideSwitch() {
		var $active = $('#slideshow IMG.active');
		if ($active.length == 0)
			$active = $('#slideshow IMG:last');

		var $next = $active.next().length ? $active.next()
				: $('#slideshow IMG:first');

		var $sibs = $active.siblings();
		var rndNum = Math.floor(Math.random() * $sibs.length);
		var $next = $($sibs[rndNum]);
		$active.addClass('last-active');

		$next.css({
			opacity : 0.0
		}).addClass('active').animate({
			opacity : 1.0
		}, 1000, function() {
			$active.removeClass('active last-active');
		});
	}

	$(function() {
		setInterval("slideSwitch()", 5000);
	});
</script>

</head>

<body>
	<div id="MainContainer">
		<div id="header"></div>
		<div class="LoginBlock">
			<div class="LoginBlockWelcom">
				<p>Register!</p>
			</div>
			<div class="LoginBlockForm">
				<form name="register" action="do.jsp" method="post">
					<table style="margin-left:-40px;">
						<tr>
							<td style="padding-top:20px;">User Name:</td>
							<td><input type="text" name="usrname" class="LoginTxt" />
							</td>
						</tr>
						<tr>
							<td style="padding-top:20px;">Email:</td>
							<td><input type="text" name="usremail" class="LoginTxt" />
							</td>
						</tr>
						<tr>
							<td style="padding-top:20px;">User Pass:</td>
							<td><input type="password" name="usrpass" class="LoginTxt" />
							</td>
						</tr>
						<tr>
							<td style="padding-top:20px;">Confirm Pass:</td>
							<td><input type="password" name="cfrpass" class="LoginTxt" />
							</td>
						</tr>
					</table>
					<input type="hidden" name="action" value="register" /> <input
						type="submit" value="Register Now" class="LoginBut"
						style="margin-left:0px; outline:none;" /> <a href="index.jsp"><button
							class="LoginBut" style="margin-left:40px;">Back</button>
					</a>
				</form>




			</div>
		</div>

		<div id="slideshow">
			<img src="images/img1.jpg" alt="" class="active" /> 
			<img src="images/img2.jpg" alt="" />
			<img src="images/img3.jpg" alt="" />
		</div>

		<div id="footer"></div>
	</div>

</body>
</html>


<html>


<head>
<base href="<%=basePath%>">

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
</html>
