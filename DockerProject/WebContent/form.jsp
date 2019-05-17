<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.*"%>

<%
	HttpSession userSession = request.getSession();

	if (userSession.getAttribute("wizardSession") == null) {
		userSession.setAttribute("wizardSession", new HashMap<String, String>());
	}
	HashMap<String, String> wizardSession = (HashMap<String, String>) userSession.getAttribute("wizardSession");

	if (request.getParameter("MAIL") != null) {
		wizardSession.put("MAIL", request.getParameter("MAIL"));
	}
	if (request.getParameter("PASS") != null) {
		wizardSession.put("PASS", request.getParameter("PASS"));
	}
	if (request.getParameter("USERNAME") != null) {
		wizardSession.put("USERNAME", request.getParameter("USERNAME"));
	}
	if (request.getParameter("CERTS") != null) {
		wizardSession.put("CERTS", request.getParameter("CERTS"));
	}
	if (request.getParameter("CONF") != null) {
		wizardSession.put("CONF", request.getParameter("CONF"));
	}

	for (String key : wizardSession.keySet()) {
		System.out.println(key + ": " + wizardSession.get(key));
	}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; UTF-8">

<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	type="text/javascript"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="js/functions.js"></script>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
<style type="text/css">
<%@include file="css/css.css"%>
</style>

