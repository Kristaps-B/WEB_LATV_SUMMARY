 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Teikumu līdzības matrica</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />


</head>
<body>


<div class="page-header">
	<center><h1>TEIKUMU LĪDZĪBAS MATRICA</h1></center>
</div>
<br/>

<ul class="nav nav-tabs nav-justified">
  		<li role="presentation"><a href="/web-latv-summary/index.html">Sākums</a></li>
  		<li role="presentation"><a href="/web-latv-summary/summary.html">Kopsavilkums</a></li>
  		<li role="presentation" class="active"><a href="#">Līdzības matrica</a></li>
  		<li role="presentation" ><a href="/web-latv-summary/all-sentences.html">Teikumi</a></li>
  		<li role="presentation"><a href="all-iterations.html">Text-rank</a></li>
</ul>


<br/>
<div class="well well-sm">
<div class="panel panel-default">
  <!-- Default panel contents -->
  <center><div class="panel-heading">Līdzība</div></center>
<table class = "table">
	<% int i = 1; %>
	<tr>
		<td></td>
		<c:forEach var= "x" items = "${text.getSimMatrix()}" varStatus ="j">
			<td><b>${j.index+1}</b></td>
		</c:forEach>
	</tr>
	<c:forEach var="row" items = "${text.getSimMatrix()}" varStatus="statusRow">
		
		<tr>
			<td><b><%=i %></b></td>
		<% i++; %>
		<c:forEach var="number" items="${row}" varStatus="statusCol">
			<td><a href = "/web-latv-summary/sentence-comparison.html?sentence1=${statusRow.index}&sentence2=${statusCol.index}">${number}</a></td>
		</c:forEach>
		</tr>
	</c:forEach>
</table>
</div>
</div>

 <footer>
		  <center><p>Kristaps B. 2015</p></center>
	</footer> 

</body>
</html>