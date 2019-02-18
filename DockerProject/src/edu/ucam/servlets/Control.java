package edu.ucam.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ucam.actions.Action;
import edu.ucam.actions.ActionLogin;
import edu.ucam.beans.Usuario;

/**
 * Servlet implementation class Control
 */
@WebServlet(urlPatterns= {"/Control","/jsp/Control"})
public class Control extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	
	private Hashtable<String, Action> actions; // Tabla de acciones
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Control() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init() throws ServletException {
		
		if (actions == null) {
			actions = new Hashtable<String,Action>();
			actions.put("LOGIN", new ActionLogin());
			 
		}
		
		Hashtable<String, Usuario> usuarios = (Hashtable<String, Usuario>) this.getServletContext().getAttribute("USUARIOS");
		
		usuarios = new Hashtable<String, Usuario>();

		
		//usuarios.put("admin", new Usuario("admin", "1234", true)); // Este usuario es administrador
		usuarios.put("root", new Usuario("root", "root", true)); // Este usuario es administrador
		/*
		ssoo.put("1", new Ssoo("1", "Debian"));
		ssoo.put("2", new Ssoo("2", "Ubuntu"));
		ssoo.put("3", new Ssoo("3", "Fedora"));
		
		bbdd.put("4", new Bbdd("4", "MySql"));
		bbdd.put("5", new Bbdd("5", "PostgreSQL"));
		
		data.put("6", new Data("6", "BlackFriday"));
		data.put("7", new Data("7", "xxx"));
		data.put("8", new Data("8", "xxxx"));
		
		library.put("9", new Library("9", "matplotlib"));
		library.put("10", new Library("10", "scikit-learn"));
		library.put("11", new Library("11", "Python 3"));
		*/
		
		this.getServletContext().setAttribute("USUARIOS", usuarios);
		
		
		
		
		
		super.init();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String actionId = (String)request.getParameter("ACTION_ID");
		
		String jsp = "/index.jsp";
		
		if(actionId == null){
			System.out.println("No se ha definido accion a ejecutar");
		}else{
			System.out.println("Accion a ejecutar: '" + actionId + "'");
			Action action = this.actions.get(actionId);
			
			if(action == null){
				System.out.println("La accion no esta definida");
			}else{
				System.out.println("Accion implementada en " + action.toString());
	
				jsp = action.execute(request, response);
				
				System.out.println("Accion realizada... ");
				
			}
		}
		
		//Reenviamos la peticion a la JSP.
		System.out.println("Voy a reenviar peticion a la jsp ");
		this.getServletContext().getRequestDispatcher(jsp).forward(request, response);
		System.out.println("Peticion enviada...");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
