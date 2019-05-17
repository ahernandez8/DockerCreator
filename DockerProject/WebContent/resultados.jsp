<%@page import="java.awt.Checkbox"%>
<%@page import="edu.ucam.classes.CopyFilesWithExtension"%>
<%@page import="java.io.ObjectInputStream.GetField"%>
<%@page import="org.apache.catalina.startup.CopyParentClassLoaderRule"%>
<%@page import="java.nio.file.Path"%>
<%@page import="org.apache.catalina.webresources.FileResource"%>
<%@page import="edu.ucam.classes.Copy"%>
<%@page import="edu.ucam.apiDocker.FunctionsDocker"%>
<%@page import="java.io.*"%>
<%@page import="java.nio.*"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="javax.servlet.*" %>
<%@page import="java.util.*" %>

<%
HttpSession userSession = request.getSession();

if(userSession.getAttribute("wizardSession") == null){
	userSession.setAttribute("wizardSession", new HashMap<String, String>());
}
HashMap<String, String> wizardSession = (HashMap<String, String>)userSession.getAttribute("wizardSession");
for(String key :wizardSession.keySet()){
	System.out.println(key+": "+wizardSession.get(key));
}
/*
String mail = request.getParameter("MAIL");
String pass = request.getParameter("PASS");
String user = request.getParameter("USERNAME");
String certs = request.getParameter("CERTS");
String conf = request.getParameter("CONF");
*/
%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; UTF-8">
		<meta charset="UTF-8">

		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<style type="text/css">
		   <%@include file="css/css.css" %>
		</style>
		 
  	    <script src="https://code.jquery.com/jquery-3.3.1.min.js" type="text/javascript"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    	<script type="text/javascript" src="js/functions.js"></script>
    
		<title>Resultados</title>
	</head>
	<body>
		<br>

	<%
	
	//PrintWriter pwMariaDB = new PrintWriter(); 
	
	//Extraer variables del wizardsession
	
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
	
	
		String fichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Ayuda General.txt";
		
		String ayudaMySql = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/Ayuda para Contenedor MySql.txt";
		String ayudaPostgre = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/Ayuda para Contenedor PostgreSQL.txt";
		String ayudaMariaDB = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/Ayuda para Contenedor MariaDB.txt";
		
		String mysqlFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/";
		String postgreFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/";
		String mariaDBFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/";
		
		String dockerfileMysql = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/Dockerfile";
		String dockerfilePostgre = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/Dockerfile";
		String dockerfileMariaDB = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/Dockerfile";
		
		
		//++++++++++++++++IDE++++++++++++++++++++++
		String netBeansFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/netBeans/";
		String eclipseFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Eclipse/";
		String intellijFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/IntellijIDEA/";
		String sublimeFichero = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Sublime-Text/";
		
		String dockerfileNetBeans = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/netBeans/Dockerfile";
		String dockerfileEclipse = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Eclipse/Dockerfile";
		String dockerfileIntellij = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/IntellijIDEA/Dockerfile";
		String dockerfileSublime = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Sublime-Text/Dockerfile";
		
		
		Boolean creado = false;

		PrintWriter pw = new PrintWriter(new FileOutputStream(fichero));
		
		String cadenaAyuda = "Gracias por usar Herramienta para la Gestión Automática de Entornos de \n " + 
				"Prácticas en Asignaturas de Análisis de Datos "+
				"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
				"Se habrá generado este archivo junto a una carpeta con el nombre de la Base de datos seleccionada \n"+
				"Dentro de esa carpeta encontrará un archivo de ayuda para instalar un contenedor correspondiente a la Base de Datos \n"+
				"*****************************************************\n"+
				"También se habrá generado una carpeta con el IDE seleccionado \n "+
				"En esa carpeta encontrará un archivo de ayuda para instalar un contenedor correspondiente al IDE de desarrollo\n"+
				"*****************************************************\n"+
				"*****************************************************\n"+
				" \n"+
				"*****************************************************\n";
				
				
		pw.flush();
		pw.println(cadenaAyuda);

		
		String build = request.getParameter("BUILD");
		String push = request.getParameter("PUSH");
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
			
			
			String line = "FROM oraclelinux:7-slim\n"+
						  "ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-8.0.15\n"+
						  "ARG MYSQL_SHELL_PACKAGE=mysql-shell-8.0.15\n"+
						  "ENV MYSQL_ROOT_PASSWORD=root\n"+
						  "RUN yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \\\n"+
						  "		https://repo.mysql.com/mysql-community-release-el7.rpm \\\n"+
						  " 	&& yum-config-manager --enable mysql80-server-minimal \\\n"+
						  "	    && yum install -y \\\n"+
						  " 		$MYSQL_SERVER_PACKAGE \\\n"+
						  " 		$MYSQL_SHELL_PACKAGE \\\n"+
						  " 		libpwquality \\\n"+
						  " 	&& yum clean all \\\n"+
						  " 	&& mkdir /docker-entrypoint-initdb.d\n"+
						  "VOLUME /var/lib/mysql\n"+
						  "COPY docker-entrypoint.sh /entrypoint.sh\n"+
						  "RUN [\"chmod\", \"+x\", \"/entrypoint.sh\"]\n"+
						  "EXPOSE 3306 33060\n"+
						  "CMD [\"mysqld\"]\n";
			
		
			pwMysql.flush();
			pwMysql.println(line);
			
			
			pwMysql.close();
			
			File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/MYSQL/docker-entrypoint.sh");
			File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/docker-entrypoint.sh");
			
			Copy.copyDirectory(source,dest);
			
		
	%>


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
			
			
			String line = "FROM debian:stretch-slim\n"+
						  "RUN set -ex; \\\n"+
						  " 	if ! command -v gpg > /dev/null; then \\\n"+
						  " 		apt-get update; \\\n"+
						  " 		apt-get install -y --no-install-recommends \\\n"+
						  " 			gnupg \\\n"+
						  " 			dirmngr \\\n"+
						  " 		; \\\n"+
						  " 		rm -rf /var/lib/apt/lists/*; \\\n"+
						  " 	fi\n"+
						  "RUN set -eux; \\\n"+
						  " 	groupadd -r postgres --gid=999; \\\n"+
						  " 	useradd -r -g postgres --uid=999 --home-dir=/var/lib/postgresql --shell=/bin/bash postgres; \\\n"+
						  " 	mkdir -p /var/lib/postgresql; \\\n"+
						  " 	chown -R postgres:postgres /var/lib/postgresql\n"+
						  "ENV GOSU_VERSION 1.11\n"+
						  "RUN set -x \\\n"+
						  " 	&& apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \\\n"+
						  " 	&& wget -O /usr/local/bin/gosu \"https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture)\" \\\n"+
						  " 	&& wget -O /usr/local/bin/gosu.asc \"https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$(dpkg --print-architecture).asc\" \\\n"+
						  " 	&& export GNUPGHOME=\"$(mktemp -d)\" \\\n"+
						  " 	&& gpg --batch --keyserver keyserver.ubuntu.com --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \\\n"+
						  " 	&& gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \\\n"+
						  " 	&& { command -v gpgconf > /dev/null && gpgconf --kill all || :; } \\\n"+
						  " 	&& rm -rf \"$GNUPGHOME\" /usr/local/bin/gosu.asc \\\n"+
						  " 	&& chmod +x /usr/local/bin/gosu \\\n"+
						  " 	&& gosu nobody true \\\n"+
						  " 	&& apt-get purge -y --auto-remove ca-certificates wget\n"+
						  "RUN set -eux; \\\n"+
						  " 	if [ -f /etc/dpkg/dpkg.cfg.d/docker ]; then \\\n"+
						  " 		grep -q '/usr/share/locale' /etc/dpkg/dpkg.cfg.d/docker; \\\n"+
						  " 		sed -ri '/\\/usr\\/share\\/locale/d' /etc/dpkg/dpkg.cfg.d/docker; \\\n"+
						  " 		! grep -q '/usr/share/locale' /etc/dpkg/dpkg.cfg.d/docker; \\\n"+
						  " 	fi; \\\n"+
						  " 	apt-get update; apt-get install -y locales; rm -rf /var/lib/apt/lists/*; \\\n"+
						  " 	localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8\n"+
						  "ENV LANG en_US.utf8\n"+
						  "RUN set -eux; \\\n"+
						  " 	apt-get update; \\\n"+
						  " 	apt-get install -y --no-install-recommends libnss-wrapper; \\\n"+
						  " 	rm -rf /var/lib/apt/lists/*\n"+
						  "RUN mkdir /docker-entrypoint-initdb.d\n"+
						  "RUN set -ex; \\\n"+
						  " 	key='B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8'; \\\n"+
						  " 	export GNUPGHOME=\"$(mktemp -d)\"; \\\n"+
						  " 	gpg --batch --keyserver keyserver.ubuntu.com --recv-keys \"$key\"; \\\n"+
						  " 	gpg --batch --export \"$key\" > /etc/apt/trusted.gpg.d/postgres.gpg; \\\n"+
						  " 	command -v gpgconf > /dev/null && gpgconf --kill all; \\\n"+
						  " 	rm -rf \"$GNUPGHOME\"; \\\n"+
						  " 	apt-key list\n"+
						  "ENV PG_MAJOR 10\n"+
						  "ENV PG_VERSION 10.7-1.pgdg90+1\n"+
						  "RUN set -ex; \\\n"+
						  " 	\\\n"+
						  " 	export PYTHONDONTWRITEBYTECODE=1; \\\n"+
						  " 	\\\n"+
						  " 	dpkgArch=\"$(dpkg --print-architecture)\"; \\\n"+
						  " 	case \"$dpkgArch\" in \\\n"+
						  " 		amd64|i386|ppc64el) \\\n"+
						  " 			echo \"deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main $PG_MAJOR\" > /etc/apt/sources.list.d/pgdg.list; \\\n"+
						  " 			apt-get update; \\\n"+
						  " 			;; \\\n"+
						  " 		*) \\\n"+
						  " 			echo \"deb-src http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main $PG_MAJOR\" > /etc/apt/sources.list.d/pgdg.list; \\\n"+
						  " 			\\\n"+
						  " 			case \"$PG_MAJOR\" in \\\n"+
						  " 				9.* | 10 ) ;; \\\n"+
						  " 				*) \\\n"+
						  " 					echo 'deb http://deb.debian.org/debian stretch-backports main' >> /etc/apt/sources.list.d/pgdg.list; \\\n"+
						  " 					;; \\\n"+
						  " 			esac; \\\n"+
						  " 			\\\n"+
						  " 			tempDir=\"$(mktemp -d)\"; \\\n"+
						  " 			cd \"$tempDir\"; \\\n"+
						  " 			\\\n"+
						  " 			savedAptMark=\"$(apt-mark showmanual)\"; \\\n"+
						  " 			\\\n"+
						  " 			apt-get update; \\\n"+
						  " 			apt-get build-dep -y \\\n"+
						  " 				postgresql-common pgdg-keyring \\\n"+
						  " 				\"postgresql-$PG_MAJOR=$PG_VERSION\" \\\n"+
						  " 			; \\\n"+
						  " 			DEB_BUILD_OPTIONS=\"nocheck parallel=$(nproc)\" \\\n"+
						  " 				apt-get source --compile \\\n"+
						  " 					postgresql-common pgdg-keyring \\\n"+
						  " 					\"postgresql-$PG_MAJOR=$PG_VERSION\" \\\n"+
						  " 			; \\\n"+
						  " 			\\\n"+
						  " 			apt-mark showmanual | xargs apt-mark auto > /dev/null; \\\n"+
						  " 			apt-mark manual $savedAptMark; \\\n"+
						  " 			\\\n"+
						  " 			ls -lAFh; \\\n"+
						  " 			dpkg-scanpackages . > Packages; \\\n"+
						  " 			grep '^Package: ' Packages; \\\n"+
						  " 			echo \"deb [ trusted=yes ] file://$tempDir ./\" > /etc/apt/sources.list.d/temp.list; \\\n"+
						  " 			apt-get -o Acquire::GzipIndexes=false update; \\\n"+
						  " 			;; \\\n"+
						  " 		esac; \\\n"+
						  " 		\\\n"+
						  " 		apt-get install -y postgresql-common; \\\n"+
						  " 		sed -ri 's/#(create_main_cluster) .*$/\\1 = false/' /etc/postgresql-common/createcluster.conf; \\\n"+
						  " 		apt-get install -y \\\n"+
						  " 			\"postgresql-$PG_MAJOR=$PG_VERSION\" \\\n"+
						  " 		; \\\n"+
						  " 		\\\n"+
						  " 		rm -rf /var/lib/apt/lists/*; \\\n"+
						  " 		\\\n"+
						  " 		if [ -n \"$tempDir\" ]; then \\\n"+
						  " 			apt-get purge -y --auto-remove; \\\n"+
						  " 			rm -rf \"$tempDir\" /etc/apt/sources.list.d/temp.list; \\\n"+
						  " 		fi; \\\n"+
						  " 		\\\n"+
						  " 		find /usr -name '*.pyc' -type f -exec bash -c 'for pyc; do dpkg -S \"$pyc\" &> /dev/null || rm -vf \"$pyc\"; done' -- '{}' +\n"+
						  "RUN set -eux; \\\n"+
						  " 	dpkg-divert --add --rename --divert \"/usr/share/postgresql/postgresql.conf.sample.dpkg\" \"/usr/share/postgresql/$PG_MAJOR/postgresql.conf.sample\"; \\\n"+
						  " 	cp -v /usr/share/postgresql/postgresql.conf.sample.dpkg /usr/share/postgresql/postgresql.conf.sample; \\\n"+
						  " 	ln -sv ../postgresql.conf.sample \"/usr/share/postgresql/$PG_MAJOR/\"; \\\n"+
						  " 	sed -ri \"s!^#?(listen_addresses)\\s*=\\s*\\S+.*!\\1 = '*'!\" /usr/share/postgresql/postgresql.conf.sample; \\\n"+
						  " 	grep -F \"listen_addresses = '*'\" /usr/share/postgresql/postgresql.conf.sample\n"+
						  "RUN mkdir -p /var/run/postgresql && chown -R postgres:postgres /var/run/postgresql && chmod 2777 /var/run/postgresql\n"+
						  "ENV PATH $PATH:/usr/lib/postgresql/$PG_MAJOR/bin\n"+
						  "ENV PGDATA /var/lib/postgresql/data\n"+
						  "RUN mkdir -p \"$PGDATA\" && chown -R postgres:postgres \"$PGDATA\" && chmod 777 \"$PGDATA\" # this 777 will be replaced by 700 at runtime (allows semi-arbitrary \"--user\" values)\n"+
						  "VOLUME /var/lib/postgresql/data\n"+
						  "COPY docker-entrypoint.sh /usr/local/bin/\n"+
						  "RUN ln -s usr/local/bin/docker-entrypoint.sh / # backwards compat\n"+
						  "ENTRYPOINT [\"docker-entrypoint.sh\"]\n"+
						  "EXPOSE 5432\n"+
						  "CMD [\"postgres\"]\n";
			
			pwPostgre.flush();
			pwPostgre.println(line);
			

			
			pwPostgre.close();
			
			File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/POSTGRE/docker-entrypoint.sh");
			File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/docker-entrypoint.sh");
			
			Copy.copyDirectory(source,dest);
			
			
	%>



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
			String line = "FROM mariadb:latest as builder\n"+
						"RUN [\"sed\","+
			                     " \"-i\","+
								" \"s/exec \\\"$@\\\"/echo \\\"not running $@\\\"/\""+
								", \"/usr/local/bin/docker-entrypoint.sh\"]\n"+
						"ENV MYSQL_ROOT_PASSWORD=root\n"+
						"RUN [\"/usr/local/bin/docker-entrypoint.sh\", \"mysqld\", \"--datadir\", \"/initialized-db\", \"--aria-log-dir-path\", \"/initialized-db\"]\n"+
						"FROM mariadb:latest\n"+
						"COPY --from=builder /initialized-db /var/lib/mysql\n";
			
			pwMariaDB.flush();
			pwMariaDB.println(line);
			
			pwMariaDB.close();
			
			
			
	%>


	<%
		}
		
	%>

	<!-- ++++++++++++++++++++++++++++++++++++DATA FICHERO++++++++++++++++++++++++++++++++++++++++++ -->
	<%
		String data = request.getParameter("DATA");
		if (data.equals("Black Friday")) {
		
			
			if (bbdd.equals("MySql")) {
				PrintWriter pwAyudaMySql = new PrintWriter(new FileOutputStream(ayudaMySql));
				String lineAy = "Para ejecutar el contenedor con la base de datos funcionando"+
						"debemos de realizar una serie de pasos:\n"+
						"++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
						"1- $docker build -t mysql:mysql 'ruta donde se encuentra nuestro Dockerfile generado' \n"+
						"en mi caso sería 1- $docker build -t mysql:mysql /Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/ \n "+
						"*****************************************************\n"+
						"2- $docker run -d --rm --name ContenedorMySql mysql:mysql "+
						"*****************************************************\n"+
						"3- $docker run -it --rm --link ContenedorMySql mysql:mysql mysql -h ContenedorMySql -uroot -proot BlackFriday -e \"select * from BlackFriday;\" \n"+
						"*****************************************************\n";
						
						pwAyudaMySql.flush();
						pwAyudaMySql.println(lineAy);
						
						
						File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/DATASETS/BlackFriday.sql");
						File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/BlackFriday.sql");
						
						Copy.copyDirectory(source,dest);
						
						PrintWriter pwMysql = new PrintWriter(new FileOutputStream(dockerfileMysql, true));
						
						String line = "COPY BlackFriday.sql /docker-entrypoint-initdb.d/\n";
						
				
						pwMysql.flush();
						pwMysql.println(line);
						
						
						pwAyudaMySql.close();
						
						pwMysql.close();
				
						
						
						if(build != null){
						FunctionsDocker.createAnImageOfBBDDMySql();
						}
						
						if(push != null){
							FunctionsDocker.pushToDockerWithPropertiesMySql(
								wizardSession.get("MAIL"), 
								wizardSession.get("PASS"), 
								wizardSession.get("USERNAME"), 
								wizardSession.get("CERTS"),
								wizardSession.get("CONF")
							);
						}
						
					
						
						
			}
			if (bbdd.equals("PostgreSQL")) {
				PrintWriter pwAyudaPostgreSQL = new PrintWriter(new FileOutputStream(ayudaPostgre));
				String lineAy = "Para ejecutar el contenedor con la base de datos funcionando"+
						"debemos de realizar una serie de pasos:\n"+
						"++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
						"1- $docker build -t mariaDB:mariaDB 'ruta donde se encuentra nuestro Dockerfile generado' \n"+
						"en mi caso sería 1- $docker build -t maria:maria /Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/ \n "+
						"*****************************************************\n"+
						"2- $docker run -d --rm --name ContenedorPostgreSQL maria:maria "+
						"*****************************************************\n"+
						"3- $docker run -it --rm --link ContenedorPostgreSQL maria:maria mysql -h ContenedorPostgreSQL -uroot -proot BlackFriday -e \"select * from BlackFriday;\" \n"+
						"*****************************************************\n";
				
				pwAyudaPostgreSQL.flush();
				pwAyudaPostgreSQL.println(lineAy);
				File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/DATASETS/BlackFriday.sql");
				File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/BlackFriday.sql");
				
				Copy.copyDirectory(source,dest);
				
				PrintWriter pwPostgre= new PrintWriter(new FileOutputStream(dockerfilePostgre, true));
				
				String line = "COPY BlackFriday.sql /docker-entrypoint-initdb.d/\n";
				
				pwPostgre.flush();
				pwPostgre.println(line);
				
				pwAyudaPostgreSQL.close();
				
				pwPostgre.close();
				
				
		
					
				if(build != null){
				FunctionsDocker.createAnImageOfBBDDPostgreSql();
				}
				
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesPostgreSql(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				}
			}
			
			if (bbdd.equals("MariaDB")) {
				PrintWriter pwAyudaMariaDB = new PrintWriter(new FileOutputStream(ayudaMariaDB));
				String lineAy = "Para ejecutar el contenedor con la base de datos funcionando"+
				"debemos de realizar una serie de pasos:\n"+
				"++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
				"1- $docker build -t mariaDB:mariaDB 'ruta donde se encuentra nuestro Dockerfile generado' \n"+
				"en mi caso sería 1- $docker build -t maria:maria /Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/ \n "+
				"*****************************************************\n"+
				"2- $docker run -d --rm --name ContenedorMariaDB maria:maria "+
				"*****************************************************\n"+
				"3- $docker run -it --rm --link ContenedorMariaDB maria:maria mysql -h ContenedorMariaDB -uroot -proot BlackFriday -e \"select * from BlackFriday;\" \n"+
				"*****************************************************\n";
				
				pwAyudaMariaDB.flush();
				pwAyudaMariaDB.println(lineAy);
				
				
				File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/DATASETS/BlackFriday.sql");
				File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/BlackFriday.sql");
				
				Copy.copyDirectory(source,dest);
				
				PrintWriter pwMariaDB = new PrintWriter(new FileOutputStream(dockerfileMariaDB, true));
				
				String line = "COPY BlackFriday.sql /docker-entrypoint-initdb.d/\n";
				
		
				pwMariaDB.flush();
				pwMariaDB.println(line);
				
				
				pwAyudaMariaDB.close();
				
				pwMariaDB.close();
				
				
				if(build != null){
				FunctionsDocker.createAnImageOfBBDDMariaDB();
				}
				
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesMariaDB(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				}
			}
			
	%>


	<%
		} else if (data.equals("Students Performance")) {
			
			if (bbdd.equals("MySql")) {
				PrintWriter pwAyudaMySql = new PrintWriter(new FileOutputStream(ayudaMySql));
				String lineAy = "Para ejecutar el contenedor con la base de datos funcionando"+
						"debemos de realizar una serie de pasos:\n"+
						"++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
						"1- $docker build -t mysql:mysql 'ruta donde se encuentra nuestro Dockerfile generado' \n"+
						"en mi caso sería 1- $docker build -t mysql:mysql /Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/ \n "+
						"*****************************************************\n"+
						"2- $docker run -d --rm --name ContenedorMySql mysql:mysql "+
						"*****************************************************\n"+
						"3- $docker run -it --rm --link ContenedorMySql mysql:mysql mysql -h ContenedorMySql -uroot -proot StudentsPerformance -e \"select * from StudentsPerformance;\" \n"+
						"*****************************************************\n";
						
						pwAyudaMySql.flush();
						pwAyudaMySql.println(lineAy);
						
						
						File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/DATASETS/StudentsPerformance.sql");
						File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/StudentsPerformance.sql");
						
						Copy.copyDirectory(source,dest);
						
						PrintWriter pwMysql = new PrintWriter(new FileOutputStream(dockerfileMysql, true));
						
						String line = "COPY StudentsPerformance.sql /docker-entrypoint-initdb.d/\n";
						
				
						pwMysql.flush();
						pwMysql.println(line);
						
						
						pwAyudaMySql.close();
						
						pwMysql.close();
						
						if(build != null){
						FunctionsDocker.createAnImageOfBBDDMySql();
						}
						
						if(push != null){
							FunctionsDocker.pushToDockerWithPropertiesMySql(
								wizardSession.get("MAIL"), 
								wizardSession.get("PASS"), 
								wizardSession.get("USERNAME"), 
								wizardSession.get("CERTS"),
								wizardSession.get("CONF")
							);
						}
			
			}
			if (bbdd.equals("PostgreSQL")) {
				PrintWriter pwAyudaPostgreSQL = new PrintWriter(new FileOutputStream(ayudaPostgre));
				String lineAy = "Para ejecutar el contenedor con la base de datos funcionando"+
						"debemos de realizar una serie de pasos:\n"+
						"++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
						"1- $docker build -t mariaDB:mariaDB 'ruta donde se encuentra nuestro Dockerfile generado' \n"+
						"en mi caso sería 1- $docker build -t maria:maria /Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/ \n "+
						"*****************************************************\n"+
						"2- $docker run -d --rm --name ContenedorPostgreSQL maria:maria "+
						"*****************************************************\n"+
						"3- $docker run -it --rm --link ContenedorPostgreSQL maria:maria mysql -h ContenedorPostgreSQL -uroot -proot StudentsPerformance -e \"select * from StudentsPerformance;\" \n"+
						"*****************************************************\n";
				
				pwAyudaPostgreSQL.flush();
				pwAyudaPostgreSQL.println(lineAy);
				File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/DATASETS/StudentsPerformance.sql");
				File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/StudentsPerformance.sql");
				
				Copy.copyDirectory(source,dest);
				
				PrintWriter pwPostgre = new PrintWriter(new FileOutputStream(dockerfilePostgre, true));
				
				String line = "COPY StudentsPerformance.sql /docker-entrypoint-initdb.d/\n";
				
				pwPostgre.flush();
				pwPostgre.println(line);
				
				pwAyudaPostgreSQL.close();
				
				pwPostgre.close();
				
				if(build != null){
				FunctionsDocker.createAnImageOfBBDDPostgreSql();
				}
				//FunctionsDocker.pushToDockerWithPropertiesPostgreSql(mail, pass, user, certs, conf);
			
			}
			if (bbdd.equals("MariaDB")) {
				PrintWriter pwAyudaMariaDB = new PrintWriter(new FileOutputStream(ayudaMariaDB));
				
				String lineAy = "Para ejecutar el contenedor con la base de datos funcionando"+
				"debemos de realizar una serie de pasos:\n"+
				"++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
				"1- $docker build -t maria:maria 'ruta donde se encuentra nuestro Dockerfile generado' \n"+
				"en mi caso sería 1- $docker build -t maria:maria /Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/ \n "+
				"*****************************************************\n"+
				"2- $docker run -d --rm --name ContenedorMariaDB maria:maria "+
				"*****************************************************\n"+
				"3- $docker run -it --rm --link ContenedorMariaDB maria:maria mysql -h ContenedorMariaDB -uroot -proot StudentsPerformance -e \"select * from StudentsPerformance;\" \n"+
				"*****************************************************\n";
				
				pwAyudaMariaDB.flush();
				pwAyudaMariaDB.println(lineAy);
				
				
				File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/DATASETS/StudentsPerformance.sql");
				File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/StudentsPerformance.sql");
				
				Copy.copyDirectory(source,dest);
				
				
				PrintWriter pwMariaDB = new PrintWriter(new FileOutputStream(dockerfileMariaDB, true));
				String line = "COPY StudentsPerformance.sql /docker-entrypoint-initdb.d/\n";
			
				pwMariaDB.flush();
				pwMariaDB.println(line);
				
				
				pwAyudaMariaDB.close();
				
				pwMariaDB.close();
				
				
				if(build != null){
					FunctionsDocker.createAnImageOfBBDDMariaDB();
					}
					
					if(push != null){
						FunctionsDocker.pushToDockerWithPropertiesMariaDB(
							wizardSession.get("MAIL"), 
							wizardSession.get("PASS"), 
							wizardSession.get("USERNAME"), 
							wizardSession.get("CERTS"),
							wizardSession.get("CONF")
						);
					}
			}
	%>
	
	<%
		} else if (data.equals("Google Play")) {

			
			if (bbdd.equals("MySql")) {
				PrintWriter pwAyudaMySql = new PrintWriter(new FileOutputStream(ayudaMySql));
				String lineAy = "Para ejecutar el contenedor con la base de datos funcionando"+
						"debemos de realizar una serie de pasos:\n"+
						"++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
						"1- $docker build -t mysql:mysql 'ruta donde se encuentra nuestro Dockerfile generado' \n"+
						"en mi caso sería 1- $docker build -t mysql:mysql /Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/ \n "+
						"*****************************************************\n"+
						"2- $docker run -d --rm --name ContenedorMySql mysql:mysql "+
						"*****************************************************\n"+
						"3- $docker run -it --rm --link ContenedorMySql mysql:mysql mysql -h ContenedorMySql -uroot -proot GooglePlay -e \"select * from GooglePlay;\" \n"+
						"*****************************************************\n";
						
						pwAyudaMySql.flush();
						pwAyudaMySql.println(lineAy);
						
						
						File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/DATASETS/GooglePlay.sql");
						File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/GooglePlay.sql");
						
						Copy.copyDirectory(source,dest);
						
						PrintWriter pwMysql = new PrintWriter(new FileOutputStream(dockerfileMysql, true));
						
						String line = "COPY GooglePlay.sql /docker-entrypoint-initdb.d/";
						
				
						pwMysql.flush();
						pwMysql.println(line);
						
						
						pwAyudaMySql.close();
						
						pwMysql.close();
						
						if(build != null){
						FunctionsDocker.createAnImageOfBBDDMySql();
						}
						
						if(push != null){
							FunctionsDocker.pushToDockerWithPropertiesMySql(
								wizardSession.get("MAIL"), 
								wizardSession.get("PASS"), 
								wizardSession.get("USERNAME"), 
								wizardSession.get("CERTS"),
								wizardSession.get("CONF")
							);
						}
			
			}
			if (bbdd.equals("PostgreSQL")) {
				PrintWriter pwAyudaPostgreSQL = new PrintWriter(new FileOutputStream(ayudaPostgre));
				String lineAy = "Para ejecutar el contenedor con la base de datos funcionando"+
						"debemos de realizar una serie de pasos:\n"+
						"++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
						"1- $docker build -t mariaDB:mariaDB 'ruta donde se encuentra nuestro Dockerfile generado' \n"+
						"en mi caso sería 1- $docker build -t maria:maria /Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/ \n "+
						"*****************************************************\n"+
						"2- $docker run -d --rm --name ContenedorPostgreSQL maria:maria "+
						"*****************************************************\n"+
						"3- $docker run -it --rm --link ContenedorPostgreSQL maria:maria mysql -h ContenedorPostgreSQL -uroot -proot GooglePlay -e \"select * from GooglePlay;\" \n"+
						"*****************************************************\n";
				
				pwAyudaPostgreSQL.flush();
				pwAyudaPostgreSQL.println(lineAy);
				File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/DATASETS/GooglePlay.sql");
				File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/GooglePlay.sql");
				
				Copy.copyDirectory(source,dest);
				
				PrintWriter pwPostgre= new PrintWriter(new FileOutputStream(dockerfilePostgre, true));
				
				String line = "COPY GooglePlay.sql /docker-entrypoint-initdb.d/";
				
				pwPostgre.flush();
				pwPostgre.println(line);
				
				pwAyudaPostgreSQL.close();
				
				pwPostgre.close();
				
				if(build != null){
				FunctionsDocker.createAnImageOfBBDDPostgreSql();
				}
			//	FunctionsDocker.pushToDockerWithPropertiesPostgreSql(mail, pass, user, certs, conf);
			
			}
			if (bbdd.equals("MariaDB")) {
				PrintWriter pwAyudaMariaDB = new PrintWriter(new FileOutputStream(ayudaMariaDB));
				
				String lineAy = "Para ejecutar el contenedor con la base de datos funcionando"+
				"debemos de realizar una serie de pasos:\n"+
				"++++++++++++++++++++++++++++++++++++++++++++++++++++\n"+
				"1- $docker build -t maria:maria 'ruta donde se encuentra nuestro Dockerfile generado' \n"+
				"en mi caso sería 1- $docker build -t maria:maria /Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/ \n "+
				"*****************************************************\n"+
				"2- $docker run -d --rm --name ContenedorMariaDB maria:maria "+
				"*****************************************************\n"+
				"3- $docker run -it --rm --link ContenedorMariaDB maria:maria mysql -h ContenedorMariaDB -uroot -proot GooglePlay -e \"select * from GooglePlay;\" \n"+
				"*****************************************************\n";
				
				pwAyudaMariaDB.flush();
				pwAyudaMariaDB.println(lineAy);
				
				
				File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/DATASETS/GooglePlay.sql");
				File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/GooglePlay.sql");
				
				Copy.copyDirectory(source,dest);
				
				PrintWriter pwMariaDB = new PrintWriter(new FileOutputStream(dockerfileMariaDB, true));
				
				String line = "COPY GooglePlay.sql /docker-entrypoint-initdb.d/";
				
				
				
				pwMariaDB.flush();
				pwMariaDB.println(line);
				
				
				pwAyudaMariaDB.close();
				
				pwMariaDB.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfBBDDMariaDB();
					}
					
					if(push != null){
						FunctionsDocker.pushToDockerWithPropertiesMariaDB(
							wizardSession.get("MAIL"), 
							wizardSession.get("PASS"), 
							wizardSession.get("USERNAME"), 
							wizardSession.get("CERTS"),
							wizardSession.get("CONF")
						);
					}
					
			}
			
	%>

	<%
		}
	%>
	<!-- ++++++++++++++++++++++++++++++++++++IDE FICHERO++++++++++++++++++++++++++++++++++++++++++ -->

