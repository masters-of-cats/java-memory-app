<!DOCTYPE HTML><%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>index</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
  <%
  String bug = "MYBUG";
  int loops = Integer.parseInt(request.getParameter("loops"));
  while ( loops  > 0 ) {
    bug += bug;
  }%>
  <p>Request URI is [<%= request.getRequestURL() %>]</p>
  <p>Query String is [<%= request.getQueryString() %>]</p>
  <p>You requested some information about rio rancho properties</p>
</body>
</html>