<title>Gestión de Proyectos</title>
</head>
<body>


	<form action="resultados.jsp" method="post" id="formIndex">

		<h5>1- Seleccione Base de Datos</h5>

		<select name="BBDD">
			<option value="MySql">MySql</option>
			<option value="PostgreSQL">PostgreSQL</option>
			<option value="MariaDB">MariaDB</option>
		</select>

		<h5>2- Seleccione Dataset</h5>

		<select size="1" name="DATA" id="DATA">
			<option value="Black Friday" id="dataset1">Black Friday</option>
			<option value="Students Performance" id="dataset2">Students
				Performance</option>
			<option value="Google Play" id="dataset3">Google Play</option>
		</select>

		<button type="button" id="dataPOP" class="dataPOP"
			data-toggle="popover" data-title="Descripción del Dataset"
			data-placement="right" data-html="true" data-container="body"
			data-trigger="focus">
			<i class="fa fa-info"></i>
		</button>

		<h5>3- Seleccione IDE de desarrollo</h5>

		<select name="IDE">
			<option value="NetBeans">NetBeans</option>
			<option value="Eclipse">Eclipse</option>
			<option value="IntelliJ IDEA">IntelliJ IDEA</option>
			<option value="SublimeText3">Sublime Text 3</option>
		</select>

		<h5>4- Seleccione Librerias</h5>


		<select size=1 name="LIBRARY">
			<option value="SciPy" id="library1">SciPy</option>
			<option value="Scikit-learn" id="library2">Scikit-learn</option>
			<option value="TensorFlow" id="library3">TensorFlow</option>
			<option value="Keras" id="library4">Keras</option>
		</select>

		<button type="button" id="libraryPOP" class="libraryPOP"
			data-toggle="popover" data-placement="right" data-html="true"
			data-title="Información de librería" data-container="body"
			data-trigger="focus">
			<i class="fa fa-info"></i>
		</button>

	</form>
	<h5>5- Seleccione el archivo que desea subir (.zip)</h5>

	<form action="Subir" method="post" enctype="multipart/form-data"
		id="formIndex">
		<input type="file" name="fileName"> <input type="submit"
			value="Subir archivo">
	</form>


	<h5>${requestScope.message}</h5>




	<input type="checkbox" name="BUILD" id="build" form="formIndex"
		onclick="change()"> Generar Imágenes automáticamente
	<br>

	<div id="push" style="display: none">
		<input type="checkbox" name="PUSH" form="formIndex"> Subir
		imágenes a DockerHub<br>
	</div>


	<script>
		function change() {
			var checkBox = document.getElementById("build");
			var text = document.getElementById("push");

			if (checkBox.checked == true) {
				text.style.display = "block";

			} else {
				text.style.display = "none";
			}
		}
	</script>


	<script>
		$('#dataPOP')
				.on(
						'click',
						function() {

							var dataset1 = document.getElementById("dataset1");
							var dataset2 = document.getElementById("dataset2");
							var dataset3 = document.getElementById("dataset3");

							if (dataset1.selected == true) {

								$(this)
										.attr(
												'data-content',
												'Este es el dataset <b>Black Friday</b> su <b>Nº de filas </b>es de: 537.557 <br/> Su <b>tamaño</b> es de: 138,4 Mb <br/>Sus <b>columnas</b> son:(12)<br/>User_ID -> INTEGER <br/> Product_ID -> VARCHAR(9) <br/> Gender -> VARCHAR(1) <br/> Age -> VARCHAR(5) <br/> Occupation -> INTEGER <br/> City_Category -> VARCHAR(1) <br/> Stay_In_Current_City_Years -> VARCHAR(2) <br/> Marital_Status -> BIT <br/> Product_Category_1 -> INTEGER <br/> Product_Category_2 -> INTEGER\n Product_Category_3 -> INTEGER<br/> Purchase -> INTEGER <br/>');
								$(this).popover('show');
							}

							if (dataset2.selected == true) {
								$(this)
										.attr(
												'data-content',
												'Este es el dataset <b>Students Performance</b> su <b>Nº de filas </b>es de: 1.003 <br/> Su <b>tamaño</b> es de: 78 Kb <br/>Sus <b>columnas</b> son:(8)<br/> gender -> VARCHAR(6)<br/> race_ethnicity -> VARCHAR(7)<br/> parental_level_of_education -> VARCHAR(18)<br/> lunch -> VARCHAR(12)<br/> test_preparation_course -> VARCHAR(9)<br/> math_score -> INT<br/> reading_score -> INT<br/> writing_score -> INT<br/>');
								$(this).popover('show');
							}
							if (dataset3.selected == true) {
								$(this).attr('data-title', 'Google Play');
								$(this)
										.attr(
												'data-content',
												'Este es el dataset <b>Google Play</b> su <b>Nº de filas </b>es de: 10.841 <br/> Su <b>tamaño</b> es de: 3,2 Mb <br/>Sus <b>columnas</b> son:(13)<br/> App -> VARCHAR(194)<br/> Category -> VARCHAR(19)<br/> Rating -> VARCHAR(3)<br/> Reviews -> VARCHAR(8)<br/> Size -> VARCHAR(18)<br/> Installs -> VARCHAR(14)<br/> Type -> VARCHAR(4)<br/> Price -> VARCHAR(8)<br/> Content_Rating -> VARCHAR(15)<br/> Genres -> VARCHAR(37)<br/> Last_Updated -> VARCHAR(18)<br/> Current_Ver -> VARCHAR(50)<br/> Android_Ver -> VARCHAR(18)<br/>');
								$(this).popover('show');
							}

						});
	</script>

	<script>
		$('#libraryPOP')
				.on(
						'click',
						function() {

							var library1 = document.getElementById("library1");
							var library2 = document.getElementById("library2");
							var library3 = document.getElementById("library3");
							var library4 = document.getElementById("library4");

							if (library1.selected == true) {

								$(this)
										.attr(
												'data-content',
												' <b>Tamaño:</b> 1112 Mb <br/><b>URL:</b> <a href="https://www.scipy.org/">www.scipy.org</a> <br/><b>Descripción:</b> SciPy es una biblioteca libre y de código abierto para Python. Se compone de herramientas y algoritmos matemáticos. SciPy contiene módulos para optimización, álgebra lineal, integración, interpolación, funciones especiales, FFT, procesamiento de señales y de imagen, resolución de ODEs y otras tareas para la ciencia e ingeniería.');
								$(this).popover('show');
							}

							if (library2.selected == true) {

								$(this)
										.attr(
												'data-content',
												' <b>Tamaño:</b> 123 Mb <br/><b>URL:</b> <a href="https://www.scikit-learn.org/">www.scikit-learn.org</a> <br/><b>Descripción:</b> Scikit-learn es una biblioteca para aprendizaje de máquina de software libre para el lenguaje de programación Python. Incluye varios algoritmos de clasificación, regresión y análisis de grupos entre los cuales están máquinas de vectores de soporte, bosques aleatorios, Gradient boosting, K-means y DBSCAN.');
								$(this).popover('show');
							}
							if (library3.selected == true) {

								$(this)
										.attr(
												'data-content',
												' <b>Tamaño:</b> +-100 Mb + 117 Mb (Python3 Instalación) <br/><b>URL:</b> <a href="https://www.tensorflow.org/">www.tensorflow.org</a> <br/><b>Descripción:</b> TensorFlow es una biblioteca en aprendizaje automático a través de un rango de tareas, está desarrollada por Google para satisfacer sus necesidades de sistemas capaces de construir y entrenar redes neuronales para detectar y descifrar patrones y correlaciones, análogos al aprendizaje y razonamiento usados por los humanos.');
								$(this).popover('show');
							}
							if (library4.selected == true) {

								$(this)
										.attr(
												'data-content',
												' <b>Tamaño:</b> +-50 Mb + 117 Mb (Python3 Instalación) <br/><b>URL:</b> <a href="https://keras.io/">www.keras.io</a> <br/><b>Descripción:</b> Keras es una biblioteca de Redes Neuronales de Código Abierto escrita en Python. Está especialmente diseñada para posibilitar la experimentación en más o menos poco tiempo con redes de Aprendizaje Profundo. Sus fuertes se centran en ser amigable para el usuario, modular y extensible. En 2017, el equipo de TensorFlow de Google decidió ofrecer soporte a Keras en la biblioteca de core de TensorFlow.');
								$(this).popover('show');
							}

						});
	</script>


	<a href="<%=request.getContextPath()%>/ServletLogout">
		<button class="btn btn-warning" type="submit">&#60&#60 Atrás
		</button>
	</a>
	<a href="<%=request.getContextPath()%>/resultados.jsp"><button
			form="formIndex"
			onclick="changeSPI()"
			class="btn btn-success" type="submit" id="generar">Generar
			&#62&#62</button></a>

	<a style="display: none" id="spinner">
		<div class="lds-roller">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
	</a>
	
	
<script>
		function changeSPI() {
			var spi = document.getElementById("spinner").style.display = 'block';
			
		}
	</script>
	
	<%
	//gets irian aqui para visualizar contenido
	
	%>

</body>
</html>

