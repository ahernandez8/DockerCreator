package edu.ucam.apiDocker;

import java.io.File;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import com.github.dockerjava.api.DockerClient;
import com.github.dockerjava.core.DefaultDockerClientConfig;
import com.github.dockerjava.core.DockerClientBuilder;
import com.github.dockerjava.core.command.BuildImageResultCallback;
import com.github.dockerjava.core.command.PushImageResultCallback;

public class FunctionsDocker {
	
	
	static DockerClient dockerClient = DockerClientBuilder.getInstance("unix:///var/run/docker.sock").build();
	
	public static void pushToDockerWithPropertiesMySql(String mail, String pass, String user, String certs, String conf) throws InterruptedException {

	       
        Properties properties = new Properties();
        properties.setProperty("registry.email", mail);
        properties.setProperty("registry.password", pass);
        properties.setProperty("registry.username", user);
        properties.setProperty("registry.url", "https://index.docker.io/v2/");
        properties.setProperty("DOCKER_CERT_PATH", certs);      
        properties.setProperty("DOCKER_CONFIG", conf);
        properties.setProperty("DOCKER_TLS_VERIFY", "1");
        properties.setProperty("DOCKER_HOST", "unix:///var/run/docker.sock");
       

        DefaultDockerClientConfig config = DefaultDockerClientConfig.createDefaultConfigBuilder().withProperties(properties).build();
        System.out.println();
      
        DockerClient dockerClient = DockerClientBuilder.getInstance(config).build();

     
        dockerClient.pushImageCmd("dockeruserucam/docker-api-java:bdmysql")
		  .exec(new PushImageResultCallback())
		  .awaitCompletion(1000, TimeUnit.SECONDS);
       
}
	
	
	 
	 public static void pushToDockerWithPropertiesPostgreSql(String mail, String pass, String user, String certs, String conf) throws InterruptedException {

	       
		 Properties properties = new Properties();
	        properties.setProperty("registry.email", mail);
	        properties.setProperty("registry.password", pass);
	        properties.setProperty("registry.username", user);
	        properties.setProperty("registry.url", "https://index.docker.io/v2/");
	        properties.setProperty("DOCKER_CERT_PATH", certs);      
	        properties.setProperty("DOCKER_CONFIG", conf);
	        properties.setProperty("DOCKER_TLS_VERIFY", "1");
	        properties.setProperty("DOCKER_HOST", "unix:///var/run/docker.sock");
	       

	        DefaultDockerClientConfig config = DefaultDockerClientConfig.createDefaultConfigBuilder().withProperties(properties).build();
	        
	      

	        DockerClient dockerClient = DockerClientBuilder.getInstance(config).build();

	   
	        dockerClient.pushImageCmd("dockeruserucam/docker-api-java:bdpostgre")
			  .exec(new PushImageResultCallback())
			  .awaitCompletion(1000, TimeUnit.SECONDS);
	       
	}
	 
	 public static void pushToDockerWithPropertiesMariaDB(String mail, String pass, String user, String certs, String conf) throws InterruptedException {

	       
		 Properties properties = new Properties();
	        properties.setProperty("registry.email", mail);
	        properties.setProperty("registry.password", pass);
	        properties.setProperty("registry.username", user);
	        properties.setProperty("registry.url", "https://index.docker.io/v2/");
	        properties.setProperty("DOCKER_CERT_PATH", certs);      
	        properties.setProperty("DOCKER_CONFIG", conf);
	        properties.setProperty("DOCKER_TLS_VERIFY", "1");
	        properties.setProperty("DOCKER_HOST", "unix:///var/run/docker.sock");
	       

	        DefaultDockerClientConfig config = DefaultDockerClientConfig.createDefaultConfigBuilder().withProperties(properties).build();
	        
	      

	        DockerClient dockerClient = DockerClientBuilder.getInstance(config).build();

	    
	        dockerClient.pushImageCmd("dockeruserucam/docker-api-java:bdmaria")
			  .exec(new PushImageResultCallback())
			  .awaitCompletion(1000, TimeUnit.SECONDS);
	       
	}
	 
