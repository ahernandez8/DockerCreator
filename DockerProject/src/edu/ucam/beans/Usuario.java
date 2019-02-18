package edu.ucam.beans;

public class Usuario {
	// ATRIBUTOS
	private String name;
	

	private String pass;
	private boolean isAdmin;
	
	public Usuario(String name, String pass, boolean isAdmin) {
		this.name = name;
		this.pass = pass;
		this.isAdmin = isAdmin;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public boolean isAdmin() {
		return isAdmin;
	}
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}

	

}
