<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib uri= "http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>KOPSAVILKUMS</title>

<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
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
	
	
	<div class="page-header">
	<center><h1>KOPSAVILKUMS</h1></center>
</div>
	
	
	<ul class="nav nav-tabs nav-justified">
  		<li role="presentation"><a href="/web-latv-summary/index.html">Sākums</a></li>
  		<li role="presentation" class="active"><a href="#">Kopsavilkums</a></li>
  		<li role="presentation" ><a href="/web-latv-summary/sim-table.html">Līdzības matrica</a></li>
  		<li role="presentation" ><a href="/web-latv-summary/all-sentences.html">Teikumi</a></li>
  		<li role="presentation"><a href="all-iterations.html">Text-rank</a></li>
</ul>
	
	<br/>
	<div class="well well-sm">
	<span class="label label-primary">Apjoms: ${text.getPercents()} %</span>
	<br/><br/>
	
	<ol>
		<c:forEach var ="listValue" items="${text.getSummaryList()}">
			
			<li>${listValue.getOriginalSentence()}  <span class="label label-info">[ID: ${listValue.getID()} RANGS: ${listValue.getRank() }]</span> </li><br/>
			
			
		</c:forEach>
	</ol>
	</div>
	<form:form method="POST" class="form-horizontal" commandName = "text" action="/web-latv-summary/submit-article.html">
		<div id = "percentsDIV">Kopsavilkuma apjoms: 50 %</div>
		
		
		<form:input id = "range"  oninput = "sliderChanged(this.value)" path = "percents" type ="range" min = "0" max = "100"/>
		
		<br/>
		<br/>
		<center><input type="submit" class="btn btn-primary" value = "Izmainit kopsavilkuma apjomu"/></center>
		
		
	</form:form>
	
	<br/>
	<br/>
	
	
	 <footer>
		  <center><p>Kristaps B. 2015</p></center>
	</footer> 
	
</body>
</html>