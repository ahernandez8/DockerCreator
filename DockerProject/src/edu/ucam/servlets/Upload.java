package edu.ucam.servlets;
 
import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/uploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100)   	// 100 MB
public class Upload extends HttpServlet {
 
   

	private static final long serialVersionUID = 205242440643911308L;
	
    /**
     * Directory where uploaded files will be saved, its relative to
     * the web application directory.
     */
    private static final String UPLOAD_DIR = "/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets absolute path of the web application
       // String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
     //   String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        String uploadFilePath = File.separator + UPLOAD_DIR;
        // creates the save directory if it does not exists
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());
        
        String fileName = null;
        //Get all the parts from request and write it to the file on server
        for (Part part : request.getParts()) {
            fileName = getFileName(part);
            part.write(uploadFilePath + File.separator + fileName);
        }
 
        request.setAttribute("message", fileName + " ¡Archivo subido! ");
        

        
     //   getServletContext().getRequestDispatcher("/form.jsp").forward(request, response);
        /*
		request.getServletContext().getInitParameter("MAIL");
		request.getServletContext().getInitParameter("USERNAME");
		
		request.getParameter("MAIL2");
		request.getParameter("PASS");
		request.getParameter("USERNAME");
		request.getParameter("CERTS");
		request.getParameter("CONF");
		*/
		//String dire = request.getParameter("/form.jsp");
        
       // request.getRequestDispatcher("/form.jsp").include(request, response);
       // request.getRequestDispatcher("/form.jsp").forward(request, response);
        response.sendRedirect("form.jsp");
                 
                
    }
 /*
  @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  request.getServletContext().getInitParameter("MAIL");
		
		
		request.getParameter("MAIL2");
		request.getParameter("PASS");
		request.getParameter("USERNAME");
		request.getParameter("CERTS");
		request.getParameter("CONF");
		super.service(request, response);
	}
*/
	/*  
	public Enumeration<String> getInitParameterNames() {
    	  ServletContext context = sce.getServletContext();
          Properties properties = new Properties();
    	 Enumeration<String> names = context.getInitParameterNames();
         while (names.hasMoreElements()) {
             String name = names.nextElement();
             properties.put(name, context.getInitParameter(name));
         }
		return super.getInitParameterNames();
	}
*/
	/**
     * Utility method to get file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }
}

