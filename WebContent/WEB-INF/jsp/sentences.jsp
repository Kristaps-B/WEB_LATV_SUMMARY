<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teikumi</title>

<style>
 table, th, td {
 	border: 2px solid black;
 	border-collapse: collapse;
 }
 th, td {
 	padding: 5px;
 }
</style>


</head>
<body>
<h1>TEIKUMI</h1>



  	<a href="/web-latv-summary/index.html">Sākums</a>
  	<a href="/web-latv-summary/summary.html">Kopsavilkums</a>
  		<a href="/web-latv-summary/sim-table.html">Līdzības matrica</a>
  		<a href="/web-latv-summary/all-sentences.html">Teikumi</a>
  	<a href="/web-latv-summary/all-iterations.html">Text-rank</a>

	
	
	
	
	
	
	<br/>
	<table border = "1" style="width:100%">
	<tr>
		<td>ID</td>
		<td>Originalais teikums</td>
		<td>Pārveidotais teikums</td>
		<td>TextRank</td>
	</tr>
	<c:forEach var = "sentence" items = "${text.getSentences()}" varStatus = "i" >
		<tr>
			<td>${sentence.getID()}</td> <td>${sentence.getOriginalSentence()} </td> <td>${sentence.getNewSentence()}</td> <td>${sentence.getRank()}</td>
		<tr>
	</c:forEach>

</body>
</html>