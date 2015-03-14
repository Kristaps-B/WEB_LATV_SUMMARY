 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Teikumu līdzības matrica</title>

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
<h1>TEIKUMU LĪDZĪBAS MATRICA</h1>
<br/>



<br/>
<table border = "1" style="width:100%">
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

<a href="/web-latv-summary/index.html">Uz sākumu</a> <br/>
<a href="/web-latv-summary/summary.html">Uz kopsavilkumu</a>

</body>
</html>