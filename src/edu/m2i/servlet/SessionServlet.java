package edu.m2i.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.m2i.entities.Session;
import edu.m2i.validators.SessionValidator;

/**
 * Servlet implementation class SessionServlet
 */
@WebServlet("/SessionServlet")
public class SessionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public SessionServlet() {
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
		String paramDate = request.getParameter("date");
		String paramFormation = request.getParameter("formation");
		String paramDurre = request.getParameter("duree");
		
		String message = "";
		if (paramDate != null && !paramDate.isBlank() &&  
			paramFormation!= null && !paramFormation.isBlank() && 
			paramDurre != null && !paramDurre.isBlank()) {			
			
			try {
				int duree = Integer.parseInt(paramDurre);
				Session session = new Session(paramDate, paramFormation, duree);

				SessionValidator sessionValidator = new SessionValidator();
				if (sessionValidator.verifierSessionValide(session)) {					
					message = "Ajout succès de session " + session.toString();
					request.setAttribute("confirmationSaveSession", message);
					request.getRequestDispatcher("/session.jsp").forward(request, response);
				} else {
					message = "Echec d'ajout de session " + session.toString();
					request.setAttribute("erreurSaveSession", message);
					request.getRequestDispatcher("/session.jsp").forward(request, response);
				}
			} catch (Exception e) {
				message = "Durée non parsable en int";
				request.setAttribute("erreurSaveSession", message);
				request.getRequestDispatcher("/session.jsp").forward(request, response);
			}
			
			
		} else {			
			message = "Paramètre(s) null(s) ou blank(s)";
			request.setAttribute("erreurSaveUser", message);
			request.getRequestDispatcher("/user.jsp").forward(request, response);
		}
	}

}
