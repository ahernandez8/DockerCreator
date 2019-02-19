  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@page import="java.util.*" %>
<%@page import="java.io.*" %>

<html>
	<head>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		 
  	    <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    
    	<script type="text/javascript" src="js/functions.js"></script>

		<meta http-equiv="Content-Type" content="text/html; UTF-8">
		<title>Gestión de Proyectos</title>
	<!--  
<script>
$(function () {
  $('[data-toggle="popover"]').popover({
	  placement:"right",
	  trigger:'hover' 
  })
});
</script>

<script>
$(function () {
    $("#selectList").on("change", onChange);
    $("#selectList").on("focus", function()
    	     {
        $(this).popover('destroy')
   			 });
});

function onChange() {
    var $this = $(this);
    var $e = $(this.target);
    $('#selectList').popover('destroy');
    $("#selectList").popover({
        trigger: 'hover',
        html: true,
        placement: 'right',
        content: $("#selectList option:selected").attr('data-info')
    }).popover('show');
    $this.blur();
}
</script>
-->



		<style type="text/css">
   <%@include file="css/css.css" %>
</style>


	</head>
<body>



	<br>

	<h4 class="titulo">

		<strong>&nbsp;Generador de entornos de Machine Learning</strong>
	</h4>
	
<form action="resultados.jsp" method="post" id="form1">

&nbsp;
<%
	out.println("Seleccione Base de Datos: ");
%>


<br>
&nbsp;
<select name="BBDD">
   <option value="MySql">MySql</option> 
   <option value="PostgreSQL">PostgreSQL</option>
   <option value="MariaDB">MariaDB</option>
</select>

<br>
<br>

&nbsp;
<%
	out.println("Seleccione DataSet: ");
%>

<br>
&nbsp;


<select size="1" name="DATA" id="DATA">


   <option value="1" data-info="holaaaa">Black Friday</option> 

   <option value="2" data-info="data2" >Students Performance</option>
   
   <option value="3" data-info="data3" >Reviews of courses of Coursera</option>
  
</select>
<!--  
<br>
<select size="3" name="selectList" id="selectList">
    <option value="1" data-info="data1">Item 1</option>
    <option value="2" data-info="data2">Item 2</option>
    <option value="3" data-info="data3">Item 3</option>
    <option value="4" data-info="data4">Item 4</option>
</select>

    
<button type="button" 
		class="btn btn-lg btn-dark" 
		data-toggle="popover"
		id="pop1"
		title="Black friday" 
		data-content="hola descripcion de black friday">Ver detalles</button>
		


			<button type="button" 
		class="btn btn-lg btn-dark" 
		data-toggle="popover"
		id="pop2"
		title="Students Performance" 
		data-content="hola descripcion de students">Ver detalles</button>
					

-->


<br>
<br>
&nbsp;
<%
	out.println("Seleccione Librerias: ");
%>

<br>
&nbsp;
<select name="LIBRARY">
   <option value="SciPy">SciPy</option> 
   <option value="Scikit-learn">Scikit-learn</option>
   <option value="Python 3 General">Python 3 General</option>
</select>


&nbsp;
<select name="LIBRARY2">
   <option value="TensorFlow">TensorFlow</option> 
   <option value="matplotlib">matplotlib</option>
   <option value="Keras">Keras</option>
   
</select>

<br>
<br>


<br>
&nbsp;
<%
	out.println("Seleccione IDE de desarrollo: ");
%>
<select name="IDE">

   <option value="NetBeans">NetBeans</option> 
   <option value="Eclipse">Eclipse</option>
   <option value="SublimeText3">Sublime Text 3</option>
</select>
        <br>
        <br>
<br>
&nbsp;


&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
      
          
       
    <!--    <button type="submit" class="btn btn-success">Generar</button> -->


&nbsp;

</form>
&nbsp;
<%
	out.println("Seleccione el archivo de datos que quiere introducir: " + "<br>");
%>
&nbsp;
 
  <form action="uploadServlet" method="post" enctype="multipart/form-data" id="form1"> 
<input type="file" name="fileName">
<input type="submit" value="Subir archivo">
 
</form>


<h5>${requestScope.message}</h5>

<!--  
<input  type="file" name="fileName" formmethod="post" onclick="uploadServlet" formenctype="multipart/form-data" id="form1">
<input type="submit" value="Subir archivo">



<h5>${requestScope.message}</h5>
-->


<!--  <button type="submit" class="btn btn-success">Generar</button> -->
<a href="<%= request.getContextPath()%>/resultados.jsp"><button form="form1" class="btn btn-success" type="submit">Generar</button></a>
&nbsp;
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;   
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;


<a href="<%= request.getContextPath()%>/ServletLogout"><button class="btn btn-warning" type="submit">Salir</button></a>


		


</body>
</html>