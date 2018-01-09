<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
  </head>
  
  <body>
  	<jsp:forward page="${pageContext.request.contextPath }/index_index.action"/>
    <%-- <a href="${pageContext.request.contextPath }/index.action">点击进行跳转</a> --%>
  </body>
</html>
