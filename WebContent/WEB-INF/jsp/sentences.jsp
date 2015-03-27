<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teikumi</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />


</head>
<body>

<div class="page-header">
	<center><h1>TEIKUMI</h1></center>
</div>


<ul class="nav nav-tabs nav-justified">
  		<li role="presentation"><a href="/web-latv-summary/index.html">Sākums</a></li>
  		<li role="presentation"><a href="/web-latv-summary/summary.html">Kopsavilkums</a></li>
  		<li role="presentation"><a href="/web-latv-summary/sim-table.html">Līdzības matrica</a></li>
  		<li role="presentation" class="active"><a href="#">Teikumi</a></li>
  		<li role="presentation"><a href="all-iterations.html">Text-rank</a></li>
</ul>

	
	
	
	
	
	<br/>
	<div class="well well-sm">

		<div class="panel panel-default">
  <!-- Default panel contents -->
  <center><div class="panel-heading">Teikumi</div></center>
	<table class = "table">
	<tr>
		<td>ID</td>
		<td>Originalais teikums</td>
		<td>Pārveidotais teikums</td>
		<td>TextRank</td>
	</tr>
	<c:forEach var = "sentence" items = "${text.getSentences()}" varStatus = "i" >
		<tr>
			<td>${sentence.getID()}</td> <td>${sentence.getOriginalSentence()} </td> <td>${sentence.getNewSentence()}</td> <td><span class="label label-info">${sentence.getRank()}</span></td>
		<tr>
	</c:forEach>
	
	</table>
	</div>
	</div>
	
		 <footer>
		  <center><p>Kristaps B. 2015</p></center>
	</footer> 

</body>
</html>