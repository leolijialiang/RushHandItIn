<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="/common/session.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Logging in Please Wait</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
	String un = request.getParameter("usrname");
	String up = request.getParameter("usrpass");
	if(Usr.getAuth()==false)
	{
	Usr.UsrAuth(un,up);	
	}
	response.sendRedirect("do.jsp");
 	if(DEBUG)
	{
	out.println(un);
	out.println(up);
	out.println(Usr.getAuth());
	}
	%>

  </head>
  
  <body> 
    <br>
  </body>
</html>