<%
		String ide = request.getParameter("IDE");
		if (ide.equals("NetBeans")) {

			
			File ruta = new File(netBeansFichero);
			if (ruta.mkdir()){
				creado=true;
			}
			else{
				creado=false;
			}
			
			
			PrintWriter pwNetBeans = new PrintWriter(new FileOutputStream(dockerfileNetBeans));
			
			String line = "FROM debian:buster-slim\n"+
						  "RUN apt-get update && apt-get install -y \\\n"+
						  "		curl libxext-dev libxrender-dev libxtst-dev unzip wget \\\n"+
						  "		&& apt-get clean \\\n"+
						  "		&& rm -rf /var/lib/apt/lists/* \\\n"+
						  "		&& rm -rf /tmp/*\n"+
						  "ENV NETBEANS_URL=http://download.oracle.com/otn-pub/java/jdk-nb/8u71-8.1/jdk-8u71-nb-8_1-linux-x64.sh\n"+
						  "ENV POLICY_URL=http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip\n"+
						  "ENV COOKIE=\"Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie\"\n"+
						  "RUN wget --progress=bar:force $NETBEANS_URL -O /tmp/netbeans.sh \\\n"+
						  		"--no-cookies --no-check-certificate --header \"$COOKIE\" \\\n"+
						  "		&& echo \"Installing NetBeans $NETBEANS_VERSION...\" \\\n"+
						  "		&& chmod +x /tmp/netbeans.sh; sleep 1 \\\n"+
						  "		&& /tmp/netbeans.sh --silent \\\n"+
						  "		&& rm -rf /tmp/* \\\n"+
						  "		&& ln -s $(ls -d /usr/local/netbeans-*) /usr/local/netbeans\n"+
						  "RUN echo 'Add archivo de usuario'\n"+
						  "RUN apt-get update && apt-get -y install \\\n"+
						  "		zip \\\n"+
						  " 	unzip\n"+
						  "ADD '*.zip' /tmp/archivosUsuario.zip\n"+
						  "RUN echo 'Descomprimiendo archivos...'\n"+
						  "RUN unzip /tmp/archivosUsuario.zip -d /archivos\n"+
						  "RUN echo 'Correcto!!'\n"+
						  "RUN curl -L $POLICY_URL -o /tmp/policy.zip \\\n"+
						  "		--cookie 'oraclelicense=accept-securebackup-cookie;' \\\n"+
						  "		&& JAVA_HOME=$(ls -d /usr/local/jdk1.*) \\\n"+
						  "		&& unzip -j -o /tmp/policy.zip -d $JAVA_HOME/jre/lib/security \\\n"+
						  "		&& rm /tmp/policy.zip\n"+
						  "CMD /usr/local/netbeans/bin/netbeans\n";
			
			
			pwNetBeans.flush();
			pwNetBeans.println(line);
			
			pwNetBeans.close(); 
	
			
			File source2 = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/");
			
			File dest2 = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/netBeans/");		
					
				CopyFilesWithExtension.copyFileUsingExt(source2.toString(), dest2.toString());
		
	%>

	<%
		} else if (ide.equals("Eclipse")) {

			File ruta = new File(eclipseFichero);
			if (ruta.mkdir()){
				creado=true;
			}
			else{
				creado=false;
			}
			PrintWriter pwEclipse = new PrintWriter(new FileOutputStream(dockerfileEclipse));
			String line = "FROM java\n"+
						  "RUN echo \"deb [check-valid-until=no] http://cdn-fastly.deb.debian.org/debian jessie main\" > /etc/apt/sources.list.d/jessie.list\n"+
						  "RUN echo \"deb [check-valid-until=no] http://archive.debian.org/debian jessie-backports main\" > /etc/apt/sources.list.d/jessie-backports.list\n"+
						  "RUN sed -i '/deb http:\\/\\/deb.debian.org\\/debian jessie-updates main/d' /etc/apt/sources.list\n"+
						  "RUN apt-get -o Acquire::Check-Valid-Until=false update\n"+
						  "ARG ECLIPSE_URL='eclipse.mirror.rafal.ca/technology/epp/downloads/release/photon/R/eclipse-jee-photon-R-linux-gtk-x86_64.tar.gz'\n"+
						  "RUN mkdir -p /opt && curl $ECLIPSE_URL | tar -xvz -C /opt\n"+
						  "RUN echo 'Add archivo de usuario'\n"+
						  "RUN apt-get -y install \\\n"+
						  "		zip \\\n"+
						  " 	unzip\n"+
						  "ADD '*.zip' /tmp/archivosUsuario.zip\n"+
						  "RUN echo 'Descomprimiendo archivos...'\n"+
						  "RUN unzip /tmp/archivosUsuario.zip -d /archivos\n"+
						  "RUN echo 'Correcto!!'\n"+
						  "CMD [\"/opt/eclipse/eclipse\"]\n";
			
			pwEclipse.flush();
			pwEclipse.println(line);

			
			pwEclipse.close();
			
			File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/");
			
			File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Eclipse/");		
					
				CopyFilesWithExtension.copyFileUsingExt(source.toString(), dest.toString());
			
			
	%>


	<% 
		} else if (ide.equals("IntelliJ IDEA")) {

			File ruta = new File(intellijFichero);
			if (ruta.mkdir()){
				creado=true;
			}
			else{
				creado=false;
			}
			File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/INTELLIJ/run");
			File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/IntellijIDEA/run");
			
			Copy.copyDirectory(source,dest);
			
			File source2 = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/INTELLIJ/jdk.table.xml");
			File dest2 = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/IntellijIDEA/jdk.table.xml");
			
			Copy.copyDirectory(source2,dest2);
			
			PrintWriter pwIntelij = new PrintWriter(new FileOutputStream(dockerfileIntellij));
			String line = "FROM ubuntu:16.04\n"+
						  "ENV LANG C.UTF-8\n"+
						  "ENV DEBIAN_FRONTEND noninteractive\n"+
						  "ENV DEBCONF_NONINTERACTIVE_SEEN true\n"+
						  "RUN sed 's/main$/main universe/' -i /etc/apt/sources.list && \\\n"+
						  " 	apt-get update -qq && \\\n"+
						  " 	echo 'Installing OS dependencies' && \\\n"+
						  " 	apt-get install -qq -y --fix-missing sudo software-properties-common git libxext-dev libxrender-dev libxslt1.1 \\\n"+
						  " 		libxtst-dev libgtk2.0-0 libcanberra-gtk-module unzip wget && \\\n"+
						  " 	echo 'Cleaning up' && \\\n"+
						  " 	apt-get clean -qq -y && \\\n"+
						  " 	apt-get autoclean -qq -y && \\\n"+
						  " 	apt-get autoremove -qq -y &&  \\\n"+
						  " 	rm -rf /var/lib/apt/lists/* && \\\n"+
						  " 	rm -rf /tmp/*\n"+
						  "#RUN echo 'Creating user: developer' && \\\n"+
						  "# 	mkdir -p /home/developer && \\\n"+
						  "# 	echo \"developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash\" >> /etc/passwd && \\\n"+
						  "# 	echo \"developer:x:1000:\" >> /etc/group && \\\n"+
						  "# 	sudo echo \"developer ALL=(ALL) NOPASSWD: ALL\" > /etc/sudoers.d/developer && \\\n"+
						  "# 	sudo chmod 0440 /etc/sudoers.d/developer && \\\n"+
						  "# 	sudo chown developer:developer -R /home/developer && \\\n"+
						  "# 	sudo chown root:root /usr/bin/sudo && \\\n"+
						  "#	chmod 4755 /usr/bin/sudo\n"+
						  "RUN mkdir -p /home/.IdeaIC2016.2/config/options && \\\n"+
						  " 	mkdir -p /home/.IdeaIC2016.2/config/plugins\n"+
						  "ADD ./jdk.table.xml /home/.IdeaIC2016.2/config/options/jdk.table.xml\n"+
						  "ADD ./jdk.table.xml /home/.jdk.table.xml\n"+
						  "ADD ./run /usr/local/bin/intellij\n"+
						  "RUN chmod 777 /usr/local/bin/intellij\n"+
						  " 	#chown developer:developer -R /home/developer/.IdeaIC2016.2\n"+
						  "RUN echo 'Downloading IntelliJ IDEA' && \\\n"+
						  " 	wget https://download.jetbrains.com/idea/ideaIU-2016.2.5.tar.gz -O /tmp/intellij.tar.gz -q && \\\n"+
						  " 	echo 'Installing IntelliJ IDEA' && \\\n"+
						  " 	mkdir -p /opt/intellij && \\\n"+
						  " 	tar -xf /tmp/intellij.tar.gz --strip-components=1 -C /opt/intellij && \\\n"+
						  " 	rm /tmp/intellij.tar.gz\n"+
						  "RUN echo 'Downloading Go 1.6.3' && \\\n"+
						  " 	wget https://storage.googleapis.com/golang/go1.6.3.linux-amd64.tar.gz -O /tmp/go.tar.gz -q && \\\n"+
						  " 	echo 'Installing Go 1.6.3' && \\\n"+
						  " 	sudo tar -zxf /tmp/go.tar.gz -C /usr/local/ && \\\n"+
						  " 	rm -f /tmp/go.tar.gz\n"+
						  "RUN echo 'Installing Go plugin' && \\\n"+
						  " 	wget https://plugins.jetbrains.com/files/5047/27278/Go-0.12.1724.zip -O /home/.IdeaIC2016.2/config/plugins/go.zip -q && \\\n"+
						  " 	cd /home/.IdeaIC2016.2/config/plugins/ && \\\n"+
						  " 	unzip -q go.zip && \\\n"+
						  " 	rm go.zip\n"+
						  "RUN echo 'Add archivo de usuario'\n"+
						  "RUN apt-get update && apt-get -y install \\\n"+
						  "		zip \\\n"+
						  " 	unzip\n"+
						  "ADD '*.zip' /tmp/archivosUsuario.zip\n"+
						  "RUN echo 'Descomprimiendo archivos...'\n"+
						  "RUN unzip /tmp/archivosUsuario.zip -d /archivos\n"+
						  "RUN echo 'Correcto!!'\n"+
						  "RUN echo 'Installing Markdown plugin' && \\\n"+
						  " 	wget https://plugins.jetbrains.com/files/7793/25156/markdown-2016.1.20160405.zip -O markdown.zip -q && \\\n"+
						  " 	unzip -q markdown.zip && \\\n"+
						  " 	rm markdown.zip\n"+
						  "#RUN sudo chown developer:developer -R /home/developer\n"+
						  "#USER developer\n"+
						  "ENV HOME /home/\n"+
						  "ENV GOPATH /home/go\n"+
						  "#ENV PATH $PATH:/home/developer/go/bin:/usr/local/go/bin\n"+
						  "#WORKDIR /home/developer/go\n"+
						  "CMD /usr/local/bin/intellij\n";

			
			pwIntelij.flush();
			pwIntelij.println(line);
			
			pwIntelij.close();
			
			File source3 = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/");
			
			File dest3 = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/IntellijIDEA/");		
					
				CopyFilesWithExtension.copyFileUsingExt(source3.toString(), dest3.toString());
				
	%>


	<%
	
	} else if (ide.equals("SublimeText3")) {
			
			File ruta = new File(sublimeFichero);
			if (ruta.mkdir()){
				creado=true;
			}
			else{
				creado=false;
			}
			
			File source = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/CONFIG/SUBLIME-TEXT/run.sh");
			File dest = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Sublime-Text/run.sh");
			
			Copy.copyDirectory(source,dest);
			
			PrintWriter pwSublime = new PrintWriter(new FileOutputStream(dockerfileSublime));
			
			String line = "FROM debian:buster-slim\n"+
						  "RUN apt-get update && apt-get -y install \\\n"+
						  "	    apt-transport-https \\\n"+
						  " 	ca-certificates \\\n"+
						  " 	curl \\\n"+
						  " 	gnupg \\\n"+
						  " 	locales \\\n"+
						  " 	--no-install-recommends \\\n"+
						  " 	&& rm -rf /var/lib/apt/lists/*\n"+
						  "RUN echo \"en_US.UTF-8 UTF-8\" > /etc/locale.gen && \\\n"+
						  "  	locale-gen && \\\n"+
						  " 	echo \"LANG=en_US.UTF-8\" > /etc/locale.conf\n"+
						  "RUN curl -sSL https://download.sublimetext.com/sublimehq-pub.gpg | apt-key add -\n"+
						  "RUN echo \"deb https://download.sublimetext.com/ apt/stable/\" > /etc/apt/sources.list.d/sublime-text.list\n"+
						  "RUN apt-get update && apt-get -y install \\\n"+
						  " 	libcanberra-gtk-module \\\n"+
						  " 	sublime-text \\\n"+
						  " 	--no-install-recommends \\\n"+
						  " 	&& rm -rf /var/lib/apt/lists/*\n"+
						  "RUN echo 'Add archivo de usuario'\n"+
						  "RUN apt-get update && apt-get -y install \\\n"+
						  "		zip \\\n"+
						  " 	unzip\n"+
						  "ADD '*.zip' /tmp/archivosUsuario.zip\n"+
						  "RUN echo 'Descomprimiendo archivos...'\n"+
						  "RUN unzip /tmp/archivosUsuario.zip -d /archivos\n"+
						  "RUN echo 'Correcto!!'\n"+
						  "COPY run.sh /run.sh\n"+
						  "RUN chmod +x /run.sh\n"+
						  "CMD [\"/run.sh\"]\n";
			
			
			pwSublime.flush();
			pwSublime.println(line);
			
			pwSublime.close(); 
			
			
			
			File source2 = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/");
			
			File dest2 = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Sublime-Text/");		
					
			CopyFilesWithExtension.copyFileUsingExt(source2.toString(), dest2.toString());
				
			
		
	%>


	<%
		}
	%>


	

	<!-- ++++++++++++++++++++++++++++++++++++LIBRARY FICHERO++++++++++++++++++++++++++++++++++++++++++ -->
	<%
	String scipy = request.getParameter("SciPy");
	String scikitlearn = request.getParameter("Scikit-learn");
	String TensorFlow = request.getParameter("TensorFlow");
	String Keras = request.getParameter("Keras");
	
	
	String library = request.getParameter("LIBRARY");
	
	
	
	
			 if(library.contentEquals("SciPy")){
					if(ide.equals("Eclipse")){
				PrintWriter pwEclipse = new PrintWriter(new FileOutputStream(dockerfileEclipse,true));
				
				String line = "RUN apt-get -y install \\\n"+
						   "	python-numpy \\\n"+
						   "	python-scipy \\\n"+
						   "	python-matplotlib \\\n"+
						   "	ipython \\\n"+
						   "	python-pandas \\\n"+
						   "	python-sympy \\\n"+
						   "	python-nose\n";
				
				pwEclipse.flush();
				pwEclipse.println(line);

				
				pwEclipse.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEeclipse();
					}
				
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesEclipse(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				}
				
				
			}
			if(ide.equals("IntelliJ IDEA"))
			{
				PrintWriter pwIntelij = new PrintWriter(new FileOutputStream(dockerfileIntellij,true));
				
				String line = "RUN apt-get update && apt-get -y install \\\n"+
						   "	python-numpy \\\n"+
						   "	python-scipy \\\n"+
						   "	python-matplotlib \\\n"+
						   "	ipython \\\n"+
						   "	python-pandas \\\n"+
						   "	python-sympy \\\n"+
						   "	python-nose\n";
				
				pwIntelij.flush();
				pwIntelij.println(line);

				
				pwIntelij.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEintellij();
					}
					if(push != null){
						FunctionsDocker.pushToDockerWithPropertiesIntellij(
							wizardSession.get("MAIL"), 
							wizardSession.get("PASS"), 
							wizardSession.get("USERNAME"), 
							wizardSession.get("CERTS"),
							wizardSession.get("CONF")
						);
					}
				
				
			}
			if(ide.equals("SublimeText3"))
			{
				PrintWriter pwSublime = new PrintWriter(new FileOutputStream(dockerfileSublime,true));
				
			
				String line = "RUN apt-get update && apt-get -y install \\\n"+
							   "	python-numpy \\\n"+
							   "	python-scipy \\\n"+
							   "	python-matplotlib \\\n"+
							   "	ipython \\\n"+
							   "	python-pandas \\\n"+
							   "	python-sympy \\\n"+
							   "	python-nose\n";
				
				
				pwSublime.flush();
				pwSublime.println(line);

				pwSublime.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEsublime();
					}
					if(push != null){
						FunctionsDocker.pushToDockerWithPropertiesSublime(
							wizardSession.get("MAIL"), 
							wizardSession.get("PASS"), 
							wizardSession.get("USERNAME"), 
							wizardSession.get("CERTS"),
							wizardSession.get("CONF")
						);
					}
				
			}
			
			if(ide.equals("NetBeans"))
			{
				PrintWriter pwNetBeans = new PrintWriter(new FileOutputStream(dockerfileNetBeans,true));
				
				String line = "RUN apt-get -y install \\\n"+
						   "	python-numpy \\\n"+
						   "	python-scipy \\\n"+
						   "	python-matplotlib \\\n"+
						   "	ipython \\\n"+
						   "	python-pandas \\\n"+
						   "	python-sympy \\\n"+
						   "	python-nose\n";
				
				pwNetBeans.flush();
				pwNetBeans.println(line);
				
				pwNetBeans.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEsublime();
					}
					if(push != null){
						FunctionsDocker.pushToDockerWithPropertiesSublime(
							wizardSession.get("MAIL"), 
							wizardSession.get("PASS"), 
							wizardSession.get("USERNAME"), 
							wizardSession.get("CERTS"),
							wizardSession.get("CONF")
						);
					}
			}
			
			
			}
		
		

			 if(library.contentEquals("Scikit-learn")){
					if(ide.equals("Eclipse")){
				PrintWriter pwEclipse = new PrintWriter(new FileOutputStream(dockerfileEclipse,true));
				
				
				String line = "RUN apt-get -y install \\\n"+
						  	  "		python-sklearn\n";
				
				pwEclipse.flush();
				pwEclipse.println(line);

				
				pwEclipse.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEeclipse();
					}
				
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesEclipse(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				}
			}
			if(ide.equals("IntelliJ IDEA"))
			{
				PrintWriter pwIntelij = new PrintWriter(new FileOutputStream(dockerfileIntellij,true));
				
				String line = "RUN apt-get -y install \\\n"+
					  	  "		python-sklearn\n";
				
				
				pwIntelij.flush();
				pwIntelij.println(line);
				
				
				pwIntelij.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEintellij();
					}
				
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesIntellij(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				}
			}
			
			if( ide.equals("SublimeText3"))
			{
				PrintWriter pwSublime = new PrintWriter(new FileOutputStream(dockerfileSublime,true));
				
				String line = "RUN apt-get -y install \\\n"+
					  	  "		python-sklearn\n";
				
				pwSublime.flush();
				pwSublime.println(line);

				
				pwSublime.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEsublime();
					}
					if(push != null){
						FunctionsDocker.pushToDockerWithPropertiesSublime(
							wizardSession.get("MAIL"), 
							wizardSession.get("PASS"), 
							wizardSession.get("USERNAME"), 
							wizardSession.get("CERTS"),
							wizardSession.get("CONF")
						);
					}
					
			}
			
			if(ide.equals("NetBeans"))
			{
				PrintWriter pwNetBeans = new PrintWriter(new FileOutputStream(dockerfileNetBeans,true));
				
				String line = "RUN apt-get -y install \\\n"+
					  	  "		python-sklearn\n";
				
				pwNetBeans.flush();
				pwNetBeans.println(line);

				
				pwNetBeans.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEnetBeans();
					}
					if(push != null){
						FunctionsDocker.pushToDockerWithPropertiesNetBeans(
							wizardSession.get("MAIL"), 
							wizardSession.get("PASS"), 
							wizardSession.get("USERNAME"), 
							wizardSession.get("CERTS"),
							wizardSession.get("CONF")
						);
					}
			}
			
	 }
	
		
	 if(library.contentEquals("TensorFlow")){
			if(ide.equals("Eclipse"))
			{
				PrintWriter pwEclipse = new PrintWriter(new FileOutputStream(dockerfileEclipse,true));
				
				String line = "RUN apt-get -y install \\\n"+
				  	  		  "		python3-dev python3-pip\n"+
				  	  		  "RUN	pip3 install -U tensorflow\n";
				
				
				pwEclipse.flush();
				pwEclipse.println(line);

				
				pwEclipse.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEeclipse();
					}
				
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesEclipse(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				}
			}
			if(ide.equals("IntelliJ IDEA"))
			{
				PrintWriter pwIntelij = new PrintWriter(new FileOutputStream(dockerfileIntellij,true));
				
				String line = "RUN apt-get -y install \\\n"+
			  	  		  "		python3-dev python3-pip\n"+
			  	  		  "RUN	pip3 install -U tensorflow\n";
				
				pwIntelij.flush();
				pwIntelij.println(line);

				
				pwIntelij.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEintellij();
					}
				
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesIntellij(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				}
			}
			if(ide.equals("SublimeText3"))
			{
				PrintWriter pwSublime = new PrintWriter(new FileOutputStream(dockerfileSublime,true));
				
				String line = "RUN apt-get -y install \\\n"+
					  	  	  "		python3-dev python3-pip\n"+
					  	  	  "RUN	pip3 install -U tensorflow\n";
				
				
				pwSublime.flush();
				pwSublime.println(line);

				
				pwSublime.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEsublime();
					}
					if(push != null){
						FunctionsDocker.pushToDockerWithPropertiesSublime(
							wizardSession.get("MAIL"), 
							wizardSession.get("PASS"), 
							wizardSession.get("USERNAME"), 
							wizardSession.get("CERTS"),
							wizardSession.get("CONF")
						);
					}
			}
			
			if(ide.equals("NetBeans"))
			{
				PrintWriter pwNetBeans = new PrintWriter(new FileOutputStream(dockerfileNetBeans,true));
				
				String line = "RUN apt-get -y install \\\n"+
			  	  		 	  "		python3-dev python3-pip\n"+
			  	  		  	  "RUN	pip3 install -U tensorflow\n";
				
				pwNetBeans.flush();
				pwNetBeans.println(line);

				
				pwNetBeans.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEsublime();
					}
					if(push != null){
						FunctionsDocker.pushToDockerWithPropertiesSublime(
							wizardSession.get("MAIL"), 
							wizardSession.get("PASS"), 
							wizardSession.get("USERNAME"), 
							wizardSession.get("CERTS"),
							wizardSession.get("CONF")
						);
					}
					
			}
			
		}
		
	 if(library.contentEquals("Keras")){
			if(ide.equals("Eclipse"))
			{
				PrintWriter pwEclipse = new PrintWriter(new FileOutputStream(dockerfileEclipse,true));
				
				String line = "RUN apt-get -y install \\\n"+
			  	  		  "		python3-dev python3-pip\n"+
			  	  		  "RUN	pip3 install -U keras\n";
			
			
			pwEclipse.flush();
			pwEclipse.println(line);

			
			pwEclipse.close();
			
			if(build != null){
				FunctionsDocker.createAnImageOfIDEeclipse();
				}
			
			if(push != null){
				FunctionsDocker.pushToDockerWithPropertiesEclipse(
					wizardSession.get("MAIL"), 
					wizardSession.get("PASS"), 
					wizardSession.get("USERNAME"), 
					wizardSession.get("CERTS"),
					wizardSession.get("CONF")
				);
			}
			
			}
			if(ide.equals("IntelliJ IDEA"))
			{
				PrintWriter pwIntelij = new PrintWriter(new FileOutputStream(dockerfileIntellij,true));
				
				String line = "RUN apt-get -y install \\\n"+
			  	  		  "		python3-dev python3-pip\n"+
			  	  		  "RUN	pip3 install -U keras\n";
				
				pwIntelij.flush();
				pwIntelij.println(line);

				
				pwIntelij.close();
				
				if(build != null){
					FunctionsDocker.createAnImageOfIDEintellij();
					}
				
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesIntellij(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				}
				
			}
			if(ide.equals("SublimeText3"))
			{
				PrintWriter pwSublime = new PrintWriter(new FileOutputStream(dockerfileSublime,true));
				
				String line = "RUN apt-get -y install \\\n"+
				  	  	  "		python3-dev python3-pip\n"+
				  	  	  "RUN	pip3 install -U keras\n";
			
			
			pwSublime.flush();
			pwSublime.println(line);

			
			pwSublime.close();
			
			if(build != null){
				FunctionsDocker.createAnImageOfIDEsublime();
				}
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesSublime(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				}
			}
			
			if(ide.equals("NetBeans"))
			{
				PrintWriter pwNetBeans = new PrintWriter(new FileOutputStream(dockerfileNetBeans,true));
				
				String line = "RUN apt-get -y install \\\n"+
		  	  		 	  "		python3-dev python3-pip\n"+
		  	  		  	  "RUN	pip3 install -U keras\n";
			
			pwNetBeans.flush();
			pwNetBeans.println(line);

			
			pwNetBeans.close();
			
			if(build != null){
				FunctionsDocker.createAnImageOfIDEsublime();
				}
				if(push != null){
					FunctionsDocker.pushToDockerWithPropertiesSublime(
						wizardSession.get("MAIL"), 
						wizardSession.get("PASS"), 
						wizardSession.get("USERNAME"), 
						wizardSession.get("CERTS"),
						wizardSession.get("CONF")
					);
				
			}
			
		}
	 }
		

	%>
	

	<%
	
	pw.close();
	out.println("Has seleccionado la Base de Datos: " + request.getParameter("BBDD") + "<br>");
	out.println("Has seleccionado el IDE: " + request.getParameter("IDE") + "<br>");
	out.println("Has seleccionado el DataSet: " + request.getParameter("DATA") + "<br>");
	out.println("Has seleccionado la Libreria: " + request.getParameter("LIBRARY") + "<br>");
	out.println("Has seleccionado la MAIL: " + request.getParameter("MAIL") + "<br>");	
	out.println("Has seleccionado la PUSH: " + request.getParameter("PUSH") + "<br>");	
	out.println("Has seleccionado la BUILD: " + request.getParameter("BUILD") + "<br>");	
	

	%>

	
</body>
</html>