	 public static void pushToDockerWithPropertiesNetBeans(String mail, String pass, String user, String certs, String conf) throws InterruptedException {

	       
		 Properties properties = new Properties();
	        properties.setProperty("registry.email", mail);
	        properties.setProperty("registry.password", pass);
	        properties.setProperty("registry.username", user);
	        properties.setProperty("registry.url", "https://index.docker.io/v2/");
	        properties.setProperty("DOCKER_CERT_PATH", certs);      
	        properties.setProperty("DOCKER_CONFIG", conf);
	        properties.setProperty("DOCKER_TLS_VERIFY", "1");
	        properties.setProperty("DOCKER_HOST", "unix:///var/run/docker.sock");
	       

	        DefaultDockerClientConfig config = DefaultDockerClientConfig.createDefaultConfigBuilder().withProperties(properties).build();
	        
	      

	        DockerClient dockerClient = DockerClientBuilder.getInstance(config).build();

	      
	      
	        dockerClient.pushImageCmd("dockeruserucam/docker-api-java:idenetbeans")
			  .exec(new PushImageResultCallback())
			  .awaitCompletion(1000, TimeUnit.SECONDS);
	       
	}
	 
	 public static void pushToDockerWithPropertiesEclipse(String mail, String pass, String user, String certs, String conf) throws InterruptedException {

	       
		 Properties properties = new Properties();
	        properties.setProperty("registry.email", mail);
	        properties.setProperty("registry.password", pass);
	        properties.setProperty("registry.username", user);
	        properties.setProperty("registry.url", "https://index.docker.io/v2/");
	        properties.setProperty("DOCKER_CERT_PATH", certs);      
	        properties.setProperty("DOCKER_CONFIG", conf);
	        properties.setProperty("DOCKER_TLS_VERIFY", "1");
	        properties.setProperty("DOCKER_HOST", "unix:///var/run/docker.sock");
	       

	        DefaultDockerClientConfig config = DefaultDockerClientConfig.createDefaultConfigBuilder().withProperties(properties).build();
	        
	      
	        DockerClient dockerClient = DockerClientBuilder.getInstance(config).build();

	     
	        dockerClient.pushImageCmd("dockeruserucam/docker-api-java:ideeclipse")
			  .exec(new PushImageResultCallback())
			  .awaitCompletion(1000, TimeUnit.SECONDS);
	       
	}
	 
	 public static void pushToDockerWithPropertiesIntellij(String mail, String pass, String user, String certs, String conf) throws InterruptedException {

	       
		 Properties properties = new Properties();
	        properties.setProperty("registry.email", mail);
	        properties.setProperty("registry.password", pass);
	        properties.setProperty("registry.username", user);
	        properties.setProperty("registry.url", "https://index.docker.io/v2/");
	        properties.setProperty("DOCKER_CERT_PATH", certs);      
	        properties.setProperty("DOCKER_CONFIG", conf);
	        properties.setProperty("DOCKER_TLS_VERIFY", "1");
	        properties.setProperty("DOCKER_HOST", "unix:///var/run/docker.sock");
	       

	        DefaultDockerClientConfig config = DefaultDockerClientConfig.createDefaultConfigBuilder().withProperties(properties).build();
	        
	     
	        DockerClient dockerClient = DockerClientBuilder.getInstance(config).build();

  
	        dockerClient.pushImageCmd("dockeruserucam/docker-api-java:ideintellij")
			  .exec(new PushImageResultCallback())
			  .awaitCompletion(1000, TimeUnit.SECONDS);
	       
	}
	 
