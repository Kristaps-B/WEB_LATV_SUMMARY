<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri= "http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Kopsavilkuma sistēma</title>
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
	
	<h1>KOPSAVILKUMU VEIDOŠANAS SISTĒMA LATV-SUMM</h1>
	<br/>
	
	
	
	
	<form:form method="POST" commandName = "text" action="/web-latv-summary/submit-article.html">
		<b>Teksts:</b><br/>
		<form:textarea path = "text"  rows="16" cols="120"></form:textarea>
		<br/>
		<div id = "percentsDIV">Kopsavilkuma apjoms: 50 %</div>
		
		0
		<form:input id = "range" oninput = "sliderChanged(this.value)" path = "percents" type ="range" min = "0" max = "100" value = "50"/>
		100
		<br/>
		<br/>
		<input type="submit" value = "Izveidot kopsavilkumu"/>
		
		
	</form:form>
	
</body>
</html>