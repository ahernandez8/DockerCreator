<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

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





<meta http-equiv="Content-Type" content="text/html; UTF-8">
<title>Gestión de Proyectos</title>

<style type="text/css">
<%@include file="css/css.css"%>
</style>


</head>
<body>

	<div class="container">
	<form action="form.jsp" method="post" id="formIndex">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<h1 class="titulo">
					<strong>Generador de entornos de Machine Learning</strong>
				</h1>
			</div>
			<div class="col-3"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3">
				<label for="MAIL">Correo electronico</label>
			</div>
			<div class="col-7">
				<input class="form-control" type="text" name="MAIL" required>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3">
				<label for="PASS">Contraseña</label>
			</div>
			<div class="col-7">
				<input type="password"  name="PASS" class="form-control" required>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3">
				<label for="USERNAME">Nombre de usuario</label>
			</div>
			<div class="col-7">
				<input type="text" name="USERNAME" class="form-control" required><br>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3">
				<label for="CERTS">Ruta de certificados Docker</label>
			</div>
			<div class="col-7">
				<input type="text"
					name="CERTS" class="form-control" required>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-1"></div>
			<div class="col-3">
				<label for="CONF">Ruta de ficheros de configuración Docker</label>
			</div>
			<div class="col-7">
				<div class="input-group">
					<input type="text"  name="CONF" class="form-control" required>
					<div class="input-group-append">
						<span class="input-group-addon"><span class="glyphicon glyphicon-info-sign"></span></span>
		            </div>
				</div>
				
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row">
			<div class="col-4"></div>
			<div class="col-7">
				<a href="<%=request.getContextPath()%>/form.jsp">
					<button form="formIndex" class="btn btn-success" type="submit">
						Siguiente>>
					</button>
				</a>
			</div>
			<div class="col-1"></div>
			
		</div>
		</form>
	</div>
	

</body>
</html>
