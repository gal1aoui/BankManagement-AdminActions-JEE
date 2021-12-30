package web;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.Group;
import users.actors.Client;
import users.session.GestionProjetRemote;

@WebServlet(name="Group", urlPatterns={"/groupe"})
public class Groupe extends HttpServlet {
	
	@EJB
	private GestionProjetRemote gpl;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		long id = Long.parseLong(req.getParameter("id"));
		Group g = gpl.consultationGroupe(id);
		req.setAttribute("Groupe", g);
		req.getRequestDispatcher("Groupe.jsp").forward(req,resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
	}
}
