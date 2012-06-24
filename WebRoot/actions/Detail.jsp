<%@page import="HandItIn.Submission"%>
<%@ include file="/common/session.jsp"%>
<%@ include file="/common/redirect.jsp"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Submission Detail</title>

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
	<jsp:useBean id="Subms" class="HandItIn.Submission" scope="page"></jsp:useBean>
	<%
		if (request.getParameter("sid") != null)
			try {
				int subid = Integer.parseInt(request.getParameter("sid"));
				Subms = new Submission(subid);
	%>
	<table>
		<%
			Subms.dspListView(out);
		%>
	</table>

	<%
		} catch (Exception ex) {
				out.print(ex.getMessage());
			}
	%>


</body>
</html>
