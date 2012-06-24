<%@ page language="java" import="dbAccessLayer.*" %>
<%@ include file="/common/session.jsp" %>
<%
	Usr.UsrReset();
 	response.sendRedirect("/WineGuy/index.html");
%>