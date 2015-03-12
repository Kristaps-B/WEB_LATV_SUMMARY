<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri= "http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>KOPSAVILKUMS</title>
</head>
<body onload = "start()">

	<script type="text/javascript">	
		
		function start() {
			var p = document.getElementById('range').value;
			document.getElementById("percentsDIV").innerHTML = "Kopsavilkuma apjoms: "+p +" %";
		}
		
		
		function sliderChanged(val) {
			document.getElementById("percentsDIV").innerHTML = "Kopsavilkuma apjoms: "+val +" %";
		}
	</script>
	
	<h1>KOPSAVILKUMS</h1>
	<a href="/WebLatvSumm/simtable.html">Līdzības matrica</a>
	<br/>
	<b>Kopsavilkuma apjoms: ${text.getPercents()} %</b>
	<br/>
	
	<ol>
		<c:forEach var ="listValue" items="${text.getSummaryList()}">
			<li>${listValue.getOriginalSentence()} [ID: ${listValue.getID()} RANGS: ${listValue.getRank() }]</li>
		</c:forEach>
	</ol>
	
	<form:form method="POST" commandName = "text" action="/WebLatvSumm/submitArticle.html">
		<div id = "percentsDIV">Kopsavilkuma apjoms: 50 %</div>
		
		0
		<form:input id = "range"  oninput = "sliderChanged(this.value)" path = "percents" type ="range" min = "0" max = "100"/>
		100
		<br/>
		<br/>
		<input type="submit" value = "Izmainit kopsavilkuma apjomu"/>
		
		
	</form:form>
	
	<br/>
	<br/>
	<a href="/WebLatvSumm/index.html">Uz sākumu</a>
	
</body>
</html>