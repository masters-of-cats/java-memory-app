<!DOCTYPE HTML><%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>index</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
  <%
  String memoryLeak = "MYBUG";
  int interval = 2000;
  int chunk = 5;

  if (!request.getParameter("interval").equals("")){
    interval = Integer.parseInt(request.getParameter("interval"));
  }

  if (!request.getParameter("chunk").equals("")){
    chunk = Integer.parseInt(request.getParameter("chunk"));
  }

  long previousMemory = 0;
  while ( interval  > 0 ) {
    memoryLeak += memoryLeak;
    int mb = 1024 * 1024;
    Runtime instance = Runtime.getRuntime();

	  long memoryUsed = ( instance.totalMemory() - instance.freeMemory()) / mb;

    if ( ( memoryUsed - previousMemory) > chunk ) {
      previousMemory = memoryUsed;
      System.out.println("Memory Usage: Total " + instance.totalMemory() / mb + ", Free " + instance.freeMemory() / mb + ", Used " + memoryUsed + ", Available " + instance.maxMemory() / mb ) ;
      java.lang.Thread.sleep(interval);
    }

  }
  %>
  <p>Request URI is [<%= request.getRequestURL() %>]</p>
  <p>Query String is [<%= request.getQueryString() %>]</p>
  <p>You requested some information about rio rancho properties</p>
</body>
</html>
