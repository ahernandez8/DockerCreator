package edu.ucam.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class Action {
	
	public abstract String execute(HttpServletRequest request, HttpServletResponse response);

}
