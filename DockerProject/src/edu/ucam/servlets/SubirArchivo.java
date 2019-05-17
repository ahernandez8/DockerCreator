package edu.ucam.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@SuppressWarnings("serial")

@WebServlet("/subirServlet")
public class SubirArchivo extends HttpServlet {
 @Override
 protected void doPost(HttpServletRequest request,
   HttpServletResponse response) throws ServletException, IOException {

	    
  // Directory where files will be saved
  File seshdir = new File("/Users/adrianhm91/git/DockerCreator/DockerProject/DATOS/");

  if (!seshdir.exists()) {
   seshdir.mkdirs();
  }

  FileItemFactory factory = new DiskFileItemFactory();

  // Create a new file upload handler
  ServletFileUpload upload = new ServletFileUpload(factory);

  // Parse the request
  @SuppressWarnings("rawtypes")
List items = null;
  try{
   items = upload.parseRequest(request);
  } catch (FileUploadException e) {
   throw new ServletException("Exception while uploading the file");
  }

  for (Iterator it = items.iterator(); it.hasNext();) {
	  DiskFileItem diskFileItem = (DiskFileItem) it.next();
 

   byte[] fileBytes = diskFileItem.get();
   File file = new File(seshdir, diskFileItem.getName());
   FileOutputStream fileOutputStream = new FileOutputStream(file);
   fileOutputStream.write(fileBytes);
   fileOutputStream.flush();
  }
  getServletContext().getRequestDispatcher("/form.jsp").forward(request, response);
 }
}