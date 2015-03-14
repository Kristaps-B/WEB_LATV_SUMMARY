 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Teikumu salīdzinājums</title>

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
<h1>TEIKUMU SALĪDZINĀJUMS</h1>

${text.getSentenceComparison().getFirstSentenceID()} ) ${text.getSentenceComparison().getFirstSentence()}
<br/>
${text.getSentenceComparison().getSecondSentenceID()} ) ${text.getSentenceComparison().getSecondSentence()}   


<br/>
<table border = "1" style="width:100%">
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
Teikumu kosinuss līdzība ir: ${text.getSentenceComparison().getRank()}
<br/>

<a href="/web-latv-summary/sim-table.html">Atpakaļ</a> 

</body>
</html>