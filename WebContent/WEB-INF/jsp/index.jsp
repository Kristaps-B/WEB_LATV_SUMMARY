<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri= "http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>LATV-SUMM</title>

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
	<center><h1>LATV-SUMM</h1></center>
</div>

	<br/>
	
	<div class="well well-sm">
	<div class="input-group">

	<form:form method="POST" class="form-horizontal" commandName = "text" action="/web-latv-summary/submit-article.html">
		<b>Teksts:</b><br/>
		
		<form:textarea class="form-control" path = "text"  rows="16" cols="140"></form:textarea>
	
		<br/>
		<div id = "percentsDIV">Kopsavilkuma apjoms: 50 %</div>
		
		
		<form:input id = "range" oninput = "sliderChanged(this.value)" path = "percents" type ="range" min = "0" max = "100" value = "50"/>
		
		<br/>
		<br/>
		<center><input type="submit" class="btn btn-primary" value = "Izveidot kopsavilkumu"/></center>
		
		
	</form:form>

	
	</div>
	</div>
	
	 <footer>
		  <center><p>Kristaps B. 2015</p></center>
	</footer> 
</body>
</html>