 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Teikumu salīdzinājums</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />

</head>
<body>

<div class="page-header">
	<center><h1>TEIKUMU SALĪDZINĀJUMS</h1></center>
</div>

<ul class="list-group">
<li class="list-group-item list-group-item-success">${text.getSentenceComparison().getFirstSentenceID()} ) ${text.getSentenceComparison().getFirstSentence()}</li>
<li class="list-group-item list-group-item-info">${text.getSentenceComparison().getSecondSentenceID()} ) ${text.getSentenceComparison().getSecondSentence()}</li>
</ul>


<br/>

<div class="well well-sm">

<div class="panel panel-default">
  <!-- Default panel contents -->
  <center><div class="panel-heading">Teikumi</div></center>
<table class = "table">
<tr>
	<td>Vārdi</td>
	<td>Pirmā teikuma vektors</td>
	<td>Otrā teikuma vektors</td>
</tr>
	
<c:forEach var ="w" items = "${text.getSentenceComparison().getWordsArr()}" varStatus = "i">
	<tr>
		<td>${w}  </td><td> ${text.getSentenceComparison().getFirstSentRank()[i.index]} </td><td>  ${text.getSentenceComparison().getSecondSentRank()[i.index]} </td>
	</tr>
</c:forEach>

</table>
</div>
<span class="label label-warning">Teikumu kosinuss līdzība ir: ${text.getSentenceComparison().getRank()}</span>
</div>



<center><p><a class="btn btn-primary btn-lg" href="/web-latv-summary/sim-table.html" role="button">Atpakaļ</a></p></center>


 <footer>
		  <center><p>Kristaps B. 2015</p></center>
	</footer> 

</body>
</html>