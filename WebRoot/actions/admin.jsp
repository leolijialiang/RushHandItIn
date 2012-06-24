<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="/common/session.jsp"%>
<%@ include file="/common/redirect.jsp"%>
<%
	if (Usr.getUid() != 3) {
		response.sendRedirect("/WineGuy/do.jsp");
	}
%>
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

<title>My JSP 'admin.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="CSS/Style.css">
<style type="text/css">
table {
	border: 1px solid gray;
}

tr {
	border: 1px solid gray;
}

td {
	border: 1px solid gray;
}
</style>

</head>

<body>
	<div id='header'></div>
	<div id='main'>
		<div class='menu'>
			<span class="LoginBut"><a href="actions/logout.jsp">Log
					out</a></span> <span class="LoginBut"><a href="do.jsp">Go Frontend</a></span>
		</div>
		<jsp:useBean id="submt" class="HandItIn.Submission" scope="page"></jsp:useBean>
		<jsp:useBean id="creator" class="HandItIn.User" scope="page"></jsp:useBean>
		<form action="do.jsp" method="post">
			<input type="hidden" name="action" value="AdminDel">
			<table>
				<%
					ArrayList<Submission> submits = Usr.allSubmission();
					for (int i = 0; i < submits.size(); i++) {
						submt = submits.get(i);
						creator = new User(submt.getCreatorId());
				%>
				<tr>
					<td><a href='actions/Detail.jsp?sid=<%=submt.getSub_id()%>'> <%= submt.getTitle() %>
					</a></td>
					<td><a href='<%= submt.getUrl() %>'></a><%= submt.getUrl() %>
					</td>
					<td><%= submt.getType()%></td>
					<td><%= creator.getUname() %></td>
					<td><%= submt.getDate().toString() %></td>
					<td><a href='actions/TeacherComment.jsp?sid=<%= submt.getSub_id() %>'>Comment</a></td>
					<%
							}
					 %>
					
			</table>
			<input type="submit" value="Delete Selected" class='loginBut' />
		</form>
	</div>
</body>

</html>
