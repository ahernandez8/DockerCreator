package edu.ucam.actions;

import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ucam.beans.Usuario;

public class ActionLogin extends Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// Recuperamos parametros
		String name = request.getParameter("NAME");
		String pass = request.getParameter("PASS");
		
		// Buscamos el usuario en la tabla
		Usuario usuario = ((Hashtable<String, Usuario>)request.getServletContext().getAttribute("USUARIOS")).get(name);
		
		if(usuario != null) {
			if(usuario.getPass().equals(pass)) { // Si es administrador
				request.getSession().setAttribute("USER_LOGGED", usuario);
			}
			else {
				request.setAttribute("MSG", "Usuario incorrecto");
			}
			
		}else {
			request.setAttribute("MSG", "Usuario no encontrado");
		}
		return "/index.jsp";
	}

}
