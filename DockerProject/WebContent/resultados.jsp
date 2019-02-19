<%@page import="java.nio.file.Path"%>
<%@page import="org.apache.catalina.webresources.FileResource"%>
<%@ page import="java.io.*"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resultados</title>
</head>
<body>
	<br>
	<%
	
		out.println("Has seleccionado la Base de Datos: " + request.getParameter("BBDD") + "<br>");
		out.println("Has seleccionado el DataSet: " + request.getParameter("DATA") + "<br>");
		out.println("Has seleccionado la Libreria: " + request.getParameter("LIBRARY") + "<br>");
		out.println("Has seleccionado el Analisis: " + request.getParameter("ANALYSIS") + "<br>");
	%>

	<%
	//creo carpeta de datos
	String carpeta = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/";
	
		File rutaCarpeta = new File(carpeta);
		boolean carpetaCreada;
	if (rutaCarpeta.mkdir()){
		carpetaCreada=true;
	}
	else{
		carpetaCreada=false;
	}
	
	
	
	
		String fichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/ayuda.txt";
		
		String mysqlFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/";
		String postgreFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/";
		String mariaDBFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/";
		
		String dockerfileMysql = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/Dockerfile";
		String dockerfilePostgre = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/Dockerfile";
		String dockerfileMariaDB = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/Dockerfile";
	
		Boolean creado = false;

		PrintWriter pw = new PrintWriter(new FileOutputStream(fichero));
		
		
		
		/*
		File ruta = new File(mysqlFichero);
		if (ruta.mkdir()){
			creado=true;
		}
		else{
			creado=false;
		}
		*/
	   
	%>


	<!-- ++++++++++++++++++++++++++++++++++++BBDD FICHERO++++++++++++++++++++++++++++++++++++++++++ -->
	<%
		String bbdd = request.getParameter("BBDD");
		if (bbdd.equals("MySql")) {
			
			File ruta = new File(mysqlFichero);
			if (ruta.mkdir()){
				creado=true;
			}
			else{
				creado=false;
			}
			PrintWriter pwMysql = new PrintWriter(new FileOutputStream(dockerfileMysql));
			String str = "Has seleccionado MySql \n";
			pwMysql.flush();
			pwMysql.println(str);
			
			pwMysql.close();
			
	%>
	<h3 class="titulo5">
		<strong>MySql</strong>
	</h3>

	<%
		} else if (bbdd.equals("PostgreSQL")) {

			File ruta = new File(postgreFichero);
			if (ruta.mkdir()){
				creado=true;
			}
			else{
				creado=false;
			}
			PrintWriter pwPostgre = new PrintWriter(new FileOutputStream(dockerfilePostgre));
			String str = "Has seleccionado PostgreSQL \n";
			pwPostgre.flush();
			pwPostgre.println(str);
			
		
			pwPostgre.close();
	%>
	<h3 class="titulo5">
		<strong>PostgreSQL</strong>
	</h3>


	<%
		} else if (bbdd.equals("MariaDB")) {

			File ruta = new File(mariaDBFichero);
			if (ruta.mkdir()){
				creado=true;
			}
			else{
				creado=false;
			}
			PrintWriter pwMariaDB = new PrintWriter(new FileOutputStream(dockerfileMariaDB));
			String line1 = "FROM mariadb:latest as builder";
			String line2 = "RUN [\"sed\", \"-i\", \"s/exec \" $@\"/echo \"not running $@\"/\", \"/usr/local/bin/docker-entrypoint.sh\"]";				
			String line3 = "ENV MYSQL_ROOT_PASSWORD=root";
			String line4 = "";
			
			pwMariaDB.flush();
			pwMariaDB.println(line1);
			pwMariaDB.println(line2);
			pwMariaDB.println(line3);
			pwMariaDB.println(line4);
			
			pwMariaDB.close();
	%>
	<h3 class="titulo5">
		<strong>MariaDB</strong>
	</h3>
	<%
		}
	%>

	<!-- ++++++++++++++++++++++++++++++++++++DATA FICHERO++++++++++++++++++++++++++++++++++++++++++ -->
	<%
		String data = request.getParameter("DATA");
		if (data.equals("Black Friday")) {

			String str = "Has seleccionado Black Friday \n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>Black Friday</strong>
	</h3>

	<%
		} else if (data.equals("Students Performance")) {

			String str = "Has seleccionado Students Performance \n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>Students Performance</strong>
	</h3>
	<%
		} else if (data.equals("Reviews of courses of Coursera")) {

			String str = "Has seleccionado Reviews of courses of Coursera \n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>Reviews of courses of Coursera</strong>
	</h3>
	<%
		}
	%>

	<!-- ++++++++++++++++++++++++++++++++++++LIBRARY FICHERO++++++++++++++++++++++++++++++++++++++++++ -->
	<%
		String library = request.getParameter("LIBRARY");
		if (library.equals("SciPy")) {

			String str = "Has seleccionado SciPy \n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>SciPy</strong>
	</h3>

	<%
		} else if (library.equals("Scikit-learn")) {

			String str = "Has seleccionado Scikit-learn \n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>Scikit-learn</strong>
	</h3>
	<%
		} else if (library.equals("Python 3 General")) {

			String str = "Python 3 General \n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>Python 3 General</strong>
	</h3>
	<%
		}
	%>
	<!-- ++++++++++++++++++++++++++++++++++++LIBRARY2 FICHERO++++++++++++++++++++++++++++++++++++++++++ -->
	<%
		String library2 = request.getParameter("LIBRARY2");
		if (library2.equals("TensorFlow")) {

			String str = "Has seleccionado TensorFlow \n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>TensorFlow</strong>
	</h3>

	<%
		} else if (library2.equals("matplotlib")) {

			String str = "Has seleccionado matplotlib\n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>matplotlib</strong>
	</h3>
	<%
		} else if (library2.equals("Keras")) {

			String str = "Has seleccionado Keras\n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>Keras</strong>
	</h3>
	<%
		}
	%>

	<!-- ++++++++++++++++++++++++++++++++++++IDE FICHERO++++++++++++++++++++++++++++++++++++++++++ -->

<%
		String ide = request.getParameter("IDE");
		if (ide.equals("NetBeans")) {

			String str = "Has seleccionado NetBeans \n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>NetBeans</strong>
	</h3>

	<%
		} else if (ide.equals("Eclipse")) {

			String str = "Has seleccionado Eclipse\n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>Eclipse</strong>
	</h3>
	<%
		} else if (ide.equals("SublimeText3")) {

			String str = "Has seleccionado SublimeText3\n";
			pw.flush();
			pw.println(str);
	%>
	<h3 class="titulo5">
		<strong>SublimeText3</strong>
	</h3>
	<%
		}
	%>





	<!-- ++++++++++++++++++++++++++++++CERRAR PRINTWRITER+++++++++++++++++++++++++++++++++++ -->
	<%
		pw.close();
		
		
	%>
</body>
</html>