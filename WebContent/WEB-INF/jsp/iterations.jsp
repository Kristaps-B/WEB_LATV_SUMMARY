 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Iterācijas</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">


</head>
<body>

<div class="page-header">
	<center><h1>TEXT-RANK ALGORITMA ITERĀCIJAS</h1></center>
</div>

	<ul class="nav nav-tabs nav-justified">
  		<li><a href="/web-latv-summary/index.html">Sākums</a></li>
  		<li><a href="/web-latv-summary/summary.html">Kopsavilkums</a></li>
  		<li><a href="/web-latv-summary/sim-table.html">Līdzības matrica</a></li>
  		<li><a href="/web-latv-summary/all-sentences.html">Teikumi</a></li>
  		<li role="presentation" class="active"><a href="#">Text-rank</a></li>
	</ul>
	
	<br/>
	
	<div class="panel panel-default">
  <!-- Default panel contents -->
  <center><div class="panel-heading">Text-Rank</div></center>
	
	<table class = "table">
	<tr>
		<td>Iterācija/teikums</td>
		<c:forEach var = "d" items = "${text.getIterList().get(0)}" varStatus = "i">
			<td>${i.index + 1}. Teikums</td>
		</c:forEach> 
	</tr>
	<c:forEach var="row" items = "${text.getIterList()}" varStatus="statusRow">
	<tr>
		<td>${statusRow.index + 1}. iterācija</td>	
		<c:forEach var="col" items = "${ row}" varStatus="statusCol">
			<td>${col}</td>
		</c:forEach>	
	</tr>	
	</c:forEach>
	</table>
	
	</div>
	 <footer>
		  <center><p>Kristaps B. 2015</p></center>
	</footer> 

</body>
</html>