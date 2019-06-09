<!--
Author: Colorlib
Author URL: https://colorlib.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Docker Machine Learning Creator</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- Custom Theme files -->
<link href="css/css.css" rel="stylesheet" type="text/css" media="all" />
<!-- //Custom Theme files -->

<!-- web font -->
<link href="//fonts.googleapis.com/css?family=Roboto:300,300i,400,400i,700,700i" rel="stylesheet">
<!-- //web font -->

<!-- Bootstrap.min.css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- //Bootstrap.min.css -->

<!-- JQuery 3.3.1.min -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	type="text/javascript"></script>
<!-- //JQuery 3.3.1.min -->

<!-- Popper.min.js -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<!-- //Popper.min.js -->

<!-- Bootstrap.min.js -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!-- //Bootstrap.min.js -->	

<script type="text/javascript" src="js/functions.js"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


	
<script type="text/javascript" src="js/functions.js"></script>
<style type="text/css">
<%@include file="css/css.css"%>
</style>
<title>Docker Machine Learning Creator</title>
</head>
<body>
	<!-- main -->
	<div class="main-w3layouts wrapper">
		<h1>Docker Machine Learning Environment Creator</h1>
		<div class="main-agileinfo">
		
			<div class="agileits-top">
			<p>Formulario de conexión con ApiDocker </p>
			
				<form action="form.jsp" method="post" id="formIndex">
					<input class="text" type="email" value="dockeruserucam@gmail.com" name="MAIL" placeholder="Email de cuenta Docker" required>
					<input class="text email" type="password" value="docker-user" name="PASS" placeholder="Contraseña de cuenta Docker" required>
					<input class="text email" type="text" value="dockeruserucam" name="USERNAME" placeholder="Nombre usuario de Docker" required>
					
					
				
					<input class="text email" type="text" value="/Users/adrianhm91/.docker/machine/certs" name="CERTS" placeholder="Ruta de certificados Docker" required >
					
					
				
				
				<button type="button" id="certsPOP" class="btn btn-default"
			data-toggle="popover" data-title="Ruta de certificados Docker"
			data-content="En este formulario has de poner donde se encuentran localizados en tu máquina los certificados de Docker. Por ejemplo: /Users/USUARIO/.docker/machine/certs "
			data-placement="right" data-html="true" data-container="body"
			data-trigger="focus">
			<i class="fa fa-info"></i>
		</button>
		
	
				
				
					<input class="text" type="text" value="/Users/adrianhm91/.docker/" name="CONF" placeholder="Ruta de ficheros de configuración Docker" required>
					
					<button type="button" id="confPOP" class="btn btn-default" data-toggle="popover"
					data-placement="right"
					
					data-content="En este formulario has de poner donde se encuentran localizados en tu máquina los ficheros de configuración de Docker. Por ejemplo: /Users/USUARIO/.docker/ "
					data-title="Ruta de ficheros de configuración" data-html="true"
					data-container="body" data-trigger="focus">
					<i class="fa fa-info"></i>
				</button>
				
				
					<div class="wthree-text">
									
	
				
						<div class="clear"> </div>
					</div>
					<input type="submit" value="SIGUIENTE >>">
				</form>
			<!-- 	<p>Formulario de conexión con ApiDocker </p> -->
			</div>
		</div>
		<!-- copyright -->
		<div class="colorlibcopy-agile">
			<p>© 2019 Docker Machine Learning Environment Creator (DMLEC). All rights reserved | Design by Adrián Hernández</p>
		</div>
		<!-- //copyright -->
		<ul class="colorlib-bubbles">
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
	<!-- //main -->
	
	

		<% 
		String carpeta = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/";

		File rutaCarpeta = new File(carpeta);
		FileUtils.deleteDirectory(rutaCarpeta);
		rutaCarpeta.mkdir();
		
		%>
		
		
</body>
</html>