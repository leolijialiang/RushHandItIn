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
    
    <title>My JSP 'newproduct.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="CSS/Style.css">
  </head>
  
  <body>

<%
  String actionName=request.getParameter("action");
  if(actionName!=null&&actionName.equals("NewSubmission"))
  {
  		String titles[]=request.getParameterValues("title");
  		String urls[]=request.getParameterValues("url");
  		String types[]=request.getParameterValues("type");
  		for(int i=0;i<titles.length;i++)
  		{
  			Usr.CreateSubmission(titles[i], urls[i], Integer.parseInt(types[i]));
  		}
  }
  
%>
  
  
  
  <div style="margin:0 auto;">
  
  <form action="actions/NewSubmission.jsp" method="post" name="formSubmission">
					<table style="margin-left:-40px;">
						<tr>
							<td style="padding-top:20px;">Title:</td>
							<td><input type="text" name="title" class="LoginTxt" />
							</td>
						</tr>
						<tr>
							<td style="padding-top:20px;">Url:</td>
							<td><input type="text" name="url" class="LoginTxt" />
							</td>
						</tr>
						<tr>
							<td style="padding-top:20px;">Type</td>
							<td>
							<input type="radio" name="type" value="0"/>Youtube
							<input type="radio" name="type" value="1"/>Flickr
							</td>
							
						</tr>
					</table>
					<input type="hidden" name="action" value="NewSubmission" />
					 <input
						type="submit" value="Hand it IN Now" class="LoginBut"
						style="margin-left:0px; outline:none;" /> <a href="index.jsp"><button
							class="LoginBut" style="margin-left:40px;">Back</button>
					</a>
				</form>
  </div>
 
  <br>
  </body>
</html>
