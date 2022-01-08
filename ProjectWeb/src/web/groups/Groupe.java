package web.groups;

import java.io.IOException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.groups.Group;
import session.GestionProjetRemote;

@WebServlet(name="Group", urlPatterns={"/groupe"})
public class Groupe extends HttpServlet {
	
	@EJB
	private GestionProjetRemote gpl;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		long id = Long.parseLong(req.getParameter("id"));
		Group g = gpl.consultationGroupe(id);
		req.setAttribute("Groupe", g);
		req.getRequestDispatcher("Groupe.jsp").forward(req,res);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
	
		String gname = req.getParameter("gname");
		if(gname != null)
		{
			gpl.ajouterGroupe(new Group(gname));
		}
		res.sendRedirect("consultation");
	}
}