	 public static void pushToDockerWithPropertiesSublime(String mail, String pass, String user, String certs, String conf) throws InterruptedException {

	       
		 Properties properties = new Properties();
	        properties.setProperty("registry.email", mail);
	        properties.setProperty("registry.password", pass);
	        properties.setProperty("registry.username", user);
	        properties.setProperty("registry.url", "https://index.docker.io/v2/");
	        properties.setProperty("DOCKER_CERT_PATH", certs);      
	        properties.setProperty("DOCKER_CONFIG", conf);
	        properties.setProperty("DOCKER_TLS_VERIFY", "1");
	        properties.setProperty("DOCKER_HOST", "unix:///var/run/docker.sock");

	        DefaultDockerClientConfig config = DefaultDockerClientConfig.createDefaultConfigBuilder().withProperties(properties).build();

	        DockerClient dockerClient = DockerClientBuilder.getInstance(config).build();

	        dockerClient.pushImageCmd("dockeruserucam/docker-api-java:idesublime")
			  .exec(new PushImageResultCallback())
			  .awaitCompletion(1000, TimeUnit.SECONDS);
	       
	}
	  //++++++++++++++++++++++++++++MySQL+++++++++++++++++++++++++++++++++++++++++++++++++++++
	  public static void createAnImageOfBBDDMySql() throws InterruptedException {

		  dockerClient.buildImageCmd()
				  .withDockerfile(new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MySql/Dockerfile"))
				  .withPull(true)
				  .withNoCache(true).withTag("dockeruserucam/docker-api-java:bdmysql")
				  .exec(new BuildImageResultCallback())
				  .awaitImageId();
	}
	//++++++++++++++++++++++++++++PostgreSql+++++++++++++++++++++++++++++++++++++++++++++++++++++
	  public static void createAnImageOfBBDDPostgreSql() throws InterruptedException {

		  dockerClient.buildImageCmd()
				  .withDockerfile(new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/PostgreSQL/Dockerfile"))
				  .withPull(true)
				  .withNoCache(true).withTag("dockeruserucam/docker-api-java:bdpostgre")
				  .exec(new BuildImageResultCallback())
				  .awaitImageId();
	}
	//++++++++++++++++++++++++++++MariaDB+++++++++++++++++++++++++++++++++++++++++++++++++++++
	  public static void createAnImageOfBBDDMariaDB() throws InterruptedException {

		  dockerClient.buildImageCmd()
				  .withDockerfile(new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/MariaDB/Dockerfile"))
				  .withPull(true)
				  .withNoCache(true).withTag("dockeruserucam/docker-api-java:bdmaria")
				  .exec(new BuildImageResultCallback())
				  .awaitImageId();
	}
	  
	  
	  
	  
	  
	//++++++++++++++++++++++++++++netBeans+++++++++++++++++++++++++++++++++++++++++++++++++++++
	  public static void createAnImageOfIDEnetBeans() throws InterruptedException {

		  dockerClient.buildImageCmd()
				  .withDockerfile(new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/netBeans/Dockerfile"))
				  .withPull(true)
				  .withNoCache(true).withTag("dockeruserucam/docker-api-java:idenetbeans")
				  .exec(new BuildImageResultCallback())
				  .awaitImageId();
	}
	//++++++++++++++++++++++++++++eclipse+++++++++++++++++++++++++++++++++++++++++++++++++++++
	  public static void createAnImageOfIDEeclipse() throws InterruptedException {

		  dockerClient.buildImageCmd()
				  .withDockerfile(new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Eclipse/Dockerfile"))
				  .withPull(true)
				  .withNoCache(true).withTag("dockeruserucam/docker-api-java:ideeclipse")
				  .exec(new BuildImageResultCallback())
				  .awaitImageId();
	}
	//++++++++++++++++++++++++++++intellij+++++++++++++++++++++++++++++++++++++++++++++++++++++
	  public static void createAnImageOfIDEintellij() throws InterruptedException {

		  dockerClient.buildImageCmd()
				  .withDockerfile(new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/IntellijIDEA/Dockerfile"))
				  .withPull(true)
				  .withNoCache(true).withTag("dockeruserucam/docker-api-java:ideintellij")
				  .exec(new BuildImageResultCallback())
				  .awaitImageId();
	}
	//++++++++++++++++++++++++++++sublime+++++++++++++++++++++++++++++++++++++++++++++++++++++
	  public static void createAnImageOfIDEsublime() throws InterruptedException {

		  dockerClient.buildImageCmd()
				  .withDockerfile(new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/Sublime-Text/Dockerfile"))
				  .withPull(true)
				  .withNoCache(true).withTag("dockeruserucam/docker-api-java:idesublime")
				  .exec(new BuildImageResultCallback())
				  .awaitImageId();
	}
}
