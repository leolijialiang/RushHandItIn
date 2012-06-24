<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="/common/session.jsp" %>
<%@ include file="/common/redirect.jsp" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'myproduct.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="CSS/Style.css">
<style type="text/css">
	.title {font-size: 22px; font-weight: bold;}
	table {border:1px solid gray;}
	tr {border:1px solid gray;}
	td {border:1px solid gray;}
	.content {margin-right:40px;}
	.imgbox {hight:300px;display:compact;}
</style>
  </head>
  
  <body>
  <div id='header'>

  </div>
  
  <div id='main'>
  <div class='menu'>
  <span class="LoginBut"><a href="actions/logout.jsp">Log out</a></span>
  <span class="LoginBut"><a href="actions/NewSubmission.jsp">Submit New</a></span>
  <span style="float:right;font-size:18px;">Welcome:<%= Usr.getUname() %></span>
  </div>
  <form action="do.jsp?action=del">
  <table>
  <tr><td COLSPAN=6 align="center"><p style="font:22px bold;">Your Submission</p></td></tr>
  <%
   ArrayList<Submission> submits=Usr.hisSubmission();
   for(int i=0;i<submits.size();i++)
   {
   submits.get(i).dspListViewPickable(out);
   }
   %>
  </table>
  </form>
  </div>
  </body>
</html>
