package servlets;




import dao.postgres.DAOEntradaPostgres;

import java.io.IOException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet(description = "Servlet de borrado de entradas", urlPatterns = { "/borrarEntrada"})
public class BorrarEntradaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L; //Por hacer
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idEntradas[] = request.getParameterValues("idEntradas");
	
		DAOEntradaPostgres daoEntrada = new DAOEntradaPostgres("admin", "admin");
		for (String id : idEntradas) {
			daoEntrada.borrar(Integer.valueOf(id));
		}
		request.setAttribute("idEntradas", idEntradas);
		RequestDispatcher dispatcher = request.getRequestDispatcher("peliculas/reserva/indexReserva2.jsp");
		dispatcher.forward(request, response);
	}
}
