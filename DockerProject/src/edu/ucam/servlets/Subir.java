package edu.ucam.servlets;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class Subir
 */
@WebServlet("/Subir")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	
maxFileSize=1024*1024*50,      	
maxRequestSize=1024*1024*100)


public class Subir extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Subir() {
        super();
        // TODO Auto-generated constructor stub
    }


	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // Directory where files will be saved
		  File ruta = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/");

		  if (!ruta.exists()) {
		   ruta.mkdirs();
		  }

		  FileItemFactory factory = new DiskFileItemFactory();

		  // Create a new file upload handler
		  ServletFileUpload upload = new ServletFileUpload(factory);



		
		try {
			
			

	
	
		  List formItems = upload.parseRequest(request);
	        Iterator it = formItems.iterator();
	        // iterates over form's fields
	        while(it.hasNext()) {
	            FileItem item = (FileItem) it.next();
	            // processes only fields that are not form fields
	            if (!item.isFormField()) {
	                String fileName = new File(item.getName()).getName();
	                String filePath = ruta + File.separator + fileName;
	                File storeFile = new File(filePath);
	                // saves the file on disk
	                item.write(storeFile);
	            }
	           
	        }
	 } catch (FileUploadException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    } catch (Exception e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
		
		response.sendRedirect("form.jsp");
		//getServletContext().getRequestDispatcher("/form.jsp").forward(request, response);
	}

	

}
