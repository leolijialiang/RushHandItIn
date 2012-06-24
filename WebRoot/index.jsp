<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ include file="/common/session.jsp" %>
<% 
if(Usr.getAuth())
response.sendRedirect("do.jsp");
else
response.sendRedirect("index.html");
%>