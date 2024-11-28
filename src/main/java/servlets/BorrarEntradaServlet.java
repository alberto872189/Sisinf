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
		String nButacas = request.getParameter("nButacas");
		String hora = request.getParameter("hora");
		String pelicula = request.getParameter("pelicula");
		String sala = request.getParameter("sala");
		String retorno = request.getParameter("retorno");
			
		DAOEntradaPostgres daoEntrada = new DAOEntradaPostgres("admin", "admin");
		for (String id : idEntradas) {
			daoEntrada.borrar(Integer.valueOf(id));
		}
		RequestDispatcher dispatcher;
		if (retorno.equals("indexReserva2.jsp")) {
			request.setAttribute("idEntradas", idEntradas);
			dispatcher = request.getRequestDispatcher("peliculas/reserva/indexReserva2.jsp?nEntradas=" + nButacas
					+ "&Hora=" + hora + ";" + sala + "&pelicula=" + pelicula);
		}
		else {
			dispatcher = request.getRequestDispatcher("index.jsp");
		}
		dispatcher.forward(request, response);
	}
}
