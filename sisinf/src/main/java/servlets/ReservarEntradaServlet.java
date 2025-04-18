package servlets;

import java.util.Map;

import dao.postgres.DAOEntradaPostgres;

import java.io.IOException;
import java.util.HashMap;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import vo.Entrada;

import java.sql.Timestamp;

@WebServlet(description = "Servlet de reserva de entradas", urlPatterns = { "/reservarEntrada"})
public class ReservarEntradaServlet extends HttpServlet {

	private static final long serialVersionUID = 1L; //Por hacer
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> errors = new HashMap <String, String>();
		String hora = request.getParameter("hora");
		String butacas[] = request.getParameterValues("butaca");
		String usuario = request.getParameter("usuario");
		String sala = request.getParameter("sala");
		Integer nButacas = Integer.valueOf(request.getParameter("nEntradas"));
		String pelicula = request.getParameter("pelicula");
		String idEntradas[] = new String[nButacas];
		if (butacas == null || butacas.length != nButacas) {
			errors.put("Butacas", "Número de butacas incorrecto");
		}
		if(errors.isEmpty()) {
			DAOEntradaPostgres daoEntrada = new DAOEntradaPostgres("usuario", "user");
			Entrada entrada = new Entrada();
			int i = 0;
			for (String but : butacas) {
				entrada.N_But = Integer.valueOf(but);
				entrada.N_Sala = Integer.valueOf(sala);
				entrada.Correo = usuario;
				entrada.Sesion_Hora = Timestamp.valueOf(hora);
				entrada.Tit_Pel = pelicula;
				int idEnt = daoEntrada.crear(entrada);
				idEntradas[i] = Integer.toString(idEnt);
				i++;
			}
		}
		request.setAttribute("errors", errors);
		RequestDispatcher dispatcher = null;
		if (errors.isEmpty()) {
			request.setAttribute("nEntradas", nButacas);
			request.setAttribute("idEntradas", idEntradas);
			request.setAttribute("pelicula", pelicula);
			request.setAttribute("hora", hora);
			request.setAttribute("sala", sala);
			dispatcher=request.getRequestDispatcher("peliculas/reserva/indexReserva3.jsp");
		}
		else {
			dispatcher=request.getRequestDispatcher("peliculas/reserva/indexReserva2.jsp?nEntradas=" + nButacas
													+ "&Hora=" + hora + ";" + sala + "&pelicula=" + pelicula);
		}
		dispatcher.forward(request, response);
	
	}
}
